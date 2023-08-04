<?php

chdir('../../');
require_once 'api/Turbo.php';
$turbo = new Turbo();

// The amount the buyer paid. The fractional part is separated by a dot.
$amount = $_POST['amount'];

// Seller's internal purchase number
// In this field, the id of the order in our store is passed.
$orderId = (int) $_POST['order'];

// Control signature
$sign = $_POST['sign'];

// Проверим статус
if ($_POST['status'] !== 'SALE') {
	die('Incorrect Status');
}

////////////////////////////////////////////////
// Select an order from the database
////////////////////////////////////////////////
$order = $turbo->orders->getOrder((int) $orderId);

if (empty($order)) {
	die('Paid order not found');
}

// You can not pay for an already paid order 
if ($order->paid) {
	die('This order has already been paid.');
}

////////////////////////////////////////////////
// Select the appropriate payment method from the database
////////////////////////////////////////////////
$method = $turbo->payment->getPaymentMethod((int) $order->payment_method_id);

if (empty($method)) {
	die("Unknown payment method");
}

$settings = unserialize($method->settings);

// Checking the control signature
$my_sign = md5(strtoupper(strrev($_POST['email']) . $settings['platon_password'] . $order->id . strrev(substr($_POST['card'], 0, 6) . substr($_POST['card'], -4))));

if ($sign !== $my_sign) {
	die("bad sign\n");
}

if ($amount != $turbo->money->convert($order->total_price, $method->currency_id, false) || $amount <= 0) {
	die("incorrect price\n");
}

////////////////////////////////////
// Product Availability Check
////////////////////////////////////
$purchases = $turbo->orders->getPurchases(['order_id' => (int) $order->id]);

foreach ($purchases as $purchase) {
	$variant = $turbo->variants->getVariant((int) $purchase->variant_id);

	if (empty($variant) || (!$variant->infinity && $variant->stock < $purchase->amount)) {
		die("Shortage of products {$purchase->product_name} {$purchase->variant_name}");
	}
}

foreach ($purchases as $purchase) {
	$variant = $turbo->variants->getVariant((int) $purchase->variant_id);

	if (empty($variant) || (!$variant->infinity && $variant->stock < $purchase->amount)) {
		die("Shortage of products $purchase->product_name $purchase->variant_name");
	}
}

// Set status paid
$turbo->orders->updateOrder((int) $order->id, ['paid' => 1]);

// Write off products  
$turbo->orders->close((int) $order->id);
$turbo->notify->emailOrderUser((int) $order->id);
$turbo->notify->emailOrderAdmin((int) $order->id);

die("OK" . $orderId . "\n");
