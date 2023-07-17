<?php

session_start();
chdir('../../');
require_once 'api/Import.php';

class ImportAjax extends Import
{

	public function import()
	{
		if (!$this->managers->access('import')) {
			return false;
		}

		$fields = $_SESSION['csv_fields'];
		session_write_close();
		unset($_SESSION['langId']);
		setlocale(LC_ALL, $this->locale);

		$result = new stdClass();

		$file = fopen($this->importFilesDir . $this->importFile, 'r');
		$this->columns = fgetcsv($file, null, $this->columnDelimiter);
		$this->initInternalColumns($fields);

		if (empty($fields) || !in_array('sku', $fields) && !in_array('name', $fields)) {
			return false;
		}

		if ($from = $this->request->get('from')) {
			fseek($file, $from);
		}

		$importedItems = [];

		for ($k = 0; !feof($file) && $k < $this->productsCount; $k++) {
			$line = fgetcsv($file, 0, $this->columnDelimiter);
			$product = null;

			if (is_array($line) && !empty($line)) {
				$i = 0;

				foreach ($fields as $csv => $inner) {
					if (isset($line[$i]) && !empty($inner)) {
						$product[$inner] = $line[$i];
					}

					$i++;
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
		$result->totalSize = $size;
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
			$product['visible'] = intval($item['visible']);
		}

		if (isset($item['featured'])) {
			$product['featured'] = intval($item['featured']);
		}

		if (!empty($item['url'])) {
			$product['url'] = trim($item['url']);
		} elseif (!empty($item['name'])) {
			$product['url'] = $this->translit($item['name']);
		}

		if (!isset($product['meta_title']) || empty($product['meta_title'])) {
			$product['meta_title'] = $product['name'];
		}

		if (!isset($product['meta_keywords']) || empty($product['meta_keywords'])) {
			$product['meta_keywords'] = $product['name'];
		}

		if (!isset($product['meta_description']) || empty($product['meta_description'])) {
			$product['meta_description'] = $product['name'];
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

		if (isset($item['color'])) {
			$variant['color'] = trim($item['color']);
		}

		if (isset($item['color_code'])) {
			$variant['color_code'] = trim($item['color_code']);
		}

		if (isset($item['price'])) {
			$variant['price'] = str_replace(',', '.', str_replace(' ', '', trim($item['price'])));
		}

		if (isset($item['compare_price'])) {
			$variant['compare_price'] = trim($item['compare_price']);
		}

		if (isset($item['currency'])) {
			$variant['currency_id'] = intval($item['currency']);
		}

		if (isset($item['weight'])) {
			$variant['weight'] = str_replace(',', '.', str_replace(' ', '', trim($item['weight'])));
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
					 LEFT JOIN __variants v ON v.product_id=p.id 
					 WHERE v.sku=? 
					 LIMIT 1',
					$variant['sku']
				);
			} elseif (isset($item['variant'])) {
				$this->db->query(
					'SELECT v.id AS variant_id, p.id AS product_id 
					 FROM __products p 
					 LEFT JOIN __variants v ON v.product_id = p.id AND v.sku=? 
					 WHERE p.name=? 
					 LIMIT 1',
					$item['variant'],
					$item['name']
				);
			} else {
				$this->db->query(
					'SELECT v.id AS variant_id, p.id AS product_id 
					 FROM __products p 
					 LEFT JOIN __variants v ON v.product_id=p.id 
					 WHERE p.name=? 
					 LIMIT 1',
					$item['name']
				);
			}

			$r = $this->db->result();

			if ($r) {
				$productId = $r->product_id;
				$variantId = $r->variant_id;
			}

			if (!empty($variantId)) {
				$this->variants->updateVariant($variantId, $variant);
				$this->products->updateProduct($productId, $product);
				$importedItem->status = 'updated';
			} elseif (empty($variantId)) {
				if (empty($productId)) {
					$productId = $this->products->addProduct($product);
				}

				$this->db->query('SELECT max(v.position) AS pos FROM __variants v WHERE v.product_id=? LIMIT 1', $productId);

				$pos = $this->db->result('pos');

				$variant['position'] = $pos + 1;
				$variant['product_id'] = $productId;

				if (!isset($variant['currency_id'])) {
					$currency = $this->money->getCurrency();
					$variant['currency_id'] = $currency->id;
				}

				$variantId = $this->variants->addVariant($variant);
				$importedItem->status = 'added';
			}
		}

		if (!empty($variantId) && !empty($productId)) {
			$importedItem->variant = $this->variants->getVariant(intval($variantId));
			$importedItem->product = $this->products->getProduct(intval($productId));

			if (!empty($categoriesIds)) {
				foreach ($categoriesIds as $cId) {
					$this->categories->addProductCategory($productId, $cId);
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
							$featureId = $this->features->addFeature(array('name' => $featureName, 'url' => $this->translit($featureName)));
						}

						if (!empty($featureValue)) {
							$this->features->addFeatureCategory($featureId, $categoryId);

							while ($this->features->getOptions(array('product_id' => $productId, 'feature_id' => $featureId))) {
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
						'url' => $this->translit($name),
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
}

$importAjax = new ImportAjax();
$data = $importAjax->import();

if ($data) {
	header("Content-type: application/json; charset=UTF-8");
	header("Cache-Control: must-revalidate");
	header("Pragma: no-cache");
	header("Expires: -1");

	$json = json_encode($data);
	print $json;
}
