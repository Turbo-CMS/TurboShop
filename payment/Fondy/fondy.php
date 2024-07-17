<?php

require_once 'api/Turbo.php';
require_once 'payment/Fondy/fondy.cls.php';

class fondy extends Turbo
{
	public function checkoutForm($orderId, $buttonText = null)
	{
		if (empty($buttonText)) {
			$buttonText = $this->translations->proceed_to_checkout;
		}

		$order = $this->orders->getOrder((int) $orderId);
		$paymentMethod = $this->payment->getPaymentMethod($order->payment_method_id);
		$paymentCurrency = $this->money->getCurrency((int) $paymentMethod->currency_id);
		$settings = $this->payment->getPaymentSettings($paymentMethod->id);

		$price = round($this->money->convert($order->total_price, $paymentMethod->currency_id, false), 2);

		// Order description
		$desc = 'Заказ номер: ' . $order->id;

		// Payment method
		$paymode = $settings['fondy_paymode'];

		$successUrl = $this->config->root_url . '/order/' . $order->url;
		$resultUrl = $this->config->root_url . '/payment/Fondy/callback.php';

		$currency = $paymentCurrency->code;

		if ($currency == 'UAH') {
			$currency = 'UAH';
		}

		if ($settings['lang'] == '') {
			$settings['lang'] = 'ua';
		}

		$res = [
			'order_id' => $orderId . fondycsl::ORDER_SEPARATOR . time(),
			'merchant_id' => $settings['fondy_merchantid'],
			'order_desc' => $desc,
			'amount' => $price * 100,
			'currency' => $currency,
			'server_callback_url' => $resultUrl,
			'response_url' => $resultUrl,
			'lang' =>  $settings['lang'],
			'sender_email' => $order->email
		];

		if ($paymode == 'Y') {
			$res['preauth'] = 'Y';
		}

		$res['signature'] = fondycsl::getSignature($res, $settings['fondy_secret']);

		$button = '<form id="fondy_to_checkout" method="POST" action="https://api.fondy.eu/api/checkout/redirect/">';

		foreach ($res as $key => $value) {
			$button .= '<input type="hidden" name="' . $key . '" value="' . $value . '">';
		}

		$button .= '<input type="submit" class="btn btn-success btn-checkout" value="' . $buttonText . '"></form>';

		echo $button;
	}
}
