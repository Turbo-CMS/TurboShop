<?php

require_once '../../../api/Turbo.php';

class StatAjax extends Turbo
{
	public function fetch(): array
	{
		$query = $this->db->placehold(
			'SELECT 
				SUM(o.total_price) AS total_price, 
				MAX(DAY(date)) AS day, 
				MAX(MONTH(date)) AS month, 
				MAX(YEAR(date)) AS year 
			FROM __orders o 
			WHERE 
				o.closed 
			GROUP BY YEAR(o.date), MONTH(o.date), DATE(o.date)'
		);

		$this->db->query($query);
		$data = $this->db->results();

		$results = [];

		foreach ($data as $d) {
			$result = [
				'day' => $d->day,
				'month' => $d->month,
				'year' => $d->year,
				'y' => $d->total_price,
			];

			$results[] = $result;
		}

		return $results;
	}
}

$statAjax = new StatAjax();

header('Content-type: application/json; charset=utf-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

$json = json_encode($statAjax->fetch());
print $json;
