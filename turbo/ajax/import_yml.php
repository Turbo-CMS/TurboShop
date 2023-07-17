<?php

session_start();
require_once '../../api/Turbo.php';

class ImportAjax extends Turbo
{
	private $columnsNames = [
		'name' => ['product', 'name'],
		'url' => ['url'],
		'visible' => ['visible', 'published'],
		'featured' => ['featured', 'hit'],
		'category' => ['category'],
		'brand' => ['brand'],
		'variant' => ['variant'],
		'price' => ['price'],
		'compare_price' => ['compare price'],
		'sku' => ['sku'],
		'stock' => ['stock'],
		'meta_title' => ['meta title'],
		'meta_keywords' => ['meta keywords'],
		'meta_description' => ['meta description'],
		'annotation' => ['annotation'],
		'description' => ['description'],
		'images' => ['images']
	];

	private $internalColumnsNames = [];
	private $importFilesDir = '../files/import/';
	private $importFile = 'import.csv';
	private $categoryDelimiter = ',';
	private $subcategoryDelimiter = '/';
	private $columnDelimiter = ';';
	private $productsCount = 10;
	private $columns = [];

	public function import()
	{
		if (!$this->managers->access('import')) {
			return false;
		}

		setlocale(LC_ALL, 'en_US.UTF-8');

		$result = new stdClass;

		$file = fopen($this->importFilesDir . $this->importFile, 'r');
		$this->columns = fgetcsv($file, null, $this->columnDelimiter);

		foreach ($this->columns as &$column) {
			if ($internalName = $this->internalColumnName($column)) {
				$this->internalColumnsNames[$column] = $internalName;
				$column = $internalName;
			}
		}

		if (!in_array('name', $this->columns) && !in_array('sku', $this->columns)) {
			return false;
		}

		if ($from = $this->request->get('from')) {
			fseek($file, $from);
		}

		$importedItems = [];

		for ($k = 0; !feof($file) && $k < $this->productsCount; $k++) {
			$line = fgetcsv($file, 0, $this->columnDelimiter);

			$product = null;

			if (is_array($line)) {
				foreach ($this->columns as $i => $col) {
					if (isset($line[$i]) && !empty($line) && !empty($col)) {
						$product[$col] = $line[$i];
					}
				}
			}

			if ($importedItem = $this->importItem($product)) {
				$importedItems[] = $importedItem;
			}
		}

		$from = ftell($file);
		$result->end = feof($file);
		fclose($file);
		$size = filesize($this->importFilesDir . $this->importFile);
		$result->from = $from;
		$result->totalsize = $size;
		$result->items = $importedItems;

		return $result;
	}

	private function importItem($item)
	{
		$importedItem = new stdClass();

		if (empty($item['name']) && empty($item['sku'])) {
			return false;
		}

		$product = [];

		if (isset($item['name'])) {
			$product['name'] = trim($item['name']);
		}

		if (isset($item['meta_title'])) {
			$product['meta_title'] = trim($item['meta_title']);
		}

		if (isset($item['meta_keywords'])) {
			$product['meta_keywords'] = trim($item['meta_keywords']);
		}

		if (isset($item['meta_description'])) {
			$product['meta_description'] = trim($item['meta_description']);
		}

		if (isset($item['annotation'])) {
			$product['annotation'] = trim($item['annotation']);
		}

		if (isset($item['description'])) {
			$product['body'] = trim($item['description']);
		}

		if (isset($item['visible'])) {
			$product['visible'] = (int) $item['visible'];
		}

		if (isset($item['featured'])) {
			$product['featured'] = (int) $item['featured'];
		}

		if (!empty($item['url'])) {
			$product['url'] = trim($item['url']);
		} elseif (!empty($item['name'])) {
			$product['url'] = $this->translit($item['name']);
		}

		if (!empty($item['brand'])) {
			$item['brand'] = trim($item['brand']);

			$this->db->query('SELECT id FROM __brands WHERE name=?', $item['brand']);

			if (!$product['brand_id'] = $this->db->result('id')) {
				$product['brand_id'] = $this->brands->addBrand([
					'name' => $item['brand'],
					'meta_title' => $item['brand'],
					'meta_keywords' => $item['brand'],
					'meta_description' => $item['brand']
				]);
			}
		}

		$categoryId = null;
		$categoriesIds = [];

		if (!empty($item['category'])) {
			foreach (explode($this->categoryDelimiter, $item['category']) as $c) {
				$categoriesIds[] = $this->importCategory($c);
			}

			$categoryId = reset($categoriesIds);
		}

		$variant = [];

		if (isset($item['variant'])) {
			$variant['name'] = trim($item['variant']);
		}

		if (isset($item['price'])) {
			$variant['price'] = str_replace(',', '.', str_replace(' ', '', trim($item['price'])));
		}

		if (isset($item['compare_price'])) {
			$variant['compare_price'] = trim($item['compare_price']);
		}

		if (isset($item['stock'])) {
			if ($item['stock'] == '') {
				$variant['stock'] = null;
			} else {
				$variant['stock'] = trim($item['stock']);
			}
		}

		if (isset($item['sku'])) {
			$variant['sku'] = trim($item['sku']);
		}

		if (!empty($variant['sku'])) {
			$this->db->query(
				'SELECT v.id AS variant_id, v.product_id
				FROM __variants v, __products p
				WHERE v.sku=? AND v.product_id=p.id
				LIMIT 1',
				$variant['sku']
			);

			$result = $this->db->result();

			if ($result) {
				if (!empty($product)) {
					$this->products->updateProduct($result->product_id, $product);
				}

				if (!empty($variant)) {
					$this->variants->updateVariant($result->variant_id, $variant);
				}

				$productId = $result->product_id;
				$variantId = $result->variant_id;
				$importedItem->status = 'updated';
			}
		}

		if ((empty($productId) || empty($variantId)) && isset($item['name'])) {
			if (!empty($variant['sku']) && empty($variant['name'])) {
				$this->db->query(
					'SELECT v.id AS variant_id, p.id AS product_id
					FROM __products p
					LEFT JOIN __variants v ON v.product_id = p.id
					WHERE v.sku = ?
					LIMIT 1',
					$variant['sku']
				);
			} elseif (isset($item['variant'])) {
				$this->db->query(
					'SELECT v.id AS variant_id, p.id AS product_id
					FROM __products p
					LEFT JOIN __variants v ON v.product_id = p.id AND v.name = ?
					WHERE p.name = ?
					LIMIT 1',
					$item['variant'],
					$item['name']
				);
			} else {
				$this->db->query(
					'SELECT v.id AS variant_id, p.id AS product_id
					FROM __products p
					LEFT JOIN __variants v ON v.product_id = p.id
					WHERE p.name = ?
					LIMIT 1',
					$item['name']
				);
			}

			$result = $this->db->result();

			if ($result) {
				$productId = $result->product_id;
				$variantId = $result->variant_id;
			}

			if (!empty($variantId)) {
				$this->variants->updateVariant($variantId, $variant);
				$this->products->updateProduct($productId, $product);
				$importedItem->status = 'updated';
			} elseif (empty($variantId)) {
				if (empty($productId)) {
					$productId = $this->products->addProduct($product);
				}

				$this->db->query(
					'SELECT max(v.position) AS pos 
					 FROM __variants v 
					 WHERE v.product_id=?
					 LIMIT 1',
					$productId
				);

				$pos = $this->db->result('pos');

				$variant['position'] = $pos + 1;
				$variant['product_id'] = $productId;
				$variantId = $this->variants->addVariant($variant);
				$importedItem->status = 'added';
			}
		}

		if (!empty($variantId) && !empty($productId)) {
			$importedItem->variant = $this->variants->getVariant(intval($variantId));
			$importedItem->product = $this->products->getProduct(intval($productId));

			if (!empty($categoriesIds)) {
				foreach ($categoriesIds as $categoryId) {
					$this->categories->addProductCategory($productId, $categoryId);
				}
			}

			if (isset($item['images'])) {
				$images = explode(',', $item['images']);

				foreach ($images as $image) {
					$image = trim($image);

					if (!empty($image)) {
						$imageFilename = pathinfo($image, PATHINFO_BASENAME);

						$this->db->query(
							'SELECT filename FROM __images WHERE product_id=? AND (filename=? OR filename=?) LIMIT 1',
							$productId,
							$imageFilename,
							$image
						);

						if (!$this->db->result('filename')) {
							$this->products->addImage($productId, $image);
						}
					}
				}
			}

			foreach ($item as $featureName => $featureValue) {
				if (!in_array($featureName, $this->internalColumnsNames)) {
					if ($categoryId && $featureValue !== '') {
						$this->db->query('SELECT f.id FROM __features f WHERE f.name=? LIMIT 1', $featureName);

						if (!$featureId = $this->db->result('id')) {
							$featureId = $this->features->addFeature(['name' => $featureName, 'url' => $this->translit($featureName)]);
						}

						if (!empty($featureValue)) {
							$this->features->addFeatureCategory($featureId, $categoryId);
							while ($this->features->getOptions(['product_id' => $productId, 'feature_id' => $featureId])) {
								$this->features->deleteOption($productId, $featureId);
							}

							$pos = 0;

							foreach (explode('|', $featureValue) as $fValue) {
								$this->features->updateOption($productId, $featureId, $fValue, $pos++);
							}
						}
					}
				}
			}

			return $importedItem;
		}
	}

	private function importCategory($category)
	{
		$delimiter = $this->subcategoryDelimiter;
		$regex = "/\\DELIMITER((?:[^\\\\\DELIMITER]|\\\\.)*)/";
		$regex = str_replace('DELIMITER', $delimiter, $regex);
		$names = preg_split($regex, $category, 0, PREG_SPLIT_DELIM_CAPTURE);
		$id = null;
		$parent = 0;

		foreach ($names as $name) {
			$name = trim(str_replace("\\$delimiter", $delimiter, $name));
			if (!empty($name)) {
				$this->db->query('SELECT id FROM __categories WHERE name=? AND parent_id=?', $name, $parent);
				$id = $this->db->result('id');

				if (empty($id)) {
					$id = $this->categories->addCategory([
						'name' => $name,
						'parent_id' => $parent,
						'meta_title' => $name,
						'meta_keywords' => $name,
						'meta_description' => $name,
						'url' => $this->translit($name)
					]);
				}

				$parent = $id;
			}
		}

		return $id;
	}

	private function translit($text)
	{
		$cyr = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я");
		$lat = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

		$res = str_replace($cyr, $lat, $text);
		$res = preg_replace("/[\s]+/ui", '-', $res);
		$res = preg_replace('/[^\p{L}\p{Nd}\d-]/ui', '', $res);
		$res = strtolower($res);

		return $res;
	}

	private function internalColumnName($name)
	{
		$name = trim($name);
		$name = str_replace('/', '', $name);
		$name = str_replace('\/', '', $name);

		foreach ($this->columnsNames as $i => $names) {
			foreach ($names as $n) {
				if (!empty($name) && preg_match("/^" . preg_quote($name) . "$/ui", $n)) {
					return $i;
				}
			}
		}

		return false;
	}
}

$importAjax = new ImportAjax();

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

$json = json_encode($importAjax->import());
print $json;
