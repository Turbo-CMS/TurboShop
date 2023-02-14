<?php

require_once('Turbo.php');

class Comments extends Turbo
{
	// Returns comment by id
	public function get_comment($id)
	{
		$query = $this->db->placehold("SELECT c.id, c.object_id, c.name, c.ip, c.type, c.text, c.date, c.approved, c.parent_id, c.admin, c.rate, c.rating FROM __comments c WHERE id=? LIMIT 1", intval($id));

		if ($this->db->query($query))
			return $this->db->result();
		else
			return false;
	}

	// Returns comments that match the filter
	public function get_comments($filter = array())
	{
		// Default
		$limit = 0;
		$page = 1;
		$object_id_filter = '';
		$type_filter = '';
		$keyword_filter = '';
		$approved_filter = '';
		$blog_fields = '';
		$blog_join = '';
		$articles_fields = '';
		$articles_join = '';
		$products_fields = '';
		$products_join = '';
		$ip = '';

		if (!empty($filter['type']))
			if ($filter['type'] == 'blog') {
				$lang_id  = $this->languages->lang_id();
				$px = ($lang_id ? 'l' : 'b');

				$lang_sql = $this->languages->get_query(array('object' => 'blog', 'px' => 'b'));
				$blog_fields = ', b.url, ' . $px . '.name post';
				$blog_join = 'INNER JOIN __blog b ON c.object_id=b.id ' . $lang_sql->join . '';
			}

		if (!empty($filter['type']))
			if ($filter['type'] == 'article') {
				$lang_id  = $this->languages->lang_id();
				$px = ($lang_id ? 'l' : 'a');

				$lang_sql = $this->languages->get_query(array('object' => 'article', 'px' => 'a'));
				$articles_fields = ', a.url, ' . $px . '.name article';
				$articles_join = 'INNER JOIN __articles a ON c.object_id=a.id ' . $lang_sql->join . '';
			}

		if (!empty($filter['type']))
			if ($filter['type'] == 'product') {
				$lang_id  = $this->languages->lang_id();
				$px = ($lang_id ? 'l' : 'p');

				$lang_sql = $this->languages->get_query(array('object' => 'product', 'px' => 'p'));
				$products_fields = ', p.url, p.rating, p.votes, ' . $px . '.name product';
				$products_join = 'INNER JOIN __products p ON c.object_id=p.id ' . $lang_sql->join . '';
			}

		if (isset($filter['limit']))
			$limit = max(1, intval($filter['limit']));

		if (isset($filter['page']))
			$page = max(1, intval($filter['page']));

		if (isset($filter['ip']))
			$ip = $this->db->placehold("OR c.ip=?", $filter['ip']);
		if (isset($filter['approved']))
			$approved_filter = $this->db->placehold("AND (c.approved=? $ip)", intval($filter['approved']));

		if ($limit)
			$sql_limit = $this->db->placehold(' LIMIT ?, ? ', ($page - 1) * $limit, $limit);
		else
			$sql_limit = '';

		if (!empty($filter['object_id']))
			$object_id_filter = $this->db->placehold('AND c.object_id in(?@)', (array)$filter['object_id']);

		if (!empty($filter['type']))
			$type_filter = $this->db->placehold('AND c.type=?', $filter['type']);

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND c.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR c.text LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
		}

		$sort = 'DESC';

		$query = $this->db->placehold("SELECT c.id, c.object_id, c.ip, c.name, c.text, c.type, c.date, c.approved, c.parent_id, c.admin, c.rate, c.rating
										$blog_fields $articles_fields $products_fields FROM __comments c $blog_join $articles_join $products_join WHERE 1 $object_id_filter $type_filter $keyword_filter $approved_filter ORDER BY id $sort $sql_limit");

		$this->db->query($query);
		return $this->db->results();
	}

	// Returns comments that match the filter 
	public function get_comments_tree($filter = array())
	{
		// Default
		$limit = 0;
		$page = 1;
		$object_id_filter = '';
		$parent_id_filter = '';
		$type_filter = '';
		$keyword_filter = '';
		$approved_filter = '';
		$order = 'c.rate DESC';

		if (isset($filter['limit']))
			$limit = max(1, intval($filter['limit']));

		if (isset($filter['page']))
			$page = max(1, intval($filter['page']));

		if (isset($filter['ip']))
			$ip = $this->db->placehold("OR c.ip=?", $filter['ip']);
		if (isset($filter['approved']))
			$approved_filter = $this->db->placehold("AND (c.approved=? $ip)", intval($filter['approved']));

		if ($limit)
			$sql_limit = $this->db->placehold(' LIMIT ?, ? ', ($page - 1) * $limit, $limit);
		else
			$sql_limit = '';

		if (!empty($filter['object_id']))
			$object_id_filter = $this->db->placehold('AND c.object_id in(?@)', (array)$filter['object_id']);

		if (!empty($filter['parent_id']))
			$parent_id_filter = $this->db->placehold('AND c.parent_id=?', $filter['parent_id']);

		if (!empty($filter['type']))
			$type_filter = $this->db->placehold('AND c.type=?', $filter['type']);

		if (!empty($filter['sort']))
			switch ($filter['sort']) {
				case 'rate':
					$order = 'c.rate DESC';
					break;
				case 'date':
					$order = 'c.date';
					break;
			}

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND c.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR c.text LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
		}

		$query = $this->db->placehold("SELECT c.id, c.object_id, c.ip, c.name, c.text, c.type, c.date, c.text, c.approved, c.parent_id, c.admin, c.rate, c.rating
										FROM __comments c WHERE 1 $object_id_filter $parent_id_filter $type_filter $keyword_filter $approved_filter ORDER BY $order $sql_limit");

		$this->db->query($query);
		$comments = $this->db->results();

		$tree = new stdClass();
		$tree->subcomments = array();

		// Pointers to tree nodes
		$pointers = array();
		$pointers[0] = &$tree;
		$pointers[0]->path = array();

		$finish = false;
		// We don't stop until the categories run out, or until none of the remaining ones have anywhere to stick
		while (!empty($comments)  && !$finish) {
			$flag = false;
			// Loop through all selected categories
			foreach ($comments as $k => $category) {
				if (isset($pointers[$category->parent_id])) {
					// Add the current category to the category tree (through the pointer)
					$pointers[$category->id] = $pointers[$category->parent_id]->subcomments[] = $category;

					// Path to the current category
					$curr = $pointers[$category->id];

					// Remove the used category from the categories array
					unset($comments[$k]);
					$flag = true;
				}
			}
			if (!$flag) $finish = true;
		}

		// For each category id of all its children, find out
		$ids = array_reverse(array_keys($pointers));
		foreach ($ids as $id) {
			if ($id > 0) {
				$pointers[$id]->children[] = $id;

				if (isset($pointers[$pointers[$id]->parent_id]->children))
					$pointers[$pointers[$id]->parent_id]->children = array_merge($pointers[$id]->children, $pointers[$pointers[$id]->parent_id]->children);
				else
					$pointers[$pointers[$id]->parent_id]->children = $pointers[$id]->children;
			}
		}
		unset($pointers[0]);
		unset($ids);

		$this->comments_tree = $tree->subcomments;
		$this->all_comments = $pointers;

		return  $this->comments_tree;
	}

	// Number of comments matching the filter
	public function count_comments($filter = array())
	{
		$object_id_filter = '';
		$type_filter = '';
		$approved_filter = '';
		$keyword_filter = '';

		if (!empty($filter['object_id']))
			$object_id_filter = $this->db->placehold('AND c.object_id in(?@)', (array)$filter['object_id']);

		if (!empty($filter['type']))
			$type_filter = $this->db->placehold('AND c.type=?', $filter['type']);

		if (isset($filter['approved']))
			$approved_filter = $this->db->placehold('AND c.approved=?', intval($filter['approved']));

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND c.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR c.text LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
		}

		$query = $this->db->placehold("SELECT count(distinct c.id) as count
										FROM __comments c WHERE 1 $object_id_filter $type_filter $keyword_filter $approved_filter", $this->settings->date_format);

		$this->db->query($query);
		return $this->db->result('count');
	}

	// Add a comment
	public function add_comment($comment)
	{
		$query = $this->db->placehold(
			'INSERT INTO __comments
		SET ?%,
		date = NOW()',
			$comment
		);

		if (!$this->db->query($query))
			return false;

		$id = $this->db->insert_id();

		$comment = (array)$comment;
		if ($comment['approved'] == 1 && $comment['object_id']) {
			if ($comment['type'] == 'blog') {
				$this->db->query('update __blog set last_modified=now() where id=?', intval($comment['object_id']));
			} elseif ($comment['type'] == 'product') {
				$this->db->query('update __products set last_modified=now() where id=?', intval($comment['object_id']));
			} elseif ($comment['type'] == 'article') {
				$this->db->query('update __articles set last_modified=now() where id=?', intval($comment['object_id']));
			}
		}

		if ($comment['approved'] == 1) {
			if ($comment['type'] == 'review') {
				$this->settings->lastModifyReviews = date("Y-m-d H:i:s");
			}
		}

		return $id;
	}

	// Update comment
	public function update_comment($id, $comment)
	{
		$query = $this->db->placehold("UPDATE __comments SET ?% WHERE id in(?@) LIMIT 1", $comment, (array)$id);
		$this->db->query($query);
		return $id;
	}

	// Delete comment
	public function delete_comment($id)
	{
		if (!empty($id)) {
			$this->db->query('select object_id, type, approved from __comments where id=?', intval($id));
			$c = $this->db->result();
			if ($c->approved == 1) {
				if ($c->type == 'blog') {
					$this->db->query('update __blog set last_modified=now() where id=?', intval($c->object_id));
				} elseif ($c->type == 'product') {
					$this->db->query('update __products set last_modified=now() where id=?', intval($c->object_id));
				} elseif ($c->type == 'article') {
					$this->db->query('update __articles set last_modified=now() where id=?', intval($c->object_id));
				}
			}

			$query = $this->db->placehold("DELETE FROM __comments WHERE id=? LIMIT 1", intval($id));
			$this->db->query($query);
		}
	}
}
