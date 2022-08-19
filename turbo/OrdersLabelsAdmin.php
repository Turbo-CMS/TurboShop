<?php

require_once('api/Turbo.php');

class OrdersLabelsAdmin extends Turbo
{

	public function fetch()
	{
		// Action processing
		if ($this->request->method('post')) {
			// Sorting
			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);
			foreach ($positions as $i => $position)
				$this->orders->update_label($ids[$i], array('position' => $position));

			// Actions with selected
			$ids = $this->request->post('check');
			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id)
								$this->orders->delete_label($id);
							break;
						}
				}
		}

		// Display
		$labels = $this->orders->get_labels();

		$this->design->assign('labels', $labels);
		return $this->design->fetch('orders_labels.tpl');
	}
}
