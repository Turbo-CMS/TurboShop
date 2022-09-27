<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 * This class uses the template products.tpl
 *
 */

require_once('View.php');

class ProductsView extends View
{
	/**
	 *
	 * SEO filter
	 *
	 */

	private $subdir = '';
	private $lang_label = '';
	private $catalog_type = '';
	private $is_wrong_params = 0;
	private $noindex_filter = false;

	public function __construct()
	{
		parent::__construct();
		$this->lang_label = $this->language->label;
		if (strlen($this->config->subfolder) > 1) {
			$this->subdir = "/?" . $this->config->subfolder;
		}

		// Determine current position 
		$uri = @parse_url($_SERVER["REQUEST_URI"]);
		preg_match("~$this->subdir(/?$this->lang_label)?/?(catalog|all-products|brands|featured|new|sale|hit)/?~", $uri['path'], $this->catalog_type);
		$this->catalog_type = $this->catalog_type[2];
		// Remove directory modifier
		$uri = preg_replace("~$this->subdir(/?$this->lang_label)?/?(catalog|all-products|brands|featured|new|sale|hit)/?~", '', $uri['path']);
		$uri_array = (empty($uri) ? array() : explode('/', $uri));
		if ($this->catalog_type == 'catalog' || $this->catalog_type == 'brands') {
			array_shift($uri_array);
		}
		foreach ($uri_array as $k => $v) {
			if (empty($v)) {
				continue;
			}
			if (!$k && $brand = $this->brands->get_brand((string)$v)) {
				$_GET['brand'] = $brand->url;
			} else {
				@list($param_name, $param_values) = explode('-', $v);
				if (
					!empty($this->page->url) && in_array($this->page->url, array('all-products', 'featured', 'hit', 'new', 'sale'))
					&& !in_array($param_name, array('page', 'sort'))
				) {
					$this->is_wrong_params = 1;
					break;
				}
				switch ($param_name) {
					case 'brand': {
							$_GET['b'] = array();
							foreach (explode('_', $param_values) as $bv) {
								if (($brand = $this->brands->get_brand((string)$bv)) && !in_array($brand->id, $_GET['b'])) {
									$_GET['b'][] = $brand->id;
									$this->noindex_filter = true;
								} else {
									$this->is_wrong_params = 1;
								}
							}
							break;
						}
					case 'page': {
							$_GET['page'] = $param_values;
							if ($param_values != 'all' && (!preg_match('~^[0-9]+$~', $param_values) || strpos($param_values, '0') === 0)) {
								$this->is_wrong_params = 1;
							}
							break;
						}
					case 'sort': {
							$_GET['sort'] = strval($param_values);
							if (!in_array($_GET['sort'], array('position', 'price', 'price_desc', 'name', 'name_desc', 'rating'))) {
								$this->is_wrong_params = 1;
							}
							break;
						}
					default: {
							if (($feature = $this->features->get_feature($param_name)) && !isset($_GET[$feature->id])) {
								$_GET[$feature->id] = explode('_', $param_values);
								$this->noindex_filter = true;
								// If there are no duplicate property values - ok, otherwise 404
								if (count($_GET[$feature->id]) == count(array_unique($_GET[$feature->id]))) {
									$option_translits = array();
									foreach ($this->features->get_options(array('feature_id' => $feature->id)) as $fo) {
										$option_translits[] = $fo->translit;
									}
									foreach ($_GET[$feature->id] as $param_value) {
										if (!in_array($param_value, $option_translits)) {
											$this->is_wrong_params = 1;
											break;
										}
									}
								} else {
									$this->is_wrong_params = 1;
								}
							} else {
								$this->is_wrong_params = 1;
							}
						}
				}
			}
		}

		$this->design->assign('noindex_filter', $this->noindex_filter);
		$this->design->smarty->registerPlugin('function', 'furl', array($this, 'filter_chpu_url'));
	}
	public function filter_chpu_url($params)
	{
		if (is_array(reset($params))) {
			$params = reset($params);
		}

		$result_array = array('brand' => array(), 'features' => array(), 'sort' => null, 'page' => null);
		// Determine what we already have in the string
		$uri = @parse_url($_SERVER["REQUEST_URI"]);
		$uri = preg_replace("~$this->subdir(/?$this->lang_label)?/?(catalog|all-products|brands|featured|new|sale|hit)/?~", '', $uri['path']);
		$uri_array = (empty($uri) ? array() : explode('/', $uri));
		if ($this->catalog_type == 'catalog' || $this->catalog_type == 'brands') {
			array_shift($uri_array);
		}
		foreach ($uri_array as $k => $v) {
			if ($k > 0 || !($brand = $this->brands->get_brand((string)$v))) {
				list($param_name, $param_values) = explode('-', $v);
				switch ($param_name) {
					case 'brand': {
							$result_array['brand'] = explode('_', $param_values);
							break;
						}
					case 'sort': {
							$result_array['sort'] = strval($param_values);
							break;
						}
					case 'page': {
							$result_array['page'] = $param_values;
							break;
						}
					default: {
							$result_array['features'][$param_name] = explode('_', $param_values);
						}
				}
			}
		}
		// Determine the passed parameters for the link
		foreach ($params as $k => $v) {
			switch ($k) {
				case 'brand': {
						if (is_null($v)) {
							unset($result_array['brand']);
						} elseif (in_array($v, $result_array['brand'])) {
							unset($result_array['brand'][array_search($v, $result_array['brand'])]);
						} else {
							$result_array['brand'][] = $v;
						}
						break;
					}
				case 'sort':
					$result_array['sort'] = strval($v);
					break;
				case 'page':
					$result_array['page'] = $v;
					break;
				default:
					if (is_null($v)) {
						unset($result_array['features'][$k]);
					} elseif (!empty($result_array['features']) && in_array($k, array_keys($result_array['features'])) && in_array($v, $result_array['features'][$k])) {
						unset($result_array['features'][$k][array_search($v, $result_array['features'][$k])]);
					} else {
						$result_array['features'][$k][] = $v;
					}
					break;
			}
		}
		// Form a link 
		if (strlen($this->config->subfolder) > 1) {
			$result_string = '/' . $this->config->subfolder . $this->lang_link . $this->catalog_type;
		} else {
			$result_string = '/' . $this->lang_link . $this->catalog_type;
		}
		if (!empty($_GET['category'])) {
			$result_string .= '/' . $_GET['category'];
		}
		if (!empty($_GET['brand'])) {
			$result_string .= '/' . $_GET['brand'];
		}

		if (!empty($result_array['brand'])) {
			$result_string .= '/brand-' . implode('_', $this->filter_chpu_sort_brands($result_array['brand'])); // - sorted by brand
		}
		foreach ($result_array['features'] as $k => $v) {
			if (empty($result_array['features'][$k])) {
				unset($result_array['features'][$k]);
			}
		}
		if (!empty($result_array['features'])) {
			$result_string .= $this->filter_chpu_sort_features($result_array['features']);
		}
		if (!empty($result_array['sort'])) {
			$result_string .= '/sort-' . $result_array['sort'];
		}
		if ($result_array['page'] > 1 || $result_array['page'] == 'all') {
			$result_string .= '/page-' . $result_array['page'];
		}
		$keyword = $this->request->get('keyword');
		if (!empty($keyword)) {
			$result_string .= '?keyword=' . $keyword;
		}
		// give the generated link
		return $result_string;
	}
	private function filter_chpu_sort_brands($brands_urls = array())
	{
		if (empty($brands_urls)) {
			return false;
		}
		$this->db->query("SELECT url FROM __brands WHERE url in(?@) ORDER BY name", (array)$brands_urls);
		return $this->db->results('url');
	}
	private function filter_chpu_sort_features($features = array())
	{
		if (empty($features)) {
			return false;
		}
		$this->db->query("SELECT url FROM __features WHERE url in(?@) ORDER BY position", (array)array_keys($features));
		$result_string = '';
		foreach ($this->db->results('url') as $v) {
			if (in_array($v, array_keys($features))) {
				$result_string .= '/' . $v . '-' . implode('_', $features[$v]);
			}
		}
		return $result_string;
	}

	/**
	 *
	 * Displaying a list of products
	 *
	 */
	function fetch()
	{

		if ($this->is_wrong_params) {
			return false;
		}

		// GET Parameters
		$category_url = $this->request->get('category', 'string');
		$brand_url    = $this->request->get('brand', 'string');
		$mode    = $this->request->get('mode', 'string');

		$filter = array();
		$filter['visible'] = 1;

		if ($mode == 'featured') {
			$filter['featured'] = 1;
		}

		if ($mode == 'new') {
			$filter['is_new'] = 1;
		}

		if ($mode == 'hit') {
			$filter['is_hit'] = 1;
		}

		if ($mode == 'sale') {
			$filter['discounted'] = 1;
		}

		$current_min_price = $this->request->post('min_price');
		$current_max_price = $this->request->post('max_price');

		$rate_from = $this->request->post('rate_from');
		$rate_to = $this->request->post('rate_to');

		if (!isset($rate_from))
			$rate_from = 1;

		if (!isset($rate_to))
			$rate_to = 1;

		$filter['min_price'] = $current_min_price / $rate_from * $rate_to;
		$filter['max_price'] = $current_max_price / $rate_from * $rate_to;

		// If the brand is set, select it from the database
		if ($val = $this->request->get('b'))
			$filter['brand_id'] = $val;
		elseif (!empty($brand_url)) {
			$brand = $this->brands->get_brand((string)$brand_url);
			if (empty($brand))
				return false;
			$this->design->assign('brand', $brand);
			$filter['brand_id'] = $brand->id;
		}

		// Select the current category
		if (!empty($category_url)) {
			$category = $this->categories->get_category((string)$category_url);
			if (empty($category) || (!$category->visible && empty($_SESSION['admin'])))
				return false;
			$this->design->assign('category', $category);
			$filter['category_id'] = $category->children;
		}

		// If the keyword is set
		$keyword = $this->request->get('keyword');
		if (!empty($keyword)) {
			$this->design->assign('keyword', $keyword);
			$filter['keyword'] = $keyword;
		}

		// Sorting of goods, save in session so that the current sorting remains for the entire site 
		if ($sort = $this->request->get('sort', 'string'))
			$_SESSION['sort'] = $sort;
		if (!empty($_SESSION['sort']))
			$filter['sort'] = $_SESSION['sort'];
		else
			$filter['sort'] = 'position';
		$this->design->assign('sort', $filter['sort']);

		$price_products = array();
		$price_products_ids = array();
		foreach ($this->products->get_products($filter) as $p)
			$price_products[$p->id] = $p;
		if (!empty($price_products))
			$price_products_ids = array_keys($price_products);

		// Product properties
		if (!empty($category)) {
			$features = array();
			$filter['features'] = array();
			foreach ($this->features->get_features(array('category_id' => $category->id, 'in_filter' => 1)) as $feature) {
				$features[$feature->id] = $feature;
				if ($val = $this->request->get($feature->id))
					$filter['features'][$feature->id] = $val;
			}

			$options_filter['visible'] = 1;

			$features_ids = array_keys($features);
			if (!empty($features_ids))
				$options_filter['feature_id'] = $features_ids;
			$options_filter['category_id'] = $category->children;
			if (isset($filter['features']))
				$options_filter['features'] = $filter['features'];
			if (!empty($brand))
				$options_filter['brand_id'] = $brand->id;
			elseif (!empty($filter['brand_id']))
				$options_filter['brand_id'] = $filter['brand_id'];
			if (!empty($price_products_ids))
				$options_filter['product_id'] = $price_products_ids;

			$options = $this->features->get_options($options_filter);

			foreach ($options as $option) {
				if (isset($features[$option->feature_id]))
					$features[$option->feature_id]->options[] = $option;
			}

			foreach ($features as $i => &$feature) {
				if (empty($feature->options))
					unset($features[$i]);
			}

			$this->design->assign('features', $features);
		}

		// Pagination
		$items_per_page = $this->settings->products_num;
		// Current page in pagination
		$current_page = $this->request->get('page', 'integer');
		// If not set, then equal to 1
		$current_page = max(1, $current_page);
		$this->design->assign('current_page_num', $current_page);
		// Calculate the number of pages
		$products_count = $this->products->count_products($filter);

		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$items_per_page = $products_count;

		$pages_num = ceil($products_count / $items_per_page);
		$this->design->assign('total_pages_num', $pages_num);
		$this->design->assign('total_products_num', $products_count);

		$filter['page'] = $current_page;
		$filter['limit'] = $items_per_page;

		///////////////////////////////////////////////
		// Pagination END
		///////////////////////////////////////////////

		$discount = 0;
		if (isset($_SESSION['user_id']) && $user = $this->users->get_user(intval($_SESSION['user_id'])))
			$discount = $user->discount;

		// Products 
		$products = array();
		foreach ($this->products->get_products($filter) as $p)
			$products[$p->id] = $p;

		// If a product was searched and exactly one was found, redirect to it
		if (!empty($keyword) && $products_count == 1)
			header('Location: ' . $this->config->root_url . '/products/' . $p->url);

		if (!empty($products)) {
			$products_ids = array_keys($products);
			foreach ($products as &$product) {
				$product->variants = array();
				$product->images = array();
				$product->properties = array();
			}

			$variants = $this->variants->get_variants(array('product_id' => $products_ids, 'in_stock' => true));

			foreach ($variants as &$variant) {
				$products[$variant->product_id]->variants[] = $variant;
			}

			$images = $this->products->get_images(array('product_id' => $products_ids));
			foreach ($images as $image)
				$products[$image->product_id]->images[] = $image;

			foreach ($products as &$product) {
				if (isset($product->variants[0]))
					$product->variant = $product->variants[0];
				if (isset($product->images[0]))
					$product->image = $product->images[0];

				if (!empty($product->sale_to) && strtotime($product->sale_to) <= time()) {
					$product->sale_to = null;
					if (isset($product->variant) && $product->variant->compare_price) {
						$product->variant->price = $product->variant->compare_price;
						$product->variant->compare_price = 0;
						$v = new stdClass();
						$v->price = $product->variant->price;
						$v->compare_price = 0;
						$this->variants->update_variant($product->variant->id, $v);
					}
				}
			}

			$this->design->assign('products', $products);
		}
		
		// Select brands, we need them in the template	
		if (!empty($category)) {
			$brands = $this->brands->get_brands($filter);
			$category->brands = $brands;
		}

		// Filter by price
		unset($filter['min_price']);
		unset($filter['max_price']);
		unset($filter['limit']);
		foreach ($this->products->get_products($filter) as $p)
			$products_prices[$p->id] = $p;

		if (!empty($products_prices)) {
			$prices_products_ids = array_keys($products_prices);
			$prices_variants = $this->variants->get_variants(array('product_id' => $prices_products_ids));
			foreach ($prices_variants as &$prices_variant)
				$prices[] = $prices_variant->price;
		}

		$min_price = 0;
		$max_price = 0;
		if (!empty($prices)) {
			$min_price = min($prices);
			$max_price = max($prices);
		}

		if (!isset($current_min_price) && empty($current_min_price))
			$current_min_price = $min_price;
		if (!isset($current_max_price) && empty($current_max_price))
			$current_max_price = $max_price;

		$this->design->assign('minprice', $min_price);
		$this->design->assign('maxprice', $max_price);
		$this->design->assign('current_minprice', $current_min_price * $rate_to / $rate_from);
		$this->design->assign('current_maxprice', $current_max_price * $rate_to / $rate_from);

		// Set meta tags depending on the request
		$auto_meta = new StdClass;

		$auto_meta->title = "";
		$auto_meta->keywords = "";
		$auto_meta->description = "";

		$auto_meta_parts = @array(
			'{category}' => ($category ? $category->name : ''),
			'{brand}' => ($brand ? $brand->name : ''),
			'{page}' => ($this->page ? $this->page->header : ''),
			'{site_url}' => ($this->seo->am_url ? $this->seo->am_url : ''),
			'{site_name}' => ($this->seo->am_name ? $this->seo->am_name : ''),
			'{site_phone}' => ($this->seo->am_phone ? $this->seo->am_phone : ''),
			'{site_email}' => ($this->seo->am_email ? $this->seo->am_email : ''),
		);

		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);

			$LastModified_unix = strtotime($this->page->last_modified);

			$auto_meta->title       = $this->seo->page_meta_title       ? $this->seo->page_meta_title       : '';
			$auto_meta->keywords    = $this->seo->page_meta_keywords    ? $this->seo->page_meta_keywords    : '';
			$auto_meta->description = $this->seo->page_meta_description ? $this->seo->page_meta_description : '';
		} elseif (isset($category) && isset($brand)) {
			$this->design->assign('meta_title', $category->meta_title);
			$this->design->assign('meta_keywords', $category->meta_keywords);
			$this->design->assign('meta_description', $category->meta_description);

			$LastModified_unix = strtotime($category->last_modified);

			$auto_meta->title       = $this->seo->category_brand_meta_title       ? $this->seo->category_brand_meta_title       : '';
			$auto_meta->keywords    = $this->seo->category_brand_meta_keywords    ? $this->seo->category_brand_meta_keywords    : '';
			$auto_meta->description = $this->seo->category_brand_meta_description ? $this->seo->category_brand_meta_description : '';
		} elseif (isset($category)) {
			$this->design->assign('meta_title', $category->meta_title);
			$this->design->assign('meta_keywords', $category->meta_keywords);
			$this->design->assign('meta_description', $category->meta_description);

			$LastModified_unix = strtotime($category->last_modified);

			$auto_meta->title       = $this->seo->category_meta_title       ? $this->seo->category_meta_title       : '';
			$auto_meta->keywords    = $this->seo->category_meta_keywords    ? $this->seo->category_meta_keywords    : '';
			$auto_meta->description = $this->seo->category_meta_description ? $this->seo->category_meta_description : '';
		} elseif (isset($brand)) {
			$this->design->assign('meta_title', $brand->meta_title);
			$this->design->assign('meta_keywords', $brand->meta_keywords);
			$this->design->assign('meta_description', $brand->meta_description);

			$LastModified_unix = strtotime($brand->last_modified);

			$auto_meta->title       = $this->seo->brand_meta_title       ? $this->seo->brand_meta_title       : '';
			$auto_meta->keywords    = $this->seo->brand_meta_keywords    ? $this->seo->brand_meta_keywords    : '';
			$auto_meta->description = $this->seo->brand_meta_description ? $this->seo->brand_meta_description : '';
		} elseif (isset($keyword)) {
			$this->design->assign('meta_title', $keyword);
		}

		$auto_meta->title = strtr($auto_meta->title, $auto_meta_parts);
		$auto_meta->keywords = strtr($auto_meta->keywords, $auto_meta_parts);
		$auto_meta->description = strtr($auto_meta->description, $auto_meta_parts);

		$auto_meta->title = preg_replace("/\{.*\}/", '', $auto_meta->title);
		$auto_meta->keywords = preg_replace("/\{.*\}/", '', $auto_meta->keywords);
		$auto_meta->description = preg_replace("/\{.*\}/", '', $auto_meta->description);

		$this->design->assign('auto_meta', $auto_meta);

		// Last-Modified
		if (isset($LastModified_unix)) {
			$LastModified = gmdate("D, d M Y H:i:s \G\M\T", $LastModified_unix);
			$IfModifiedSince = false;
			if (isset($_ENV['HTTP_IF_MODIFIED_SINCE']))
				$IfModifiedSince = strtotime(substr($_ENV['HTTP_IF_MODIFIED_SINCE'], 5));
			if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE']))
				$IfModifiedSince = strtotime(substr($_SERVER['HTTP_IF_MODIFIED_SINCE'], 5));
			if ($IfModifiedSince && $IfModifiedSince >= $LastModified_unix) {
				header($_SERVER['SERVER_PROTOCOL'] . ' 304 Not Modified');
				exit;
			}
			header('Last-Modified: ' . $LastModified);
		}

		$this->body = $this->design->fetch('products.tpl');
		return $this->body;
	}
}
