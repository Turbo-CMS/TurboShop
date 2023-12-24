<?php

session_start();

require_once '../../api/Turbo.php';

class ExportAjax extends Turbo
{
	private $columnNames = [
		'email' => 'Email'
	];

	private $columnDelimiter = ';';
	private $countSubscribes = 5;
	private $exportFilesDir = '../files/export_users/';
	private $fileName = 'subscribes.csv';

	public function fetch()
	{
		if (!$this->managers->access('subscribes')) {
			return false;
		}

		$this->db->query('SET NAMES cp1251');

		$page = $this->request->get('page');

		if (empty($page) || $page === 1) {
			$page = 1;

			if (is_writable($this->exportFilesDir . $this->fileName)) {
				@unlink($this->exportFilesDir . $this->fileName);
			}
		}

		$file = fopen($this->exportFilesDir . $this->fileName, 'ab');

		if ($page == 1) {
			fputcsv($file, $this->columnNames, $this->columnDelimiter);
		}

		$filter = [];
		$filter['page'] = $page;
		$filter['limit'] = $this->countSubscribes;
		$filter['sort'] = $this->request->get('sort');
		$filter['keyword'] = $this->request->get('keyword');

		$subscribes = $this->subscribes->get_subscribes($filter);

		foreach ($subscribes as $subscribe) {
			$str = [];

			foreach ($this->columnNames as $name => $column) {
				$str[] = $subscribe->$name;
			}

			fputcsv($file, $str, $this->columnDelimiter);
		}

		$totalSubscribes = $this->subscribes->count_subscribes();

		if ($this->countSubscribes * $page < $totalSubscribes) {
			return ['end' => false, 'page' => $page, 'totalPages' => $totalSubscribes / $this->countSubscribes];
		} else {
			return ['end' => true, 'page' => $page, 'totalPages' => $totalSubscribes / $this->countSubscribes];
		}

		fclose($file);
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
