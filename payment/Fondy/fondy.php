<?php

require_once 'api/Turbo.php';
require_once 'payment/fondy/fondy.cls.php';

class Fondy extends Turbo
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

		$price = round($this->money->convert($order->total_price, $paymentMethod->currency_id, false), 2);

		// Order description
		$desc = 'Order:' . $order->id;

		// Payment method
		$paymode = $settings['fondy_paymode'];

		$successUrl = $this->config->root_url . '/order/';
		$resultUrl = $this->config->root_url . '/payment/fondy/callback.php';

		$currency = $paymentCurrency->code;

		if ($currency == 'UAH') {
			$currency = 'UAH';
		}

		if ($settings['lang'] == '') {
			$settings['lang'] = 'ua';
		}

		$oplataArgs = [
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

		define('fondy_secret', 'your-secret-value');
		$oplataArgs['signature'] = fondycsl::getSignature($oplataArgs, $settings[fondy_secret]);
		$url = $this->getCheckout($oplataArgs);
		$out = '';
		if ($settings['mode'] == 'redirect') {
			$out .= '<style>
			.btn btn-success btn-checkout{
				text-decoration: none;
				top: 10px;
				position: relative;
			}
			</style>';
			$out .= '<a href="' . $url . '"class="btn btn-success btn-checkout">' . $buttonText . '</a>';
		} else {
			$out = '<script src="https://api.fondy.eu/static_common/v1/checkout/ipsp.js"></script>
			<div id="checkout">
			<div id="checkout_wrapper">
			</div>
			</div>';
			$out .= '
				 <style>
			#checkout_wrapper a{
				font-size: 20px;
				top: 30px;
				padding: 20px;
				position: relative;
			}
			#checkout_wrapper {
				text-align: left;
				position: relative;
				background: #FFF;
				/* padding: 30px; */
				padding-left: 15px;
				padding-right: 15px;
				padding-bottom: 30px;
				width: auto;
				max-width: 2000px;
				margin: 9px auto;
			}
			</style>
				 
				 <script>
			function checkoutInit(url, val) {
				$ipsp("checkout").scope(function() {
					this.setCheckoutWrapper("#checkout_wrapper");
					this.addCallback(__DEFAULTCALLBACK__);
					this.action("show", function(data) {
					   $("#checkout_loader").remove();
						$("#checkout").show();
					});
					this.action("hide", function(data) {
						$("#checkout").hide();
					});
					if(val){
					this.width(val);
					this.action("resize", function(data) {
					$("#checkout_wrapper").width(val).height(data.height);
						});
					}else{
					 this.action("resize", function(data) {
					$("#checkout_wrapper").width(480).height(data.height);
						});
					}
					this.loadUrl(url);
				});
				};
				checkoutInit("' . $url . '");
				</script>';
		}
		return $out;
	}

	protected function getCheckout($args)
	{
		if (is_callable('curl_init')) {
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, 'https://api.fondy.eu/api/checkout/url/');
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-type: application/json'));
			curl_setopt($ch, CURLOPT_POST, true);
			curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode(array('request' => $args)));

			$result = json_decode(curl_exec($ch));
			$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

			if ($httpCode != 200) {
				echo "Return code is {$httpCode} \n"
					. curl_error($ch);
				exit;
			}

			if ($result->response->response_status == 'failure') {
				echo $result->response->error_message;
				exit;
			}

			$url = $result->response->checkout_url;

			return $url;
		} else {
			echo "Curl not found!";
			die;
		}
	}
}
