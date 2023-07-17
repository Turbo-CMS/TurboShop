<?php

require_once '../../../api/Turbo.php';

class StatAjax extends Turbo
{
	public function fetch()
	{
		$query = $this->db->placehold(
			'SELECT
				SUM(o.total_price) AS total_price,
				DAY(date) AS day,
				MONTH(date) AS month,
				YEAR(date) AS year
			FROM
				t_orders o
			GROUP BY
				DATE(o.date)
			ORDER BY
				DATE(o.date) DESC
			LIMIT 30'
		);

		$this->db->query($query);
		$data = $this->db->results();

		$results = [];

		foreach ($data as $d) {
			$result = [
				'day' => $d->day,
				'month' => $d->month,
				'year' => $d->year,
				'x' => $d->total_price,
				'y' => 0,
				'z' => 0,
			];

			$results[$d->year . $d->month . $d->day] = $result;
		}

		$query = $this->db->placehold(
			'SELECT SUM(o.total_price) AS total_price, 
				DAY(date) AS day, 
				MONTH(date) AS month, 
				YEAR(date) AS year 
			FROM 
				t_orders o 
			WHERE 
				o.paid = 0 
			GROUP BY 
				DATE(o.date) 
			ORDER BY 
				o.date DESC  
			LIMIT 30'
		);

		$this->db->query($query);
		$data = $this->db->results();

		foreach ($data as $d) {
			$results[$d->year . $d->month . $d->day]['y'] = $d->total_price;
		}

		$query = $this->db->placehold(
			'SELECT 
				SUM(o.total_price) AS total_price,
				DAY(date) AS day,
				MONTH(date) AS month,
				YEAR(date) AS year 
			FROM 
				t_orders o 
			WHERE 
				o.paid = 1 
			GROUP BY 
				DATE(o.date) 
			ORDER BY 
				DATE(o.date) DESC
			LIMIT 30'
		);

		$this->db->query($query);
		$data = $this->db->results();

		foreach ($data as $d) {
			$results[$d->year . $d->month . $d->day]['z'] = $d->total_price;
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
