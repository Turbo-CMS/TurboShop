<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com/
 *
 * This class uses the template compare.tpl
 *
 */

require_once('View.php');

class CompareView extends View
{
	public $max_products = 4;

	/**
	 *
	 * Constructor
	 *
	 */
	public function fetch()
	{

		if ($this->request->get('product_url', 'string')) {
			$_SESSION['compared_products'][$this->request->get('product_url', 'string')] = $this->request->get('product_url', 'string');
			header('location: ' . $this->config->root_url . '/' . $this->lang_link . 'compare/');
		}
		if (isset($_SESSION['compared_products'])) {
			if (count($_SESSION['compared_products']) > $this->max_products)
				array_shift($_SESSION['compared_products']);
		}
		if ($this->request->get('remove_product_url', 'string')) {
			if ($this->request->get('remove_product_url', 'string') == 'all')
				unset($_SESSION['compared_products']);
			else
				unset($_SESSION['compared_products'][$this->request->get('remove_product_url', 'string')]);

			header('location: ' . $this->config->root_url . '/' . $this->lang_link . 'compare/');
		}

		/**
		 *
		 * Display individual product
		 *
		 */

		if (isset($_SESSION['compared_products'])) {
			// Select products from the database
			foreach ($_SESSION['compared_products'] as $product_url) {
				$products[] =  $this->products->get_product((string)$product_url);
			}
		}

		if (isset($products)) {
			foreach ($products as $k => $product) {
				@$product->images = $this->products->get_images(array('product_id' => $product->id));
				$product->image = &$product->images[0];

				@$cats = $this->categories->get_categories(array('product_id' => $product->id));
				$product->cats = $cats;

				@$variants = $this->variants->get_variants(array('product_id' => $product->id, 'in_stock' => true));
				// Discount
				$discount = 0;
				if (isset($_SESSION['user_id']) && $user = $this->users->get_user(intval($_SESSION['user_id'])))
					$discount = $user->discount;

				$product->variants = $variants;

				// Default option
				if (($v_id = $this->request->get('variant', 'integer')) > 0 && isset($variants[$v_id]))
					$product->variant = $variants[$v_id];
				else
					$product->variant = reset($variants);

				if ($product_values = $this->features->get_product_options(array('product_id' => $product->id))) {
					foreach ($product_values as $pv) {
						if (!isset($product->features[$pv->feature_id])) {
							$product->features[$pv->feature_id] = $pv;
						}
						$product->features[$pv->feature_id]->values[] = $pv;
					}
				}

				if (!empty($product->features)) {
					foreach ($product->features as $k => $feature) {
						$_SESSION['compare_features'][$feature->feature_id]	= $feature->feature_id;
					}
				}
			}
		}
		if (isset($_SESSION['compare_features'])) {
			// Select products from the database
			foreach ($_SESSION['compare_features'] as $feature_id) {
				$compare_features[] =  $this->features->get_compare($feature_id);
			}
			$this->design->assign('compare_features', $compare_features);
		}
		unset($_SESSION['compare_features']);

		// And pass it to the template
		if (isset($products)) {
			$this->design->assign('products', $products);
		}

		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);
		}

		$auto_meta = new StdClass;

		$auto_meta->title       = $this->seo->page_meta_title       ? $this->seo->page_meta_title       : '';
		$auto_meta->keywords    = $this->seo->page_meta_keywords    ? $this->seo->page_meta_keywords    : '';
		$auto_meta->description = $this->seo->page_meta_description ? $this->seo->page_meta_description : '';

		$auto_meta_parts = array(
			'{page}' => ($this->page ? $this->page->header : ''),
			'{site_url}' => ($this->seo->am_url ? $this->seo->am_url : ''),
			'{site_name}' => ($this->seo->am_name ? $this->seo->am_name : ''),
			'{site_phone}' => ($this->seo->am_phone ? $this->seo->am_phone : ''),
			'{site_email}' => ($this->seo->am_email ? $this->seo->am_email : ''),
		);

		$auto_meta->title = strtr($auto_meta->title, $auto_meta_parts);
		$auto_meta->keywords = strtr($auto_meta->keywords, $auto_meta_parts);
		$auto_meta->description = strtr($auto_meta->description, $auto_meta_parts);

		$auto_meta->title = preg_replace("/\{.*\}/", '', $auto_meta->title);
		$auto_meta->keywords = preg_replace("/\{.*\}/", '', $auto_meta->keywords);
		$auto_meta->description = preg_replace("/\{.*\}/", '', $auto_meta->description);

		$this->design->assign('auto_meta', $auto_meta);

		return $this->design->fetch('compare.tpl');
	}
}
