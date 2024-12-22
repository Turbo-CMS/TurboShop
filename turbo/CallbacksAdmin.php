<?php

require_once 'api/Turbo.php';

class CallbacksAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$ids = $this->request->post('check');

			if (!empty($ids)) {
				switch ($this->request->post('action')) {
					case 'delete':
						foreach ($ids as $id) {
							$this->callbacks->deleteCallback($id);
						}
						break;
					case 'processed':
						foreach ($ids as $id) {
							$this->callbacks->updateCallback($id, ['processed' => 1]);
						}
						break;
				}
			}
		}

		$filter = ['page' => max(1, $this->request->get('page', 'integer')), 'limit' => 40,];

		$callbacksCount = $this->callbacks->countCallbacks($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $callbacksCount;
		}

		$callbacks = $this->callbacks->getCallbacks($filter, true);

		$this->design->assign('pages_count', ceil($callbacksCount / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);
		$this->design->assign('callbacks', $callbacks);
		$this->design->assign('callbacks_count', $callbacksCount);

		return $this->design->fetch('callbacks.tpl');
	}
}
