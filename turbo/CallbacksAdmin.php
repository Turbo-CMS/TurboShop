<?php

require_once('api/Turbo.php');

########################################
class CallbacksAdmin extends Turbo
{

	function fetch()
	{

		// Action processing 	
		if ($this->request->method('post')) {
			// Actions with selected
			$ids = $this->request->post('check');
			if (!empty($ids))
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id)
								$this->callbacks->delete_callback($id);
							break;
						}
					case 'processed': {
							foreach ($ids as $id)
								$this->callbacks->update_callback($id, array('processed' => 1));
							break;
						}
				}
		}

		// Display
		$filter = array();
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = 40;


		$callbacks_count = $this->callbacks->count_callbacks($filter);
		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$filter['limit'] = $callbacks_count;

		$callbacks = $this->callbacks->get_callbacks($filter, true);

		$this->design->assign('pages_count', ceil($callbacks_count / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);

		$this->design->assign('callbacks', $callbacks);
		$this->design->assign('callbacks_count', $callbacks_count);

		return $this->design->fetch('callbacks.tpl');
	}
}
