<?php
 
// Working in the root directory
require_once('WebToPay.php');
chdir ('../../');
require_once('api/Turbo.php');

$turbo = new Turbo();
$order_id = $_GET['order_id'];
////////////////////////////////////////////////
// Select an order from the database
////////////////////////////////////////////////
$order = $turbo->orders->get_order(intval($order_id));
if(empty($order))
	die('Paid order not found');

// You can't pay for an order that has already been paid.  
if($order->paid)
	die('Этот заказ уже оплачен');

////////////////////////////////////////////////
// Select the appropriate payment method from the database
////////////////////////////////////////////////
$method = $turbo->payment->get_payment_method(intval($order->payment_method_id));
if(empty($method))
	die("Unknown payment method");
 
$settings = unserialize($method->settings);
       

$response = WebToPay::checkResponse($_GET, array(
		'projectid' => $settings['paysera_project_id'],
		'sign_password' => $settings['paysera_password']));

if ($response['type'] !== 'macro') {
	die('Only macro payment callbacks are accepted');
}

$test_mode = $response['test'];
$order_id = $response['orderid'];
$amount = $response['amount'];
$currency = $response['currency'];


////////////////////////////////////
// Checking the payment amount
////////////////////////////////////
       
// The amount of the order in our store
$order_amount = $turbo->money->convert($order->total_price, $method->currency_id, false);
       
// Must be equal to the transferred amount
if(round($order_amount*100) != $amount || $amount<=0)
	die("Invalid payment amount");
     
// Let's write down
if(!$pre_request)
{
	// Set status paid
	$turbo->orders->update_order(intval($order->id), array('paid'=>1));

	// Write off goods  
	$turbo->orders->close(intval($order->id));
}

if(!$pre_request)
{
	$turbo->notify->email_order_user(intval($order->id));
	$turbo->notify->email_order_admin(intval($order->id));
}

die("OK");
