<?php

require_once 'Turbo.php';

class Pages extends Turbo
{
	/**
	 * Get Page
	 */
	public function getPage($id)
	{
		if (is_string($id)) {
			$where = $this->db->placehold('WHERE url=?', $id);
		} else {
			$where = $this->db->placehold('WHERE id=?', (int) $id);
		}

		$langSql = $this->languages->getQuery(['object' => 'page']);

		$query = $this->db->placehold(
			"SELECT 
				p.id,
				p.url,
				p.header,
				p.name,
				p.meta_title,
				p.meta_description,
				p.meta_keywords,
				p.body,
				p.menu_id,
				p.parent_id,
				p.position,
				p.visible,
				p.last_modified,
				$langSql->fields
			FROM __pages p 
			 	$langSql->join 
			 	$where 
			LIMIT 1"
		);

		$this->db->query($query);
		return $this->db->result();
	}

	/**
	 * Get Pages
	 */
	public function getPages($filter = [])
	{
		$limit = 1000;
		$page = 1;

		$menuFilter = '';
		$visibleFilter = '';
		$keywordFilter = '';
		$pages = [];

		$langId  = $this->languages->langId();
		$px = ($langId ? 'l' : 'p');

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (isset($filter['menu_id'])) {
			$menuFilter = $this->db->placehold('AND menu_id IN(?@)', (array) $filter['menu_id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND visible=?', (int) $filter['visible']);
		}

		$langSql = $this->languages->getQuery(['object' => 'page']);

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (' . $px . '.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR ' . $px . '.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		$query = $this->db->placehold(
			"SELECT 
				p.id, 
				p.url, 
				p.header, 
				p.name, 
				p.meta_title, 
				p.meta_description, 
				p.meta_keywords, 
				p.body, 
				p.menu_id, 
				p.position, 
				p.visible, 
				p.last_modified, 
				$langSql->fields
			FROM __pages p 
				$langSql->join 
			WHERE 1 
				$menuFilter 
				$keywordFilter 
				$visibleFilter 
			ORDER BY 
				p.position
				$sqlLimit"
		);

		$this->db->query($query);

		foreach ($this->db->results() as $page) {
			$pages[$page->id] = $page;
		}

		return $pages;
	}

	/**
	 * Add Page
	 */
	public function addPage($page)
	{
		$page = (object) $page;

		$result = $this->languages->getDescription($page, 'page');

		if (!empty($result->data)) {
			$page = $result->data;
		}

		$query = $this->db->placehold("INSERT INTO __pages SET ?%", $page);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'page');
		}

		$this->db->query("UPDATE __pages SET position=id WHERE id=?", $id);

		return $id;
	}

	/**
	 * Update Page
	 */
	public function updatePage($id, $page)
	{
		$page = (object) $page;

		$result = $this->languages->getDescription($page, 'page');

		if (!empty($result->data)) {
			$page = $result->data;
		}

		$query = $this->db->placehold("UPDATE __pages SET last_modified=NOW(), ?% WHERE id IN(?@)", $page, (array) $id);

		if (!$this->db->query($query)) {
			return false;
		}

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'page', $this->languages->langId());
		}

		return $id;
	}

	/**
	 * Delete Page
	 */
	public function deletePage($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __pages WHERE id=? LIMIT 1", (int) $id);

			if ($this->db->query($query)) {
				$this->db->query("DELETE FROM __lang_pages WHERE page_id=?", (int) $id);
				return true;
			}
		}

		return false;
	}

	public $menus = [];
	public $menu;

	/**
	 * Get Menus
	 */
	public function getMenus()
	{
		$menus = [];

		$query = $this->db->placehold("SELECT * FROM __menu ORDER BY position");
		$this->db->query($query);

		foreach ($this->db->results() as $menu) {
			$menus[$menu->id] = $menu;
		}

		return $menus;
	}

	/**
	 * Initialize Menu
	 */
	private function initMenu()
	{
		$this->menus = [];

		$query = $this->db->placehold("SELECT id, name, position FROM __menu ORDER BY position");

		$this->db->query($query);

		$results = $this->db->results();
		foreach ($results as $c) {
			$this->menus[$c->id] = $c;
		}

		$this->menu = reset($this->menus);
	}

	/**
	 * Add Menu
	 */
	public function addMenu($menu)
	{
		$query = $this->db->placehold("INSERT INTO __menu SET ?%", $menu);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		$this->db->query("UPDATE __menu SET position=id WHERE id=?", $id);
		$this->initMenu();

		return $id;
	}

	/**
	 * Update Menu
	 */
	public function updateMenu($id, $menu)
	{
		$query = $this->db->placehold("UPDATE __menu SET ?% WHERE id IN(?@)", $menu, (array) $id);

		if (!$this->db->query($query)) {
			return false;
		}

		$this->initMenu();

		return $id;
	}

	/**
	 * Delete Menu
	 */
	public function deleteMenu($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __menu WHERE id=? LIMIT 1", (int) $id);

			if ($this->db->query($query)) {
				return true;
			}

			$this->initMenu();
		}

		return false;
	}

	/**
	 * Get Menu
	 */
	public function getMenu($menuId)
	{
		$query = $this->db->placehold("SELECT * FROM __menu WHERE id=? LIMIT 1", (int) $menuId);
		$this->db->query($query);

		return $this->db->result();
	}

	private $allPages;
	private $pagesTree;

	/**
	 * Get Pages Tree
	 */
	public function getPagesTree($filter = [])
	{
		unset($this->initPages, $this->allPages);
		$this->initPages($filter);

		return $this->pagesTree;
	}

	/**
	 * Initialize Pages
	 */
	private function initPages($filter = [])
	{
		$menuId = '';
		$isVisible = '';

		if (isset($filter['menu_id'])) {
			$menuId = "AND menu_id = " . (int)$filter['menu_id'];
		}

		if (isset($filter['visible'])) {
			$isVisible = "AND visible = 1";
		}

		$tree = new stdClass();
		$tree->subpages = [];

		$pointers = [0 => &$tree];
		$pointers[0]->path = [];
		$pointers[0]->level = 0;

		$langSql = $this->languages->getQuery(['object' => 'page']);
		$query = $this->db->placehold("SELECT *, $langSql->fields FROM __pages p $langSql->join WHERE 1 $menuId $isVisible ORDER BY p.parent_id, p.position");

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			$pages = $this->cache->get($query);
			if (!$pages) {
				$this->db->query($query);
				$pages = $this->db->results();
				$this->cache->set($query, $pages);
			}
		} else {
			$this->db->query($query);
			$pages = $this->db->results();
		}

		foreach ($pages as $page) {
			if (!isset($page->subpages)) {
				$page->subpages = [];
			}

			$pointers[$page->id] = $page;

			if (isset($pointers[$page->parent_id])) {
				$pointers[$page->parent_id]->subpages[] = $page;
				$page->path = array_merge((array)$pointers[$page->parent_id]->path, [$page]);
				$page->level = $pointers[$page->parent_id]->level + 1;
			} else {
				$tree->subpages[] = $page;
				$page->path = [];
				$page->level = 0;
			}
		}

		foreach (array_reverse(array_keys($pointers)) as $id) {
			if ($id > 0) {
				$page = $pointers[$id];
				$page->children[] = $id;

				$parent_id = $page->parent_id;
				if ($parent_id && isset($pointers[$parent_id])) {
					$pointers[$parent_id]->children = array_merge(
						$page->children,
						$pointers[$parent_id]->children ?? []
					);
				}
			}
		}

		$this->pagesTree = $tree->subpages;
		$this->allPages = $pointers;

		return true;
	}
}
