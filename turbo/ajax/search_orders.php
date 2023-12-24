<?php

session_start();

require_once '../../api/Turbo.php';

$turbo = new Turbo();

$limit = 100;

$keyword = $turbo->request->get('keyword', 'string');

if ($turbo->request->get('limit', 'integer')) {
	$limit = $turbo->request->get('limit', 'integer');
}

$orders = array_values($turbo->orders->getOrders(['keyword' => $keyword, 'limit' => $limit]));

header('Content-type: application/json; charset=UTF-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

print json_encode($orders);
