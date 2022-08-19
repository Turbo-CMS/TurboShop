<?php

require_once('api/Turbo.php');

class PaymentMethodsAdmin extends Turbo
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
				$this->payment->update_payment_method($ids[$i], array('position' => $position));

			// Actions with selected
			$ids = $this->request->post('check');

			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'disable': {
							$this->payment->update_payment_method($ids, array('enabled' => 0));
							break;
						}
					case 'enable': {
							$this->payment->update_payment_method($ids, array('enabled' => 1));
							break;
						}
					case 'delete': {
							foreach ($ids as $id)
								$this->payment->delete_payment_method($id);
							break;
						}
				}
		}

		// Display
		$payment_methods = $this->payment->get_payment_methods();
		$this->design->assign('payment_methods', $payment_methods);
		return $this->design->fetch('payment_methods.tpl');
	}
}
