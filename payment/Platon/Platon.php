<?php

require_once 'api/Turbo.php';

class Platon extends Turbo
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
		$data = base64_encode(serialize(array('amount' => number_format($price, 2, '.', ''), 'currency' => $paymentCurrency->code, 'name' => 'Order payment №' . $order->id)));

		$returnUrl = $this->config->root_url . '/order/' . $order->url;

		$sign = md5(strtoupper(strrev($_SERVER["REMOTE_ADDR"]) . strrev($settings['platon_key']) . strrev($data) . strrev($returnUrl) . strrev($settings['platon_password'])));

		$button =	'<form action="https://secure.platononline.com/webpaygw/pcc.php?a=auth" method="POST"/>' .
			'<input type="hidden" name="key" value="' . $settings['platon_key'] . '" />' .
			'<input type="hidden" name="order" value="' . $order->id . '" />' .
			'<input type="hidden" name="data" value="' . $data . '" />' .
			'<input type="hidden" name="url" value="' . $returnUrl . '" />' .
			'<input type="hidden" name="sign" value="' . $sign . '" />' .
			'<input type=submit class="btn btn-success btn-checkout" value="' . $buttonText . '">' .
			'</form>';
		return $button;
	}
}
