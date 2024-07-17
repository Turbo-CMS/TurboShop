<?php

session_start();

require_once '../../api/Turbo.php';

class ExportAjax extends Turbo
{
	private $columnsNames = [
		'name' =>             'Category',
		'amount' =>           'Amount',
		'price' =>            'Price'
	];

	private $totalPrice;
	private $totalAmount;
	private $columnDelimiter = ';';
	private $exportFilesDir = '../files/export/';
	private $filename = 'export_stat_categories.csv';

	public function fetch()
	{
		if (!$this->managers->access('stats')) {
			return false;
		}

		$this->db->query('SET NAMES cp1251');

		$page = $this->request->get('page');

		if (empty($page) || $page == 1) {
			$page = 1;

			if (is_writable($this->exportFilesDir . $this->filename)) {
				@unlink($this->exportFilesDir . $this->filename);
			}
		}

		$f = fopen($this->exportFilesDir . $this->filename, 'ab');

		if ($page == 1) {
			fputcsv($f, $this->columnsNames, $this->columnDelimiter);
		}

		$filter = [];
		$filter['page'] = $page;

		$this->totalPrice = 0;
		$this->totalAmount = 0;

		$categoryId = $this->request->get('category', 'integer');

		if (!empty($categoryId)) {
			$category = $this->categories->getCategory($categoryId);
			$this->design->assign('category', $category);
			$filter['category_id'] = $category->children;
		}

		$brandId = $this->request->get('brand', 'integer');

		if (!empty($brandId)) {
			$filter['brand_id'] = $brandId;
			$brand = $this->brands->getBrand($brandId);
			$this->design->assign('brand', $brand);
		}

		$dateFrom = $this->request->get('date_from');
		$dateTo = $this->request->get('date_to');

		if (!empty($dateFrom) || !empty($dateTo)) {
			if (!empty($dateFrom)) {
				$filter['date_from'] = date("Y-m-d 00:00:01", strtotime($dateFrom));
			}

			if (!empty($dateTo)) {
				$filter['date_to'] = date("Y-m-d 23:59:00", strtotime($dateTo));
			}
		}

		$categories = $this->categories->getCategoriesTree();
		$purchases = $this->reportstat->getCategorizedStat($filter);

		if (!empty($category)) {
			$categoriesList = $this->catTree([$category], $purchases);
		} else {
			$categoriesList = $this->catTree($categories, $purchases);
		}

		foreach ($categoriesList as $c) {
			fputcsv($f, $c, $this->columnDelimiter);
		}

		$total = ['name' => 'Total', 'amount' => $this->totalAmount, 'price' => $this->totalPrice];

		fputcsv($f, $total, $this->columnDelimiter);
		fclose($f);

		return true;
	}

	private function catTree($categories, $purchases = [], &$result = [])
	{
		foreach ($categories as $k => $v) {
			$category = [];
			$path = [];

			foreach ($v->path as $p) {
				$path[] = isset($this->subcategoryDelimiter) ? str_replace($this->subcategoryDelimiter, '\\' . $this->subcategoryDelimiter, $p->name) : $p->name;
			}

			if (isset($purchases[$v->id])) {
				$price = floatval($purchases[$v->id]->price);
				$amount = intval($purchases[$v->id]->amount);
			} else {
				$price = 0;
				$amount = 0;
			}

			$category['name'] = implode('/', $path);
			$category['price'] = $price;
			$category['amount'] = $amount;

			$result[] = $category;
			$this->totalPrice += $price;
			$this->totalAmount += $amount;

			if (isset($v->subcategories)) {
				array_merge($result, $this->catTree($v->subcategories, $purchases, $result));
			}
		}

		return $result;
	}
}

$exportAjax = new ExportAjax();

$data = $exportAjax->fetch();

if ($data) {
	header("Content-type: application/json; charset=utf-8");
	header("Cache-Control: must-revalidate");
	header("Pragma: no-cache");
	header("Expires: -1");

	$json = json_encode($data);

	print $json;
}
