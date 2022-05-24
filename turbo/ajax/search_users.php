<?php
require_once('../../api/Turbo.php');
$turbo = new Turbo();
$limit = 100;

$keyword = $turbo->request->get('query', 'string');

$turbo->db->query('SELECT u.id, u.name, u.email FROM __users u WHERE u.name LIKE "%' . $turbo->db->escape($keyword) . '%" OR u.email LIKE "%' . $turbo->db->escape($keyword) . '%"ORDER BY u.name LIMIT ?', $limit);
$users = $turbo->db->results();

$suggestions = array();
foreach ($users as $user) {
	$suggestion = new stdClass();
	$suggestion->value = $user->name . " ($user->email)";
	$suggestion->data = $user;
	$suggestions[] = $suggestion;
}

$res = new stdClass;
$res->query = $keyword;
$res->suggestions = $suggestions;
header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print json_encode($res);
