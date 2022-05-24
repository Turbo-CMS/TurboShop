<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Callbacks extends Turbo
{

	public function get_callback($id)
	{
		$query = $this->db->placehold("SELECT c.id, c.name, c.phone, c.processed, c.message, c.date FROM __callbacks c WHERE id=? LIMIT 1", intval($id));

		if ($this->db->query($query))
			return $this->db->result();
		else
			return false;
	}

	public function get_callbacks($filter = array(), $new_on_top = false)
	{
		// Default
		$limit = 0;
		$page = 1;
		$processed = '';

		if (isset($filter['limit']))
			$limit = max(1, intval($filter['limit']));

		if (isset($filter['page']))
			$page = max(1, intval($filter['page']));

		if (isset($filter['processed']))
			$processed = $this->db->placehold('AND processed=?', $filter['processed']);

		$sql_limit = $this->db->placehold(' LIMIT ?, ? ', ($page - 1) * $limit, $limit);

		if ($new_on_top)
			$sort = 'DESC';
		else
			$sort = 'ASC';

		$query = $this->db->placehold("SELECT c.id, c.name, c.phone, c.date, c.processed, c.message
										FROM __callbacks c WHERE 1 $processed ORDER BY c.id $sort $sql_limit");

		$this->db->query($query);
		return $this->db->results();
	}

	public function count_callbacks($filter = array())
	{
		$keyword_filter = '';
		$processed_filter = '';

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('OR c.email LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
		}

		if (isset($filter['processed'])) {
			$processed_filter = $this->db->placehold('AND c.processed = ?', intval($filter['processed']));
		}

		$query = $this->db->placehold("SELECT count(distinct c.id) as count
										FROM __callbacks c WHERE 1 $processed_filter  $keyword_filter");

		$this->db->query($query);
		return $this->db->result('count');
	}

	public function add_callback($callback)
	{
		$query = $this->db->placehold(
			'INSERT INTO __callbacks
		SET ?%,
		date = NOW()',
			$callback
		);

		if (!$this->db->query($query))
			return false;

		$id = $this->db->insert_id();
		return $id;
	}

	public function update_callback($id, $callback)
	{
		$date_query = '';
		if (isset($callback->date)) {
			$date = $callback->date;
			unset($callback->date);
			$date_query = $this->db->placehold(', date=STR_TO_DATE(?, ?)', $date, $this->settings->date_format);
		}
		$query = $this->db->placehold("UPDATE __callbacks SET ?% $date_query WHERE id in(?@) LIMIT 1", $callback, (array)$id);
		$this->db->query($query);
		return $id;
	}

	public function delete_callback($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __callbacks WHERE id=? LIMIT 1", intval($id));
			$this->db->query($query);
		}
	}
}
