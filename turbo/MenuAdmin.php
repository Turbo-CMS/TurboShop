<?php

require_once 'api/Turbo.php';

class MenuAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			foreach ($this->request->post('menu') as $n => $va) {
				foreach ($va as $i => $v) {
					if (empty($menus[$i])) {
						$menus[$i] = new stdClass();
					}

					$menus[$i]->$n = $v;
				}
			}

			$menusIds = [];

			foreach ($menus as $menu) {
				if ($menu->id) {
					$this->pages->updateMenu($menu->id, $menu);
				} else {
					$menu->id = $this->pages->addMenu($menu);
				}

				$menusIds[] = $menu->id;
			}

			$query = $this->db->placehold("DELETE FROM __menu WHERE id NOT IN(?@)", $menusIds);
			$this->db->query($query);

			asort($menusIds);
			$i = 0;

			foreach ($menusIds as $menuId) {
				$this->pages->updateMenu($menusIds[$i], ['position' => $menuId]);
				$i++;
			}

			$action = $this->request->post('action');
			$id = $this->request->post('action_id');

			if (!empty($action) && !empty($id)) {
				switch ($action) {
					case 'delete':
						$this->pages->deleteMenu($id);
						break;
				}
			}
		}

		$menus = $this->pages->getMenus();
		$this->design->assign('menus', $menus);

		return $this->design->fetch('menu.tpl');
	}
}
