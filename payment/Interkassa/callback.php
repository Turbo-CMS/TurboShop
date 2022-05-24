<?php

/**
 * Turbo CMS
 *
 * @copyright 	Turbo CMS
 * @link 		https://turbo-cms.com
 * @author 		Turbo CMS
 *
 * Interkassa calls this script during the payment process
 *
 */

// Working in the root directory
chdir ('../../');
require_once('api/Turbo.php');
$turbo = new Turbo();

////////////////////////////////////////////////
// Status check
////////////////////////////////////////////////
if($_POST['ik_payment_state'] !== 'success')
	die('bad status');

////////////////////////////////////////////////
// Select an order from the database
////////////////////////////////////////////////
$order = $turbo->orders->get_order(intval($_POST['ik_payment_id']));
if(empty($order))
	die('Paid order not found');
 
////////////////////////////////////////////////
// Select the appropriate payment method from the database
////////////////////////////////////////////////
$method = $turbo->payment->get_payment_method(intval($order->payment_method_id));
if(empty($method))
	die("Unknown payment method");
	
$settings = unserialize($method->settings);
$payment_currency = $turbo->money->get_currency(intval($method->currency_id));

////////////////////////////////////////////////
// Store id check
////////////////////////////////////////////////
if($settings['interkassa_shop_id'] !== $_POST['ik_shop_id'])
	die('bad shop id');

// Checking the control signature
$ik_shop_id = $_POST['ik_shop_id'];
$ik_payment_amount = $_POST['ik_payment_amount'];
$ik_payment_id = $_POST['ik_payment_id'];
$ik_payment_desc = $_POST['ik_payment_desc'];
$ik_paysystem_alias = $_POST['ik_paysystem_alias'];
$ik_baggage_fields = $_POST['ik_baggage_fields'];
$ik_payment_state = $_POST['ik_payment_state'];
$ik_trans_id = $_POST['ik_trans_id'];
$ik_currency_exch = $_POST['ik_currency_exch'];
$ik_fees_payer = $_POST['ik_fees_payer'];
$ik_sign_hash = $_POST['ik_sign_hash'];;

$secret_key = $settings['interkassa_secret_key'];
$ik_sign_hash_str = $ik_shop_id.':'.$ik_payment_amount.':'.$ik_payment_id.':'.$ik_paysystem_alias.':'.$ik_baggage_fields.':'.$ik_payment_state.':'.$ik_trans_id.':'.$ik_currency_exch.':'.$ik_fees_payer.':'.$secret_key;

if(strtoupper($ik_sign_hash) !== strtoupper(md5($ik_sign_hash_str)))
	die('bad sign');

// You can't pay for an order that has already been paid.  
if($order->paid)
	die('This order has already been paid.');

if($_POST['ik_payment_amount'] != round($turbo->money->convert($order->total_price, $method->currency_id, false), 2) || $_POST['ik_payment_amount']<=0)
	die("incorrect price");

// Set status paid
$turbo->orders->update_order(intval($order->id), array('paid'=>1));

// We will send an email notification
$turbo->notify->email_order_user(intval($order->id));
$turbo->notify->email_order_admin(intval($order->id));

// Write off goods  
$turbo->orders->close(intval($order->id));

exit();
