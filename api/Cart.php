<?php

require_once 'Turbo.php';

class Cart extends Turbo
{
	/**
	 * Get cart
	 */
	public function getCart()
	{
		$cart = new stdClass();
		$cart->purchases = [];
		$cart->total_price = 0;
		$cart->total_products = 0;
		$cart->coupon = null;
		$cart->discount = 0;
		$cart->coupon_discount = 0;
		$cart->total_weight = 0;

		if (!empty($_SESSION['shopping_cart'])) {
			$sessionItems = $_SESSION['shopping_cart'];
			$variants = $this->variants->getVariants(['id' => array_keys($sessionItems)]);

			if (!empty($variants)) {
				$items = [];
				$productsIds = [];

				foreach ($variants as $variant) {
					$item = new stdClass();
					$item->variant = $variant;
					$item->amount = $sessionItems[$variant->id];

					$items[$variant->id] = $item;

					$productsIds[] = $variant->product_id;
				}

				$products = [];

				foreach ($this->products->getProducts(['id' => $productsIds, 'limit' => count($productsIds)]) as $p) {
					$products[$p->id] = $p;
				}

				$images = $this->products->getImages(['product_id' => $productsIds]);

				foreach ($images as $image) {
					$products[$image->product_id]->images[$image->id] = $image;
				}

				foreach ($items as $variantId => $item) {
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
							$this->variants->updateVariant($purchase->variant->id, $v);
						}

						$cart->purchases[] = $purchase;
						$cart->total_price += $item->variant->price * $item->amount;
						$cart->total_weight += $item->variant->weight * $item->amount;
						$cart->total_products += $item->amount;
					}
				}

				$cart->discount = 0;

				if (isset($_SESSION['user_id']) && $user = $this->users->getUser((int) $_SESSION['user_id'])) {
					$cart->discount = $user->discount;
				}

				$cart->total_price *= (100 - $cart->discount) / 100;

				if (isset($_SESSION['coupon_code'])) {
					$cart->coupon = $this->coupons->getCoupon($_SESSION['coupon_code']);

					if ($cart->coupon && $cart->coupon->valid && $cart->total_price >= $cart->coupon->min_order_price) {
						if ($cart->coupon->type == 'absolute') {
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

	/**
	 * Add item
	 */
	public function addItem($variantId, $amount = 1)
	{
		$amount = max(1, $amount);

		if (isset($_SESSION['shopping_cart'][$variantId])) {
			$amount = max(1, $amount + $_SESSION['shopping_cart'][$variantId]);
		}

		$variant = $this->variants->getVariant($variantId);

		if (!empty($variant) && ($variant->stock > 0)) {
			$amount = min($amount, $variant->stock);
			$_SESSION['shopping_cart'][$variantId] = (int) $amount;
		}
	}

	/**
	 * Update item
	 */
	public function updateItem($variantId, $amount = 1)
	{
		$amount = max(1, $amount);
		$variant = $this->variants->getVariant($variantId);

		if (!empty($variant) && $variant->stock > 0) {
			$amount = min($amount, $variant->stock);
			$_SESSION['shopping_cart'][$variantId] = (int) $amount;
		}
	}

	/**
	 * Delete item
	 */
	public function deleteItem($variantId)
	{
		unset($_SESSION['shopping_cart'][$variantId]);
	}

	/**
	 * Empty cart
	 */
	public function emptyCart()
	{
		unset($_SESSION['shopping_cart']);
		unset($_SESSION['coupon_code']);
	}

	/**
	 * Applies coupon 
	 */
	public function applyCoupon($couponCode)
	{
		$coupon = $this->coupons->getCoupon((string)$couponCode);

		if ($coupon && $coupon->valid) {
			$_SESSION['coupon_code'] = $coupon->code;
		} else {
			unset($_SESSION['coupon_code']);
		}
	}
}
