<?php

session_start();
require_once('../../api/Turbo.php');

class ExportAjax extends Turbo
{
	private $columns_names = array(
		'category' =>         'Category',
		'name' =>             'Name',
		'price' =>            'Price',
		'url' =>              'URL',
		'visible' =>          'Visible',
		'featured' =>         'Featured',
		'brand' =>            'Brand',
		'variant' =>          'Variant',
		'color' =>            'Variant color',
		'color_code' =>       'Color code',
		'compare_price' =>    'Compare price',
		'currency' =>         'Currency ID',
		'weight' =>           'Weight',
		'sku' =>              'SKU',
		'stock' =>            'Stock',
		'meta_title' =>       'Meta title',
		'meta_keywords' =>    'Meta keywords',
		'meta_description' => 'Meta description',
		'annotation' =>       'Annotation',
		'body' =>             'Description',
		'images' =>           'Images'
	);

	private $column_delimiter = ';';
	private $subcategory_delimiter = '/';
	private $products_count = 10;
	private $export_files_dir = '../files/export/';
	private $filename = 'export.csv';

	public function fetch()
	{

		if (!$this->managers->access('export'))
			return false;

		// Excel only eats 1251
		$this->db->query('SET NAMES cp1251');

		// Page to be exported
		$page = $this->request->get('page');
		if (empty($page) || $page == 1) {
			$page = 1;
			// If you started over, delete the old export file
			if (is_writable($this->export_files_dir . $this->filename))
				unlink($this->export_files_dir . $this->filename);
		}

		// Opening the export file for adding
		$f = fopen($this->export_files_dir . $this->filename, 'ab');

		// Add product properties to the list of columns
		$features = $this->features->get_features();
		foreach ($features as $feature)
			$this->columns_names[$feature->name] = $feature->name;

		// If you started from the beginning - add the column names to the first line
		if ($page == 1) {
			fputcsv($f, $this->columns_names, $this->column_delimiter);
		}

		$filter = array('page' => $page, 'limit' => $this->products_count);
		if (($cid = $this->request->get('category_id', 'integer')) && ($category = $this->categories->get_category($cid))) {
			$filter['category_id'] = $category->children;
		}
		if ($brand_id = $this->request->get('brand_id', 'integer')) {
			$filter['brand_id'] = $brand_id;
		}

		// All products
		$products = array();
		foreach ($this->products->get_products($filter) as $p) {
			$products[$p->id] = (array)$p;

			// Product features
			$options = $this->features->get_product_options($p->id);
			foreach ($options as $option) {
				if (!isset($products[$option->product_id][$option->name]))
					$products[$option->product_id][$option->name] = str_replace(',', '.', trim($option->value));
				else
					$products[$option->product_id][$option->name] .= '|' . $option->value;
			}
		}

		if (empty($products))
			return false;

		// Product categories
		foreach ($products as $p_id => &$product) {
			$categories = array();
			$cats = $this->categories->get_product_categories($p_id);
			foreach ($cats as $category) {
				$path = array();
				$cat = $this->categories->get_category((int)$category->category_id);
				if (!empty($cat)) {
					// Calculate the components of the category
					foreach ($cat->path as $p)
						$path[] = str_replace($this->subcategory_delimiter, '\\' . $this->subcategory_delimiter, $p->name);
					// Adding a category to a product
					$categories[] = implode('/', $path);
				}
			}
			$product['category'] = implode(', ', $categories);
		}

		// Product images
		$images = $this->products->get_images(array('product_id' => array_keys($products)));
		foreach ($images as $image) {
			// Add images to a product with a comma
			if (empty($products[$image->product_id]['images']))
				$products[$image->product_id]['images'] = $image->filename;
			else
				$products[$image->product_id]['images'] .= ', ' . $image->filename;
		}

		$variants = $this->variants->get_variants(array('product_id' => array_keys($products)));

		foreach ($variants as $variant) {
			if (isset($products[$variant->product_id])) {
				$v                    = array();
				$v['variant']         = $variant->name;
				$v['color']           = $variant->color;
				$v['color_code']      = $variant->color_code;
				$v['price']           = $variant->oprice;
				$v['compare_price']   = $variant->compare_price;
				$v['sku']             = $variant->sku;
				$v['stock']           = $variant->stock;
				$v['weight']          = $variant->weight;
				$v['currency']        = $variant->currency_id;
				if ($variant->infinity)
					$v['stock']           = '';
				$products[$variant->product_id]['variants'][] = $v;
			}
		}

		$all_brands = array();
		foreach ($this->brands->get_brands() as $b) {
			$all_brands[$b->id] = $b;
		}

		foreach ($products as &$product) {
			if ($product['brand_id'] && isset($all_brands[$product['brand_id']])) {
				$product['brand'] = $all_brands[$product['brand_id']]->name;
			}

			$variants = $product['variants'];
			unset($product['variants']);

			if (isset($variants))
				foreach ($variants as $variant) {
					$result = array();
					$result =  $product;
					foreach ($variant as $name => $value)
						$result[$name] = $value;

					foreach ($this->columns_names as $internal_name => $column_name) {
						if (isset($result[$internal_name]))
							$res[$internal_name] = $result[$internal_name];
						else
							$res[$internal_name] = '';
					}
					fputcsv($f, $res, $this->column_delimiter);
				}
		}

		$total_products = $this->products->count_products($filter);

		if ($this->products_count * $page < $total_products)
			return array('end' => false, 'page' => $page, 'totalpages' => $total_products / $this->products_count);
		else
			return array('end' => true, 'page' => $page, 'totalpages' => $total_products / $this->products_count);

		fclose($f);
	}
}

$export_ajax = new ExportAjax();
$data = $export_ajax->fetch();
if ($data) {
	header("Content-type: application/json; charset=utf-8");
	header("Cache-Control: must-revalidate");
	header("Pragma: no-cache");
	header("Expires: -1");
	$json = json_encode($data);
	print $json;
}
