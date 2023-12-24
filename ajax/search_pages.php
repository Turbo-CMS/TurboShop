<?php

session_start();

require_once '../api/Turbo.php';

$turbo = new Turbo();

$limit = 30;

$langId = $turbo->languages->langId();
$language = $turbo->languages->languages(['id' => $langId]);
$langLink = '';
$firstLang = $turbo->languages->languages();

if (!empty($firstLang)) {
    $firstLang = reset($firstLang);

    if ($firstLang->id !== $language->id) {
        $langLink = $language->label . '/';
    }
}

$px = ($langId ? 'l' : 'p');
$langSql = $turbo->languages->getQuery(['object' => 'page']);

$keyword = $turbo->request->get('query', 'string');
$sk = $turbo->db->escape($keyword);

$turbo->db->query(
    "SELECT 
        p.id,
        p.url,
        $px.name, 
        $langSql->fields
     FROM __pages p
         $langSql->join
     WHERE ($px.name LIKE '%$sk%' OR p.meta_keywords LIKE '%$sk%') 
     AND visible=1 
     ORDER BY p.name 
     LIMIT ?",
    $limit
);

$pages = $turbo->db->results();

$suggestions = [];

foreach ($pages as $page) {
    $suggestion = new stdClass();
    $suggestion->value = $page->name;
    $suggestion->data = $page;
    $suggestion->lang = $langLink;
    $suggestions[] = $suggestion;
}

$res = new stdClass();
$res->query = $keyword;
$res->suggestions = $suggestions;

header('Content-Type: application/json; charset=UTF-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

print json_encode($res);
