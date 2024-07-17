<?php

session_start();

require_once '../api/Turbo.php';

$turbo = new Turbo();

$callback = new StdClass;
$callback->name = $turbo->request->post('name', 'string');
$callback->phone = $turbo->request->post('phone');
$callback->message = $turbo->request->post('message', 'string');
$captchaCode = $turbo->request->post('captcha_code', 'string');

if (empty($callback->name)) {
	$condition = 'empty_name';
} elseif (empty($callback->phone)) {
	$condition = 'empty_phone';
} elseif ($turbo->settings->captcha_callback && ($_SESSION['captcha_callback'] != $captchaCode || empty($captchaCode))) {
	$condition = 'captcha_error';
} else {
	$condition = 'success';

	$callbackId = $turbo->callbacks->addCallback($callback);

	$turbo->notify->emailCallbackAdmin($callbackId);

	if ($turbo->settings->tg_notify == 1) {
		$turbo->tgnotify->messageCallback($callbackId);
	}
}

$turbo->design->assign('condition', $condition);
$turbo->design->assign('callback', $callback);

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
	'message' => $turbo->design->fetch('modals/callback_answer.tpl'),
	'condition' => $condition
];

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print json_encode($result);
