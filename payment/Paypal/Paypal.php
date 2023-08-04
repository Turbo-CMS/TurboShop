<?php

require_once 'api/Turbo.php';

class Paypal extends Turbo
{
	public function checkoutForm($orderId, $buttonText = null)
	{
		if (empty($buttonText)) {
			$buttonText = $this->translations->proceed_to_checkout;
		}

		$order = $this->orders->getOrder((int) $orderId);
		$purchases = $this->orders->getPurchases(['order_id' => (int) $order->id]);

		$paymentMethod = $this->payment->getPaymentMethod($order->payment_method_id);
		$currency = $this->money->getCurrency(intval($paymentMethod->currency_id));
		$paymentSettings = $this->payment->getPaymentSettings($paymentMethod->id);

		if ($paymentSettings['mode'] == 'sandbox') {
			$paypalUrl = "https://www.sandbox.paypal.com/cgi-bin/webscr";
		} else {
			$paypalUrl = "https://www.paypal.com/cgi-bin/webscr";
		}

		$ipnUrl = $this->config->root_url . '/payment/Paypal/callback.php';
		$successUrl = $this->config->root_url . '/order/' . $order->url;
		$failUrl = $this->config->root_url . '/order/' . $order->url;

		$button =	"<form method='post' action= '" . $paypalUrl . "'>
					<input type='hidden' name='charset' value='utf-8'>
					<input type='hidden' name='currency_code' value='" . $currency->code . "'>
					<input type='hidden' name='invoice' value='" . $order->id . "'>
					<input type='hidden' name='business' value='" . $paymentSettings['business'] . "'>
					<input type='hidden' name='cmd' value='_cart'>
					<input type='hidden' name='upload' value='1'>
					<input type='hidden' name='rm' value='2'>
					<input type='hidden' name='notify_url' value='$ipnUrl'>
					<input type='hidden' name='return' value='$successUrl'>
					<input type='hidden' name='cancel_return' value='$failUrl'>
					";

		if ($order->discount > 0) {
			$button .= "<input type='hidden' name='discount_rate_cart' value='" . $order->discount . "'>";
		}

		if ($order->coupon_discount > 0) {
			$couponDiscount = $this->money->convert($order->coupon_discount, $paymentMethod->currency_id, false);
			$button .= "<input type='hidden' name='discount_amount_cart' value='" . $couponDiscount . "'>";
		}

		$i = 1;
		foreach ($purchases as $purchase) {
			$price = $this->money->convert($purchase->price, $paymentMethod->currency_id, false);
			$price = number_format($price, 2, '.', '');
			$button .=	"<input type='hidden' name='item_name_" . $i . "' value='" . $purchase->product_name . ' ' . $purchase->variant_name . "'>
						<input type='hidden' name='amount_" . $i . "' value='" . $price . "'>
						<input type='hidden' name='quantity_" . $i . "' value='" . $purchase->amount . "'>";
			$i++;
		}

		$deliveryPrice = 0;
		if ($order->delivery_id && !$order->separate_delivery && $order->delivery_price > 0) {
			$deliveryPrice = $this->money->convert($order->delivery_price, $paymentMethod->currency_id, false);
			$deliveryPrice = number_format($deliveryPrice, 2, '.', '');
			$button .=	"<input type='hidden' name='shipping_1' value='" . $deliveryPrice . "'>";
		}

		$button .=	"<input type=submit class='btn btn-success btn-checkout' value='" . $buttonText . "'>
					</form>";
		return $button;
	}
}
