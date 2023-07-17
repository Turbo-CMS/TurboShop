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
$langSql = $turbo->languages->getQuery(['object' => 'product']);
$keyword = $turbo->request->get('query', 'string');
$sanitizedKeyword = $turbo->db->escape($keyword);

$turbo->db->query(
	"SELECT 
        p.id,
        p.url,
        $px.name, 
        i.filename AS image 
    FROM __products p 
    $langSql->join
    LEFT JOIN __images i ON i.product_id=p.id AND i.position=(SELECT MIN(position) FROM __images WHERE product_id=p.id LIMIT 1)
    WHERE 
        ($px.name LIKE '%$sanitizedKeyword%' OR $px.meta_keywords LIKE '%$sanitizedKeyword%' OR p.id IN (SELECT product_id FROM __variants WHERE sku LIKE '%$sanitizedKeyword%')) 
        AND visible=1 
    ORDER BY p.name 
    LIMIT ?",
	$limit
);

$products = $turbo->db->results();

$suggestions = [];

foreach ($products as $product) {
	$suggestion = new stdClass();

	if (!empty($product->image)) {
		$product->image = $turbo->design->resizeModifier($product->image, 35, 35);
	}

	$suggestion->value = $product->name;
	$suggestion->data = $product;
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
