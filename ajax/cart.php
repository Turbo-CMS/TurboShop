<?php

session_start();
require_once '../api/Turbo.php';

$turbo = new Turbo();

$turbo->cart->addItem(
    $turbo->request->get('variant', 'integer'),
    $turbo->request->get('amount', 'integer')
);

$cart = $turbo->cart->getCart();
$turbo->design->assign('cart', $cart);
$currencies = $turbo->money->getCurrencies(['enabled' => 1]);

if (isset($_SESSION['currency_id'])) {
    $currency = $turbo->money->getCurrency($_SESSION['currency_id']);
} else {
    $currency = reset($currencies);
}

$turbo->design->assign('currency', $currency);
$language = $turbo->languages->languages(['id' => $_SESSION['lang_id']]);
$turbo->design->assign('language', $language);
$firstLang = reset($turbo->languages->languages());
$langLink = '';

if ($firstLang !== $language->id) {
    $langLink = $language->label . '/';
}

$turbo->design->assign('lang_link', $langLink);
$turbo->design->assign('lang', $turbo->translations);

$result = $turbo->design->fetch('cart_informer.tpl');

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print json_encode($result);
