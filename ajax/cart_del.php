<?php

session_start();

chdir('..');
require_once 'api/Turbo.php';

$turbo = new Turbo();

$variant = $turbo->request->get('variant', 'integer');
$turbo->cart->deleteItem($variant);

$cart = $turbo->cart->getCart();
$turbo->design->assign('cart', $cart);

$currencies = $turbo->money->getCurrencies(['enabled' => 1]);

if (isset($_SESSION['currency_id'])) {
	$currency = $turbo->money->getCurrency($_SESSION['currency_id']);
} else {
	$currency = reset($currencies);
}

$turbo->design->assign('currency', $currency);

$result = $turbo->design->fetch('cart_informer.tpl');

header('Content-type: application/json; charset=UTF-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

print json_encode($result);
