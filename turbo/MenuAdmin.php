<?php

require_once('api/Turbo.php');

class MenuAdmin extends Turbo
{
	public function fetch()
	{
		// Action processing
		if ($this->request->method('post')) {

			foreach ($this->request->post('menu') as $n => $va)
				foreach ($va as $i => $v) {
					if (empty($menus[$i]))
						$menus[$i] = new stdClass;
					$menus[$i]->$n = $v;
				}

			$menus_ids = array();
			foreach ($menus as $menu) {
				if ($menu->id)
					$this->pages->update_menu($menu->id, $menu);
				else
					$menu->id = $this->pages->add_menu($menu);
				$menus_ids[] = $menu->id;
			}

			// Delete untransferred menus
			$query = $this->db->placehold('DELETE FROM __menu WHERE id NOT IN(?@)', $menus_ids);
			$this->db->query($query);

			// Sort menu
			asort($menus_ids);
			$i = 0;
			foreach ($menus_ids as $menu_id) {
				$this->pages->update_menu($menus_ids[$i], array('position' => $menu_id));
				$i++;
			}

			// Actions with selected
			$action = $this->request->post('action');
			$id = $this->request->post('action_id');

			if (!empty($action) && !empty($id))
				switch ($action) {
					case 'delete': {
							$this->pages->delete_menu($id);
							break;
						}
				}
		}

		// Display
		$menus = $this->pages->get_menus();
		$this->design->assign('menus', $menus);
		return $this->design->fetch('menu.tpl');
	}
}
