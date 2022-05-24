<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class FAQ extends Turbo
{

	/*
	*
	* Function returns FAQ by its id
	* @param $id id faq
	*
	*/
	public function get_faq($id)
	{
		if (is_int($id))
			$where = $this->db->placehold(' WHERE f.id=? ', intval($id));

		$lang_sql = $this->languages->get_query(array('object' => 'faq'));

		$query = $this->db->placehold("SELECT f.id, f.name, f.answer, f.visible, f.position, f.last_modified, $lang_sql->fields
		                               FROM __faq f $lang_sql->join $where LIMIT 1");
		if ($this->db->query($query))
			return $this->db->result();
		else
			return false;
	}

	/*
	*
	* The function returns an array of FAQs that match the filter
	* @param $filter
	*
	*/
	public function get_faqs($filter = array())
	{
		// Default
		$limit = 1000;
		$page = 1;
		$faq_id_filter = '';
		$visible_filter = '';
		$keyword_filter = '';
		$order = 'f.position DESC';
		$faq = array();

		$lang_id  = $this->languages->lang_id();
		$px = ($lang_id ? 'l' : 'f');

		if (isset($filter['limit']))
			$limit = max(1, intval($filter['limit']));

		if (isset($filter['page']))
			$page = max(1, intval($filter['page']));

		if (!empty($filter['id']))
			$faq_id_filter = $this->db->placehold('AND f.id in(?@)', (array)$filter['id']);

		if (isset($filter['visible']))
			$visible_filter = $this->db->placehold('AND f.visible = ?', intval($filter['visible']));

		if (!empty($filter['sort']))
			switch ($filter['sort']) {
				case 'position':
					$order = 'f.position DESC';
					break;
			}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND (' . $px . '.name LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
		}

		$sql_limit = $this->db->placehold(' LIMIT ?, ? ', ($page - 1) * $limit, $limit);

		$lang_sql = $this->languages->get_query(array('object' => 'faq'));

		$query = $this->db->placehold("SELECT f.id, f.name, f.answer, f.visible, f.position, f.last_modified, $lang_sql->fields
		                                      FROM __faq f $lang_sql->join WHERE 1 $faq_id_filter $visible_filter $keyword_filter
		                                      ORDER BY $order $sql_limit");

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result; // return data from memcached
			} else {
				$this->db->query($query); // otherwise pull from the database
				$result = $this->db->results();
				$this->cache->set($query, $result); // put into cache
				return $result;
			}
		} else {
			$this->db->query($query);
			return $this->db->results();
		}
	}

	/*
	*
	* The function calculates the number of faqs that satisfy the filter
	* @param $filter
	*
	*/
	public function count_faqs($filter = array())
	{
		$faq_id_filter = '';
		$visible_filter = '';
		$keyword_filter = '';

		if (!empty($filter['id']))
			$post_id_filter = $this->db->placehold('AND f.id in(?@)', (array)$filter['id']);

		if (isset($filter['visible']))
			$visible_filter = $this->db->placehold('AND f.visible = ?', intval($filter['visible']));

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND (f.name LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
		}

		$query = "SELECT COUNT(distinct f.id) as count
		          FROM faq f WHERE 1 $faq_id_filter $visible_filter $keyword_filter";

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result; // return data from memcached
			} else {
				if ($this->db->query($query)) {
					$result = $this->db->result('count');
					$this->cache->set($query, $result); // put into cache
					return $result;
				} else
					return false;
			}
		} else {
			if ($this->db->query($query))
				return $this->db->result('count');
			else
				return false;
		}
	}

	/*
	*
	* FAQ creation
	* @param $faq
	*
	*/
	public function add_faq($faq)
	{
		$faq = (object)$faq;

		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($faq, 'faq');
		if (!empty($result->data)) $faq = $result->data;

		$this->settings->lastModifyFAQ = date("Y-m-d H:i:s");
		$query = $this->db->placehold('INSERT INTO __faq SET ?%', $faq);
		if (!$this->db->query($query))
			return false;

		$id = $this->db->insert_id();

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'faq');
		}

		$this->db->query("UPDATE __faq SET position=id WHERE id=?", $id);
		return $id;
	}

	/*
	*
	* Update FAQ
	* @param $faq
	*
	*/
	public function update_faq($id, $faq)
	{
		$faq = (object)$faq;

		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($faq, 'faq');
		if (!empty($result->data)) $faq = $result->data;

		$this->settings->lastModifyFAQ = date("Y-m-d H:i:s");
		$query = $this->db->placehold("UPDATE __faq SET `last_modified`=NOW(), ?% WHERE id in(?@) LIMIT ?", $faq, (array)$id, count((array)$id));
		$this->db->query($query);

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'faq', $this->languages->lang_id());
		}

		return $id;
	}

	/*
	*
	* Delete FAQ
	* @param $id
	*
	*/
	public function delete_faq($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __faq WHERE id=? LIMIT 1", intval($id));
			if ($this->db->query($query)) {
				$this->db->query("DELETE FROM __lang_faq WHERE faq_id=?", intval($id));
				if ($this->db->query($query))
					return true;
			}
		}
		return false;
	}
}
