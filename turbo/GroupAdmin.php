<?php

require_once 'api/Turbo.php';

class GroupAdmin extends Turbo
{
	public function fetch()
	{
		$group = new stdClass();

		if ($this->request->isMethod('post')) {
			$group->id = $this->request->post('id', 'integer');
			$group->name = $this->request->post('name');
			$group->discount = $this->request->post('discount');

			if (empty($group->name)) {
				$this->design->assign('message_error', 'empty_name');
			} else {
				if (empty($group->id)) {
					$group->id = $this->users->addGroup($group);
					$this->design->assign('message_success', 'added');
				} else {
					$group->id = $this->users->updateGroup($group->id, $group);
					$this->design->assign('message_success', 'updated');
				}

				$group = $this->users->getGroup((int) $group->id);
			}
		} else {
			$id = $this->request->get('id', 'integer');

			if (!empty($id)) {
				$group = $this->users->getgroup((int) $id);
			}
		}

		if (!empty($group)) {
			$this->design->assign('group', $group);
		}

		return $this->design->fetch('group.tpl');
	}
}
