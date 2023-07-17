<?php

require_once 'View.php';

class WishlistView extends View
{
	public $maxVisitedProducts = 100;

	public function fetch()
	{
		$maxVisitedProducts = 100;
		$expire = time() + 60 * 60 * 24 * 365;

		if ($this->request->get('product_url', 'string')) {
			if (!empty($_COOKIE['wishlist_products'])) {
				$wishlistProducts = explode(',', $_COOKIE['wishlist_products']);

				if (($exists = array_search($this->request->get('product_url', 'string'), $wishlistProducts)) !== false) {
					unset($wishlistProducts[$exists]);
				}
			}

			$wishlistProducts[] = $this->request->get('product_url', 'string');
			$cookieVal = implode(',', array_slice($wishlistProducts, -$maxVisitedProducts, $maxVisitedProducts));
			setcookie("wishlist_products", $cookieVal, $expire, "/");

			header('location: ' . $this->config->root_url . '/' . $this->langLink . 'wishlist/');
		}

		if ($this->request->get('remove_product_url', 'string')) {
			if ($this->request->get('remove_product_url', 'string') == 'all') {
				setcookie("wishlist_products", "", $expire, "/");
				header('location: ' . $this->config->root_url . '/' . $this->langLink . 'wishlist/');
			} else {
				if (!empty($_COOKIE['wishlist_products'])) {
					$wishlistProducts = explode(',', $_COOKIE['wishlist_products']);

					if (($exists = array_search($this->request->get('remove_product_url', 'string'), $wishlistProducts)) !== false) {
						unset($wishlistProducts[$exists]);
					}
				}

				$cookieVal = implode(',', array_slice($wishlistProducts, -$maxVisitedProducts, $maxVisitedProducts));
				setcookie("wishlist_products", $cookieVal, $expire, "/");

				header('location: ' . $this->config->root_url . '/' . $this->langLink . 'wishlist/');
			}
		}

		if (!empty($_COOKIE['wishlist_products'])) {
			$wishlistProducts = explode(',', $_COOKIE['wishlist_products']);

			foreach ($wishlistProducts as $productUrl) {
				$pr = $this->products->getProduct((string) $productUrl);

				if (!empty($pr)) {
					$products[] = $pr;
				} elseif (($exists = array_search((string) $productUrl, $wishlistProducts)) !== false) {
					unset($wishlistProducts[$exists]);
				}
			}
		}

		if (isset($products) && !empty($products)) {
			foreach ($products as $k => $product) {

				$product->images = $this->products->getImages(['product_id' => $product->id]);
				$product->image = &$product->images[0];

				$cats = $this->categories->getCategories(['product_id' => $product->id]);
				$product->cats = $cats;

				$variants = $this->variants->getVariants(['product_id' => $product->id, 'in_stock' => true]);

				$discount = 0;

				if (isset($_SESSION['user_id']) && $user = $this->users->getUser((int) $_SESSION['user_id'])) {
					$discount = $user->discount;
				}

				$product->variants = $variants;

				if (($vId = $this->request->get('variant', 'integer')) > 0 && isset($variants[$vId])) {
					$product->variant = $variants[$vId];
				} else {
					$product->variant = reset($variants);
				}

				$product->commentsCount = $this->comments->countComments(['object_id' => $product->id, 'type' => 'product', 'approved' => 1]);

				$dataRelatedProducts = [];
				$relatedIds = $this->products->getRelatedProductIds([$product->id]);

				if (!empty($relatedIds)) {
					$relatedProducts = $this->products->getProducts(['id' => $relatedIds, 'visible' => 1]);

					if (!empty($relatedProducts)) {
						$relatedProductsImages = $this->products->getImages(['product_id' => array_keys($relatedProducts)]);

						foreach ($relatedProducts as $relatedProduct) {
							$relatedProduct->images = [];
							$relatedProduct->variants = [];

							foreach ($relatedProductsImages as $relatedProductImage) {
								if ($relatedProduct->id == $relatedProductImage->product_id) {
									$relatedProduct->images[] = $relatedProductImage;
								}
							}

							$relatedProductsVariants = $this->variants->getVariants(['product_id' => $relatedProduct->id]);

							foreach ($relatedProductsVariants as $relatedProductVariant) {
								$relatedProduct->variants[] = $relatedProductVariant;
							}

							if (isset($relatedProduct->variants[0])) {
								$relatedProduct->variant = $relatedProduct->variants[0];
							}

							if (isset($relatedProduct->images[0])) {
								$relatedProduct->image = $relatedProduct->images[0];
							}

							$dataRelatedProducts[] = $relatedProduct;
						}
					}
				}

				$product->relatedProducts = $dataRelatedProducts;
			}

			$this->design->assign('products', $products);
		} else {
			unset($_COOKIE['wishlist_products']);
			unset($wishlistProducts);
		}

		$this->design->assign('wishlist', true);

		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);
		}

		$autoMeta = new StdClass();

		$autoMeta->title = $this->seo->page_meta_title ?: '';
		$autoMeta->keywords = $this->seo->page_meta_keywords ?: '';
		$autoMeta->description = $this->seo->page_meta_description ?: '';

		$autoMetaParts = [
			'{page}' => $this->page ? $this->page->header : '',
			'{site_url}' => $this->seo->am_url ?: '',
			'{site_name}' => $this->seo->am_name ?: '',
			'{site_phone}' => $this->seo->am_phone ?: '',
			'{site_email}' => $this->seo->am_email ?: '',
		];

		$autoMeta->title = strtr($autoMeta->title, $autoMetaParts);
		$autoMeta->keywords = strtr($autoMeta->keywords, $autoMetaParts);
		$autoMeta->description = strtr($autoMeta->description, $autoMetaParts);

		$autoMeta->title = preg_replace('/\{.*\}/', '', $autoMeta->title);
		$autoMeta->keywords = preg_replace('/\{.*\}/', '', $autoMeta->keywords);
		$autoMeta->description = preg_replace('/\{.*\}/', '', $autoMeta->description);

		$this->design->assign('auto_meta', $autoMeta);

		return $this->design->fetch('wishlist.tpl');
	}
}
