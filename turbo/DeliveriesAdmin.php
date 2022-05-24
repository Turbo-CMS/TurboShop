<?php

require_once('api/Turbo.php');

########################################
class DeliveriesAdmin extends Turbo
{

	public function fetch()
	{

		// Action processing
		if ($this->request->method('post')) {
			// Actions with selected
			$ids = $this->request->post('check');

			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'disable': {
							$this->delivery->update_delivery($ids, array('enabled' => 0));
							break;
						}
					case 'enable': {
							$this->delivery->update_delivery($ids, array('enabled' => 1));
							break;
						}
					case 'delete': {
							foreach ($ids as $id)
								$this->delivery->delete_delivery($id);
							break;
						}
				}

			// Sorting
			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);
			foreach ($positions as $i => $position)
				$this->delivery->update_delivery($ids[$i], array('position' => $position));
		}

		// Display
		$deliveries = $this->delivery->get_deliveries();
		$this->design->assign('deliveries', $deliveries);
		return $this->design->fetch('deliveries.tpl');
	}
}
