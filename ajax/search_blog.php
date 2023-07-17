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

$px = ($langId ? 'l' : 'b');
$langSql = $turbo->languages->getQuery(['object' => 'blog']);

$keyword = $turbo->request->get('query', 'string');

$sanitizedKeyword = $turbo->db->escape($keyword);

$turbo->db->query(
    "SELECT
        b.id,
        b.url,
        b.image,
        $px.name,
        $langSql->fields
    FROM __blog b
        $langSql->join
    WHERE ($px.name LIKE '%$sanitizedKeyword%' OR b.meta_keywords LIKE '%$sanitizedKeyword%')
        AND visible = 1
    ORDER BY b.name
    LIMIT ?",
    $limit
);

$posts = $turbo->db->results();

$suggestions = [];

foreach ($posts as $post) {
	$suggestion = new stdClass();
	
    if (!empty($post->image)) {
		$post->image = $turbo->design->resizePostsModifier($post->image, 35, 35);
	}

	$suggestion->value = $post->name;
	$suggestion->data = $post;
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

// Output the JSON-encoded response
print json_encode($responseObj);
