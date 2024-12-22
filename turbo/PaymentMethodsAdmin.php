<?php

require_once 'api/Turbo.php';

class PaymentMethodsAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$positions = $this->request->post('positions', []);
			$ids = array_keys($positions);
			sort($positions);

			foreach ($positions as $i => $position) {
				$this->payment->updatePaymentMethod($ids[$i], ['position' => $position]);
			}

			$ids = $this->request->post('check', []);

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'disable': {
							$this->payment->updatePaymentMethod($ids, ['enabled' => 0]);
							break;
						}
					case 'enable': {
							$this->payment->updatePaymentMethod($ids, ['enabled' => 1]);
							break;
						}
					case 'delete': {
							foreach ($ids as $id) {
								$this->payment->deletePaymentMethod($id);
							}
							break;
						}
				}
			}
		}

		$paymentMethods = $this->payment->getPaymentMethods();
		$this->design->assign('payment_methods', $paymentMethods);

		return $this->design->fetch('payment_methods.tpl');
	}
}
