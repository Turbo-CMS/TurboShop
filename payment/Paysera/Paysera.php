<?php

require_once 'WebToPay.php';
require_once 'api/Turbo.php';

class Paysera extends Turbo
{
	public function checkoutForm($orderId, $buttonText = null)
	{
		if (empty($buttonText)) {
			$buttonText = $this->translations->proceed_to_checkout;
		}

		$order = $this->orders->getOrder((int) $orderId);
		$paymentMethod = $this->payment->getPaymentMethod($order->payment_method_id);
		$paymentSettings = $this->payment->getPaymentSettings($paymentMethod->id);

		$amount = $this->money->convert($order->total_price, $paymentMethod->currency_id, false);

		$successUrl = $this->config->root_url . '/order/' . $order->url;
		$failUrl = $this->config->root_url . '/order/' . $order->url;
		$callbackUrl = $this->config->root_url . '/payment/Paysera/callback.php?order_id=' . $order->id;

		$currency = $this->money->getCurrency((int) $paymentMethod->currency_id);

		$request = WebToPay::buildRequest([
			'projectid' => $paymentSettings['paysera_project_id'],
			'sign_password' => $paymentSettings['paysera_password'],
			'test' => $paymentSettings['paysera_test_mode'],
			'orderid' => $order->id,
			'p_email' => $order->email,
			'amount' => round($amount * 100),
			'currency' => $currency->code,
			'paytext' => 'Payment for order #[order_nr] on [site_name]',
			'accepturl' => $successUrl,
			'cancelurl' => $failUrl,
			'callbackurl' => $callbackUrl
		]);

		$button = "<form method='POST' action='" . WebToPay::PAY_URL . "'>
					<input type='hidden' name='data' value='" . $request['data'] . "'>
					<input type='hidden' name='sign' value='" . $request['sign'] . "'>
					<input class='btn btn-success btn-checkout' type='submit' value='" . $buttonText . "' />
					</form>";
		return $button;
	}
}
