<?php
session_start();
chdir('..');
require_once('api/Turbo.php');
$turbo = new Turbo();

$product_id = $turbo->request->get('id', 'integer');

if ($product_id) {
	$product = $turbo->products->get_product($product_id);

	if (!empty($product)) {
		if (!isset($_SESSION['rating_ids'])) $_SESSION['rating_ids'] = array();

		if (!in_array($product_id, $_SESSION['rating_ids'])) {

			$_SESSION['rating_ids'][] = $product_id;

			$rating = $turbo->request->get('rating', 'integer');

			$votes = $product->votes + 1;
			$rate = ($product->rating * $product->votes + $rating) / ($product->votes + 1);

			$turbo->products->update_product($product_id, array('votes' => $votes, 'rating' => $rate));

			echo $rate;
		} else echo -1;
	} else echo 0;
} else echo 0;
