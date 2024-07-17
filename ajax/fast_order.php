<?php

session_start();

require_once '../api/Turbo.php';

$turbo = new Turbo();

$order = new StdClass;
$order->name = $turbo->request->post('name', 'string');
$order->phone = $turbo->request->post('phone');
$order->address = $turbo->request->post('address', 'string');
$order->comment = $turbo->request->post('comment', 'string');
$captchaCode = $turbo->request->post('captcha_code', 'string');

if (empty($order->name)) {
	$condition = 'empty_name';
} elseif (empty($order->phone)) {
	$condition = 'empty_phone';
} elseif ($turbo->settings->captcha_fastorder && ($_SESSION['captcha_fastorder'] != $captchaCode || empty($captchaCode))) {
	$condition = 'captcha_error';
} else {
	$condition = 'success';

	$orderId = $turbo->orders->addOrder($order);
	$_SESSION['order_id'] = $orderId;

	$turbo->orders->addPurchase(['order_id' => $orderId, 'variant_id' => (int) $turbo->request->post('variant_id'), 'amount' => 1]);

	$order = $turbo->orders->getOrder($orderId);

	$turbo->notify->emailOrderUser($order->id);
	$turbo->notify->emailOrderAdmin($order->id);

	if ($turbo->settings->tg_notify == 1) {
		$turbo->tgnotify->message($order->id);
	}
}

$turbo->design->assign('condition', $condition);
$turbo->design->assign('order', $order);

$language = $turbo->languages->languages(['id' => $_SESSION['lang_id']]);
$turbo->design->assign('language', $language);

$firstLang = reset($turbo->languages->languages());
$langLink = '';

if ($firstLang !== $language->id) {
	$langLink = $language->label . '/';
}

$turbo->design->assign('lang_link', $langLink);
$turbo->design->assign('lang', $turbo->translations);

$result = [
	'message' => $turbo->design->fetch('modals/order_answer.tpl'),
	'condition' => $condition
];

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print json_encode($result);
