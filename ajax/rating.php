<?php

session_start();

chdir('..');
require_once 'api/Turbo.php';

$turbo = new Turbo();

$productId = $turbo->request->get('id', 'integer');

if ($productId) {
	$product = $turbo->products->getProduct($productId);

	if (!empty($product)) {
		if (!isset($_SESSION['rating_ids'])) {
			$_SESSION['rating_ids'] = [];
		}

		if (!in_array($productId, $_SESSION['rating_ids'])) {
			$_SESSION['rating_ids'][] = $productId;
			$rating = $turbo->request->get('rating', 'integer');
			$votes = $product->votes + 1;
			$rate = ($product->rating * $product->votes + $rating) / $votes;
			$turbo->products->updateProduct($productId, ['votes' => $votes, 'rating' => $rate,]);
			echo $rate;
		} else {
			echo -1;
		}
	} else {
		echo 0;
	}
} else {
	echo 0;
}
