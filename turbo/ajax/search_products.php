<?php

session_start();
require_once '../../api/Turbo.php';

$turbo = new Turbo();
$limit = 30;

$langId = $turbo->languages->langId();
$px = ($langId ? 'l' : 'p');
$langSql = $turbo->languages->getQuery(['object' => 'product', 'px' => 'p']);

$keyword = $turbo->request->get('query', 'string');
$keywords = explode(' ', $keyword);
$keywordSql = '';

foreach ($keywords as $kw) {
    $kw = $turbo->db->escape(trim($kw));
    $keywordSql .= $turbo->db->placehold("AND ($px.name LIKE '%$kw%' OR $px.meta_keywords LIKE '%$kw%' OR p.id IN (SELECT product_id FROM __variants WHERE sku LIKE '%$kw%')) ");
}

$query =
    "SELECT 
        p.id, 
        $px.name, 
        i.filename AS image 
    FROM __products p
        $langSql->join
        LEFT JOIN __images i ON i.product_id = p.id AND i.position = (
            SELECT MIN(position) 
            FROM __images 
            WHERE product_id = p.id 
            LIMIT 1
        )
    WHERE 
        1 
        $keywordSql 
    ORDER BY 
        $px.name 
    LIMIT ?
";

$turbo->db->query($query, $limit);

$products = $turbo->db->results();
$suggestions = [];

foreach ($products as $product) {
    if (!empty($product->image)) {
        $product->image = $turbo->design->resizeModifier($product->image, 35, 35);
    }

    $suggestion = new stdClass();
    $suggestion->value = $product->name;
    $suggestion->data = $product;
    $suggestions[] = $suggestion;
}

$response = new stdClass();
$response->query = $keyword;
$response->suggestions = $suggestions;

header('Content-Type: application/json; charset=UTF-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

echo json_encode($response);
