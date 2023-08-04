<?php

// Working in root dir
chdir('../../');

// Including turbo API
require_once 'api/Turbo.php';
$turbo = new Turbo();


// Get the order
$order = $turbo->orders->getOrder((int) $turbo->request->post('invoice'));

if (empty($order)) {
	die('Order not found');
}

// Get payment method from this order
$method = $turbo->payment->getPaymentMethod((int) $order->payment_method_id);

if (empty($method)) {
	die("Unknown payment method");
}

// Payment method settings
$settings = unserialize($method->settings);

if ($settings['mode'] == 'sandbox') {
	$paypalUrl = "https://www.sandbox.paypal.com/cgi-bin/webscr";
} else {
	$paypalUrl = "https://www.paypal.com/cgi-bin/webscr";
}

// Verify transaction
$postdata = '';

foreach ($_POST as $key => $value) {
	$postdata .= $key . '=' . urlencode($value) . '&';
}

$postdata .= 'cmd=_notify-validate';

$curl = curl_init($paypalUrl);
curl_setopt($curl, CURLOPT_HEADER, 0);
curl_setopt($curl, CURLOPT_POST, 1);
curl_setopt($curl, CURLOPT_POSTFIELDS, $postdata);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1);

$response = curl_exec($curl);
curl_close($curl);

if ($response != "VERIFIED") {
	die("Could not verify transaction");
}

// Check payment status
if ($_POST["payment_status"] != "Completed") {
	die('Incorrect status ' . $_POST["payment_status"] . $_POST["pending_reason"]);
}

// Verify merchant email
if ($turbo->request->post('receiver_email') != $settings['business']) {
	die("Incorrect merchant email");
}

// Verify transaction type
if ($turbo->request->post('txn_type') != 'cart') {
	die("Incorrect txn_type");
}

// Is order already paid
if ($order->paid) {
	die('Duplicate payment');
}

////////////////////////////////////
// Verify total payment amount
////////////////////////////////////
$totalPrice = 0;

// Get order purchases
$purchases = $turbo->orders->getPurchases(['order_id' => (int) $order->id]);

foreach ($purchases as $purchase) {
	$price = $turbo->money->convert($purchase->price, $method->currency_id, false);
	$price = round($price, 2);
	$totalPrice += $price * $purchase->amount;
}

// Substract the discount
if ($order->discount) {
	$totalPrice *= (100 - $order->discount) / 100;
	$totalPrice = round($totalPrice, 2);
}

// Adding delivery price
if ($order->delivery_id && !$order->separate_delivery && $order->delivery_price > 0) {
	$deliveryPrice = $turbo->money->convert($order->delivery_price, $paymentMethod->currency_id, false);
	$deliveryPrice = round($deliveryPrice, 2);
	$totalPrice += $deliveryPrice;
}

if ($totalPrice != $turbo->request->post('mc_gross')) {
	die("Incorrect total price (" . $totalPrice . "!=" . $turbo->request->post('mc_gross') . ")");
}

// Set order status paid
$turbo->orders->updateOrder((int) $order->id, ['paid' => 1]);

// Write off products
$turbo->orders->close((int) $order->id);
$turbo->notify->emailOrderUser((int) $order->id);
$turbo->notify->emailOrderAdmin((int) $order->id);

function logg($str)
{
	file_put_contents('payment/Paypal/log.txt', file_get_contents('payment/Paypal/log.txt') . "\r\n" . date("m.d.Y H:i:s") . ' ' . $str);
}
