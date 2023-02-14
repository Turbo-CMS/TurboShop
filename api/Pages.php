<?php

require_once('Turbo.php');

class Pages extends Turbo
{

	/*
	*
	* The function returns a page by its id or url (depending on the type)
	* @param $id id or url of the page
	*
	*/
	public function get_page($id)
	{
		if (gettype($id) == 'string')
			$where = $this->db->placehold(' WHERE url=? ', $id);
		else
			$where = $this->db->placehold(' WHERE id=? ', intval($id));

		$lang_sql = $this->languages->get_query(array('object' => 'page'));

		$query = "SELECT p.id, p.url, p.header, p.name, p.meta_title, p.meta_description, p.meta_keywords, p.body, p.menu_id, p.parent_id, p.position, p.visible, p.last_modified, $lang_sql->fields
		          FROM __pages p $lang_sql->join $where LIMIT 1";

		$this->db->query($query);
		return $this->db->result();
	}

	/*
	*
	* The function returns an array of pages that match the filter
	* @param $filter
	*
	*/
	public function get_pages($filter = array())
	{
		$menu_filter = '';
		$visible_filter = '';
		$keyword_filter = '';
		$pages = array();

		$lang_id  = $this->languages->lang_id();
		$px = ($lang_id ? 'l' : 'p');

		if (isset($filter['menu_id']))
			$menu_filter = $this->db->placehold('AND menu_id in (?@)', (array)$filter['menu_id']);

		if (isset($filter['visible']))
			$visible_filter = $this->db->placehold('AND visible = ?', intval($filter['visible']));

		$lang_sql = $this->languages->get_query(array('object' => 'page'));

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND (' . $px . '.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR ' . $px . '.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
		}

		$query = "SELECT p.id, p.url, p.header, p.name, p.meta_title, p.meta_description, p.meta_keywords, p.body, p.menu_id, p.position, p.visible, p.last_modified, $lang_sql->fields
		          FROM __pages p $lang_sql->join WHERE 1 $menu_filter $keyword_filter $visible_filter ORDER BY position";

		$this->db->query($query);

		foreach ($this->db->results() as $page)
			$pages[$page->id] = $page;

		return $pages;
	}

	/*
	*
	* Add page
	*
	*/
	public function add_page($page)
	{
		$page = (object)$page;

		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($page, 'page');
		if (!empty($result->data)) $page = $result->data;

		$query = $this->db->placehold('INSERT INTO __pages SET ?%', $page);
		if (!$this->db->query($query))
			return false;

		$id = $this->db->insert_id();

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'page');
		}

		$this->db->query("UPDATE __pages SET position=id WHERE id=?", $id);
		return $id;
	}

	/*
	*
	* Update page
	*
	*/
	public function update_page($id, $page)
	{

		$page = (object)$page;

		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($page, 'page');
		if (!empty($result->data)) $page = $result->data;

		$query = $this->db->placehold('UPDATE __pages SET `last_modified`=NOW(), ?% WHERE id in (?@)', $page, (array)$id);
		if (!$this->db->query($query))
			return false;

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'page', $this->languages->lang_id());
		}

		return $id;
	}

	/*
	*
	* Delete page
	*
	*/
	public function delete_page($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __pages WHERE id=? LIMIT 1", intval($id));
			if ($this->db->query($query))
				$this->db->query("DELETE FROM __lang_pages WHERE page_id=?", intval($id));
			return true;
		}
		return false;
	}

	/*
	*
	* The function returns an array of menus
	*
	*/
	public function get_menus()
	{
		$menus = array();
		$query = "SELECT * FROM __menu ORDER BY position";
		$this->db->query($query);
		foreach ($this->db->results() as $menu)
			$menus[$menu->id] = $menu;
		return $menus;
	}

	/*
	*
	* Update menu list
	*
	*/
	private function init_menu()
	{
		$this->menus = array();
		// Select from the menu base
		$query = "SELECT id, name, position FROM __menu ORDER BY position";
		$this->db->query($query);

		$results = $this->db->results();

		foreach ($results as $c) {
			$this->menus[$c->id] = $c;
		}

		$this->menu = reset($this->menus);
	}

	/*
	*
	* Menu creation
	*
	*/
	public function add_menu($menu)
	{
		$query = $this->db->placehold('INSERT INTO __menu SET ?%', $menu);
		if (!$this->db->query($query))
			return false;

		$id = $this->db->insert_id();
		$this->db->query("UPDATE __menu SET position=id WHERE id=?", $id);
		$this->init_menu();
		return $id;
	}

	/*
	*
	* Update menu
	*
	*/
	public function update_menu($id, $menu)
	{
		$query = $this->db->placehold('UPDATE __menu SET ?% WHERE id in (?@)', $menu, (array)$id);
		if (!$this->db->query($query))
			return false;
		$this->init_menu();
		return $id;
	}

	/*
	*
	* Delete menu
	*
	*/
	public function delete_menu($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __menu WHERE id=? LIMIT 1", intval($id));
			if ($this->db->query($query))
				return true;
			$this->init_menu();
		}
		return false;
	}

	/*
	*
	* The function returns the menu by id
	* @param $id
	*
	*/
	public function get_menu($menu_id)
	{
		$query = $this->db->placehold("SELECT * FROM __menu WHERE id=? LIMIT 1", intval($menu_id));
		$this->db->query($query);
		return $this->db->result();
	}

	// List of menu pointers in the menu tree (key = menu id)
	private $all_pages;

	// Menu tree
	private $pages_tree;

	// The function returns the menu tree
	public function get_pages_tree($filter = array())
	{
		//if(!isset($this->pages_tree))
		unset($this->init_pages, $this->all_pages);
		$this->init_pages($filter);

		return $this->pages_tree;
	}

	// Menu initialization, after which the menu will be selected from a local variable
	private function init_pages($filter = array())
	{
		$menu_id = '';
		$is_visible = '';
		//print_r($filter);
		if (isset($filter['visible']) && isset($filter['menu_id'])) {
			$query = $this->db->placehold('SELECT COUNT(*) FROM __pages WHERE id=? AND visible=1', intval($filter['menu_id']));
			$this->db->query($query);
			if (!$this->db->result('COUNT(*)'))
				return false;
		}

		if (isset($filter['menu_id']))
			$menu_id = $this->db->placehold(" AND menu_id=? ", intval($filter['menu_id']));

		if (isset($filter['visible']))
			$is_visible = ' AND visible =1 ';

		// Menu tree
		$tree = new stdClass();
		$tree->subpages = array();

		// Pointers to tree nodes
		$pointers = array();
		$pointers[0] = &$tree;
		$pointers[0]->path = array();
		$pointers[0]->level = 0;

		$lang_sql = $this->languages->get_query(array('object' => 'page'));

		// Select all pages
		$query = $this->db->placehold("SELECT *, $lang_sql->fields FROM __pages p $lang_sql->join WHERE 1 $menu_id $is_visible ORDER BY p.parent_id, p.position");

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				$pages = $result; // return data from memcached
			} else {
				$this->db->query($query); // otherwise pull from the database
				$result = $this->db->results();
				$this->cache->set($query, $result); // put into cache
				$pages = $result;
			}
		} else {
			$this->db->query($query);
			$pages = $this->db->results();
		}

		$finish = false;
		// We don't stop until the menus run out, or until none of the remaining ones have anywhere to stick
		while (!empty($pages)  && !$finish) {
			$flag = false;
			// Loop through all selected menus
			foreach ($pages as $k => $page) {
				if (isset($pointers[$page->parent_id])) {
					// Add the current menu to the menu tree (through the pointer)
					$pointers[$page->id] = $pointers[$page->parent_id]->subpages[] = $page;

					// Path to the current menu
					$curr = $pointers[$page->id];
					$pointers[$page->id]->path = array_merge((array)$pointers[$page->parent_id]->path, array($curr));

					// Menu nesting level
					$pointers[$page->id]->level = 1 + $pointers[$page->parent_id]->level;

					// Remove the used menu from the menu array
					unset($pages[$k]);
					$flag = true;
				}
			}
			if (!$flag) $finish = true;
		}

		// For each menu id of all its children, find out
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

		$this->pages_tree = $tree->subpages;
		$this->all_pages = $pointers;
	}
}
