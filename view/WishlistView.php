<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 * This class uses the template wishlist.tpl
 *
 */

require_once('View.php');

class WishlistView extends View
{
	public $max_visited_products = 100; // Maximum number of stored items in history

	/**
	 *
	 * Constructor
	 *
	 */
	public function fetch()
	{
		$max_visited_products = 100;
		$expire = time() + 60 * 60 * 24 * 365; // Life time - 365 days

		if ($this->request->get('product_url', 'string')) {

			if (!empty($_COOKIE['wishlist_products'])) {
				$wishlist_products = explode(',', $_COOKIE['wishlist_products']);
				// Delete the current product if it was
				if (($exists = array_search($this->request->get('product_url', 'string'), $wishlist_products)) !== false)
					unset($wishlist_products[$exists]);
			}
			// Add current product
			$wishlist_products[] = $this->request->get('product_url', 'string');
			$cookie_val = implode(',', array_slice($wishlist_products, -$max_visited_products, $max_visited_products));
			setcookie("wishlist_products", $cookie_val, $expire, "/");

			header('location: ' . $this->config->root_url . '/' . $this->lang_link . 'wishlist/');
		}

		if ($this->request->get('remove_product_url', 'string')) {
			if ($this->request->get('remove_product_url', 'string') == 'all') {
				setcookie("wishlist_products", "", $expire, "/");
				header('location: ' . $this->config->root_url . '/' . $this->lang_link . 'wishlist/');
			} else {
				if (!empty($_COOKIE['wishlist_products'])) {
					$wishlist_products = explode(',', $_COOKIE['wishlist_products']);
					// Delete the current product if it was
					if (($exists = array_search($this->request->get('remove_product_url', 'string'), $wishlist_products)) !== false)
						unset($wishlist_products[$exists]);
				}

				$cookie_val = implode(',', array_slice($wishlist_products, -$max_visited_products, $max_visited_products));
				setcookie("wishlist_products", $cookie_val, $expire, "/");

				header('location: ' . $this->config->root_url . '/' . $this->lang_link . 'wishlist/');
			}
		}

		/**
		 *
		 * Single product display
		 *
		 */
		if (!empty($_COOKIE['wishlist_products'])) {
			$wishlist_products = explode(',', $_COOKIE['wishlist_products']);
			// Select products from database
			foreach ($wishlist_products as $product_url) {
				$pr = $this->products->get_product((string)$product_url);
				if (!empty($pr))
					$products[] =  $pr;
				else
				if (($exists = array_search((string)$product_url, $wishlist_products)) !== false)
					unset($wishlist_products[$exists]);
			}
		}
		//print_r($products);
		if (isset($products) && !empty($products)) {
			foreach ($products as $k => $product) {
				$product->images = $this->products->get_images(array('product_id' => $product->id));
				$product->image = &$product->images[0];

				$cats = $this->categories->get_categories(array('product_id' => $product->id));
				$product->cats = $cats;

				$variants = $this->variants->get_variants(array('product_id' => $product->id, 'in_stock' => true));
				// Discount
				$discount = 0;
				if (isset($_SESSION['user_id']) && $user = $this->users->get_user(intval($_SESSION['user_id'])))
					$discount = $user->discount;
				$product->variants = $variants;

				// Default variant
				if (($v_id = $this->request->get('variant', 'integer')) > 0 && isset($variants[$v_id]))
					$product->variant = $variants[$v_id];
				else
					$product->variant = reset($variants);
			}
			// And pass it to the template
			$this->design->assign('products', $products);
		} else {
			unset($_COOKIE['wishlist_products']);
			unset($wishlist_products);
		}

		$this->design->assign('wishlist', true);

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

		return $this->design->fetch('wishlist.tpl');
	}
}
