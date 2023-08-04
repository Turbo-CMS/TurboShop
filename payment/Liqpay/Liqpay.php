<?php

require_once 'api/Turbo.php';

class Liqpay extends Turbo
{
	public function checkoutForm($orderId, $buttonText = null)
	{
		if (empty($buttonText)) {
			$buttonText = $this->translations->proceed_to_checkout;
		}

		$order = $this->orders->getOrder((int)$orderId);
		$liqpayOrderId = $order->id . "-" . rand(100000, 999999);
		$paymentMethod = $this->payment->getPaymentMethod($order->payment_method_id);
		$paymentCurrency = $this->money->getCurrency(intval($paymentMethod->currency_id));
		$settings = $this->payment->getPaymentSettings($paymentMethod->id);

		$price = round($this->money->convert($order->total_price, $paymentMethod->currency_id, false), 2);

		// order description
		$desc = 'Order payment №' . $order->id;

		$resultUrl = $this->config->root_url . '/order/' . $order->url;
		$serverUrl = $this->config->root_url . '/payment/Liqpay/callback.php';

		$privateKey = $settings['liqpay_private_key'];
		$publicKey = $settings['liqpay_public_key'];
		$sign = base64_encode(sha1($privateKey . $price . $paymentCurrency->code . $publicKey . $liqpayOrderId . 'buy' . $desc . $resultUrl . $serverUrl, 1));

		$button =	'<form method="POST" action="https://www.liqpay.ua/api/pay">
						<input type="hidden" name="public_key" value="' . $publicKey . '" />
						<input type="hidden" name="amount" value="' . $price . '" />
						<input type="hidden" name="currency" value="' . $paymentCurrency->code . '" />
						<input type="hidden" name="description" value="' . $desc . '" />
						<input type="hidden" name="order_id" value="' . $liqpayOrderId . '" />
						<input type="hidden" name="result_url" value="' . $resultUrl . '" />
						<input type="hidden" name="server_url" value="' . $serverUrl . '" />  
						<input type="hidden" name="type" value="buy" />
						<input type="hidden" name="signature" value="' . $sign . '" />
						<input type=submit class="btn btn-success btn-checkout" value="' . $buttonText . '">
					</form>';
		return $button;
	}
}
