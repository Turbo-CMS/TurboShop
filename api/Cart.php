<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Cart extends Turbo
{
	/*
	*
	* The function returns a cart
	*
	*/
	public function get_cart()
	{
		$cart = new stdClass();
		$cart->purchases = array();
		$cart->total_price = 0;
		$cart->total_products = 0;
		$cart->coupon = null;
		$cart->discount = 0;
		$cart->coupon_discount = 0;
		$cart->total_weight = 0;

		// We take the list variant_id=>amount from the session
		if (!empty($_SESSION['shopping_cart'])) {
			$session_items = $_SESSION['shopping_cart'];

			$variants = $this->variants->get_variants(array('id' => array_keys($session_items)));
			if (!empty($variants)) {

				foreach ($variants as $variant) {
					$items[$variant->id] = new stdClass();
					$items[$variant->id]->variant = $variant;
					$items[$variant->id]->amount = $session_items[$variant->id];
					$products_ids[] = $variant->product_id;
				}

				$products = array();
				foreach ($this->products->get_products(array('id' => $products_ids, 'limit' => count($products_ids))) as $p)
					$products[$p->id] = $p;

				$images = $this->products->get_images(array('product_id' => $products_ids));
				foreach ($images as $image)
					$products[$image->product_id]->images[$image->id] = $image;


				foreach ($items as $variant_id => $item) {
					$purchase = null;
					if (!empty($products[$item->variant->product_id])) {
						$purchase = new stdClass();
						$purchase->product = $products[$item->variant->product_id];
						$purchase->variant = $item->variant;
						$purchase->amount = $item->amount;

						if (!empty($purchase->product->sale_to) && isset($purchase->variant) && strtotime($purchase->product->sale_to) <= time() && $purchase->variant->compare_price) {
							$purchase->variant->price = $purchase->variant->compare_price;
							$purchase->variant->compare_price = 0;
							$v = new stdClass();
							$v->price = $purchase->variant->price;
							$v->compare_price = 0;
							$this->variants->update_variant($purchase->variant->id, $v);
						}

						$cart->purchases[] = $purchase;
						$cart->total_price += $item->variant->price * $item->amount;
						$cart->total_weight += $item->variant->weight * $item->amount;
						$cart->total_products += $item->amount;
					}
				}

				// Custom discount
				$cart->discount = 0;
				if (isset($_SESSION['user_id']) && $user = $this->users->get_user(intval($_SESSION['user_id'])))
					$cart->discount = $user->discount;

				$cart->total_price *= (100 - $cart->discount) / 100;

				// Coupon discount
				if (isset($_SESSION['coupon_code'])) {
					$cart->coupon = $this->coupons->get_coupon($_SESSION['coupon_code']);
					if ($cart->coupon && $cart->coupon->valid && $cart->total_price >= $cart->coupon->min_order_price) {
						if ($cart->coupon->type == 'absolute') {
							// Absolute discount no more than the amount of the order
							$cart->coupon_discount = $cart->total_price > $cart->coupon->value ? $cart->coupon->value : $cart->total_price;
							$cart->total_price = max(0, $cart->total_price - $cart->coupon->value);
						} else {
							$cart->coupon_discount = $cart->total_price * ($cart->coupon->value) / 100;
							$cart->total_price = $cart->total_price - $cart->coupon_discount;
						}
					} else {
						unset($_SESSION['coupon_code']);
					}
				}
			}
		}

		return $cart;
	}

	/*
	*
	* Adding a product variant to the cart
	*
	*/
	public function add_item($variant_id, $amount = 1)
	{
		$amount = max(1, $amount);

		if (isset($_SESSION['shopping_cart'][$variant_id]))
			$amount = max(1, $amount + $_SESSION['shopping_cart'][$variant_id]);

		// We will select a product from the database, at the same time making sure of its existence
		$variant = $this->variants->get_variant($variant_id);

		// If the product exists, add it to the cart 
		if (!empty($variant) && ($variant->stock > 0)) {
			// We will not give more than in stock
			$amount = min($amount, $variant->stock);

			$_SESSION['shopping_cart'][$variant_id] = intval($amount);
		}
	}

	/*
	*
	* Product Quantity Update
	*
	*/
	public function update_item($variant_id, $amount = 1)
	{
		$amount = max(1, $amount);

		// We will select a product from the database, at the same time making sure of its existence
		$variant = $this->variants->get_variant($variant_id);

		// If the product exists, add it to the cart
		if (!empty($variant) && $variant->stock > 0) {
			// We will not give more than in stock
			$amount = min($amount, $variant->stock);

			$_SESSION['shopping_cart'][$variant_id] = intval($amount);
		}
	}

	/*
	*
	* Removing an item from the cart
	*
	*/
	public function delete_item($variant_id)
	{
		unset($_SESSION['shopping_cart'][$variant_id]);
	}

	/*
	*
	* Emptying the trash
	*
	*/
	public function empty_cart()
	{
		unset($_SESSION['shopping_cart']);
		unset($_SESSION['coupon_code']);
	}

	/*
	*
	* Apply Coupon
	*
	*/
	public function apply_coupon($coupon_code)
	{
		$coupon = $this->coupons->get_coupon((string)$coupon_code);
		if ($coupon && $coupon->valid) {
			$_SESSION['coupon_code'] = $coupon->code;
		} else {
			unset($_SESSION['coupon_code']);
		}
	}
}
