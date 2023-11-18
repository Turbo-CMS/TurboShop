<?php

require_once 'Turbo.php';

class Comments extends Turbo
{
	/**
	 * Get Comment
	 */
	public function getComment($id)
	{
		$query = $this->db->placehold(
			"SELECT 
				c.id, 
				c.object_id, 
				c.name, 
				c.ip, 
				c.type, 
				c.text, 
				c.date, 
				c.approved, 
				c.parent_id, 
				c.admin, 
				c.rate, 
				c.rating 
			 FROM __comments c 
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
	 * Get Comments
	 */
	public function getComments($filter = [])
	{
		$limit = 0;
		$page = 1;
		$objectIdFilter = '';
		$typeFilter = '';
		$hasParent = '';
		$keywordFilter = '';
		$approvedFilter = '';
		$ip = '';
		$sort = 'c.date DESC';

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (isset($filter['ip'])) {
			$ip = $this->db->placehold("OR c.ip=?", $filter['ip']);
		}

		if (isset($filter['approved'])) {
			$approvedFilter = $this->db->placehold("AND (c.approved=? $ip)", (int) $filter['approved']);
		}

		if ($limit) {
			$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);
		} else {
			$sqlLimit = '';
		}

		if (!empty($filter['object_id'])) {
			$objectIdFilter = $this->db->placehold('AND c.object_id IN(?@)', (array) $filter['object_id']);
		}

		if (!empty($filter['type'])) {
			$typeFilter = $this->db->placehold('AND c.type=?', $filter['type']);
		}

		if (isset($filter['has_parent'])) {
			$hasParent = ' AND c.parent_id' . ($filter['has_parent'] ? '>0' : '=0');
		}

		if (!empty($filter['sort'])) {
			switch ($filter['sort']) {
				case 'rate':
					$sort = 'c.rate DESC';
					break;
				case 'date':
					$sort = 'c.date';
					break;
			}
		}

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND c.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR c.text LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
			}
		}

		$query = $this->db->placehold(
			"SELECT
				c.id,
				c.object_id,
				c.ip,
				c.name,
				c.text,
				c.type,
				c.date,
				c.approved,
				c.parent_id,
				c.admin,
				c.rate,
				c.rating
			FROM __comments c
			WHERE 1 
				$objectIdFilter
				$typeFilter
				$hasParent
				$keywordFilter
				$approvedFilter
			ORDER BY $sort $sqlLimit"
		);

		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Counts Comments 
	 */
	public function countComments($filter = [])
	{
		$objectIdFilter = '';
		$typeFilter = '';
		$hasParent = '';
		$approvedFilter = '';
		$keywordFilter = '';

		if (!empty($filter['object_id'])) {
			$objectIdFilter = $this->db->placehold('AND c.object_id IN(?@)', (array) $filter['object_id']);
		}

		if (!empty($filter['type'])) {
			$typeFilter = $this->db->placehold('AND c.type=?', $filter['type']);
		}

		if (isset($filter['approved'])) {
			$approvedFilter = $this->db->placehold('AND c.approved=?', (int) $filter['approved']);
		}

		if (isset($filter['has_parent'])) {
			$hasParent = ' AND c.parent_id' . ($filter['has_parent'] ? '>0' : '=0');
		}

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND c.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR c.text LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
			}
		}

		$query = $this->db->placehold(
			"SELECT COUNT(DISTINCT c.id) AS count
			 FROM __comments c 
			 WHERE 1
			   $objectIdFilter
			   $typeFilter
			   $hasParent
			   $keywordFilter
			   $approvedFilter",
			$this->settings->date_format
		);

		$this->db->query($query);
		$result = $this->db->result('count');

		return $result;
	}

	/**
	 * Add Comment
	 */
	public function addComment($comment)
	{
		$query = $this->db->placehold('INSERT INTO __comments SET ?%, date=NOW()', $comment);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		$comment = (array) $comment;

		if (isset($comment['approved'], $comment['object_id']) && $comment['approved'] == 1) {
			switch ($comment['type']) {
				case 'blog':
					$this->db->query('UPDATE __blog SET last_modified=NOW() WHERE id=?', (int) $comment['object_id']);
					break;
				case 'product':
					$this->db->query('UPDATE __products SET last_modified=NOW() WHERE id=?', (int) $comment['object_id']);
					break;
				case 'article':
					$this->db->query('UPDATE __articles SET last_modified=NOW() WHERE id=?', (int) $comment['object_id']);
					break;
				case 'review':
					$this->settings->lastModifyReviews = date('Y-m-d H:i:s');
					break;
			}
		}

		return $id;
	}

	/**
	 * Updates Comment
	 */
	public function updateComment($id, $comment)
	{
		$query = $this->db->placehold("UPDATE __comments SET ?% WHERE id IN(?@) LIMIT 1", $comment, (array) $id);
		$this->db->query($query);

		return $id;
	}

	/**
	 * Deletes Comment
	 */
	public function deleteComment($id)
	{
		if (!empty($id)) {
			$this->db->query('SELECT object_id, type, approved FROM __comments WHERE id=?', (int) $id);

			$comment = $this->db->result();

			if ($comment->approved == 1) {
				switch ($comment->type) {
					case 'blog':
						$this->db->query('UPDATE __blog SET last_modified=now() WHERE id=?', (int) $comment->object_id);
						break;
					case 'product':
						$this->db->query('UPDATE __products SET last_modified=now() WHERE id=?', (int) $comment->object_id);
						break;
					case 'article':
						$this->db->query('UPDATE __articles SET last_modified=now() WHERE id=?', (int) $comment->object_id);
						break;
				}
			}

			$query = $this->db->placehold("DELETE FROM __comments WHERE id=? LIMIT 1", (int) $id);
			$this->db->query($query);
		}
	}
}
