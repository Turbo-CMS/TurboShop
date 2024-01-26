<?php

require_once 'View.php';

class OrderView extends View
{
	public function __construct()
	{
		parent::__construct();
		$this->design->smarty->registerPlugin("function", "checkoutForm", [$this, 'checkoutForm']);
	}

	/**
	 * Main function
	 */
	function fetch()
	{
		if ($this->request->get('file')) {
			return $this->download();
		} else {
			return $this->fetchOrder();
		}
	}

	/**
	 * Fetch order
	 */
	private function fetchOrder()
	{
		if ($url = $this->request->get('url', 'string')) {
			$order = $this->orders->getOrder((string)$url);
		} elseif (!empty($_SESSION['order_id'])) {
			$order = $this->orders->getOrder((int) $_SESSION['order_id']);
		} else {
			return false;
		}

		if (!$order) {
			return false;
		}

		$purchases = $this->orders->getPurchases(['order_id' => (int) $order->id]);

		if (!$purchases) {
			return false;
		}

		if ($this->request->isMethod('post')) {
			if ($paymentMethodId = $this->request->post('payment_method_id', 'integer')) {
				$this->orders->updateOrder($order->id, ['payment_method_id' => $paymentMethodId]);
				$order = $this->orders->getOrder((int)$order->id);
			} elseif ($this->request->post('reset_payment_method')) {
				$this->orders->updateOrder($order->id, ['payment_method_id' => null]);
				$order = $this->orders->getOrder((int)$order->id);
			}
		}

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

		$images = $this->products->getImages(['product_id' => $productsIds]);

		foreach ($images as $image) {
			$products[$image->product_id]->images[] = $image;
		}

		$variants = [];

		foreach ($this->variants->getVariants(['id' => $variantsIds]) as $variant) {
			$variants[$variant->id] = $variant;
		}

		foreach ($variants as $variant) {
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

		// Delivery
		$delivery = $this->delivery->getDelivery($order->delivery_id);
		$this->design->assign('delivery', $delivery);

		// Design
		$this->design->assign('order', $order);
		$this->design->assign('purchases', $purchases);

		// Payment methods
		if ($order->payment_method_id) {
			$paymentMethod = $this->payment->getPaymentMethod($order->payment_method_id);
			$this->design->assign('payment_method', $paymentMethod);
		}

		$paymentMethods = $this->payment->getPaymentMethods(['delivery_id' => $order->delivery_id, 'enabled' => 1]);
		$this->design->assign('payment_methods', $paymentMethods);

		//All currencies
		$allCurrencies = $this->money->getCurrencies();
		$this->design->assign('all_currencies', $allCurrencies);

		// Display
		$body = $this->design->fetch('order.tpl');

		return $body;
	}

	/**
	 * Download
	 */
	private function download()
	{
		$file = $this->request->get('file');

		if (!$url = $this->request->get('url', 'string')) {
			return false;
		}

		$order = $this->orders->getOrder((string)$url);

		if (!$order) {
			return false;
		}

		if (!$order->paid) {
			return false;
		}

		$query = $this->db->placehold("SELECT p.id FROM __purchases p, __variants v WHERE p.variant_id=v.id AND p.order_id=? AND v.attachment=?", $order->id, $file);
		$this->db->query($query);

		if ($this->db->numRows() == 0) {
			return false;
		}

		header("Content-type: application/force-download");
		header("Content-Disposition: attachment; filename=\"$file\"");
		header("Content-Length: " . filesize($this->config->root_dir . $this->config->downloads_dir . $file));

		readfile($this->config->root_dir . $this->config->downloads_dir . $file);

		exit();
	}

	/**
	 * Checkout form
	 */
	public function checkoutForm($params)
	{
		$moduleName = preg_replace("/[^A-Za-z0-9]+/", "", $params['module']);

		$form = '';

		if (!empty($moduleName) && is_file("payment/$moduleName/$moduleName.php")) {
			include_once("payment/$moduleName/$moduleName.php");
			$module = new $moduleName();
			$buttonText = isset($params['button_text']) ? $params['button_text'] : '';
			$form = $module->checkoutForm($params['order_id'], $buttonText);
		}

		return $form;
	}
}
