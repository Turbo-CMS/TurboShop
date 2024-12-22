<?php

require_once 'api/Turbo.php';

class DeliveriesAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'disable':
						$this->delivery->updateDelivery($ids, ['enabled' => 0]);
						break;

					case 'enable':
						$this->delivery->updateDelivery($ids, ['enabled' => 1]);
						break;

					case 'delete':
						foreach ($ids as $id) {
							$this->delivery->deleteDelivery($id);
						}
						break;
				}
			}

			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);

			foreach ($positions as $i => $position) {
				$this->delivery->updateDelivery($ids[$i], ['position' => $position]);
			}
		}

		$deliveries = $this->delivery->getDeliveries();
		$this->design->assign('deliveries', $deliveries);

		return $this->design->fetch('deliveries.tpl');
	}
}
