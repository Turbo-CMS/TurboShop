<?php

if (!empty($_SERVER['HTTP_USER_AGENT'])) {
	session_name(md5($_SERVER['HTTP_USER_AGENT']));
}

session_start();
chdir('../../');
require_once 'api/Turbo.php';

$turbo = new Turbo();

if (!$turbo->managers->access('orders')) {
	exit();
}

$turbo->design->setTemplatesDir('turbo/design/html');
$turbo->design->setCompiledDir('turbo/design/compiled');

$result = [];

// Accepting labels to take action on
if ($turbo->request->isMethod("post")) {
	$orderId = $turbo->request->post("order_id", "integer");
	$state = $turbo->request->post("state", "string");
	$labelId = $turbo->request->post("label_id", "integer");

	if (empty($orderId) || empty($state)) {
		$result['success'] = false;
	} else {
		switch ($state) {
			case "add": {
					$turbo->orders->addOrderLabels($orderId, (array)$labelId);
					$result['success'] = true;
					break;
				}
			case "remove": {
					$turbo->orders->deleteOrderLabels($orderId, (array)$labelId);
					$result['success'] = true;
					break;
				}
		}
		$order = new stdClass();
		$order->labels = $turbo->orders->getOrderLabels((array)$orderId);
		$turbo->design->assign("order", $order);
		$result['data'] = $turbo->design->fetch("labels_ajax.tpl");
	}
} else {
	$result['success'] = false;
}

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print json_encode($result);
