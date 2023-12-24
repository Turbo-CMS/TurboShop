<?php

require_once 'Turbo.php';

class Feedbacks extends Turbo
{
	/**
	 * Get Feedback
	 */
	public function getFeedback($id)
	{
		$query = $this->db->placehold(
			"SELECT
				f.id,
				f.name,
				f.processed,
				f.email,
				f.ip,
				f.message,
				f.date
			FROM __feedbacks f
			WHERE id=?
			LIMIT 1",
			(int) $id
		);

		if ($this->db->query($query)) {
			return $this->db->result();
		} else {
			return false;
		}
	}

	/**
	 * Get Feedbacks
	 */
	public function getFeedbacks($filter = [], $newOnTop = false)
	{
		$limit = 0;
		$page = 1;
		$keywordFilter = '';
		$processed = '';

		if (isset($filter['limit'])) {
			$limit = max(1, intval($filter['limit']));
		}

		if (isset($filter['page'])) {
			$page = max(1, intval($filter['page']));
		}

		if (isset($filter['processed'])) {
			$processed = $this->db->placehold('AND processed=?', $filter['processed']);
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND f.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR f.message LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR f.email LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
			}
		}

		if ($newOnTop) {
			$sort = 'DESC';
		} else {
			$sort = 'ASC';
		}

		$query = $this->db->placehold(
			"SELECT
				f.id,
				f.name,
				f.email,
				f.ip,
				f.message,
				f.processed,
				f.date
			FROM __feedbacks f
			WHERE 1 
				$processed 
				$keywordFilter 
			ORDER BY 
				f.id 
				$sort 
				$sqlLimit"
		);

		$this->db->query($query);

		return $this->db->results();
	}

	/**
	 * Counts Feedbacks
	 */
	public function countFeedbacks($filter = [])
	{
		$keywordFilter = '';
		$processedFilter = '';

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND f.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR f.message LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR f.email LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
			}
		}

		if (isset($filter['processed'])) {
			$processedFilter = $this->db->placehold('AND f.processed = ?', intval($filter['processed']));
		}

		$query = $this->db->placehold(
			"SELECT COUNT(DISTINCT f.id) AS count
			FROM __feedbacks f 
			WHERE 1 $processedFilter $keywordFilter"
		);

		$this->db->query($query);

		return $this->db->result('count');
	}

	/**
	 * Add Feedback
	 */
	public function addFeedback($feedback)
	{
		$query = $this->db->placehold("INSERT INTO __feedbacks SET ?%, date=NOW()", $feedback);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		return $id;
	}

	/**
	 * Update Feedback
	 */
	public function updateFeedback($id, $feedback)
	{
		$dateQuery = '';
		$feedback = (object) $feedback;

		if (isset($feedback->date)) {
			$date = $feedback->date;
			unset($feedback->date);

			$dateQuery = $this->db->placehold(', date=STR_TO_DATE(?, ?)', $date, $this->settings->date_format);
		}

		$query = $this->db->placehold("UPDATE __feedbacks SET ?% $dateQuery WHERE id IN(?@) LIMIT 1", $feedback, (array) $id);

		$this->db->query($query);

		return $id;
	}


	/**
	 * Delete Feedback
	 */
	public function deleteFeedback($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __feedbacks WHERE id=? LIMIT 1", (int) $id);

			$this->db->query($query);
		}
	}
}
