<?php

require_once 'api/Turbo.php';

class PagesAdmin extends Turbo
{
	public function fetch()
	{
		$menus = $this->pages->getMenus();
		$this->design->assign('menus', $menus);
		$menuId = $this->request->get('menu_id', 'integer');

		if (!$menuId || !$menu = $this->pages->getMenu($menuId)) {
			$menu = reset($menus);
		}

		$this->design->assign('menu', $menu);

		if ($this->request->method('post')) {
			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);

			foreach ($positions as $i => $position) {
				$this->pages->updatePage($ids[$i], ['position' => $position]);
			}

			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'disable':
						$this->pages->updatePage($ids, ['visible' => 0]);
						break;
					case 'enable':
						$this->pages->updatePage($ids, ['visible' => 1]);
						break;
					case 'delete':
						foreach ($ids as $id) {
							$this->pages->deletePage($id);
						}
						break;
				}
			}
		}

		$tree = $this->pages->getPagesTree();

		$pages = [];

		foreach ($tree as $t) {
			if ($t->menu_id !== $menu->id) {
				continue;
			}

			$pages[] = $t;
		}

		$this->design->assign('pages', $pages);

		return $this->design->fetch('pages.tpl');
	}
}
