<?php

require_once 'View.php';

class CartView extends View
{
	public function __construct()
	{
		parent::__construct();

		// Add Product Cart
		if ($variantId = $this->request->get('variant', 'integer')) {
			$this->cart->addItem($variantId, $this->request->get('amount', 'integer'));
			header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
		}

		// Delete Product Cart
		if ($deleteVariantId = (int) $this->request->get('delete_variant')) {
			$this->cart->deleteItem($deleteVariantId);

			if (!isset($_POST['submit_order']) || $_POST['submit_order'] != 1) {
				header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
			}
		}

		// Empty Cart
		if ($this->request->get('empty')) {
			$this->cart->emptyCart();
			header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
		}

		// Checkout
		if (isset($_POST['checkout'])) {
			$order = new stdClass();

			$order->delivery_id = $this->request->post('delivery_id', 'integer');
			$order->payment_method_id = $this->request->post('payment_method_id', 'integer');
			$order->name = $this->request->post('name');
			$order->email = $this->request->post('email');
			$order->address = $this->request->post('address');
			$order->phone = $this->request->post('phone');
			$order->comment = $this->request->post('comment');
			$order->ip = $_SERVER['REMOTE_ADDR'];

			$this->design->assign('delivery_id', $order->delivery_id);
			$this->design->assign('name', $order->name);
			$this->design->assign('email', $order->email);
			$this->design->assign('phone', $order->phone);
			$this->design->assign('address', $order->address);

			// Captcha
			$captchaCode =  $this->request->post('captcha_code', 'string');

			// Discount
			$cart = $this->cart->getCart();
			$order->discount = $cart->discount;

			// Weight
			$order->weight = $cart->total_weight;

			// Coupon
			if ($cart->coupon) {
				$order->coupon_discount = $cart->coupon_discount;
				$order->coupon_code = $cart->coupon->code;
			}

			// User
			if (!empty($this->user->id)) {
				$order->user_id = $this->user->id;
			}

			if (empty($order->name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($order->email)) {
				$this->design->assign('error', 'empty_email');
			} elseif ($this->settings->captcha_cart && (($_SESSION['captcha_cart'] != $captchaCode || empty($captchaCode)) || empty($_SESSION['captcha_cart']))) {
				$this->design->assign('error', 'captcha');
			} else {
				// Add Order
				$orderId = $this->orders->addOrder($order);
				$_SESSION['order_id'] = $orderId;

				// Update Coupon
				if ($cart->coupon) {
					$this->coupons->updateCoupon($cart->coupon->id, ['usages' => $cart->coupon->usages + 1]);
				}

				// Add Product Order
				foreach ($this->request->post('amounts') as $variantId => $amount) {
					$this->orders->addPurchase(['order_id' => $orderId, 'variant_id' => (int) $variantId, 'amount' => (int) $amount]);
				}

				// Get Order
				$order = $this->orders->getOrder($orderId);

				// Cost Delivery
				$delivery = $this->delivery->getDelivery($order->delivery_id);

				if (!empty($delivery) && $delivery->free_from > $order->total_price) {
					$this->orders->updateOrder($order->id, array('delivery_price' => $delivery->price, 'separate_delivery' => $delivery->separate_payment));
				} elseif ($delivery->separate_payment) {
					$this->orders->updateOrder($order->id, array('separate_delivery' => $delivery->separate_payment));
				}

				// Email
				$this->notify->emailOrderUser($order->id);
				$this->notify->emailOrderAdmin($order->id);

				// Telegram
				if ($this->settings->tg_notify == 1) {
					$this->tgnotify->message($order->id);
				}

				// Empty Cart
				$this->cart->emptyCart();

				// Redirect
				header('Location: ' . $this->config->root_url . '/' . $this->language->label . '/order/' . $order->url);
			}
		} else {

			// Amaunts
			if ($amounts = $this->request->post('amounts')) {
				foreach ($amounts as $variantId => $amount) {
					$this->cart->updateItem($variantId, $amount);
				}

				// Coupon
				$couponCode = trim($this->request->post('coupon_code', 'string'));

				if (empty($couponCode)) {
					$this->cart->applyCoupon('');
					header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
				} else {
					$coupon = $this->coupons->getCoupon((string)$couponCode);

					if (empty($coupon) || !$coupon->valid) {
						$this->cart->applyCoupon($couponCode);
						$this->design->assign('coupon_error', 'invalid');
					} else {
						$this->cart->applyCoupon($couponCode);
						header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
					}
				}
			}
		}
	}

	/**
	 * Main Function
	 */
	public function fetch()
	{
		// Delivery
		$deliveries = $this->delivery->getDeliveries(['enabled' => 1]);

		foreach ($deliveries as $delivery) {
			$delivery->ext_module_form = null;

			// Delivery Module
			$moduleName = $delivery->module;
			$ext_module_path = "delivery/$moduleName/api/$moduleName.php";

			if (file_exists($ext_module_path)) {
				include_once($ext_module_path);
				$ext_module_name = $moduleName;
				$ext_module = new $ext_module_name();
				$delivery->ext_module_form = $ext_module->delivery_form($delivery->id);
			}

			// Payment Methods Delivery
			$delivery->payment_methods = $this->payment->getPaymentMethods(['delivery_id' => $delivery->id, 'enabled' => 1]);
		}

		$this->design->assign('deliveries', $deliveries);

		// All Currencies
		$this->design->assign('all_currencies', $this->money->getCurrencies());

		// User Data
		if ($this->user) {
			$lastOrder = $this->orders->getOrders(['user_id' => $this->user->id, 'limit' => 1]);
			$lastOrder = reset($lastOrder);

			if ($lastOrder) {
				$this->design->assign('name', $lastOrder->name);
				$this->design->assign('email', $lastOrder->email);
				$this->design->assign('phone', $lastOrder->phone);
				$this->design->assign('address', $lastOrder->address);
			} else {
				$this->design->assign('name', $this->user->name);
				$this->design->assign('email', $this->user->email);
				$this->design->assign('phone', $this->user->phone);
				$this->design->assign('address', $this->user->address);
			}
		}

		// Coupon
		if ($this->coupons->countCoupons(['valid' => 1]) > 0) {
			$this->design->assign('coupon_request', true);
		}

		// Display
		return $this->design->fetch('cart.tpl');
	}
}
