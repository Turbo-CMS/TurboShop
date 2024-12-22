<?php

require_once 'api/Turbo.php';

class OrderAdmin extends Turbo
{
	public function fetch()
	{
		$order = new stdClass();

		if ($this->request->method('post')) {
			$order->id = $this->request->post('id', 'integer');
			$order->name = $this->request->post('name');
			$order->email = $this->request->post('email');
			$order->phone = $this->request->post('phone');
			$order->address = $this->request->post('address');
			$order->comment = $this->request->post('comment');
			$order->note = $this->request->post('note');
			$order->discount = $this->request->post('discount', 'floatr');
			$order->weight = $this->request->post('weight', 'floatr');
			$order->coupon_discount = $this->request->post('coupon_discount', 'floatr');
			$order->delivery_id = $this->request->post('delivery_id', 'integer');
			$order->delivery_price = $this->request->post('delivery_price', 'float');
			$order->payment_method_id = $this->request->post('payment_method_id', 'integer');
			$order->paid = $this->request->post('paid', 'integer');
			$order->user_id = $this->request->post('user_id', 'integer');
			$order->separate_delivery = $this->request->post('separate_delivery', 'integer');
			$order->lang_id = $this->request->post('lang_id', 'integer');

			if (!$orderLabels = $this->request->post('order_labels')) {
				$orderLabels = [];
			}

			if (empty($order->id)) {
				$order->id = $this->orders->addOrder($order);
				$this->design->assign('message_success', 'added');
			} else {
				$this->orders->updateOrder($order->id, $order);
				$this->design->assign('message_success', 'updated');
			}

			if ($order->id) {
				$purchases = [];

				if ($this->request->post('purchases')) {
					foreach ($this->request->post('purchases') as $n => $va) {
						foreach ($va as $i => $v) {
							if (empty($purchases[$i])) {
								$purchases[$i] = new stdClass();
							}

							$purchases[$i]->$n = $v;
						}
					}
				}

				$postedPurchasesIds = [];

				foreach ($purchases as $purchase) {
					$variant = $this->variants->getVariant($purchase->variant_id);

					if (!empty($purchase->id)) {
						if (!empty($variant)) {
							$this->orders->updatePurchase($purchase->id, ['variant_id' => $purchase->variant_id, 'variant_name' => $variant->name, 'sku' => $variant->sku, 'price' => $purchase->price, 'amount' => $purchase->amount,]);
						} else {
							$this->orders->updatePurchase($purchase->id, ['price' => $purchase->price, 'amount' => $purchase->amount,]);
						}
					} elseif (!$purchase->id = $this->orders->addPurchase(['order_id' => $order->id, 'variant_id' => $purchase->variant_id, 'variant_name' => $variant->name, 'price' => $purchase->price, 'amount' => $purchase->amount,])) {
						$this->design->assign('message_error', 'error_closing');
					}

					$postedPurchasesIds[] = $purchase->id;
				}

				foreach ($this->orders->getPurchases(['order_id' => $order->id]) as $p) {
					if (!in_array($p->id, $postedPurchasesIds)) {
						$this->orders->deletePurchase($p->id);
					}
				}

				if ($this->request->post('status_new')) {
					$newStatus = 0;
				} elseif ($this->request->post('status_accept')) {
					$newStatus = 1;
				} elseif ($this->request->post('status_done')) {
					$newStatus = 2;
				} elseif ($this->request->post('status_deleted')) {
					$newStatus = 3;
				} else {
					$newStatus = $this->request->post('status', 'string');
				}

				if ($newStatus == 0) {
					if (!$this->orders->open((int) $order->id)) {
						$this->design->assign('message_error', 'error_open');
					} else {
						$this->orders->updateOrder($order->id, ['status' => 0]);
					}
				} elseif ($newStatus == 1) {
					if (!$this->orders->close((int) $order->id)) {
						$this->design->assign('message_error', 'error_closing');
					} else {
						$this->orders->updateOrder($order->id, ['status' => 1]);
					}
				} elseif ($newStatus == 2) {
					if (!$this->orders->close((int) $order->id)) {
						$this->design->assign('message_error', 'error_closing');
					} else {
						$this->orders->updateOrder($order->id, ['status' => 2]);
					}
				} elseif ($newStatus == 3) {
					if (!$this->orders->open((int) $order->id)) {
						$this->design->assign('message_error', 'error_open');
					} else {
						$this->orders->updateOrder($order->id, ['status' => 3]);
					}

					header('Location: ' . $this->request->get('return'));
				}

				$order = $this->orders->getOrder($order->id);

				if ($this->request->post('notify_user')) {
					$this->notify->emailOrderUser($order->id);
				}
			}
		} else {
			$order->id = $this->request->get('id', 'integer');
			$order = $this->orders->getOrder((int) $order->id);

			$orderLabels = [];

			if (isset($order->id)) {
				foreach ($this->orders->getOrderLabels($order->id) as $ol) {
					$orderLabels[] = $ol->id;
				}
			}
		}

		$subtotal = 0;
		$purchasesCount = 0;

		if ($order && $purchases = $this->orders->getPurchases(['order_id' => $order->id])) {
			$productsIds = [];
			$variantsIds = [];

			foreach ($purchases as $purchase) {
				$productsIds[] = $purchase->product_id;
				$variantsIds[] = $purchase->variant_id;
			}

			$products = [];

			foreach ($this->products->getProducts(['id' => $productsIds]) as $product) {
				$products[$product->id] = $product;
			}

			$images = $this->products->getImages(['product_id' => $productsIds]);

			foreach ($images as $image) {
				$products[$image->product_id]->images[] = $image;
			}

			$variants = [];

			foreach ($this->variants->getVariants(['product_id' => $productsIds]) as $variant) {
				$variants[$variant->id] = $variant;
			}

			foreach ($variants as $variant) {
				if (!empty($products[$variant->product_id])) {
					$products[$variant->product_id]->variants[] = $variant;
				}
			}

			foreach ($purchases as &$purchase) {
				if (!empty($products[$purchase->product_id])) {
					$purchase->product = $products[$purchase->product_id];
				}

				if (!empty($variants[$purchase->variant_id])) {
					$purchase->variant = $variants[$purchase->variant_id];
				}

				$subtotal += $purchase->price * $purchase->amount;
				$purchasesCount += $purchase->amount;
			}
		} else {
			$purchases = [];
		}

		if (empty($order->id)) {
			$order = new stdClass();

			$order->id = null;
			$order->status = null;
			$order->discount = null;
			$order->coupon_code = null;
			$order->coupon_discount = null;
			$order->weight = null;
			$order->delivery_price = null;
			$order->separate_delivery = null;
			$order->total_price = null;
			$order->paid = null;
			$order->date = null;
			$order->comment = '';
			$order->ip = null;
			$order->lang_id = '';
			$order->note = '';

			if (empty($order->phone)) {
				$order->phone = $this->request->get('phone', 'string');
			}

			if (empty($order->name)) {
				$order->name = $this->request->get('name', 'string');
			}

			if (empty($order->address)) {
				$order->address = $this->request->get('address', 'string');
			}

			if (empty($order->email)) {
				$order->email = $this->request->get('email', 'string');
			}
		}

		$this->design->assign('purchases', $purchases);
		$this->design->assign('purchases_count', $purchasesCount);
		$this->design->assign('subtotal', $subtotal);
		$this->design->assign('order', $order);

		if (!empty($order->id)) {
			$delivery = $this->delivery->getDelivery($order->delivery_id);
			$this->design->assign('delivery', $delivery);

			$paymentMethod = $this->payment->getPaymentMethod($order->payment_method_id);

			if (!empty($paymentMethod)) {
				$this->design->assign('payment_method', $paymentMethod);
				$paymentCurrency = $this->money->getCurrency((int) $paymentMethod->currency_id);
				$this->design->assign('payment_currency', $paymentCurrency);
			}

			if ($order->user_id) {
				$orderUser = $this->users->getUser((int) $order->user_id);
				$orderUser->group = $this->users->getGroup((int) $orderUser->group_id);
				$this->design->assign('user', $orderUser);
			}

			$this->design->assign('next_order', $this->orders->getNextOrder($order->id, $this->request->get('status', 'string')));
			$this->design->assign('prev_order', $this->orders->getPrevOrder($order->id, $this->request->get('status', 'string')));
		}

		$deliveries = $this->delivery->getDeliveries();
		$this->design->assign('deliveries', $deliveries);

		$paymentMethods = $this->payment->getPaymentMethods();
		$this->design->assign('payment_methods', $paymentMethods);

		$labels = $this->orders->getLabels();
		$this->design->assign('labels', $labels);

		$this->design->assign('order_labels', $orderLabels);

		if ($this->request->get('view') == 'print') {
			return $this->design->fetch('order_print.tpl');
		} else {
			return $this->design->fetch('order.tpl');
		}
	}
}
