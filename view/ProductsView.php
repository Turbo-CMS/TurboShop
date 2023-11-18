<?php

require_once 'View.php';

class ProductsView extends View
{
	private $subdir = '';
	private $langLabel = '';
	private $catalogType = '';
	private $isWrongParams = 0;
	private $noIndexFilter = false;

	/**
	 * SEO Filter
	 */
	public function __construct()
	{
		parent::__construct();

		if ($this->language) {
			$this->langLabel = $this->language->label;
		}

		if (strlen($this->config->subfolder) > 1) {
			$this->subdir = "/?" . $this->config->subfolder;
		}

		$uri = isset($_SERVER["REQUEST_URI"]) ? parse_url($_SERVER["REQUEST_URI"]) : null;
		preg_match("~$this->subdir(/?$this->langLabel)?/?(catalog|all-products|brands|featured|new|sale|hit)/?~", $uri['path'], $this->catalogType);
		$this->catalogType = $this->catalogType[2];
		$uri = preg_replace("~$this->subdir(/?$this->langLabel)?/?(catalog|all-products|brands|featured|new|sale|hit)/?~", '', $uri['path']);
		$uriArray = (empty($uri) ? [] : explode('/', $uri));

		if ($this->catalogType == 'catalog' || $this->catalogType == 'brands') {
			array_shift($uriArray);
		}

		foreach ($uriArray as $key => $value) {
			if (empty($value)) {
				continue;
			}

			if (!$key && $brand = $this->brands->getBrand((string) $value)) {
				$_GET['brand'] = $brand->url;
			} else {
				list($paramName, $paramValues) = explode('-', $value);

				if (!empty($this->page->url) && in_array($this->page->url, ['all-products', 'featured', 'hit', 'new', 'sale'], true) && !in_array($paramName, ['page', 'sort'], true)) {
					$this->isWrongParams = 1;
					break;
				}

				switch ($paramName) {
					case 'brand': {
							$_GET['b'] = array();
							foreach (explode('_', $paramValues) as $bv) {
								if (($brand = $this->brands->getBrand((string)$bv)) && !in_array($brand->id, $_GET['b'])) {
									$_GET['b'][] = $brand->id;
									$this->noIndexFilter = true;
								} else {
									$this->isWrongParams = 1;
								}
							}
							break;
						}
					case 'page': {
							$_GET['page'] = $paramValues;
							if ($paramValues != 'all' && (!preg_match('~^[0-9]+$~', $paramValues) || strpos($paramValues, '0') === 0)) {
								$this->isWrongParams = 1;
							}
							break;
						}
					case 'sort': {
							$_GET['sort'] = strval($paramValues);
							if (!in_array($_GET['sort'], ['position', 'price', 'price_desc', 'name', 'name_desc', 'rating'])) {
								$this->isWrongParams = 1;
							}
							break;
						}
					default: {
							if (($feature = $this->features->getFeature($paramName)) && !isset($_GET[$feature->id])) {
								$_GET[$feature->id] = explode('_', $paramValues);
								$this->noIndexFilter = true;
								if (count($_GET[$feature->id]) == count(array_unique($_GET[$feature->id]))) {
									$optionTranslits = [];
									foreach ($this->features->getOptions(['feature_id' => $feature->id]) as $fo) {
										$optionTranslits[] = $fo->translit;
									}
									foreach ($_GET[$feature->id] as $paramValue) {
										if (!in_array($paramValue, $optionTranslits, true)) {
											$this->isWrongParams = 1;
											break;
										}
									}
								} else {
									$this->isWrongParams = 1;
								}
							} else {
								$this->isWrongParams = 1;
							}
						}
				}
			}
		}

		$this->design->assign('noindex_filter', $this->noIndexFilter);
		$this->design->smarty->registerPlugin('function', 'furl', array($this, 'filterChpuUrl'));
	}

	/**
	 * Filter URL
	 */
	public function filterChpuUrl($params)
	{
		if (is_array(reset($params))) {
			$params = reset($params);
		}

		$resultArray = [
			'brand' => [],
			'features' => [],
			'sort' => null,
			'page' => null,
		];

		$uri = isset($_SERVER["REQUEST_URI"]) ? parse_url($_SERVER["REQUEST_URI"]) : null;
		$uri = preg_replace("~$this->subdir(/?$this->langLabel)?/?(catalog|all-products|brands|featured|new|sale|hit)/?~", '', $uri['path']);
		$uriArray = empty($uri) ? [] : explode('/', $uri);

		if ($this->catalogType == 'catalog' || $this->catalogType == 'brands') {
			array_shift($uriArray);
		}

		foreach ($uriArray as $key => $value) {
			if ($key > 0 || !($brand = $this->brands->getBrand((string) $value))) {
				list($paramName, $paramValues) = explode('-', $value);
				switch ($paramName) {
					case 'brand':
						$resultArray['brand'] = explode('_', $paramValues);
						break;
					case 'sort':
						$resultArray['sort'] = strval($paramValues);
						break;
					case 'page':
						$resultArray['page'] = $paramValues;
						break;
					default:
						$resultArray['features'][$paramName] = explode('_', $paramValues);
						break;
				}
			}
		}

		foreach ($params as $key => $value) {
			switch ($key) {
				case 'brand':
					if (is_null($value)) {
						unset($resultArray['brand']);
					} elseif (in_array($value, $resultArray['brand'])) {
						unset($resultArray['brand'][array_search($value, $resultArray['brand'])]);
					} else {
						$resultArray['brand'][] = $value;
					}
					break;
				case 'sort':
					$resultArray['sort'] = strval($value);
					break;
				case 'page':
					$resultArray['page'] = $value;
					break;
				default:
					if (is_null($value)) {
						unset($resultArray['features'][$key]);
					} elseif (!empty($resultArray['features']) && in_array($key, array_keys($resultArray['features'])) && in_array($value, $resultArray['features'][$key])) {
						unset($resultArray['features'][$key][array_search($value, $resultArray['features'][$key])]);
					} else {
						$resultArray['features'][$key][] = $value;
					}
					break;
			}
		}

		$resultString = strlen($this->config->subfolder) > 1 ? '/' . $this->config->subfolder . $this->langLink . $this->catalogType : '/' . $this->langLink . $this->catalogType;

		if (!empty($_GET['category'])) {
			$resultString .= '/' . $_GET['category'];
		}

		if (!empty($_GET['brand'])) {
			$resultString .= '/' . $_GET['brand'];
		}

		if (!empty($resultArray['brand'])) {
			$resultString .= '/brand-' . implode('_', $this->filterChpuSortBrands($resultArray['brand']));
		}

		foreach ($resultArray['features'] as $key => $value) {
			if (empty($resultArray['features'][$key])) {
				unset($resultArray['features'][$key]);
			}
		}

		if (!empty($resultArray['features'])) {
			$resultString .= $this->filterChpuSortFeatures($resultArray['features']);
		}

		if (!empty($resultArray['sort'])) {
			$resultString .= '/sort-' . $resultArray['sort'];
		}

		if ($resultArray['page'] > 1 || $resultArray['page'] == 'all') {
			$resultString .= '/page-' . $resultArray['page'];
		}

		$keyword = $this->request->get('keyword');

		if (!empty($keyword)) {
			$resultString .= '?keyword=' . $keyword;
		}

		return $resultString;
	}

	/**
	 * Sort Brands
	 */
	private function filterChpuSortBrands($brandsUrls = [])
	{
		if (empty($brandsUrls)) {
			return false;
		}

		$this->db->query("SELECT url FROM __brands WHERE url IN(?@) ORDER BY name", (array) $brandsUrls);

		return $this->db->results('url');
	}

	/**
	 * Sort Features
	 */
	private function filterChpuSortFeatures($features = [])
	{
		if (empty($features)) {
			return false;
		}

		$this->db->query("SELECT url FROM __features WHERE url IN(?@) ORDER BY position", (array) array_keys($features));

		$resultString = '';

		foreach ($this->db->results('url') as $value) {
			if (in_array($value, array_keys($features))) {
				$resultString .= '/' . $value . '-' . implode('_', $features[$value]);
			}
		}

		return $resultString;
	}

	/**
	 * Products list
	 */
	function fetch()
	{
		if ($this->isWrongParams) {
			return false;
		}

		// GET Parameters
		$categoryUrl = $this->request->get('category', 'string');
		$brandUrl = $this->request->get('brand', 'string');
		$mode = $this->request->get('mode', 'string');

		$filter = ['visible' => 1];

		if ($mode == 'featured') {
			$filter['featured'] = 1;
		} elseif ($mode == 'new') {
			$filter['is_new'] = 1;
		} elseif ($mode == 'hit') {
			$filter['is_hit'] = 1;
		} elseif ($mode == 'sale') {
			$filter['discounted'] = 1;
		}

		$currentMinPrice = $this->request->post('min_price');
		$currentMaxPrice = $this->request->post('max_price');

		$rateFrom = $this->request->post('rate_from');
		$rateTo = $this->request->post('rate_to');

		if (!isset($rateFrom)) {
			$rateFrom = 1;
		}

		if (!isset($rateTo)) {
			$rateTo = 1;
		}

		$filter['min_price'] = $currentMinPrice / $rateFrom * $rateTo;
		$filter['max_price'] = $currentMaxPrice / $rateFrom * $rateTo;

		// Brand
		if ($val = $this->request->get('b')) {
			$filter['brand_id'] = $val;
		} elseif (!empty($brandUrl)) {
			$brand = $this->brands->getBrand((string) $brandUrl);

			if (empty($brand)) {
				return false;
			}

			$this->design->assign('brand', $brand);
			$filter['brand_id'] = $brand->id;
		}

		// Category
		if (!empty($categoryUrl)) {
			$category = $this->categories->getCategory((string) $categoryUrl);

			if (empty($category) || (!$category->visible && empty($_SESSION['admin']))) {
				return false;
			}

			$this->design->assign('category', $category);
			$filter['category_id'] = $category->children;
		}

		// Search
		$keyword = $this->request->get('keyword');
		if (!empty($keyword)) {
			$this->design->assign('keyword', $keyword);
			$filter['keyword'] = $keyword;
		}

		// Sort
		if ($sort = $this->request->get('sort', 'string')) {
			$_SESSION['sort'] = $sort;
		}

		if (!empty($_SESSION['sort'])) {
			$filter['sort'] = $_SESSION['sort'];
		} else {
			$filter['sort'] = 'position';
		}

		$this->design->assign('sort', $filter['sort']);

		// Price Filter
		$priceProducts = [];
		$priceProductIds = [];

		foreach ($this->products->getProducts($filter) as $product) {
			$priceProducts[$product->id] = $product;
		}

		if (!empty($priceProducts)) {
			$priceProductIds = array_keys($priceProducts);
		}

		// Features
		if (!empty($category)) {
			$features = [];
			$filter['features'] = [];

			foreach ($this->features->getFeatures(['category_id' => $category->id, 'in_filter' => 1]) as $feature) {
				$features[$feature->id] = $feature;

				if ($val = $this->request->get($feature->id)) {
					$filter['features'][$feature->id] = $val;
				}
			}

			$optionsFilter['visible'] = 1;
			$featureIds = array_keys($features);

			if (!empty($featureIds)) {
				$optionsFilter['feature_id'] = $featureIds;
			}

			$optionsFilter['category_id'] = $category->children;

			if (isset($filter['features'])) {
				$optionsFilter['features'] = $filter['features'];
			}

			if (!empty($brand)) {
				$optionsFilter['brand_id'] = $brand->id;
			} elseif (!empty($filter['brand_id'])) {
				$optionsFilter['brand_id'] = $filter['brand_id'];
			}

			if (!empty($priceProductIds)) {
				$optionsFilter['product_id'] = $priceProductIds;
			}

			$options = $this->features->getOptions($optionsFilter);

			foreach ($options as $option) {
				if (isset($features[$option->feature_id])) {
					$features[$option->feature_id]->options[] = $option;
				}
			}

			foreach ($features as $i => &$feature) {
				if (empty($feature->options)) {
					unset($features[$i]);
				}
			}

			$this->design->assign('features', $features);
		}

		// Pagination
		$itemsPerPage = $this->settings->products_num;

		$currentPage = $this->request->get('page', 'integer');
		$currentPage = max(1, $currentPage);

		$this->design->assign('current_page_num', $currentPage);

		$productsCount = $this->products->countProducts($filter);

		if ($this->request->get('page') == 'all') {
			$itemsPerPage = $productsCount;
		}

		$pagesNum = ceil($productsCount / $itemsPerPage);

		$this->design->assign('total_pages_num', $pagesNum);
		$this->design->assign('total_products_num', $productsCount);

		$filter['page'] = $currentPage;
		$filter['limit'] = $itemsPerPage;

		// Discount User
		$discount = 0;

		if (isset($_SESSION['user_id']) && $user = $this->users->getUser((int) $_SESSION['user_id'])) {
			$discount = $user->discount;
		}

		// Products
		$products = [];

		foreach ($this->products->getProducts($filter) as $product) {
			$products[$product->id] = $product;
		}

		if (!empty($keyword) && $productsCount == 1) {
			header('Location: ' . $this->config->root_url . '/products/' . $product->url);
		}

		if (!empty($products)) {
			$productsIds = array_keys($products);

			foreach ($products as &$product) {
				$product->variants = [];
				$product->images = [];
				$product->comments_count = $this->comments->countComments(['has_parent' => false, 'object_id' => $product->id, 'type' => 'product', 'approved' => 1,]);
			}

			$variants = $this->variants->getVariants(['product_id' => $productsIds]);

			foreach ($variants as &$variant) {
				$products[$variant->product_id]->variants[] = $variant;
			}

			$images = $this->products->getImages(['product_id' => $productsIds]);

			foreach ($images as $image) {
				$products[$image->product_id]->images[] = $image;
			}

			foreach ($products as &$product) {
				if (isset($product->variants[0])) {
					$product->variant = $product->variants[0];
				}

				if (isset($product->images[0])) {
					$product->image = $product->images[0];
				}

				if (!empty($product->sale_to) && strtotime($product->sale_to) <= time()) {
					$product->sale_to = null;

					if (isset($product->variant) && $product->variant->compare_price) {
						$product->variant->price = $product->variant->compare_price;
						$product->variant->compare_price = 0;
						$v = new stdClass();
						$v->price = $product->variant->price;
						$v->compare_price = 0;
						$this->variants->updateVariant($product->variant->id, $v);
					}
				}

				if ($productValues = $this->features->getProductOptions(['product_id' => $product->id])) {

					foreach ($productValues as $pv) {
						if (!isset($product->features[$pv->feature_id])) {
							$product->features[$pv->feature_id] = $pv;
						}

						$product->features[$pv->feature_id]->values[] = $pv;
					}
				}

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

							if (!empty($relatedProduct->variants[0])) {
								$relatedProduct->variant = $relatedProduct->variants[0];
							}

							if (!empty($relatedProduct->images[0])) {
								$relatedProduct->image = $relatedProduct->images[0];
							}

							$dataRelatedProducts[] = $relatedProduct;
						}
					}
				}

				$product->related_products = $dataRelatedProducts;
			}

			// Design
			$this->design->assign('products', $products);
		}

		// Brands
		if (!empty($category)) {
			$brands = $this->brands->getBrands($filter);
			$category->brands = $brands;
		}

		// Price Filter
		unset($filter['min_price']);
		unset($filter['max_price']);
		unset($filter['limit']);

		foreach ($this->products->getProducts($filter) as $p) {
			$productsPrices[$p->id] = $p;
		}

		if (!empty($productsPrices)) {
			$pricesProductsIds = array_keys($productsPrices);
			$pricesVariants = $this->variants->getVariants(['product_id' => $pricesProductsIds]);

			foreach ($pricesVariants as &$pricesVariant) {
				$prices[] = $pricesVariant->price;
			}
		}

		$minPrice = 0;
		$maxPrice = 0;

		if (!empty($prices)) {
			$minPrice = min($prices);
			$maxPrice = max($prices);
		}

		if (!isset($currentMinPrice) && empty($currentMinPrice)) {
			$currentMinPrice = $minPrice;
		}

		if (!isset($currentMaxPrice) && empty($currentMaxPrice)) {
			$currentMaxPrice = $maxPrice;
		}

		$this->design->assign('minprice', $minPrice);
		$this->design->assign('maxprice', $maxPrice);
		$this->design->assign('current_minprice', $currentMinPrice * $rateTo / $rateFrom);
		$this->design->assign('current_maxprice', $currentMaxPrice * $rateTo / $rateFrom);

		// Meta Tags
		$autoMeta = new stdClass();

		$autoMetaParts = [
			'{category}' => isset($category, $category->name) ? $category->name : '',
			'{brand}' => isset($brand, $brand->name) ? $brand->name : '',
			'{page}' => $this->page ? $this->page->header : '',
			'{site_url}' => $this->seo->am_url ?: '',
			'{site_name}' => $this->seo->am_name ?: '',
			'{site_phone}' => $this->seo->am_phone ?: '',
			'{site_email}' => $this->seo->am_email ?: '',
		];

		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);

			$lastModifiedUnix = strtotime($this->page->last_modified);

			$autoMeta->title = $this->seo->page_meta_title ?: '';
			$autoMeta->keywords = $this->seo->page_meta_keywords ?: '';
			$autoMeta->description = $this->seo->page_meta_description ?: '';
		} elseif (isset($category)) {
			$this->design->assign('meta_title', $category->meta_title);
			$this->design->assign('meta_keywords', $category->meta_keywords);
			$this->design->assign('meta_description', $category->meta_description);

			$lastModifiedUnix = strtotime($category->last_modified);

			$autoMeta->title = $this->seo->category_meta_title ?: '';
			$autoMeta->keywords = $this->seo->category_meta_keywords ?: '';
			$autoMeta->description = $this->seo->category_meta_description ?: '';

			if (isset($brand)) {
				$autoMeta->title = $this->seo->category_brand_meta_title ?: '';
				$autoMeta->keywords = $this->seo->category_brand_meta_keywords ?: '';
				$autoMeta->description = $this->seo->category_brand_meta_description ?: '';
			}
		} elseif (isset($brand)) {
			$this->design->assign('meta_title', $brand->meta_title);
			$this->design->assign('meta_keywords', $brand->meta_keywords);
			$this->design->assign('meta_description', $brand->meta_description);

			$lastModifiedUnix = strtotime($brand->last_modified);

			$autoMeta->title = $this->seo->brand_meta_title ?: '';
			$autoMeta->keywords = $this->seo->brand_meta_keywords ?: '';
			$autoMeta->description = $this->seo->brand_meta_description ?: '';
		} elseif (isset($keyword)) {
			$this->design->assign('meta_title', $keyword);
		}

		$autoMeta->title = strtr($autoMeta->title, $autoMetaParts);
		$autoMeta->keywords = strtr($autoMeta->keywords, $autoMetaParts);
		$autoMeta->description = strtr($autoMeta->description, $autoMetaParts);

		$autoMeta->title = preg_replace("/\{.*\}/", '', $autoMeta->title);
		$autoMeta->keywords = preg_replace("/\{.*\}/", '', $autoMeta->keywords);
		$autoMeta->description = preg_replace("/\{.*\}/", '', $autoMeta->description);

		$this->design->assign('auto_meta', $autoMeta);

		// Last Modified
		if (isset($lastModifiedUnix)) {
			$lastModified = gmdate("D, d M Y H:i:s \G\M\T", $lastModifiedUnix);
			$ifModifiedSince = false;

			if (isset($_ENV['HTTP_IF_MODIFIED_SINCE'])) {
				$ifModifiedSince = strtotime(substr($_ENV['HTTP_IF_MODIFIED_SINCE'], 5));
			}

			if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE'])) {
				$ifModifiedSince = strtotime(substr($_SERVER['HTTP_IF_MODIFIED_SINCE'], 5));
			}

			if ($ifModifiedSince && $ifModifiedSince >= $lastModifiedUnix) {
				header($_SERVER['SERVER_PROTOCOL'] . ' 304 Not Modified');
				exit;
			}

			header('Last-Modified: ' . $lastModified);
		}

		// Display
		$body = $this->design->fetch('products.tpl');

		return $body;
	}
}
