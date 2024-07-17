<?php

require_once 'api/Turbo.php';

class GroupsAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->isMethod('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'delete':
						foreach ($ids as $id) {
							$this->users->deleteGroup($id);
						}
						break;
				}
			}
		}

		$groups = $this->users->getGroups();
		$this->design->assign('groups', $groups);

		$body = $this->design->fetch('groups.tpl');

		return $body;
	}
}
