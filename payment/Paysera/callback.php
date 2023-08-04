<?php

// Working in the root directory
require_once 'WebToPay.php';

chdir('../../');
require_once 'api/Turbo.php';

$turbo = new Turbo();
$orderId = $_GET['order_id'];

////////////////////////////////////////////////
// Select an order from the database
////////////////////////////////////////////////
$order = $turbo->orders->getOrder((int) $orderId);

if (empty($order)) {
	die('Paid order not found');
}

// You can't pay for an order that has already been paid.  
if ($order->paid) {
	die('This order has already been paid');
}

////////////////////////////////////////////////
// Select the appropriate payment method from the database
////////////////////////////////////////////////
$method = $turbo->payment->getPaymentMethod((int) $order->payment_method_id);

if (empty($method)) {
	die("Unknown payment method");
}

$settings = unserialize($method->settings);

$response = WebToPay::checkResponse($_GET, [
	'projectid' => $settings['paysera_project_id'],
	'sign_password' => $settings['paysera_password']
]);

if ($response['type'] !== 'macro') {
	die('Only macro payment callbacks are accepted');
}

$testMode = $response['test'];
$orderId = $response['orderid'];
$amount = $response['amount'];
$currency = $response['currency'];

////////////////////////////////////
// Checking the payment amount
////////////////////////////////////

// The amount of the order in our store
$orderAmount = $turbo->money->convert($order->total_price, $method->currency_id, false);

// Must be equal to the transferred amount
if (round($orderAmount * 100) != $amount || $amount <= 0) {
	die("Invalid payment amount");
}

// Let's write down
if (!$pre_request) {
	// Set status paid
	$turbo->orders->updateOrder((int) $order->id, ['paid' => 1]);

	// Write off goods  
	$turbo->orders->close((int) $order->id);
}

if (!$pre_request) {
	$turbo->notify->emailOrderUser((int) $order->id);
	$turbo->notify->emailOrderAdmin((int) $order->id);
}

die("OK");
