<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

class TgNotify extends Turbo
{
	private function exec_curl_request($handle)
	{
		$response = curl_exec($handle);

		if ($response === false) {
			$errno = curl_errno($handle);
			$error = curl_error($handle);
			error_log("Curl returned error $errno: $error\n");
			curl_close($handle);
			return false;
		}

		$http_code = intval(curl_getinfo($handle, CURLINFO_HTTP_CODE));
		curl_close($handle);

		if ($http_code >= 500) {
			// do not wat to DDOS server if something goes wrong
			sleep(10);
			return false;
		} else if ($http_code != 200) {
			$response = json_decode($response, true);
			error_log("Request has failed with error {$response['error_code']}: {$response['description']}\n");
			if ($http_code == 401) {
				throw new Exception('Invalid access token provided');
			}
			return false;
		} else {
			$response = json_decode($response, true);
			if (isset($response['description'])) {
				error_log("Request was successfull: {$response['description']}\n");
			}
			$response = $response['result'];
		}
		return $response;
	}

	public function apiRequest($method, $parameters)
	{
		if (!is_string($method)) {
			error_log("Method name must be a string\n");
			return false;
		}

		if (!$parameters) {
			$parameters = array();
		} else if (!is_array($parameters)) {
			error_log("Parameters must be an array\n");
			return false;
		}

		foreach ($parameters as $key => &$val) {
			// encoding to JSON array parameters, for example reply_markup
			if (!is_numeric($val) && !is_string($val)) {
				$val = json_encode($val);
			}
		}
		$url = $this->settings->tg_apiurl . $this->settings->tg_token . '/' . $method . '?' . http_build_query($parameters);

		$handle = curl_init($url);

		curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 5);
		curl_setopt($handle, CURLOPT_TIMEOUT, 60);

		return $this->exec_curl_request($handle);
	}

	public function message($order_id)
	{
		if (!($order = $this->orders->get_order(intval($order_id))))
			return false;

		$purchases = $this->orders->get_purchases(array('order_id' => $order->id));

		$products_ids = array();
		$variants_ids = array();
		foreach ($purchases as $purchase) {
			$products_ids[] = $purchase->product_id;
			$variants_ids[] = $purchase->variant_id;
		}

		$products = array();
		foreach ($this->products->get_products(array('id' => $products_ids)) as $p)
			$products[$p->id] = $p;


		$variants = array();
		foreach ($this->variants->get_variants(array('id' => $variants_ids)) as $v) {
			$variants[$v->id] = $v;
			$products[$v->product_id]->variants[] = $v;
		}

		foreach ($purchases as &$purchase) {
			if (!empty($products[$purchase->product_id]))
				$purchase->product = $products[$purchase->product_id];
			if (!empty($variants[$purchase->variant_id]))
				$purchase->variant = $variants[$purchase->variant_id];
		}
		$currency = $this->money->get_currency();
		$total = $this->money->convert($order->total_price) . ' ' . $currency->sign;

		$text_string = '' . $this->backend_translations->email_new_order . ' №' . $order->id . ' ' . $this->backend_translations->email_for_sum . ' ' . $total . PHP_EOL;
		if ($order->status == 0)
			$status = '' . $this->backend_translations->email_status_waiting . '';
		elseif ($order->status == 1)
			$status = '' . $this->backend_translations->email_status_in . '';
		elseif ($order->status == 2)
			$status = '' . $this->backend_translations->email_status_completed . '';
		$text_string .= '<b>' . $this->backend_translations->email_order_status_s . ':</b> ' . $status . PHP_EOL;

		if ($order->paid == 1)
			$paid = '' . $this->backend_translations->order_paid . '';
		else {
			$paid = '' . $this->backend_translations->order_not_paid . '';
		}

		$text_string .= '<b>' . $this->backend_translations->email_payment_status . ':</b> ' . $paid . PHP_EOL;

		if ($order->name)
			$text_string .= '<b>' . $this->backend_translations->email_order_name . ':</b> ' . $order->name . PHP_EOL;
		if ($order->phone)
			$text_string .= '<b>' . $this->backend_translations->email_order_phone . ':</b> ' . $order->phone . PHP_EOL;
		if ($order->email)
			$text_string .= '<b>' . $this->backend_translations->email_order_email . ':</b> ' . $order->email . PHP_EOL;
		if ($order->address)
			$text_string .= '<b>' . $this->backend_translations->email_order_address . ':</b> ' . $order->address . PHP_EOL;
		if ($order->comment)
			$text_string .= '<b>' . $this->backend_translations->email_order_comment . ':</b> ' . $order->comment . PHP_EOL;

		$text_string .= '<b>' . $this->backend_translations->email_order_purchases . ':</b> ' . PHP_EOL;
		foreach ($purchases as &$purchase) {
			$text_string .= $purchase->product_name . ' ' . $purchase->variant_color . ' ' . $purchase->variant_name . PHP_EOL;

			$item_price = $this->money->convert($purchase->price) . ' ' . $currency->sign;
			$text_string .= $purchase->amount . ' x ' . $item_price . PHP_EOL;
		}
		$delivery = $this->delivery->get_delivery($order->delivery_id);
		$text_string .= '<b>' . $this->backend_translations->general_shipping . ':</b> ' . $delivery->name . PHP_EOL;
		$delivery_price = $this->money->convert($order->delivery_price) . ' ' . $currency->sign;
		$text_string .= '<b>' . $this->backend_translations->delivery_cost . ':</b> ' . $delivery_price . PHP_EOL;
		$text_string .= $this->config->root_url . '/turbo/index.php?module=OrderAdmin&id=' . $order->id;
		$this->apiRequest("sendMessage", array('chat_id' => $this->settings->tg_channel, 'parse_mode' => 'HTML', "text" => $text_string));
	}

	public function message_callback($callback_id)
	{
		if (!($callback = $this->callbacks->get_callback(intval($callback_id))))
			return false;

		$text_string = '' . $this->backend_translations->callbacks_order . '' . PHP_EOL;

		if ($callback->name)
			$text_string .= '<b>' . $this->backend_translations->index_name . ':</b> ' . $callback->name . PHP_EOL;
		if ($callback->phone)
			$text_string .= '<b>' . $this->backend_translations->email_order_phone . ':</b> ' . $callback->phone . PHP_EOL;
		if ($callback->message)
			$text_string .= '<b>' . $this->backend_translations->email_message . ':</b> ' . $callback->message;

		$this->apiRequest("sendMessage", array('chat_id' => $this->settings->tg_channel, 'parse_mode' => 'HTML', "text" => $text_string));
	}
}
