<?php

session_start();
require_once('../../api/Turbo.php');

class ExportAjax extends Turbo
{

	// Fields (columns) for the export file
	private $columns_names = array(
		'id' =>           'Order ID',
		'date' =>         'Order date',
		'name' =>         'User name',
		'phone' =>        'User phone',
		'email' =>        'User email',
		'address' =>      'User address',
		'comment' =>      'User comment',
		'total_price' =>  'Total price',
		'currency' =>     'Currency'

	);

	private $column_delimiter = ';';
	private $orders_count = 100;
	private $export_files_dir = '../files/export/';
	private $filename = 'export_orders.csv';

	public function fetch()
	{

		if (!$this->managers->access('orders'))
			return false;

		session_write_close();
		unset($_SESSION['lang_id']);

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

		$filter = array();

		$filter['page'] = $page;
		$filter['limit'] = $this->orders_count;

		// Status
		$status = $this->request->get('status', 'integer');
		if ($status < 4)
			$filter['status'] = $status;

		// Label
		$label_id = $this->request->get('label', 'integer');
		if (!empty($label_id)) {
			$filter['label'] = $label_id;
		}

		// Date
		$from_date = $this->request->get('from_date');
		$to_date = $this->request->get('to_date');

		if (!empty($from_date)) {
			$filter['from_date'] = $from_date;
		}
		if (!empty($to_date)) {
			$filter['to_date'] = $to_date;
		}

		// If you started from the beginning - add the column names to the first line
		if ($page == 1) {
			fputcsv($f, $this->columns_names, $this->column_delimiter);
		}

		// Main currency
		$main_currency =  $this->money->get_currency();

		// All orders
		$orders = $this->orders->get_orders($filter);
		if (!empty($orders)) {
			foreach ($orders as $o) {
				$str = array();
				$o->currency = $main_currency->code;
				foreach ($this->columns_names as $n => $c) {
					$str[] = $o->$n;
				}
				fputcsv($f, $str, $this->column_delimiter);
			}
		}
		$total_orders = $this->orders->count_orders($filter);

		if ($this->orders_count * $page < $total_orders) {
			return array('end' => false, 'page' => $page, 'totalpages' => $total_orders / $this->orders_count);
		} else {
			return array('end' => true, 'page' => $page, 'totalpages' => $total_orders / $this->orders_count);
		}

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
