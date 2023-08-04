<?php

// Working in the root directory
chdir('../../');
require_once 'api/Turbo.php';
$turbo = new Turbo();

////////////////////////////////////////////////
// Status check
////////////////////////////////////////////////
if ($_POST['ik_payment_state'] !== 'success') {
	die('bad status');
}

////////////////////////////////////////////////
// Select an order from the database
////////////////////////////////////////////////
$order = $turbo->orders->getOrder((int) $_POST['ik_payment_id']);

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

////////////////////////////////////////////////
// Store id check
////////////////////////////////////////////////
if ($settings['interkassa_shop_id'] !== $_POST['ik_shop_id']) {
	die('bad shop id');
}

// Checking the control signature
$ikShopId = $_POST['ik_shop_id'];
$ikPaymentAmount = $_POST['ik_payment_amount'];
$ikPaymentId = $_POST['ik_payment_id'];
$ikPaymentDesc = $_POST['ik_payment_desc'];
$ikPaysystemAlias = $_POST['ik_paysystem_alias'];
$ikBaggageFields = $_POST['ik_baggage_fields'];
$ikPaymentState = $_POST['ik_payment_state'];
$ikTransId = $_POST['ik_trans_id'];
$ikCurrencyExch = $_POST['ik_currency_exch'];
$ikFeesPayer = $_POST['ik_fees_payer'];
$ikSignHash = $_POST['ik_sign_hash'];

$secretKey = $settings['interkassa_secret_key'];
$ikSignHashStr = $ikShopId . ':' . $ikPaymentAmount . ':' . $ikPaymentId . ':' . $ikPaysystemAlias . ':' . $ikBaggageFields . ':' . $ikPaymentState . ':' . $ikTransId . ':' . $ikCurrencyExch . ':' . $ikFeesPayer . ':' . $secretKey;

if (strtoupper($ikSignHash) !== strtoupper(md5($ikSignHashStr))) {
	die('bad sign');
}

// You can't pay for an order that has already been paid.  
if ($order->paid) {
	die('This order has already been paid.');
}

if ($_POST['ik_payment_amount'] != round($turbo->money->convert($order->total_price, $method->currency_id, false), 2) || $_POST['ik_payment_amount'] <= 0) {
	die("incorrect price");
}

// Set status paid
$turbo->orders->updateOrder((int) $order->id, ['paid' => 1]);

// We will send an email notification
$turbo->notify->emailOrderUser((int) $order->id);
$turbo->notify->emailOrderAdmin((int) $order->id);

// Write off goods  
$turbo->orders->close((int) $order->id);

exit();
