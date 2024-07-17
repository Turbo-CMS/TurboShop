<?php

require_once 'api/Turbo.php';

class UsersAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->isMethod('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'disable':
						foreach ($ids as $id) {
							$this->users->updateUser($id, ['enabled' => 0]);
						}
						break;
					case 'enable':
						foreach ($ids as $id) {
							$this->users->updateUser($id, ['enabled' => 1]);
						}
						break;
					case 'delete':
						foreach ($ids as $id) {
							$this->users->deleteUser($id);
						}
						break;
					case 'move_to':
						foreach ($ids as $id) {
							$this->users->updateUser($id, ['group_id' => $this->request->post('move_group', 'integer')]);
						}
						break;
				}
			}
		}

		$groups = [];

		foreach ($this->users->getGroups() as $g) {
			$groups[$g->id] = $g;
		}

		$group = null;
		$filter = ['page' => max(1, $this->request->get('page', 'integer')), 'limit' => 20,];
		$groupId = $this->request->get('group_id', 'integer');

		if ($groupId) {
			$group = $this->users->getGroup($groupId);
			$filter['group_id'] = $group->id;
		}

		$keyword = $this->request->get('keyword', 'string');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		if ($sort = $this->request->get('sort', 'string')) {
			$_SESSION['users_admin_sort'] = $sort;
		}

		if (!empty($_SESSION['users_admin_sort'])) {
			$filter['sort'] = $_SESSION['users_admin_sort'];
		} else {
			$filter['sort'] = 'name';
		}

		$this->design->assign('sort', $filter['sort']);

		$usersCount = $this->users->countUsers($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $usersCount;
		}

		$users = $this->users->getUsers($filter);

		foreach ($users as $userItem) {
			$userItem->orders = $this->orders->getOrders(['user_id' => $userItem->id]);
		}

		if (!empty($groups)) {
			$this->design->assign('groups', $groups);
		}

		$this->design->assign('pages_count', ceil($usersCount / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);
		$this->design->assign('group', $group);
		$this->design->assign('users', $users);
		$this->design->assign('users_count', $usersCount);

		$body = $this->design->fetch('users.tpl');

		return $body;
	}
}
