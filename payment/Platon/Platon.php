<?php

require_once('api/Turbo.php');

class Platon extends Turbo
{	
	public function checkout_form($order_id, $button_text = null)
	{
		if(empty($button_text))
			$button_text = $this->translations->proceed_to_checkout;
		
		$order = $this->orders->getOrder((int)$order_id);
		$payment_method = $this->payment->getPaymentMethod($order->payment_method_id);
		$payment_currency = $this->money->getCurrency(intval($payment_method->currency_id));
		$settings = $this->payment->getPaymentSettings($payment_method->id);
		
		$price = round($this->money->convert($order->total_price, $payment_method->currency_id, false), 2);
		
		// order description
		$data = base64_encode( serialize( array('amount'=>number_format($price,2,'.',''), 'currency'=>$payment_currency->code, 'name'=>'Order payment №'.$order->id)));
		
		$return_url = $this->config->root_url.'/order/'.$order->url;
		
		$sign = md5(strtoupper(strrev($_SERVER["REMOTE_ADDR"]).strrev($settings['platon_key']).strrev($data).strrev($return_url).strrev($settings['platon_password'])));
					
		$button =	'<form action="https://secure.platononline.com/webpaygw/pcc.php?a=auth" method="POST"/>'.
					'<input type="hidden" name="key" value="'.$settings['platon_key'].'" />'.
					'<input type="hidden" name="order" value="'.$order->id.'" />'.
					'<input type="hidden" name="data" value="'.$data.'" />'.
					'<input type="hidden" name="url" value="'.$return_url.'" />'.
					'<input type="hidden" name="sign" value="'.$sign.'" />'.
					'<input type=submit class="btn btn-success btn-checkout" value="'.$button_text.'">'.
					'</form>';
		return $button;
	}
}