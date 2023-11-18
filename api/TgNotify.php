<?php

class TgNotify extends Turbo
{
	/**
	 * Exec Curl Request
	 */
	private function execCurlRequest($handle)
	{
		$response = curl_exec($handle);

		if ($response === false) {
			$errno = curl_errno($handle);
			$error = curl_error($handle);
			error_log("Curl returned error $errno: $error\n");
			curl_close($handle);
			return false;
		}

		$httpCode = (int) curl_getinfo($handle, CURLINFO_HTTP_CODE);
		curl_close($handle);

		if ($httpCode >= 500) {
			sleep(10);
			return false;
		} else if ($httpCode != 200) {
			$response = json_decode($response, true);

			error_log("Request has failed with error {$response['error_code']}: {$response['description']}\n");

			if ($httpCode == 401) {
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

	/**
	 * API Request
	 */
	public function apiRequest($method, $parameters)
	{
		if (!is_string($method)) {
			error_log("Method name must be a string\n");
			return false;
		}

		if (!$parameters) {
			$parameters = [];
		} else if (!is_array($parameters)) {
			error_log("Parameters must be an array\n");
			return false;
		}

		foreach ($parameters as $key => &$val) {
			if (!is_numeric($val) && !is_string($val)) {
				$val = json_encode($val);
			}
		}

		$url = $this->settings->tg_apiurl . $this->settings->tg_token . '/' . $method . '?' . http_build_query($parameters);
		$handle = curl_init($url);

		curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 5);
		curl_setopt($handle, CURLOPT_TIMEOUT, 60);

		return $this->execCurlRequest($handle);
	}

	/**
	 * Massege
	 */
	public function message($orderId)
	{
		if (!($order = $this->orders->getOrder((int) $orderId))) {
			return false;
		}

		$purchases = $this->orders->getPurchases(array('order_id' => $order->id));

		$productsIds = [];
		$variantsIds = [];

		foreach ($purchases as $purchase) {
			$productsIds[] = $purchase->product_id;
			$variantsIds[] = $purchase->variant_id;
		}

		$products = [];

		foreach ($this->products->getProducts(['id' => $productsIds]) as $product) {
			$products[$product->id] = $product;
		}

		$variants = [];

		foreach ($this->variants->getVariants(['id' => $variantsIds]) as $variant) {
			$variants[$variant->id] = $variant;
			$products[$variant->product_id]->variants[] = $variant;
		}


		foreach ($purchases as &$purchase) {
			if (!empty($products[$purchase->product_id])) {
				$purchase->product = $products[$purchase->product_id];
			}

			if (!empty($variants[$purchase->variant_id])) {
				$purchase->variant = $variants[$purchase->variant_id];
			}
		}

		$currency = $this->money->getCurrency();
		$total = $this->money->convert($order->total_price) . ' ' . $currency->sign;

		$textString = $this->backendTranslations->order_new . '<b> №' . $order->id . '</b> ' . $this->backendTranslations->email_for_sum . ' ' . $total . PHP_EOL;

		if ($order->status == 0) {
			$status = '' . $this->backendTranslations->email_status_waiting . '';
		} elseif ($order->status == 1) {
			$status = '' . $this->backendTranslations->email_status_in . '';
		} elseif ($order->status == 2) {
			$status = '' . $this->backendTranslations->email_status_completed . '';
			$textString .= '<b>' . $this->backendTranslations->email_order_status_s . ':</b> ' . $status . PHP_EOL;
		}

		if ($order->paid == 1) {
			$paid = '' . $this->backendTranslations->order_paid . '';
		} else {
			$paid = '' . $this->backendTranslations->order_not_paid . '';
		}

		$textString .= '<b>' . $this->backendTranslations->global_payment . ':</b> ' . $paid . PHP_EOL;

		if ($order->name) {
			$textString .= '<b>' . $this->backendTranslations->global_full_name . ':</b> ' . $order->name . PHP_EOL;
		}

		if ($order->phone) {
			$textString .= '<b>' . $this->backendTranslations->global_phone . ':</b> ' . $order->phone . PHP_EOL;
		}

		if ($order->email) {
			$textString .= '<b>' . $this->backendTranslations->global_email . ':</b> ' . $order->email . PHP_EOL;
		}

		if ($order->address) {
			$textString .= '<b>' . $this->backendTranslations->global_address . ':</b> ' . $order->address . PHP_EOL;
		}

		if ($order->comment) {
			$textString .= '<b>' . $this->backendTranslations->global_comment . ':</b> ' . $order->comment . PHP_EOL;
		}

		$textString .= '<b>' . $this->backendTranslations->email_order_purchases . ':</b> ' . PHP_EOL;

		foreach ($purchases as &$purchase) {
			$textString .= $purchase->product_name . ' ' . $purchase->variant_color . ' ' . $purchase->variant_name . PHP_EOL;
			$itemPrice = $this->money->convert($purchase->price) . ' ' . $currency->sign;
			$textString .= $purchase->amount . ' x ' . $itemPrice . PHP_EOL;
		}

		$delivery = $this->delivery->getDelivery($order->delivery_id);
		$textString .= '<b>' . $this->backendTranslations->global_shipping . ':</b> ' . $delivery->name . PHP_EOL;
		$deliveryPrice = $this->money->convert($order->delivery_price) . ' ' . $currency->sign;
		$textString .= '<b>' . $this->backendTranslations->delivery_cost . ':</b> ' . $deliveryPrice . PHP_EOL;
		$textString .= $this->config->root_url . '/turbo/index.php?module=OrderAdmin&id=' . $order->id;

		$this->apiRequest("sendMessage", ['chat_id' => $this->settings->tg_channel, 'parse_mode' => 'HTML', "text" => $textString]);
	}

	/**
	 * Massege Callback
	 */
	public function messageCallback($callback_id)
	{
		if (!($callback = $this->callbacks->getCallback((int) $callback_id))) {
			return false;
		}

		$textString = '' . $this->backendTranslations->callbacks_order . '' . PHP_EOL;

		if ($callback->name) {
			$textString .= '<b>' . $this->backendTranslations->global_name . ':</b> ' . $callback->name . PHP_EOL;
		}

		if ($callback->phone) {
			$textString .= '<b>' . $this->backendTranslations->global_phone . ':</b> ' . $callback->phone . PHP_EOL;
		}

		if ($callback->message) {
			$textString .= '<b>' . $this->backendTranslations->global_message . ':</b> ' . $callback->message;
		}

		$this->apiRequest("sendMessage", ['chat_id' => $this->settings->tg_channel, 'parse_mode' => 'HTML', "text" => $textString]);
	}
}
