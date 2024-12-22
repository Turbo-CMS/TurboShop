<?php

require_once 'api/Turbo.php';

class SubscribesAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$ids = $this->request->post('check');
			if (!empty($ids)) {
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id) {
								$this->subscribes->deleteSubscribe($id);
							}
							break;
						}
					case 'processed': {
							foreach ($ids as $id) {
								$this->subscribes->updateSubscribe($id, array('processed' => 1));
							}
							break;
						}
				}
			}
		}

		$filter = ['page' => max(1, $this->request->get('page', 'integer')), 'limit' => 40,];
		$subscribesCount = $this->subscribes->countSubscribes($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $subscribesCount;
		}

		$subscribes = $this->subscribes->getSubscribes($filter, true);

		$this->design->assign('pages_count', ceil($subscribesCount / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);
		$this->design->assign('subscribes', $subscribes);
		$this->design->assign('subscribes_count', $subscribesCount);

		return $this->design->fetch('subscribes.tpl');
	}
}
