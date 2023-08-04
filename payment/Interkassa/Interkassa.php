<?php

require_once 'api/Turbo.php';

class Interkassa extends Turbo
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

		// order description
		$desc = 'Order payment №' . $order->id;

		$shopId = $settings['interkassa_shop_id'];

		$button = "<form name='payment' action='https://interkassa.com/lib/payment.php' method='post' 
					enctype='application/x-www-form-urlencoded' accept-charset='UTF-8'>
					<input type='hidden' name='ik_shop_id' value='$shopId'>
					<input type='hidden' name='ik_payment_amount' value='$price'>
					<input type='hidden' name='ik_payment_id' value='$order->id'>
					<input type='hidden' name='ik_payment_desc' value='$desc'>
					<input type='submit' name='process' value='$buttonText' class='btn btn-success btn-checkout'>
					</form>";
		return $button;
	}
}
