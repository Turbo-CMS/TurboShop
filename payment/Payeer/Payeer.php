<?php

require_once 'api/Turbo.php';

class Payeer extends Turbo
{
	public function checkoutForm($orderId, $buttonText = null)
	{
		if (empty($buttonText)) {
			$buttonText = $this->translations->proceed_to_checkout;
		}

		$order = $this->orders->getOrder((int) $orderId);
		$paymentMethod = $this->payment->getPaymentMethod($order->payment_method_id);
		$paymentCurrency = $this->money->getCurrency(intval($paymentMethod->currency_id));
		$settings = $this->payment->getPaymentSettings($paymentMethod->id);

		$mUrl = $settings['payeer_merchanturl'];
		$mShop = $settings['payeer_merchantid'];
		$mOrderid = $order->id;
		$mAmount = number_format($order->total_price, 2, '.', '');
		$mCurr = $paymentCurrency->code == 'RUR' ? 'RUB' : $paymentCurrency->code;
		$mDesc = base64_encode($order->comment);

		$arHash = [
			$mShop,
			$mOrderid,
			$mAmount,
			$mCurr,
			$mDesc,
			$settings['payeer_secret']
		];

		$sign = strtoupper(hash('sha256', implode(":", $arHash)));

		$button = '
		<form method="GET" action="' . $mUrl . '">
			<input type="hidden" name="m_shop" value="' . $mShop . '">
			<input type="hidden" name="m_orderid" value="' . $mOrderid . '">
			<input type="hidden" name="m_amount" value="' . $mAmount . '">
			<input type="hidden" name="m_curr" value="' . $mCurr . '">
			<input type="hidden" name="m_desc" value="' . $mDesc . '">
			<input type="hidden" name="m_sign" value="' . $sign . '">
			<input type="submit" name="m_process" class="btn btn-success btn-checkout" value="' . $buttonText . '" />
		</form>';
		return $button;
	}
}
