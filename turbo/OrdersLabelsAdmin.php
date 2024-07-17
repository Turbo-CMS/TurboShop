<?php

require_once 'api/Turbo.php';

class OrdersLabelsAdmin extends Turbo
{

	public function fetch()
	{
		if ($this->request->isMethod('post')) {
			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);

			foreach ($positions as $i => $position) {
				$this->orders->updateLabel($ids[$i], ['position' => $position]);
			}

			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id) {
								$this->orders->deleteLabel($id);
							}
							break;
						}
				}
			}
		}

		$labels = $this->orders->getLabels();

		$this->design->assign('labels', $labels);
		return $this->design->fetch('orders_labels.tpl');
	}
}
