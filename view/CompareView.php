<?php

require_once 'View.php';

class CompareView extends View
{
	public $maxProducts = 4;

	public function fetch()
	{
		// Add Product
		if ($this->request->get('product_url', 'string')) {
			$_SESSION['compared_products'][$this->request->get('product_url', 'string')] = $this->request->get('product_url', 'string');
			header('location: ' . $this->config->root_url . '/' . $this->langLink . 'compare/');
		}

		if (isset($_SESSION['compared_products'])) {
			if (count($_SESSION['compared_products']) > $this->maxProducts) {
				array_shift($_SESSION['compared_products']);
			}
		}

		// Remove Product
		if ($this->request->get('remove_product_url', 'string')) {
			if ($this->request->get('remove_product_url', 'string') == 'all') {
				unset($_SESSION['compared_products']);
			} else {
				unset($_SESSION['compared_products'][$this->request->get('remove_product_url', 'string')]);
			}

			header('location: ' . $this->config->root_url . '/' . $this->langLink . 'compare/');
		}

		// Product
		if (isset($_SESSION['compared_products'])) {
			$products = [];

			foreach ($_SESSION['compared_products'] as $product_url) {
				$products[] = $this->products->getProduct((string) $product_url);
			}
		}

		if (isset($products)) {
			foreach ($products as $k => $product) {

				if (isset($product)) {
					$productImages = $this->products->getImages(['product_id' => $product->id]);

					if ($productImages !== null) {
						$product->images = $productImages;
					}
				}

				$product->image = null;

				if (!empty($product->images)) {
					$product->image = &$product->images[0];
				}

				if ($product !== null && property_exists($product, 'id')) {
					$cats = $this->categories->getCategories(['product_id' => $product->id]);

					if ($cats !== false) {
						$product->cats = $cats;
					}
				}

				if ($product !== null && property_exists($product, 'id')) {
					$variants = $this->variants->getVariants(['product_id' => $product->id, 'in_stock' => true]);

					if ($variants !== null) {
						$product->variants = $variants;
					}
				}

				$discount = 0;

				if (isset($_SESSION['user_id']) && $user = $this->users->getUser((int) $_SESSION['user_id'])) {
					$discount = $user->discount;
				}

				if ($product !== null && isset($product->variants)) {

					if (($variantId = $this->request->get('variant', 'integer')) > 0 && isset($product->variants[$variantId])) {
						$product->variant = $product->variants[$variantId];
					} else {
						$product->variant = reset($product->variants);
					}
				}

				if (!is_null($product) && isset($product->id)) {
					if (!isset($product->features)) {
						$product->features = []; 
					}

					if ($productValues = $this->features->getProductOptions(['product_id' => $product->id])) {

						foreach ($productValues as $pv) {
							if (!isset($product->features[$pv->feature_id])) {
								$product->features[$pv->feature_id] = $pv;
							}

							$product->features[$pv->feature_id]->values[] = $pv;
						}
					}

					$this->db->query("SELECT SUM(rating)/COUNT(id) AS ratings FROM __comments WHERE id IN (SELECT id FROM __comments WHERE type='product' AND object_id = $product->id AND approved=1 AND admin=0 AND rating > 0)");
					$product->ratings = floatval($this->db->result('ratings'));
				}

				if (!empty($product->features)) {
					foreach ($product->features as $k => $feature) {
						$_SESSION['compare_features'][$feature->feature_id] = $feature->feature_id;
					}
				}
			}
		}

		// Features
		if (isset($_SESSION['compare_features'])) {
			$compareFeatures = [];

			foreach ($_SESSION['compare_features'] as $featureId) {
				$compareFeatures[] = $this->features->getCompare($featureId);
			}

			$this->design->assign('compare_features', $compareFeatures);
		}

		unset($_SESSION['compare_features']);

		// Design
		if (isset($products)) {
			$this->design->assign('products', $products);
		}

		// Meta Tags
		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);
		}

		$autoMeta = new stdClass();

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

		$autoMeta->title = preg_replace("/\{.*\}/", '', $autoMeta->title);
		$autoMeta->keywords = preg_replace("/\{.*\}/", '', $autoMeta->keywords);
		$autoMeta->description = preg_replace("/\{.*\}/", '', $autoMeta->description);

		$this->design->assign('auto_meta', $autoMeta);

		// Display
		return $this->design->fetch('compare.tpl');
	}
}
