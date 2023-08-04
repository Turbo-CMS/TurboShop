<?php

// Working in the root directory
chdir('../../');
require_once 'api/Turbo.php';
$turbo = new Turbo();

// We select the necessary data from xml
$publicKey = $turbo->request->post('public_key');
$amount = $turbo->request->post('amount');
$currency = $turbo->request->post('currency');
$description = $turbo->request->post('description');
$liqpayOrderId = $turbo->request->post('order_id');
$orderId = (int) substr($liqpayOrderId, 0, strpos($liqpayOrderId, '-'));
$type = $turbo->request->post('type');
$signature = $turbo->request->post('signature');
$status = $turbo->request->post('status');
$transactionId = $turbo->request->post('transaction_id');
$senderPhone = $turbo->request->post('sender_phone');

if ($status !== 'success') {
	die("bad status");
}

if ($type !== 'buy') {
	die("bad type");
}

////////////////////////////////////////////////
// Select an order from the database
////////////////////////////////////////////////
$order = $turbo->orders->getOrder((int) $order_id);

if (empty($order)) {
	die('Paid order not found');
}

////////////////////////////////////////////////
// Select the appropriate payment method from the database
////////////////////////////////////////////////
$method = $turbo->payment->getPaymentMethod((int) $order->payment_method_id);

if (empty($method)) {
	die("Unknown payment method");
}

$settings = unserialize($method->settings);
$paymentCurrency = $turbo->money->getCurrency((int) $method->currency_id);

// Currency must match
if ($currency !== $paymentCurrency->code) {
	die("bad currency");
}

// Checking the control signature
$mysignature = base64_encode(sha1($settings['liqpay_private_key'] . $amount . $currency . $publicKey . $liqpayOrderId . $type . $description . $status . $transactionId . $senderPhone, 1));

if ($mysignature !== $signature) {
	die("bad sign" . $signature);
}

// You can't pay for an order that has already been paid. 
if ($order->paid) {
	die('order already paid');
}

if ($amount != round($turbo->money->convert($order->total_price, $method->currency_id, false), 2) || $amount <= 0) {
	die("incorrect price");
}

// Set status paid
$turbo->orders->updateOrder((int) $order->id, ['paid' => 1]);

// We will send an email notification
$turbo->notify->emailOrderUser((int) $order->id);
$turbo->notify->emailOrderAdmin((int) $order->id);

// Write off goods  
$turbo->orders->close((int) $order->id);

// Redirect the user to the order page
// header('Location: '.$turbo->config->root_url.'/order/'.$order->url);

exit();
