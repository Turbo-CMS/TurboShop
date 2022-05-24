<?php
session_start();
require_once('../../api/Turbo.php');
$turbo = new Turbo();
$limit = 30;

if (!$turbo->managers->access('orders'))
	return false;

$lang_id  = $turbo->languages->lang_id();
$px = ($lang_id ? 'l' : 'p');
$lang_sql = $turbo->languages->get_query(array('object' => 'product', 'px' => 'p'));

$keyword = $turbo->request->get('query', 'string');
$keywords = explode(' ', $keyword);
$keyword_sql = '';
foreach ($keywords as $keyword) {
	$kw = $turbo->db->escape(trim($keyword));
	$keyword_sql .= $turbo->db->placehold("AND (
            $px.name LIKE '%$kw%' 
            OR $px.meta_keywords LIKE '%$kw%' 
            OR p.id in (SELECT product_id FROM __variants WHERE sku LIKE '%$kw%') 
        ) ");
}

$turbo->db->query("SELECT 
            p.id, 
            $px.name, 
            i.filename as image 
        FROM __products p
        $lang_sql->join
        LEFT JOIN __images i ON i.product_id=p.id AND i.position=(SELECT MIN(position) FROM __images WHERE product_id=p.id LIMIT 1)
		LEFT JOIN __variants pv ON pv.product_id=p.id
        WHERE 
            1 
            $keyword_sql 
        ORDER BY $px.name 
        LIMIT ?
    ", $limit);

foreach ($turbo->db->results() as $product)
	$products[$product->id] = $product;

$lang_sql = $turbo->languages->get_query(array('object' => 'variant', 'px' => 'pv'));
$variants = array();
if (!empty($products)) {
	$turbo->db->query(
		"SELECT 
				pv.id,  
				pv.name, 
				pv.color, 
				pv.sku, 
				pv.price, 
				IFNULL(pv.stock, ?) as stock, 
				(pv.stock IS NULL) as infinity,
				pv.product_id,
				$lang_sql->fields
			FROM __variants pv 
			$lang_sql->join 
			WHERE 
				pv.product_id in(?@) 
				AND (pv.stock IS NULL OR pv.stock>0)
				AND pv.price>0 
			ORDER BY pv.position",
		$turbo->settings->max_order_amount,
		array_keys($products)
	);
	$variants = $turbo->db->results();
}

foreach ($variants as $variant)
	if (isset($products[$variant->product_id]))
		$products[$variant->product_id]->variants[] = $variant;

$suggestions = array();
foreach ($products as $product) {
	if (!empty($product->variants)) {
		$suggestion = new stdClass;
		if (!empty($product->image))
			$product->image = $turbo->design->resize_modifier($product->image, 35, 35);
		$suggestion->value = $product->name;
		$suggestion->data = $product;
		$suggestions[] = $suggestion;
	}
}

$res = new stdClass;
$res->query = $keyword;
$res->suggestions = $suggestions;
header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print json_encode($res);
