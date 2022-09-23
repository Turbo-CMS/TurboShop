<?php

require_once('api/Turbo.php');

class Interkassa extends Turbo
{	
	public function checkout_form($order_id, $button_text = null)
	{
		if(empty($button_text))
			$button_text = $this->translations->proceed_to_checkout;
		
		$order = $this->orders->get_order((int)$order_id);
		$payment_method = $this->payment->get_payment_method($order->payment_method_id);
		$payment_currency = $this->money->get_currency(intval($payment_method->currency_id));
		$settings = $this->payment->get_payment_settings($payment_method->id);
		
		$price = round($this->money->convert($order->total_price, $payment_method->currency_id, false), 2);
		
		
		// order description
		$desc = 'Order payment №'.$order->id;
		
		$shop_id = $settings['interkassa_shop_id'];
					
		$button = "<form name='payment' action='https://interkassa.com/lib/payment.php' method='post' 
					enctype='application/x-www-form-urlencoded' accept-charset='UTF-8'>
					<input type='hidden' name='ik_shop_id' value='$shop_id'>
					<input type='hidden' name='ik_payment_amount' value='$price'>
					<input type='hidden' name='ik_payment_id' value='$order->id'>
					<input type='hidden' name='ik_payment_desc' value='$desc'>
					<input type='submit' name='process' value='$button_text' class='btn btn-success btn-checkout'>
					</form>";
		return $button;
	}
}