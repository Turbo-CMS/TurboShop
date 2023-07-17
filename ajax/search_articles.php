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

$px = ($langId ? 'l' : 'a');
$langSql = $turbo->languages->getQuery(['object' => 'article']);
$keyword = $turbo->request->get('query', 'string');
$sanitizedKeyword = $turbo->db->escape($keyword);

$turbo->db->query(
	"SELECT 
        a.id,
        a.url,
        a.image, 
        $px.name, 
        $langSql->fields
    FROM __articles a
    $langSql->join
    WHERE ($px.name LIKE '%$sanitizedKeyword%' OR a.meta_keywords LIKE '%$sanitizedKeyword%') 
    AND visible=1 
    ORDER BY a.name 
    LIMIT ?",
	$limit
);

$articles = $turbo->db->results();

$suggestions = [];

foreach ($articles as $article) {
	$suggestion = new stdClass();

	if (!empty($article->image)) {
		$article->image = $turbo->design->resizeArticlesModifier($article->image, 35, 35);
	}

	$suggestion->value = $article->name;
	$suggestion->data = $article;
	$suggestion->lang = $langLink;
	$suggestions[] = $suggestion;
}

$responseObj = new stdClass();
$responseObj->query = $keyword;
$responseObj->suggestions = $suggestions;

header('Content-Type: application/json; charset=UTF-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

print json_encode($responseObj);
