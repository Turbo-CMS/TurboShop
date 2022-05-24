<?php
session_start();
require_once('../api/Turbo.php');
$turbo = new Turbo();
$turbo->cart->add_item($turbo->request->get('variant', 'integer'), $turbo->request->get('amount', 'integer'));
$cart = $turbo->cart->get_cart();
$turbo->design->assign('cart', $cart);

$currencies = $turbo->money->get_currencies(array('enabled' => 1));
if (isset($_SESSION['currency_id']))
	$currency = $turbo->money->get_currency($_SESSION['currency_id']);
else
	$currency = reset($currencies);

$turbo->design->assign('currency',	$currency);

$language = $turbo->languages->languages(array('id' => $_SESSION['lang_id']));
$turbo->design->assign('language', $language);

$first_lang = reset($turbo->languages->languages());
$lang_link = '';
if ($first_lang !== $language->id)
	$lang_link = $language->label . '/';
$turbo->design->assign('lang_link', $lang_link);
$turbo->design->assign('lang', $turbo->translations);

$result = $turbo->design->fetch('cart_informer.tpl');
header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print json_encode($result);
