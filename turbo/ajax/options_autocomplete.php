<?php

session_start();

require_once '../../api/Turbo.php';

$turbo = new Turbo();

$limit = 100;

$langId  = $turbo->languages->langId();
$px = ($langId ? 'l' : '0');
$langSql = $turbo->languages->getQuery(['object' => 'option', 'px' => 'o']);

$keyword = $turbo->request->get('query', 'string');
$featureId = $turbo->request->get('feature_id', 'string');
$sk = $turbo->db->escape($keyword);

$turbo->db->query(
    "SELECT DISTINCT o.id, $px.value 
    FROM __options o 
        $langSql->join
    WHERE $px.value LIKE '%$sk%' AND $px.feature_id=? 
    ORDER BY o.value LIMIT ?",
    $featureId,
    $limit
);

$options = $turbo->db->results();

$suggestions = [];

foreach ($options as $option) {
    $suggestion = new StdClass();
    $suggestion->value = $option->value;
    $suggestion->id = $option->id;
    $suggestion->data = $option;
    $suggestions[] = $suggestion;
}

$res = new StdClass();
$res->query = $keyword;
$res->suggestions = $suggestions;

header('Content-type: application/json; charset=UTF-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

print json_encode($res);
