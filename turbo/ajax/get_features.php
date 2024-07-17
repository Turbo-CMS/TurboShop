<?php

session_start();

require_once '../../api/Turbo.php';

$turbo = new Turbo();

$categoryId = $turbo->request->get('category_id', 'integer');
$productId = $turbo->request->get('product_id', 'integer');

if (!empty($categoryId)) {
	$features = $turbo->features->getFeatures(['category_id' => $categoryId]);
} else {
	$features = $turbo->features->getFeatures();
}

if (!empty($productId)) {
	foreach ($turbo->features->getOptions(['product_id' => $productId]) as $o) {
		$options[$o->feature_id][] = $o;
	}
}

foreach ($features as $f) {
	if (isset($options[$f->id])) {
		$f->values = $options[$f->id];
	} else {
		$f->values = [['value' => '', 'id' => '']];
	}
}

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print json_encode($features);
