<?php

session_start();

require_once '../api/Turbo.php';

$turbo = new Turbo();

$email = $turbo->request->post('email');
$pregEmail = "/^[_\.a-z0-9-]{1,20}@(([a-z0-9-]+\.)+(com|net|org|mil|edu|gov|arpa|info|biz|inc|name|[a-z]{2})|[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})$/is";

$subscribe = new StdClass;

if (empty($email)) {
	$condition = 'empty_email';
} elseif (!preg_match($pregEmail, $email)) {
	$condition = 'wrong_email';
	$subscribe->email = $email;
} elseif ($subscribe = $turbo->subscribes->getSubscribe($email)) {
	$condition = 'email_exists';
} elseif ($subscribe_id = $turbo->subscribes->addSubscribe(array('email' => $email))) {
	$condition = 'success';
	$subscribe = $turbo->subscribes->getSubscribe(intval($email));
}

$turbo->design->assign('condition', $condition);
$turbo->design->assign('subscribe', $subscribe);

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
	'message' => $turbo->design->fetch('modals/subscribe_answer.tpl'),
	'condition' => $condition
];

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print json_encode($result);
