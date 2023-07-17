<?php

session_start();
require_once '../../api/Turbo.php';

$turbo = new Turbo();

$limit = 100;

$keyword = $turbo->request->get('query', 'string');
$featureId = $turbo->request->get('feature_id', 'string');

$query = $turbo->db->placehold(
    'SELECT DISTINCT po.value 
    FROM __options po
    WHERE value LIKE "' . $turbo->db->escape($keyword) . '%" AND feature_id=? 
    ORDER BY po.value LIMIT ?',
    $featureId,
    $limit
);

$turbo->db->query($query);
$options = $turbo->db->results('value');

$res = new stdClass();

$res->query = $keyword;
$res->suggestions = $options;

header('Content-type: application/json; charset=UTF-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

echo json_encode($res);
