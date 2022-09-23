<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com/
 *
 * Shopping basket
 * This class uses the template cart.tpl
 *
 */

require_once('View.php');

class CartView extends View
{
	//////////////////////////////////////////
	// Changes to items in the cart
	//////////////////////////////////////////
	public function __construct()
	{
		parent::__construct();

		// If the option id is passed, add it to the cart
		if ($variant_id = $this->request->get('variant', 'integer')) {
			$this->cart->add_item($variant_id, $this->request->get('amount', 'integer'));
			header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
		}

		// Removing an item from the cart
		if ($delete_variant_id = intval($this->request->get('delete_variant'))) {
			$this->cart->delete_item($delete_variant_id);
			if (!isset($_POST['submit_order']) || $_POST['submit_order'] != 1)
				header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
		}

		// Empty the trash
		if ($this->request->get('empty')) {
			$this->cart->empty_cart();
			header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
		}

		// If clicked checkout
		if (isset($_POST['checkout'])) {
			$order = new stdClass;
			$order->delivery_id = $this->request->post('delivery_id', 'integer');
			$order->name        = $this->request->post('name');
			$order->email       = $this->request->post('email');
			$order->address     = $this->request->post('address');
			$order->phone       = $this->request->post('phone');
			$order->comment     = $this->request->post('comment');
			$order->ip          = $_SERVER['REMOTE_ADDR'];

			$this->design->assign('delivery_id', $order->delivery_id);
			$this->design->assign('name', $order->name);
			$this->design->assign('email', $order->email);
			$this->design->assign('phone', $order->phone);
			$this->design->assign('address', $order->address);

			$captcha_code =  $this->request->post('captcha_code', 'string');

			// Discount
			$cart = $this->cart->get_cart();
			$order->discount = $cart->discount;
			$order->weight = $cart->total_weight;

			if ($cart->coupon) {
				$order->coupon_discount = $cart->coupon_discount;
				$order->coupon_code = $cart->coupon->code;
			}

			if (!empty($this->user->id))
				$order->user_id = $this->user->id;

			if (empty($order->name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($order->email)) {
				$this->design->assign('error', 'empty_email');
			} elseif ($this->settings->captcha_cart && (($_SESSION['captcha_cart'] != $captcha_code || empty($captcha_code)) || empty($_SESSION['captcha_cart']))) {
				$this->design->assign('error', 'captcha');
			} else {
				// Add order to database
				$order_id = $this->orders->add_order($order);
				$_SESSION['order_id'] = $order_id;

				// If a coupon was used, increase the number of uses
				if ($cart->coupon)
					$this->coupons->update_coupon($cart->coupon->id, array('usages' => $cart->coupon->usages + 1));

				// Add items to the order
				foreach ($this->request->post('amounts') as $variant_id => $amount) {
					$this->orders->add_purchase(array('order_id' => $order_id, 'variant_id' => intval($variant_id), 'amount' => intval($amount)));
				}
				$order = $this->orders->get_order($order_id);

				// Cost of delivery
				$delivery = $this->delivery->get_delivery($order->delivery_id);
				if (!empty($delivery) && $delivery->free_from > $order->total_price) {
					$this->orders->update_order($order->id, array('delivery_price' => $delivery->price, 'separate_delivery' => $delivery->separate_payment));
				}

				// Send an email to the user
				$this->notify->email_order_user($order->id);

				// Send an email to the administrator
				$this->notify->email_order_admin($order->id);
				
				// Let's notify in Telegram
				if($this->settings->tg_notify==1)
				$this->tgnotify->message($order->id);

				// Empty the trash (session)
				$this->cart->empty_cart();

				// Redirect to order page
				header('Location: ' . $this->config->root_url . '/' . $this->language->label . '/order/' . $order->url);
			}
		} else {

			// If we have posted amounts, update them
			if ($amounts = $this->request->post('amounts')) {
				foreach ($amounts as $variant_id => $amount) {
					$this->cart->update_item($variant_id, $amount);
				}

				$coupon_code = trim($this->request->post('coupon_code', 'string'));
				if (empty($coupon_code)) {
					$this->cart->apply_coupon('');
					header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
				} else {
					$coupon = $this->coupons->get_coupon((string)$coupon_code);

					if (empty($coupon) || !$coupon->valid) {
						$this->cart->apply_coupon($coupon_code);
						$this->design->assign('coupon_error', 'invalid');
					} else {
						$this->cart->apply_coupon($coupon_code);
						header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
					}
				}
			}
		}
	}

	//////////////////////////////////////////
	// Main function
	//////////////////////////////////////////
	function fetch()
	{
		// Delivery methods
		$deliveries = $this->delivery->get_deliveries(array('enabled' => 1));
		$this->design->assign('deliveries', $deliveries);

		// User data
		if ($this->user) {
			$last_order = $this->orders->get_orders(array('user_id' => $this->user->id, 'limit' => 1));
			$last_order = reset($last_order);
			if ($last_order) {
				$this->design->assign('name', $last_order->name);
				$this->design->assign('email', $last_order->email);
				$this->design->assign('phone', $last_order->phone);
				$this->design->assign('address', $last_order->address);
			} else {
				$this->design->assign('name', $this->user->name);
				$this->design->assign('email', $this->user->email);
				$this->design->assign('phone', $this->user->phone);
				$this->design->assign('address', $this->user->address);
			}
		}

		// If there are valid coupons, output the coupon input
		if ($this->coupons->count_coupons(array('valid' => 1)) > 0)
			$this->design->assign('coupon_request', true);

		// Display the cart
		return $this->design->fetch('cart.tpl');
	}
}
