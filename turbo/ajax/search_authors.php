<?php

session_start();

require_once '../../api/Turbo.php';

$turbo = new Turbo();

$limit = 30;

$langId  = $turbo->languages->langId();
$px = ($langId ? 'l' : 'a');
$langSql = $turbo->languages->getQuery(['object' => 'article', 'px' => 'a']);

$keyword = $turbo->request->get('query', 'string');
$sk = $turbo->db->escape($keyword);

$turbo->db->query(
	"SELECT DISTINCT $px.author 
	FROM __articles a 
		$langSql->join 
	WHERE $px.author LIKE '%$sk%' 
	ORDER BY a.author LIMIT ?",
	$limit
);

$authors = $turbo->db->results();

$suggestions = [];

foreach ($authors as $author) {
	$suggestion = new StdClass();
	$suggestion->value = $author->author;
	$suggestion->data = $author;
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
