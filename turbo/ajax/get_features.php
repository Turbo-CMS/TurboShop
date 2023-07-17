<?php

session_start();
require_once '../../api/Turbo.php';

$turbo = new Turbo();

$categoryId = $turbo->request->get('category_id', 'integer');
$productId = $turbo->request->get('product_id', 'integer');

if ($categoryId !== null) {
    $features = $turbo->features->getFeatures(['category_id' => $categoryId]);
} else {
    $features = $turbo->features->getFeatures();
}

$options = [];

if ($productId !== null) {
    $tempOptions = [];

    foreach ($turbo->features->getProductOptions($productId) as $option) {
        if (!isset($tempOptions[$option->feature_id])) {
            $tempOptions[$option->feature_id] = (object) [
                'feature_id' => $option->feature_id,
                'product_id' => $option->product_id,
                'name' => $option->name,
                'value' => [],
            ];
        }

        $tempOptions[$option->feature_id]->value[] = $option->value;
    }

    foreach ($tempOptions as $option) {
        $options[$option->feature_id] = $option;
    }
}

foreach ($features as &$feature) {
    if (isset($options[$feature->id])) {
        $feature->value = $options[$feature->id]->value;
        $feature->translit = $options[$feature->id]->translit ?? '';
    } else {
        $feature->value = '';
        $feature->translit = '';
    }
}

header('Content-type: application/json; charset=UTF-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

echo json_encode($features);
