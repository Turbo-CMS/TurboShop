<?php

require_once 'Turbo.php';

class Subscribes extends Turbo
{

	/**
	 * Get Subscribe
	 */
	public function getSubscribe($id)
	{
		$query = $this->db->placehold("SELECT c.id, c.email, c.processed, c.date FROM __subscribes c WHERE id=? LIMIT 1", $id);

		if ($this->db->query($query)) {
			return $this->db->result();
		}

		return null;
	}

	/**
	 * Get Subscribes
	 */
	public function getSubscribes($filter = [], $newOnTop = false)
	{
		$limit = 0;
		$page = 1;
		$processed = '';

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (isset($filter['processed'])) {
			$processed = $this->db->placehold('AND processed=?', $filter['processed']);
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		if ($newOnTop) {
			$sort = 'DESC';
		} else {
			$sort = 'ASC';
		}

		$query = $this->db->placehold("SELECT c.id, c.email, c.processed, c.date FROM __subscribes c WHERE 1 $processed ORDER BY c.id $sort $sqlLimit");
		$this->db->query($query);

		return $this->db->results();
	}

	/**
	 * Count Subscribes
	 */
	public function countSubscribes($filter = [])
	{
		$keywordFilter = '';
		$processedFilter = '';

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('OR c.email LIKE "%' . $this->db->escape(trim($keyword)) . '%"');
			}
		}

		if (isset($filter['processed'])) {
			$processedFilter = $this->db->placehold('AND c.processed = ?', (int) $filter['processed']);
		}

		$query = $this->db->placehold("SELECT COUNT(DISTINCT c.id) AS count FROM __subscribes c WHERE 1 $processedFilter $keywordFilter");
		$this->db->query($query);

		return $this->db->result('count');
	}

	/**
	 * Add Subscribes
	 */
	public function addSubscribe($subscribe)
	{
		$query = $this->db->placehold("INSERT INTO __subscribes SET ?%, date=NOW()", $subscribe);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		return $id;
	}

	/**
	 * Update Subscribes
	 */
	public function updateSubscribe($id, $subscribe)
	{
		$dateQuery = '';

		if (isset($subscribe['date'])) {
			$date = $subscribe['date'];
			unset($subscribe['date']);
			$dateQuery = $this->db->placehold(', date=STR_TO_DATE(?, ?)', $date, $this->settings->date_format);
		}

		$query = $this->db->placehold("UPDATE __subscribes SET ?% {$dateQuery} WHERE id IN(?@) LIMIT 1", $subscribe, (array) $id);
		$this->db->query($query);

		return $id;
	}

	/**
	 * Delete Subscribes
	 */
	public function deleteSubscribe($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __subscribes WHERE id=? LIMIT 1", (int) $id);
			$this->db->query($query);
		}
	}
}
