<?php

require_once 'Turbo.php';

class Coupons extends Turbo
{

	/**
	 * Get Coupon
	 */
	public function getCoupon($id)
	{
		if (is_string($id)) {
			$where = $this->db->placehold('WHERE c.code=?', $id);
		} else {
			$where = $this->db->placehold('WHERE c.id=?', $id);
		}

		$query = $this->db->placehold(
			"SELECT 
				c.id, 
				c.code, 
				c.value, 
				c.type, 
				c.expire, 
				min_order_price, 
				c.single, 
				c.usages,
				((DATE(NOW()) <= DATE(c.expire) OR c.expire IS NULL) AND (c.usages=0 OR NOT c.single)) AS valid
			 FROM 
				 __coupons c 
			 $where 
			 LIMIT 1"
		);

		if ($this->db->query($query)) {
			return $this->db->result();
		} else {
			return false;
		}
	}

	/**
	 * Get Coupons
	 */
	public function getCoupons($filter = [])
	{
		$limit = 1000;
		$page = 1;
		$couponIdFilter = '';
		$validFilter = '';
		$keywordFilter = '';

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (!empty($filter['id'])) {
			$couponIdFilter = $this->db->placehold('AND c.id IN(?@)', (array) $filter['id']);
		}

		if (isset($filter['valid'])) {
			if ($filter['valid']) {
				$validFilter = $this->db->placehold('AND ((DATE(NOW()) <= DATE(c.expire) OR c.expire IS NULL) AND (c.usages=0 OR NOT c.single))');
			} else {
				$validFilter = $this->db->placehold('AND NOT ((DATE(NOW()) <= DATE(c.expire) OR c.expire IS NULL) AND (c.usages=0 OR NOT c.single))');
			}
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (b.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR b.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		$sqlLimit = $this->db->placehold(' LIMIT ?, ?', ($page - 1) * $limit, $limit);

		$query = $this->db->placehold(
			"SELECT c.id, 
					c.code, 
					c.value, 
					c.type, 
					c.expire, 
					min_order_price, 
					c.single, 
					c.usages,
					((DATE(NOW()) <= DATE(c.expire) OR c.expire IS NULL) AND (c.usages=0 OR NOT c.single)) AS valid
			 FROM __coupons c 
			 WHERE 1
				$couponIdFilter 
				$validFilter 
				$keywordFilter
			 ORDER BY valid DESC, id DESC 
			 $sqlLimit",
			$this->settings->date_format
		);

		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Count Coupons 
	 */
	public function countCoupons($filter = [])
	{
		$couponIdFilter = '';
		$validFilter = '';
		$keywordFilter = '';

		if (!empty($filter['id'])) {
			$couponIdFilter = $this->db->placehold('AND c.id IN(?@)', (array) $filter['id']);
		}

		if (isset($filter['valid'])) {
			$validFilter = $this->db->placehold('AND ((DATE(NOW()) <= DATE(c.expire) OR c.expire IS NULL) AND (c.usages=0 OR NOT c.single))');
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (b.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR b.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		$query = $this->db->placehold(
			"SELECT COUNT(distinct c.id) AS count 
			FROM __coupons c 
			WHERE 1 $couponIdFilter $validFilter"
		);

		if ($this->db->query($query)) {
			return $this->db->result('count');
		} else {
			return false;
		}
	}

	/**
	 * Add Coupon
	 */
	public function addCoupon($coupon)
	{
		if (empty($coupon->single)) {
			$coupon->single = 0;
		}

		$query = $this->db->placehold("INSERT INTO __coupons SET ?%", $coupon);

		if (!$this->db->query($query)) {
			return false;
		} else {
			return $this->db->insertId();
		}
	}

	/**
	 * Update Coupon
	 */
	public function updateCoupon($id, $coupon)
	{
		$query = $this->db->placehold("UPDATE __coupons SET ?% WHERE id IN(?@) LIMIT ?", $coupon, (array) $id, count((array) $id));
		$this->db->query($query);

		return $id;
	}

	/**
	 * Deletes Coupon
	 */
	public function deleteCoupon($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __coupons WHERE id=? LIMIT 1", (int) $id);
			return $this->db->query($query);
		}

		return false;
	}
}
