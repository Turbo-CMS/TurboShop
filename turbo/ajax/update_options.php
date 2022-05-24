<?php
session_start();
require_once('../../api/Turbo.php');
$turbo = new Turbo();

if (!$turbo->managers->access('features'))
	return false;

$options = new stdClass();
$options->feature_id = $turbo->request->post('feature_id', 'integer');

$options->value = $turbo->request->post('value');
$options->translit = $turbo->request->post('translit');
$options->translit = preg_replace("/[\s]+/ui", '', $options->translit);
$options->translit = strtolower(preg_replace("/[^0-9a-z]+/ui", '', $options->translit));
$old_value = $turbo->request->post('old_value');

// do not work with empty
if (!$options->value)
	exit();

$turbo->db->query("UPDATE __options SET ?% WHERE feature_id = ? AND value = ?", (array)$options, $options->feature_id, $old_value);

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print json_encode($options);
