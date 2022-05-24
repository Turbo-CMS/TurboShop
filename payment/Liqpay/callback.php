<?php

/**
 * Turbo CMS
 *
 * @copyright 	Turbo CMS
 * @link 		https://turbo-cms.com
 * @author 		Turbo CMS
 *
 * This script is called by Liqpay during the payment process
 *
 */

// Working in the root directory
chdir ('../../');
require_once('api/Turbo.php');
$turbo = new Turbo();

// We select the necessary data from xml
$public_key		 	= $turbo->request->post('public_key');
$amount				= $turbo->request->post('amount');
$currency			= $turbo->request->post('currency');
$description		= $turbo->request->post('description');
$liqpay_order_id	= $turbo->request->post('order_id');
$order_id			= intval(substr($liqpay_order_id, 0, strpos($liqpay_order_id, '-')));
$type				= $turbo->request->post('type');
$signature			= $turbo->request->post('signature');
$status				= $turbo->request->post('status');
$transaction_id		= $turbo->request->post('transaction_id');
$sender_phone		= $turbo->request->post('sender_phone');

if($status !== 'success')
	die("bad status");

if($type !== 'buy')
	die("bad type");

////////////////////////////////////////////////
// Select an order from the database
////////////////////////////////////////////////
$order = $turbo->orders->get_order(intval($order_id));
if(empty($order))
	die('Оплачиваемый заказ не найден');
 
////////////////////////////////////////////////
// Select the appropriate payment method from the database
////////////////////////////////////////////////
$method = $turbo->payment->get_payment_method(intval($order->payment_method_id));
if(empty($method))
	die("Unknown payment method");
	
$settings = unserialize($method->settings);
$payment_currency = $turbo->money->get_currency(intval($method->currency_id));

// Currency must match
if($currency !== $payment_currency->code)
	die("bad currency");

// Checking the control signature
$mysignature = base64_encode(sha1($settings['liqpay_private_key'].$amount.$currency.$public_key.$liqpay_order_id.$type.$description.$status.$transaction_id.$sender_phone, 1));
if($mysignature !== $signature)
	die("bad sign".$signature);

// You can't pay for an order that has already been paid. 
if($order->paid)
	die('order already paid');

if($amount != round($turbo->money->convert($order->total_price, $method->currency_id, false), 2) || $amount<=0)
	die("incorrect price");
	       
// Set status paid
$turbo->orders->update_order(intval($order->id), array('paid'=>1));

// We will send an email notification
$turbo->notify->email_order_user(intval($order->id));
$turbo->notify->email_order_admin(intval($order->id));

// Write off goods  
$turbo->orders->close(intval($order->id));

// Redirect the user to the order page
// header('Location: '.$turbo->config->root_url.'/order/'.$order->url);

exit();