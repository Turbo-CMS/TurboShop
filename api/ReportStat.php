<?php

require_once 'Turbo.php';

class ReportStat extends Turbo
{
	/**
	 * Get statistics
	 */
	function getStat($filter = [])
	{
		$weekdays = [
			' ' . $this->backendTranslations->global_days_su . ' ',
			' ' . $this->backendTranslations->global_days_mo . ' ',
			' ' . $this->backendTranslations->global_days_tu . ' ',
			' ' . $this->backendTranslations->global_days_we . ' ',
			' ' . $this->backendTranslations->global_days_th . ' ',
			' ' . $this->backendTranslations->global_days_fr . ' ',
			' ' . $this->backendTranslations->global_days_sa . ' '
		];

		$allFilters = $this->makeFilter($filter);

		$query = $this->db->placehold(
			"SELECT 
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
			WHERE 1 $allFilters 
			ORDER BY o.date"
		);

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

		$results = [];

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

			if (!isset($results[$date]['new'], $results[$date]['confirm'], $results[$date]['complite'], $results[$date]['delete'])) {
				$results[$date]['new'] = 0;
				$results[$date]['confirm'] = 0;
				$results[$date]['complite'] = 0;
				$results[$date]['delete'] = 0;
			}

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

	/**
	 * Get statistics orders 
	 */
	function getStatOrders($filter = [])
	{
		$weekdays = [
			' ' . $this->backendTranslations->global_days_su . ' ',
			' ' . $this->backendTranslations->global_days_mo . ' ',
			' ' . $this->backendTranslations->global_days_tu . ' ',
			' ' . $this->backendTranslations->global_days_we . ' ',
			' ' . $this->backendTranslations->global_days_th . ' ',
			' ' . $this->backendTranslations->global_days_fr . ' ',
			' ' . $this->backendTranslations->global_days_sa . ' '
		];

		$allFilters = $this->makeFilter($filter);

		$query = $this->db->placehold(
			"SELECT 
				o.id,
				DATE_FORMAT(o.date, '%d.%m.%y') date,
				DATE_FORMAT(o.date, '%w') weekday,
				DATE_FORMAT(o.date, '%H') hour,
				DATE_FORMAT(o.date, '%d') day,
				DATE_FORMAT(o.date, '%m') month,
				DATE_FORMAT(o.date, '%Y') year,
				o.status
			FROM __orders o
			LEFT JOIN __orders_labels AS ol ON o.id=ol.order_id
			WHERE 1 $allFilters 
			ORDER BY o.date"
		);

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

		$results = [];

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

			if (!isset($results[$date]['new'])) {
				$results[$date]['new'] = 0;
				$results[$date]['confirm'] = 0;
				$results[$date]['complite'] = 0;
				$results[$date]['delete'] = 0;
			}

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

	/**
	 * Get report purchases
	 */
	public function getReportPurchases($filter = [])
	{
		$sortProd = 'sum_price DESC';

		if (isset($filter['sort_prod'])) {
			switch ($filter['sort_prod']) {
				case 'price': {
						$sortProd = $this->db->placehold('sum_price DESC');
						break;
					}
				case 'price_in': {
						$sortProd = $this->db->placehold('sum_price ASC');
						break;
					}
				case 'amount': {
						$sortProd = $this->db->placehold('amount DESC');
						break;
					}
				case 'amount_in': {
						$sortProd = $this->db->placehold('amount ASC');
						break;
					}
			}
		}

		$allFilters = $this->makeFilter($filter);

		$limit = 1000;
		$page = 1;

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		$query = $this->db->placehold(
			"SELECT
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
				$allFilters
			GROUP BY p.variant_id
			ORDER BY $sortProd 
			$sqlLimit"
		);

		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Get report purchases count
	 */
	public function getReportPurchasesCount($filter = [])
	{
		$allFilters = $this->makeFilter($filter);

		$query = $this->db->placehold("SELECT COUNT(DISTINCT p.variant_id) AS count FROM __purchases AS p LEFT JOIN __orders AS o ON o.id = p.order_id WHERE 1 $allFilters");
		$this->db->query($query);

		return $this->db->result('count');
	}

	/**
	 * Get report product
	 */
	function getReportProduct($filter = [], $id = null)
	{
		$variantId = '';

		if (isset($filter['variant_id'])) {
			$variantId = $this->db->placehold('AND p.variant_id=?', (int) $filter['variant_id']);
		}

		$allFilters = $this->makeFilter($filter);

		$query = $this->db->placehold(
			"SELECT 
				o.id, 
				DATE(o.date) AS date, 
				p.product_id, 
				p.variant_id, 
				p.product_name, 
				p.variant_name,
				p.variant_color,
				SUM(p.price * p.amount) AS price, 
				SUM(p.amount) AS amount
			FROM __orders AS o 
			LEFT JOIN __purchases AS p ON o.id=p.order_id 
			LEFT JOIN __orders_labels AS ol ON o.id=ol.order_id 
			WHERE 1 AND p.product_id=? $variantId $allFilters 
			GROUP BY p.variant_id
			ORDER BY o.date",
			$id
		);

		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Get product report statistics 
	 */
	function getReportProductStat($filter = [], $id = null)
	{
		$variantId = '';

		if (isset($filter['variant_id'])) {
			$variantId = $this->db->placehold('AND p.variant_id=?', (int) $filter['variant_id']);
		}

		$allFilters = $this->makeFilter($filter);

		$query = $this->db->placehold(
			"SELECT 
				o.id, 
				DATE(o.date) AS date, 
				p.product_id, 
				p.variant_id, 
				p.product_name, 
				p.variant_name, 
				p.variant_color, 
				SUM(p.price * p.amount) AS price, 
				SUM(p.amount) AS amount
			FROM __orders AS o 
				LEFT JOIN __purchases AS p ON o.id = p.order_id 
				LEFT JOIN __orders_labels AS ol ON o.id=ol.order_id 
			WHERE 1 AND p.product_id=? $variantId $allFilters 
			GROUP BY DATE(o.date) 
			ORDER BY o.date",
			$id
		);

		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Makes filter
	 */
	private function makeFilter($filter = [])
	{
		$periodFilter = '';
		$dateFilter = '';
		$statusFilter = '';
		$labelFilter = '';

		if (isset($filter['status'])) {
			$statusFilter = $this->db->placehold('AND o.status=?', (int) $filter['status']);
		}

		if (isset($filter['label'])) {
			$labelFilter = $this->db->placehold('AND ol.label_id=?', $filter['label']);
		}

		if (isset($filter['date_from']) && !isset($filter['date_to'])) {
			$periodFilter = $this->db->placehold('AND o.date > ?', $filter['date_from']);
		} elseif (isset($filter['date_to']) && !isset($filter['date_from'])) {
			$periodFilter = $this->db->placehold('AND o.date < ?', $filter['date_to']);
		} elseif (isset($filter['date_to'], $filter['date_from'])) {
			$periodFilter = $this->db->placehold('AND (o.date BETWEEN ? AND ?)', $filter['date_from'], $filter['date_to']);
		}

		if (isset($filter['date_filter'])) {
			switch ($filter['date_filter']) {
				case 'today':
					$dateFilter = 'AND DATE(o.date) = DATE(NOW())';
					break;
				case 'this_week':
					$dateFilter = 'AND WEEK(o.date - INTERVAL 1 DAY) = WEEK(now()) AND YEAR(o.date - INTERVAL 1 DAY) = YEAR(now())';
					break;
				case 'this_month':
					$dateFilter = 'AND MONTH(o.date) = MONTH(now()) AND YEAR(o.date) = YEAR(now())';
					break;
				case 'this_year':
					$dateFilter = 'AND YEAR(o.date) = YEAR(now())';
					break;
				case 'yesterday':
					$dateFilter = 'AND DATE(o.date) = DATE(DATE_SUB(NOW(),INTERVAL 1 DAY))';
					break;
				case 'last_week':
					$dateFilter = 'AND WEEK(o.date - INTERVAL 1 DAY) = WEEK(DATE_SUB(NOW(),INTERVAL 1 WEEK)) AND YEAR(o.date - INTERVAL 1 DAY) = YEAR(DATE_SUB(NOW(),INTERVAL 1 WEEK))';
					break;
				case 'last_month':
					$dateFilter = 'AND MONTH(o.date) = MONTH(DATE_SUB(NOW(),INTERVAL 1 MONTH)) AND YEAR(o.date) = YEAR(DATE_SUB(NOW(),INTERVAL 1 MONTH))';
					break;
				case 'last_year':
					$dateFilter = 'AND YEAR(o.date) = YEAR(DATE_SUB(NOW(),INTERVAL 1 YEAR))';
					break;
				case 'last_24hour':
					$dateFilter = 'AND o.date >= DATE_SUB(NOW(),INTERVAL 24 HOUR)';
					break;
				case 'last_7day':
					$dateFilter = 'AND DATE(o.date) >= DATE(DATE_SUB(NOW(),INTERVAL 6 DAY))';
					break;
				case 'last_30day':
					$dateFilter = 'AND DATE(o.date) >= DATE(DATE_SUB(NOW(),INTERVAL 29 DAY))';
					break;
			}
		}

		return "$statusFilter $dateFilter $periodFilter $labelFilter";
	}

	/**
	 * Get categorized statistical
	 */
	public function getCategorizedStat($filter = [])
	{
		$categoryFilter = '';
		$brandFilter = '';
		$periodFilter = '';

		$categoryJoin = 'LEFT JOIN __products_categories pc ON (pc.product_id=p.id AND pc.category_id=(SELECT category_id FROM __products_categories WHERE p.id=product_id ORDER BY position LIMIT 1))';
		$ordersJoin = '';

		if (!empty($filter['category_id'])) {
			$categoryFilter = $this->db->placehold('AND pc.category_id IN(?@)', (array) $filter['category_id']);
		}

		if (!empty($filter['brand_id'])) {
			$brandFilter = $this->db->placehold('AND p.brand_id=?', (int) $filter['brand_id']);
		}

		if (isset($filter['date_from']) && !isset($filter['date_to'])) {
			$periodFilter = $this->db->placehold('AND o.date > ?', $filter['date_from']);
			$ordersJoin = 'LEFT JOIN __orders o ON o.id=pp.order_id';
		} elseif (isset($filter['date_to']) && !isset($filter['date_from'])) {
			$periodFilter = $this->db->placehold('AND o.date < ?', $filter['date_to']);
			$ordersJoin = 'LEFT JOIN __orders o ON o.id=pp.order_id';
		} elseif (isset($filter['date_to'], $filter['date_from'])) {
			$periodFilter = $this->db->placehold('AND (o.date BETWEEN ? AND ?)', $filter['date_from'], $filter['date_to']);
			$ordersJoin = 'LEFT JOIN __orders o ON o.id=pp.order_id';
		}

		$query = $this->db->placehold(
			"SELECT 
				pc.category_id, 
				SUM(pp.amount) AS amount, 
				SUM(pp.amount * pp.price) AS price
			FROM __purchases pp
			LEFT JOIN __products p ON p.id=pp.product_id
			$categoryJoin
			$ordersJoin
			WHERE 1
				$categoryFilter
				$brandFilter
				$periodFilter
			GROUP BY pc.category_id"
		);

		$this->db->query($query);

		$result = [];

		foreach ($this->db->results() as $v) {
			$result[$v->category_id] = $v;
		}

		return $result;
	}
}
