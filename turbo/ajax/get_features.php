<?php
session_start();
require_once('../../api/Turbo.php');
$turbo = new Turbo();

$category_id = $turbo->request->get('category_id', 'integer');
$product_id = $turbo->request->get('product_id', 'integer');

if (!empty($category_id))
	$features = $turbo->features->get_features(array('category_id' => $category_id));
else
	$features = $turbo->features->get_features();

$options = array();
if (!empty($product_id)) {
	$opts = $turbo->features->get_product_options($product_id);
	$temp_options = array();
	foreach ($opts as $option) {
		if (empty($temp_options[$option->feature_id]))
			$temp_options[$option->feature_id] = new stdClass;
		$temp_options[$option->feature_id]->feature_id = $option->feature_id;
		$temp_options[$option->feature_id]->product_id = $option->product_id;
		$temp_options[$option->feature_id]->name = $option->name;
		$temp_options[$option->feature_id]->value[] = $option->value;
	}
	$opts = $temp_options;
	foreach ($opts as $opt)
		$options[$opt->feature_id] = $opt;
}

foreach ($features as &$f) {
	if (isset($options[$f->id]))
		$f->value = $options[$f->id]->value;
	else
		$f->value = '';
	if (isset($options[$f->id]) && isset($options[$f->id]->translit))
		$f->translit = $options[$f->id]->translit;
	else
		$f->translit = '';
}

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print json_encode($features);
