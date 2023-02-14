<?php

require_once('Turbo.php');

class ReportStat extends Turbo
{
	function get_stat($filter = array())
	{ // Product selection

		$weekdays = array(
			' ' . $this->backend_translations->global_days_su . ' ',
			' ' . $this->backend_translations->global_days_mo . ' ',
			' ' . $this->backend_translations->global_days_tu . ' ',
			' ' . $this->backend_translations->global_days_we . ' ',
			' ' . $this->backend_translations->global_days_th . ' ',
			' ' . $this->backend_translations->global_days_fr . ' ',
			' ' . $this->backend_translations->global_days_sa . ' '
		);

		$all_filters = $this->make_filter($filter);

		$query = $this->db->placehold("SELECT 
				o.total_price,
				DATE_FORMAT(o.date,'%d.%m.%y') date, 
				DATE_FORMAT(o.date,'%w') weekday, 
				DATE_FORMAT(o.date,'%H') hour, 
				DATE_FORMAT(o.date,'%d') day, 
				DATE_FORMAT(o.date,'%m') month, 
				DATE_FORMAT(o.date,'%Y') year, 
				o.status
			FROM __orders o
			LEFT JOIN __orders_labels AS ol ON o.id=ol.order_id
			WHERE 1 $all_filters ORDER BY o.date");

		$this->db->query($query);
		$data = $this->db->results();

		$group = 'day';
		if (isset($filter['date_filter'])) {
			switch ($filter['date_filter']) {
				case 'today':
					$group = 'hour';
					break;
				case 'yesterday':
					$group = 'hour';
					break;
				case 'last_24hour':
					$group = 'hour';
					break;
				case 'this_year':
					$group = 'month';
					break;
				case 'last_year':
					$group = 'month';
					break;
				case 'all':
					$group = 'month';
					break;
			}
		}

		$results = array();

		foreach ($data as $d) {
			switch ($group) {
				case 'hour':
					$date = $d->year . $d->month . $d->day . $d->hour;
					$results[$date]['title'] = $d->day . '.' . $d->month . ' ' . $d->hour . ':00';
					break;
				case 'day':
					$date = $d->year . $d->month . $d->day;
					$results[$date]['title'] = $d->date . ' ' . $weekdays[$d->weekday];
					break;
				case 'month':
					$date = $d->year . $d->month;
					$results[$date]['title'] = $d->month . '.' . $d->year;
					break;
			}

			if (!isset($results[$date]['new']))
				$results[$date]['new'] = $results[$date]['confirm'] = $results[$date]['complite'] = $results[$date]['delete'] = 0;

			switch ($d->status) {
				case 0:
					$results[$date]['new'] += $d->total_price;
					break;
				case 1:
					$results[$date]['confirm'] += $d->total_price;
					break;
				case 2:
					$results[$date]['complite'] += $d->total_price;
					break;
				case 3:
					$results[$date]['delete'] += $d->total_price;
					break;
			}
		}
		return $results;
	}

	function get_stat_orders($filter = array())
	{ // Product selection

		$weekdays = array(
			' ' . $this->backend_translations->global_days_su . ' ',
			' ' . $this->backend_translations->global_days_mo . ' ',
			' ' . $this->backend_translations->global_days_tu . ' ',
			' ' . $this->backend_translations->global_days_we . ' ',
			' ' . $this->backend_translations->global_days_th . ' ',
			' ' . $this->backend_translations->global_days_fr . ' ',
			' ' . $this->backend_translations->global_days_sa . ' '
		);

		$all_filters = $this->make_filter($filter);

		$query = $this->db->placehold("SELECT 
				o.id, 
				DATE_FORMAT(o.date,'%d.%m.%y') date, 
				DATE_FORMAT(o.date,'%w') weekday, 
				DATE_FORMAT(o.date,'%H') hour, 
				DATE_FORMAT(o.date,'%d') day, 
				DATE_FORMAT(o.date,'%m') month, 
				DATE_FORMAT(o.date,'%Y') year, 
				o.status
			FROM __orders o
			LEFT JOIN __orders_labels AS ol ON o.id=ol.order_id
			WHERE 1 $all_filters ORDER BY o.date");
		$this->db->query($query);
		$data = $this->db->results();

		$group = 'day';
		if (isset($filter['date_filter'])) {
			switch ($filter['date_filter']) {
				case 'today':
					$group = 'hour';
					break;
				case 'yesterday':
					$group = 'hour';
					break;
				case 'last_24hour':
					$group = 'hour';
					break;
				case 'this_year':
					$group = 'month';
					break;
				case 'last_year':
					$group = 'month';
					break;
				case 'all':
					$group = 'month';
					break;
			}
		}

		$results = array();

		foreach ($data as $d) {
			switch ($group) {
				case 'hour':
					$date = $d->year . $d->month . $d->day . $d->hour;
					$results[$date]['title'] = $d->day . '.' . $d->month . ' ' . $d->hour . ':00';
					break;
				case 'day':
					$date = $d->year . $d->month . $d->day;
					$results[$date]['title'] = $d->date . ' ' . $weekdays[$d->weekday];
					break;
				case 'month':
					$date = $d->year . $d->month;
					$results[$date]['title'] = $d->month . '.' . $d->year;
					break;
			}

			if (!isset($results[$date]['new']))
				$results[$date]['new'] = $results[$date]['confirm'] = $results[$date]['complite'] = $results[$date]['delete'] = 0;

			switch ($d->status) {
				case 0:
					$results[$date]['new']++;
					break;
				case 1:
					$results[$date]['confirm']++;
					break;
				case 2:
					$results[$date]['complite']++;
					break;
				case 3:
					$results[$date]['delete']++;
					break;
			}
		}
		return $results;
	}

	// Fetch sales statistics
	public function get_report_purchases($filter = array())
	{
		// Default
		$sort_prod = 'sum_price DESC';

		if (isset($filter['sort_prod'])) {
			switch ($filter['sort_prod']) {
				case 'price': {
						$sort_prod = $this->db->placehold('sum_price DESC');
						break;
					}
				case 'price_in': {
						$sort_prod = $this->db->placehold('sum_price ASC');
						break;
					}
				case 'amount': {
						$sort_prod = $this->db->placehold('amount DESC');
						break;
					}
				case 'amount_in': {
						$sort_prod = $this->db->placehold('amount ASC');
						break;
					}
			}
		}

		$all_filters = $this->make_filter($filter);

		$limit = 1000;
		$page = 1;

		if (isset($filter['limit'])) {
			$limit = max(1, intval($filter['limit']));
		}
		if (isset($filter['page'])) {
			$page = max(1, intval($filter['page']));
		}
		$sql_limit = $this->db->placehold(' LIMIT ?, ? ', ($page - 1) * $limit, $limit);

		// Select orders
		$query = $this->db->placehold("SELECT
				o.id,
				p.product_id,
				p.variant_id,
				p.product_name,
				p.variant_name,
				p.variant_color,
				SUM(p.price * p.amount) as sum_price,
				SUM(p.amount) as amount,
				p.sku 
			FROM __purchases AS p
			LEFT JOIN __orders AS o ON o.id = p.order_id
			WHERE 
				1 
				$all_filters
			GROUP BY p.variant_id
			ORDER BY $sort_prod 
			$sql_limit
		");

		$this->db->query($query);
		return $this->db->results();
	}

	// Counting the number for statistics
	public function get_report_purchases_count($filter = array())
	{
		// Default
		$all_filters = $this->make_filter($filter);

		// Select orders
		$query = $this->db->placehold("SELECT 
			count(DISTINCT p.variant_id) as count
			FROM __purchases AS p
			LEFT JOIN __orders AS o ON o.id = p.order_id
			WHERE
				1
				$all_filters
		");
		$this->db->query($query);
		return $this->db->result('count');
	}

	function get_report_product($filter = array(), $id = null)
	{ // Selecting a product for the product page
		// Default
		$variant_id = '';

		if (isset($filter['variant_id']))
			$variant_id = $this->db->placehold('AND p.variant_id = ?', intval($filter['variant_id']));

		$all_filters = $this->make_filter($filter);

		// Select orders
		$query = $this->db->placehold("SELECT 
				o.id, 
				DATE(o.date) as date, 
				p.product_id, 
				p.variant_id, 
				p.product_name, 
				p.variant_name,
				p.variant_color,
				SUM(p.price * p.amount) as price, 
				SUM(p.amount) as amount
			FROM __orders AS o 
			LEFT JOIN __purchases AS p ON o.id = p.order_id 
			LEFT JOIN __orders_labels AS ol ON o.id=ol.order_id 
			WHERE 1 AND p.product_id=? $variant_id $all_filters 
			GROUP BY p.variant_id
			ORDER BY o.date", $id);

		$this->db->query($query);
		return $this->db->results();
	}

	function get_report_product_stat($filter = array(), $id = null)
	{ // Selecting a product for the product page
		// Default
		$variant_id = '';

		if (isset($filter['variant_id']))
			$variant_id = $this->db->placehold('AND p.variant_id = ?', intval($filter['variant_id']));

		$all_filters = $this->make_filter($filter);

		// Select orders
		$query = $this->db->placehold("SELECT 
				o.id, 
				DATE(o.date) as date, 
				p.product_id, 
				p.variant_id, 
				p.product_name, 
				p.variant_name,
				p.variant_color,
				SUM(p.price * p.amount) as price, 
				SUM(p.amount) as amount
			FROM __orders AS o 
			LEFT JOIN __purchases AS p ON o.id = p.order_id 
			LEFT JOIN __orders_labels AS ol ON o.id=ol.order_id 
			WHERE 1 AND p.product_id=? $variant_id $all_filters 
			GROUP BY DATE(o.date) 
			ORDER BY o.date", $id);

		$this->db->query($query);
		return $this->db->results();
	}

	// Sales statistics filter
	private function make_filter($filter = array())
	{
		// Default
		$period_filter = '';
		$date_filter = '';
		$status_filter = '';
		$label_filter = '';

		if (isset($filter['status'])) {
			$status_filter = $this->db->placehold('AND o.status = ?', intval($filter['status']));
		}

		if (isset($filter['label'])) {
			$label_filter = $this->db->placehold('AND ol.label_id = ?', $filter['label']);
		}

		if (isset($filter['date_from']) && !isset($filter['date_to'])) {
			$period_filter = $this->db->placehold('AND o.date > ?', $filter['date_from']);
		} elseif (isset($filter['date_to']) && !isset($filter['date_from'])) {
			$period_filter = $this->db->placehold('AND o.date < ?', $filter['date_to']);
		} elseif (isset($filter['date_to']) && isset($filter['date_from'])) {
			$period_filter = $this->db->placehold('AND (o.date BETWEEN ? AND ?)', $filter['date_from'], $filter['date_to']);
		}

		if (isset($filter['date_filter'])) {
			switch ($filter['date_filter']) {
				case 'today': {
						$date_filter = 'AND DATE(o.date) = DATE(NOW())';
						break;
					}
				case 'this_week': {
						$date_filter = 'AND WEEK(o.date - INTERVAL 1 DAY) = WEEK(now()) /**/ AND YEAR(o.date - INTERVAL 1 DAY) = YEAR(now())';
						break;
					}
				case 'this_month': {
						$date_filter = 'AND MONTH(o.date) = MONTH(now()) /**/ AND YEAR(o.date) = YEAR(now())';
						break;
					}
				case 'this_year': {
						$date_filter = 'AND YEAR(o.date) = YEAR(now())';
						break;
					}
				case 'yesterday': {
						$date_filter = 'AND DATE(o.date) = DATE(DATE_SUB(NOW(),INTERVAL 1 DAY))';
						break;
					}
				case 'last_week': {
						$date_filter = 'AND WEEK(o.date - INTERVAL 1 DAY) = WEEK(DATE_SUB(NOW(),INTERVAL 1 WEEK)) /**/ AND YEAR(o.date - INTERVAL 1 DAY) = YEAR(DATE_SUB(NOW(),INTERVAL 1 WEEK))';
						break;
					}
				case 'last_month': {
						$date_filter = 'AND MONTH(o.date) = MONTH(DATE_SUB(NOW(),INTERVAL 1 MONTH)) /**/ AND YEAR(o.date) = YEAR(DATE_SUB(NOW(),INTERVAL 1 MONTH))';
						break;
					}
				case 'last_year': {
						$date_filter = 'AND YEAR(o.date) = YEAR(DATE_SUB(NOW(),INTERVAL 1 YEAR))';
						break;
					}
				case 'last_24hour': {
						$date_filter = 'AND o.date >= DATE_SUB(NOW(),INTERVAL 24 HOUR)';
						break;
					}
				case 'last_7day': {
						$date_filter = 'AND DATE(o.date) >= DATE(DATE_SUB(NOW(),INTERVAL 6 DAY))';
						break;
					}
				case 'last_30day': {
						$date_filter = 'AND DATE(o.date) >= DATE(DATE_SUB(NOW(),INTERVAL 29 DAY))';
						break;
					}
			}
		}
		return "$status_filter $date_filter $period_filter $label_filter";
	}

	// Sales categorization selection 
	public function get_categorized_stat($filter = array())
	{
		$category_filter = '';
		$brand_filter = '';
		$period_filter = '';

		$category_join = ' LEFT JOIN __products_categories pc ON (pc.product_id = p.id AND pc.category_id=(SELECT category_id FROM __products_categories WHERE p.id=product_id ORDER BY position LIMIT 1)) ';
		$orders_join = '';

		if (!empty($filter['category_id'])) {
			$category_filter = $this->db->placehold(" AND pc.category_id in (?@)", (array)$filter['category_id']);
		}

		if (!empty($filter['brand_id'])) {
			$brand_filter = $this->db->placehold(" AND p.brand_id=? ", intval($filter['brand_id']));
		}

		if (isset($filter['date_from']) && !isset($filter['date_to'])) {
			$period_filter = $this->db->placehold('AND o.date > ?', $filter['date_from']);
			$orders_join = ' LEFT JOIN __orders o ON o.id=pp.order_id ';
		} elseif (isset($filter['date_to']) && !isset($filter['date_from'])) {
			$period_filter = $this->db->placehold('AND o.date < ?', $filter['date_to']);
			$orders_join = ' LEFT JOIN __orders o ON o.id=pp.order_id ';
		} elseif (isset($filter['date_to']) && isset($filter['date_from'])) {
			$period_filter = $this->db->placehold('AND (o.date BETWEEN ? AND ?)', $filter['date_from'], $filter['date_to']);
			$orders_join = ' LEFT JOIN __orders o ON o.id=pp.order_id ';
		}

		$query = $this->db->placehold("SELECT 
				pc.category_id, 
				SUM(pp.amount) as amount, 
				SUM(pp.amount * pp.price) as price
				FROM __purchases pp
				LEFT JOIN __products p ON p.id=pp.product_id
				$category_join
				$orders_join
				WHERE
					1
					$category_filter
					$brand_filter
					$period_filter
				GROUP BY pc.category_id
		");
		$this->db->query($query);
		$result = array();
		foreach ($this->db->results() as $v) {
			$result[$v->category_id] = $v;
		}
		return $result;
	}
}
