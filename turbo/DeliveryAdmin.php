<?php

require_once 'api/Turbo.php';

class DeliveryAdmin extends Turbo
{
	private $allowedImageExtentions = ['png', 'gif', 'jpg', 'jpeg', 'ico', 'svg'];

	public function fetch()
	{
		$delivery = new stdClass();

		if ($this->request->isMethod('post')) {
			$delivery->id = $this->request->post('id', 'integer');
			$delivery->enabled = $this->request->post('enabled', 'boolean');
			$delivery->name = $this->request->post('name');
			$delivery->code = $this->request->post('code');
			$delivery->description = $this->request->post('description');
			$delivery->price = $this->request->post('price');
			$delivery->free_from = $this->request->post('free_from');
			$delivery->separate_payment = $this->request->post('separate_payment');
			$delivery->module = $this->request->post('module', 'string');
			$deliverySettings = $this->request->post('delivery_settings');

			if (!$deliveryPayments = $this->request->post('delivery_payments')) {
				$deliveryPayments = [];
			}

			if (empty($delivery->name)) {
				$this->design->assign('message_error', 'empty_name');
			} else {
				if (empty($delivery->id)) {
					$delivery->id = $this->delivery->addDelivery($delivery);
					$this->design->assign('message_success', 'added');
				} else {
					$this->delivery->updateDelivery($delivery->id, $delivery);
					$this->design->assign('message_success', 'updated');
				}
				$this->delivery->updateDeliveryPayments($delivery->id, $deliveryPayments);
				$this->delivery->updateDeliverySettings($delivery->id, $deliverySettings);

				if ($this->request->post('delete_icon')) {
					$this->delivery->deleteIcon($delivery->id);
				}

				$icon = $this->request->files('icon');

				if (!empty($icon['name']) && in_array(strtolower(pathinfo($icon['name'], PATHINFO_EXTENSION)), $this->allowedImageExtentions)) {
					$this->delivery->deleteIcon($delivery->id);
					move_uploaded_file($icon['tmp_name'], $this->root_dir . $this->config->delivery_images_dir . $icon['name']);
					$this->delivery->updateDelivery($delivery->id, ['icon' => $icon['name']]);
				}

				$delivery = $this->delivery->getDelivery($delivery->id);
			}
		} else {
			$delivery->id = $this->request->get('id', 'integer');

			if (!empty($delivery->id)) {
				$delivery = $this->delivery->getDelivery($delivery->id);
				$deliverySettings =  $this->delivery->getDeliverySettings($delivery->id);
			} else {
				$deliverySettings = [];
			}

			$deliveryPayments = $this->delivery->getDeliveryPayments($delivery->id);
		}

		$this->design->assign('delivery_payments', $deliveryPayments);

		$paymentMethods = $this->payment->getPaymentMethods();

		$this->design->assign('payment_methods', $paymentMethods);
		$this->design->assign('delivery_settings', $deliverySettings);

		$deliveryModules = $this->delivery->getDeliveryModules();
		$this->design->assign('delivery_modules', $deliveryModules);
		$this->design->assign('delivery', $delivery);

		return $this->design->fetch('delivery.tpl');
	}
}
