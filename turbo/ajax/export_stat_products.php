<?php

session_start();

require_once('../../api/Turbo.php');

class ExportAjax extends Turbo
{

	// Fields (columns) for the export file
	private $columns_names = array(
		'category_name'     =>    'Category',
		'product_name'      =>    'Name',
		'sum_price'         =>    'Price',
		'amount'            =>    'Amount'
	);

	private $column_delimiter = ';';
	private $stat_count = 100;
	private $export_files_dir = '../files/export/';
	private $filename = 'export_stat_products.csv';

	public function fetch()
	{

		if (!$this->managers->access('stats'))
			return false;

		// Excel only eats 1251
		$this->db->query('SET NAMES cp1251');

		// Page to be exported
		$page = $this->request->get('page');
		if (empty($page) || $page == 1) {
			$page = 1;
			// If you started over, delete the old export file
			if (is_writable($this->export_files_dir . $this->filename)) {
				unlink($this->export_files_dir . $this->filename);
			}
		}

		// Opening the export file for adding
		$f = fopen($this->export_files_dir . $this->filename, 'ab');

		// If you started from the beginning - add the column names to the first line
		if ($page == 1) {
			fputcsv($f, $this->columns_names, $this->column_delimiter);
		}

		$filter = array();
		$date_filter = $this->request->get('date_filter');
		if (!empty($date_filter)) {
			$filter['date_filter'] = $date_filter;
		}

		if ($this->request->get('date_from') || $this->request->get('date_to')) {
			$date_from = $this->request->get('date_from');
			$date_to = $this->request->get('date_to');
		}

		if ($this->request->get('category')) {
			$filter['category_id'] = $this->request->get('category');
		}

		if (!empty($date_from)) {
			$filter['date_from'] = date("Y-m-d 00:00:01", strtotime($date_from));
		}
		if (!empty($date_to)) {
			$filter['date_to'] = date("Y-m-d 23:59:00", strtotime($date_to));
		}
		$status = $this->request->get('status', 'integer');
		if (!empty($status)) {
			$filter['status'] = $status;
		}

		$sort_prod = $this->request->get('sort_prod');
		if (!empty($sort_prod)) {
			$filter['sort_prod'] = $sort_prod;
		} else {
			$filter['sort_prod'] = 'price';
		}

		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = 40;

		$temp_filter = $filter;
		unset($temp_filter['limit']);
		unset($temp_filter['page']);
		$total_count = $this->reportstat->get_report_purchases_count($temp_filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $total_count;
		}

		$total_summ = 0;
		$total_amount = 0;
		$report_stat_purchases = $this->reportstat->get_report_purchases($filter);
		$cat_filter = $this->request->get('category');
		@$cat = $this->categories->get_category(intval($filter['category_id']));
		foreach ($report_stat_purchases as $id => $r) {
			if (!empty($r->product_id)) {
				$tmp_cat = $this->categories->get_categories(array('product_id' => $r->product_id));
				$tmp_cat = reset($tmp_cat);

				if (!empty($cat_filter) && !in_array($cat_filter, (array)$tmp_cat->path[$cat->level_depth - 1]->children)) {
					unset($report_stat_purchases[$id]);
				} else {
					$report_stat_purchases[$id]->category_name = $tmp_cat->name;
				}
			}
		}

		foreach ($report_stat_purchases as $u) {
			$total_summ += $u->sum_price;
			$total_amount += $u->amount;
			$str = array();
			foreach ($this->columns_names as $n => $c) {
				$str[] = $u->$n;
			}
			fputcsv($f, $str, $this->column_delimiter);
		}

		$total = array('category_name' => 'Total', 'product_name' => ' ', 'price' => $total_summ, 'amount' => $total_amount);
		fputcsv($f, $total, $this->column_delimiter);

		fclose($f);
		if ($this->stat_count * $page < $total_count) {
			return array('end' => false, 'page' => $page, 'totalpages' => $total_count / $this->stat_count);
		} else {
			return array('end' => true, 'page' => $page, 'totalpages' => $total_count / $this->stat_count);
		}
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
