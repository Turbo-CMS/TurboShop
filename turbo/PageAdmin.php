<?php

require_once 'api/Turbo.php';

class PageAdmin extends Turbo
{
	public function fetch()
	{
		$page = new stdClass();

		if ($this->request->isMethod('post')) {
			$page->id = $this->request->post('id', 'integer');
			$page->parent_id = $this->request->post('parent_id', 'integer');
			$page->name = $this->request->post('name');
			$page->header = $this->request->post('header');
			$page->url = trim($this->request->post('url'));
			$page->meta_title = $this->request->post('meta_title');
			$page->meta_keywords = $this->request->post('meta_keywords');
			$page->meta_description = $this->request->post('meta_description');
			$page->body = $this->request->post('body');
			$page->menu_id = $this->request->post('menu_id', 'integer');
			$page->visible = $this->request->post('visible', 'boolean');

			if (($p = $this->pages->getPage($page->url)) && $p->id != $page->id) {
				$this->design->assign('message_error', 'url_exists');
			} else {
				if (empty($page->id)) {
					$page->id = $this->pages->addPage($page);
					$page = $this->pages->getPage($page->id);
					$this->design->assign('message_success', 'added');
				} else {
					$this->pages->updatePage($page->id, $page);
					$page = $this->pages->getPage($page->id);
					$this->design->assign('message_success', 'updated');
				}
			}
		} else {
			$id = $this->request->get('id', 'integer');

			if (!empty($id)) {
				$page = $this->pages->getPage($id);
			} else {
				$page->menu_id = $this->request->get('menu_id');
				$page->visible = 1;
			}
		}

		$this->design->assign('page', $page);

		$menus = $this->pages->getMenus();
		$this->design->assign('menus', $menus);

		if (isset($page->menu_id)) {
			$menu_id = $page->menu_id;
		}

		if (empty($menu_id) || !$menu = $this->pages->getMenu($menu_id)) {
			$menu = reset($menus);
		}

		$this->design->assign('menu', $menu);

		return $this->design->fetch('page.tpl');
	}
}
