<?php
session_start();
chdir('..');
require_once('api/Turbo.php');
$turbo = new Turbo();
$turbo->cart->delete_item($turbo->request->get('variant', 'integer'));
$cart = $turbo->cart->get_cart();
$turbo->design->assign('cart', $cart);

$currencies = $turbo->money->get_currencies(array('enabled' => 1));
if (isset($_SESSION['currency_id']))
	$currency = $turbo->money->get_currency($_SESSION['currency_id']);
else
	$currency = reset($currencies);

$turbo->design->assign('currency',	$currency);

$result = $turbo->design->fetch('cart_informer.tpl');
header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print json_encode($result);
