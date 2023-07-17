<?php

require_once 'api/Turbo.php';

class View extends Turbo
{
	public $currency;
	public $currencies;
	public $user;
	public $group;
	public $page;
	public $language;
	public $langLink;

	private static $viewInstance;

	public function __construct()
	{
		parent::__construct();

		if (self::$viewInstance) {
			$this->currency = &self::$viewInstance->currency;
			$this->currencies = &self::$viewInstance->currencies;
			$this->user = &self::$viewInstance->user;
			$this->group = &self::$viewInstance->group;
			$this->page = &self::$viewInstance->page;
			$this->language = &self::$viewInstance->language;
			$this->langLink = &self::$viewInstance->langLink;
		} else {
			self::$viewInstance = $this;

			$langLabels = [];
			$languages = $this->languages->languages();

			foreach ($languages as $language) {
				$langLabels[] = $language->label;
			}

			$getLang = $_GET['lang_label'] ?? null;

			if (!isset($getLang) && !empty($langLabels) && !in_array($getLang, $langLabels)) {
				$_GET['page_url'] = '404';
				$_GET['module'] = 'PageView';
			}

			$langLink = '';

			if ($getLang) {
				$this->language = $this->languages->languages(['id' => $this->languages->langId()]);

				if (!is_object($this->language)) {
					$_GET['page_url'] = '404';
					$_GET['module'] = 'PageView';
					$this->language = reset($languages);
					$this->languages->setLangId($this->language->id);
				}

				$langLink = $this->language->label . '/';
			} else {
				$this->language = reset($languages);

				if ($this->language !== false && isset($this->language->id)) {
					$this->languages->setLangId($this->language->id);
				}
			}

			$this->design->assign('lang_link', $langLink);
			$this->langLink = $langLink;

			if (!empty($languages)) {
				$firstLang = reset($languages);
				$ruri = explode('/', $_SERVER['REQUEST_URI']);
				$as = $firstLang->id !== $this->languages->LangId() ? 2 : 1;

				if (is_array($ruri) && $firstLang->id == $this->languages->LangId() && $ruri[1] == $firstLang->label) {
					header('HTTP/1.1 301 Moved Permanently');
					header('Location: ' . $this->config->root_url . '/' . implode('/', array_slice($ruri, 2)));
					exit();
				}

				foreach ($languages as &$lang) {
					if ($firstLang->id !== $lang->id) {
						$lang->url = $lang->label . ($ruri ? '/' . implode('/', array_slice($ruri, $as)) : '');
					} else {
						$lang->url = ($ruri ? '/' . implode('/', array_slice($ruri, $as)) : '');
					}
				}
			}

			$this->currencies = $this->money->getCurrencies(['enabled' => true]);

			if ($currencyId = $this->request->get('currency_id', 'integer')) {
				$_SESSION['currency_id'] = $currencyId;
				header("Location: " . $this->request->url(['currency_id' => null]));
			}

			if (isset($_SESSION['currency_id'])) {
				$this->currency = $this->money->getCurrency($_SESSION['currency_id']);
			} else {
				$this->currency = reset($this->currencies);
			}

			if (isset($_SESSION['user_id'])) {
				$user_id = (int) $_SESSION['user_id'];
				$user = $this->users->getUser($user_id);

				if ($user && $user->enabled) {
					$this->user = $user;
					$this->group = $this->users->getGroup($this->user->group_id);
				}
			}

			$compare_products = isset($_SESSION['compared_products']) ? count($_SESSION['compared_products']) : 0;
			$this->design->assign('compare_products', $compare_products);

			if (!empty($_COOKIE['wishlist_products'])) {
				$wishlist_products = explode(',', $_COOKIE['wishlist_products']);
				$this->design->assign('wishlist_products', $wishlist_products);
			}

			$subDir = substr(dirname(dirname(__FILE__)), strlen($_SERVER['DOCUMENT_ROOT']));
			$pageUrl = trim(substr($_SERVER['REQUEST_URI'], strlen($subDir)), "/");

			if (strpos($pageUrl, '?') !== false) {
				$pageUrl = substr($pageUrl, 0, strpos($pageUrl, '?'));
			}

			if (!empty($languages) && !empty($firstLang)) {
				$strlen = $firstLang->id == $this->language->id ? '' : $firstLang->label;
				$pageUrl = trim(substr($pageUrl, strlen($strlen)), '/');
			}

			if (!empty($_GET['page_url']) && in_array($_GET['page_url'], array('all-products', 'featured', 'hit', 'new', 'sale'))) {
				$pageUrl = $_GET['page_url'];
			}

			$this->design->assign('language', $this->language);
			$this->design->assign('languages', $languages);
			$this->design->assign('lang', $this->translations);

			$pageUrl = (string) $pageUrl;
			$this->page = $this->pages->getPage($pageUrl);

			$this->design->assign('seo', $this->seo);
			$this->design->assign('page', $this->page);
			$this->design->assign('user', $this->user);
			$this->design->assign('group', $this->group);
			$this->design->assign('config', $this->config);
			$this->design->assign('settings', $this->settings);
			$this->design->assign('currency', $this->currency);
			$this->design->assign('currencies', $this->currencies);

			$this->design->smarty->registerPlugin('block', 'js', [$this, 'addJavascriptBlock']);
			$this->design->smarty->registerPlugin('block', 'css', [$this, 'addStylesheetBlock']);

			$this->design->smarty->registerPlugin("function", "get_faqs", [$this, 'getFaqsPlugin']);
			$this->design->smarty->registerPlugin("function", "get_posts", [$this, 'getPostsPlugin']);
			$this->design->smarty->registerPlugin("function", "get_banner", [$this, 'getBannerPlugin']);
			$this->design->smarty->registerPlugin("function", "get_brands", [$this, 'getBrandsPlugin']);
			$this->design->smarty->registerPlugin('function', 'javascript', [$this, 'printJavascript']);
			$this->design->smarty->registerPlugin('function', 'stylesheet', [$this, 'printStylesheet']);
			$this->design->smarty->registerPlugin("function", "get_captcha", [$this, 'getCaptchaPlugin']);
			$this->design->smarty->registerPlugin("function", "get_articles", [$this, 'getArticlesPlugin']);
			$this->design->smarty->registerPlugin("function", "get_products", [$this, 'getProductsPlugin']);
			$this->design->smarty->registerPlugin("function", "get_comments", [$this, 'getCommentsPlugin']);
			$this->design->smarty->registerPlugin('function', 'unset_js', [$this, 'unsetJavascriptFunction']);
			$this->design->smarty->registerPlugin('function', 'unset_css', [$this, 'unsetStylesheetFunction']);
			$this->design->smarty->registerPlugin("function", "get_browsed_products", [$this, 'getBrowsedProducts']);
			$this->design->smarty->registerPlugin("function", "get_new_products", [$this, 'getNewProductsPlugin']);
			$this->design->smarty->registerPlugin("function", "get_is_new_products", [$this, 'getIsNewProductsPlugin']);
			$this->design->smarty->registerPlugin("function", "get_is_hit_products", [$this, 'getIsHitProductsPlugin']);
			$this->design->smarty->registerPlugin("function", "get_featured_products", [$this, 'getFeaturedProductsPlugin']);
			$this->design->smarty->registerPlugin("function", "get_discounted_products", [$this, 'getDiscountedProductsPlugin']);
			$this->design->smarty->registerPlugin("function", "get_featured_categories", [$this, 'getFeaturedCategoriesPlugin']);
		}
	}

	function fetch()
	{
		return false;
	}

	/**
	 * Get featured categories plugin
	 */
	public function getFeaturedCategoriesPlugin($params, $smarty)
	{
		if (!isset($params['featured'])) {
			$params['featured'] = 1;
		}

		$params['visible'] = 1;

		if (!empty($params['var'])) {
			$smarty->assign($params['var'], $this->categories->getCategories($params));
		}
	}

	/**
	 * Get captcha plugin
	 */
	public function getCaptchaPlugin($params, $smarty)
	{
		if (isset($params['var'])) {
			$number = 0;
			unset($_SESSION[$params['var']]);

			$total = rand(10, 50);
			$secret = rand(1, 10);

			$result[] = $total - $secret;
			$result[] = $total;

			$_SESSION[$params['var']] = $secret;

			$smarty->assign($params['var'], $result);
		} else {
			return false;
		}
	}

	/**
	 * Get banner plugin
	 */
	public function getBannerPlugin($params, $smarty)
	{
		$group = isset($params['group']) && !empty($params['group']) ? $params['group'] : false;

		$articlesCategory = $this->design->smarty->getTemplateVars('articles_category');
		$category = $this->design->smarty->getTemplateVars('category');
		$brand = $this->design->smarty->getTemplateVars('brand');
		$page = $this->design->smarty->getTemplateVars('page');

		$showFilterArray = [
			'categories' => $category ? $category->id : null,
			'brands' => $brand ? $brand->id : null,
			'articles_categories' => $articlesCategory ? $articlesCategory->id : null,
			'pages' => $page ? $page->id : null,
		];

		$banner = $this->banners->getBanner($group, true, $showFilterArray);

		if (!empty($banner)) {
			$items = $this->banners->getBannersImages(['banner_id' => $banner->id, 'visible' => 1]);

			if ($items) {
				$banner->items = $items;
				$smarty->assign($params['var'], $banner);
			}
		}
	}

	/**
	 * Get post plugin
	 */
	public function getPostsPlugin($params, $smarty)
	{
		if (!isset($params['visible'])) {
			$params['visible'] = 1;
		}

		if (!empty($params['var'])) {
			$posts = $this->blog->getPosts($params);
		}

		if (empty($posts)) {
			return false;
		}

		foreach ($posts as &$post) {
			$post->comments = count($this->comments->getComments(['has_parent' => false, 'type' => 'blog', 'object_id' => $post->id, 'approved' => 1]));
		}

		$smarty->assign($params['var'], $posts);
	}

	/**
	 * Get FAQs plugin
	 */
	public function getFaqsPlugin($params, $smarty)
	{
		if (!isset($params['visible'])) {
			$params['visible'] = 1;
		}

		if (!empty($params['var'])) {
			$faqs = $this->faq->get_faqs($params);
		}

		if (empty($faqs)) {
			return false;
		}

		$smarty->assign($params['var'], $faqs);
	}

	/**
	 * Get articles plugin
	 */
	public function getArticlesPlugin($params, $smarty)
	{
		if (!isset($params['visible'])) {
			$params['visible'] = 1;
		}

		if (!empty($params['var'])) {
			$posts = $this->articles->getArticles($params);
		}

		if (empty($posts)) {
			return false;
		}

		foreach ($posts as &$post) {
			$post->comments = count($this->comments->getComments(['has_parent' => false, 'type' => 'article', 'object_id' => $post->id, 'approved' => 1]));
			$post->category = $this->articlesCategories->getArticlesCategory((int) $post->category_id);
		}

		$smarty->assign($params['var'], $posts);
	}

	/**
	 * Gets comments plugin
	 */
	public function getCommentsPlugin($params, $smarty)
	{
		if (!isset($params['approved'])) {
			$params['approved'] = 1;
		}

		if (!isset($params['has_parent'])) {
			$params['has_parent'] = false;
		}

		if (!empty($params['var'])) {
			$comments = $this->comments->getComments($params);

			$productsIds = [];
			$products = [];
			$postsIds = [];
			$posts = [];
			$articlesIds = [];
			$articles = [];

			foreach ($comments as $comment) {
				$productsIds[] = $comment->object_id;

				foreach ($this->products->getProducts(['id' => $productsIds]) as $p) {
					$products[$p->id] = $p;
				}

				$postsIds[] = $comment->object_id;

				foreach ($this->blog->getPosts(['id' => $postsIds]) as $p) {
					$posts[$p->id] = $p;
				}

				$articlesIds[] = $comment->object_id;

				foreach ($this->articles->getArticles(['id' => $articlesIds]) as $a) {
					$articles[$a->id] = $a;
				}
			}

			foreach ($comments as $comment) {
				if (isset($products[$comment->object_id])) {
					$comment->product = $products[$comment->object_id];
				}

				if (isset($posts[$comment->object_id])) {
					$comment->post = $posts[$comment->object_id];
				}

				if (isset($articles[$comment->object_id])) {
					$comment->article = $articles[$comment->object_id];
				}
			}

			$smarty->assign($params['var'], $comments);
		}
	}

	/**
	 * Get brands plugin
	 */
	public function getBrandsPlugin($params, $smarty)
	{
		if (!isset($params['visible'])) {
			$params['visible'] = 1;
		}

		if (!empty($params['var'])) {
			$smarty->assign($params['var'], $this->brands->getBrands($params));
		}
	}

	/**
	 * Gets products plugin
	 */
	public function getProductsPlugin($params, $smarty)
	{
		$products = [];

		if (!empty($params['var'])) {
			foreach ($this->products->getProducts($params) as $p) {
				$products[$p->id] = $p;
				$products[$p->id]->variants = [];
				$products[$p->id]->images = [];
			}

			if (!empty($products)) {
				$productIds = array_keys($products);
				$variants = $this->variants->getVariants(['product_id' => $productIds]);

				foreach ($variants as &$variant) {
					$products[$variant->product_id]->variants[] = $variant;
				}

				$images = $this->products->getImages(['product_id' => $productIds]);

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
							$this->variants->update_variant($product->variant->id, $v);
						}
					}

					$product->comments_count = $this->comments->countComments(['has_parent' => false, 'object_id' => $product->id, 'type' => 'product', 'approved' => 1]);

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

					$product->related_products = $dataRelatedProducts;
				}

				$smarty->assign($params['var'], $products);
			}
		}
	}

	/**
	 * Get browsed products
	 */
	public function getBrowsedProducts($params, $smarty)
	{
		$result = [];

		if (!empty($_COOKIE['browsed_products'])) {
			$browsedProductsIds = explode(',', $_COOKIE['browsed_products']);
			$browsedProductsIds = array_reverse($browsedProductsIds);

			if (isset($params['limit'])) {
				$browsedProductsIds = array_slice($browsedProductsIds, 0, $params['limit']);
			}

			$products = [];

			foreach ($this->products->getProducts(['id' => $browsedProductsIds]) as $product) {
				$products[$product->id] = $product;
				$products[$product->id]->variants = [];
				$products[$product->id]->images = [];
			}

			$variants = $this->variants->getVariants(['product_id' => $browsedProductsIds]);

			foreach ($variants as &$variant) {
				$products[$variant->product_id]->variants[] = $variant;
			}

			$browsedProductsImages = $this->products->getImages(['product_id' => $browsedProductsIds]);

			foreach ($browsedProductsImages as $browsedProductImage) {
				if (isset($products[$browsedProductImage->product_id])) {
					$products[$browsedProductImage->product_id]->images[] = $browsedProductImage;
				}
			}

			foreach ($browsedProductsIds as $id) {
				if (isset($products[$id])) {
					if (isset($products[$id]->images[0])) {
						$products[$id]->image = $products[$id]->images[0];
					}

					if (isset($products[$id]->variants[0])) {
						$products[$id]->variant = $products[$id]->variants[0];
					}

					$result[] = $products[$id];

					$products[$id]->comments_count = $this->comments->countComments(['has_parent' => false, 'object_id' => $id, 'type' => 'product', 'approved' => 1]);

					$dataRelatedProducts = [];
					$relatedIds = $this->products->getRelatedProductIds([$id]);

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

					$products[$id]->related_products = $dataRelatedProducts;
				}
			}

			$smarty->assign($params['var'], $result);
		}
	}

	/**
	 * Get featured products plugin
	 */
	public function getFeaturedProductsPlugin($params, $smarty)
	{
		if (!isset($params['visible'])) {
			$params['visible'] = 1;
		}

		$params['featured'] = 1;

		if (!empty($params['var'])) {
			$products = [];

			foreach ($this->products->getProducts($params) as $p) {
				$products[$p->id] = $p;
				$products[$p->id]->variants = [];
				$products[$p->id]->images = [];
			}

			if (!empty($products)) {
				$productIds = array_keys($products);

				$variants = $this->variants->getVariants(['has_parent' => false, 'product_id' => $productIds]);

				foreach ($variants as &$variant) {
					$products[$variant->product_id]->variants[] = $variant;
				}

				$images = $this->products->getImages(['product_id' => $productIds]);

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
							$this->variants->update_variant($product->variant->id, $v);
						}
					}

					$product->comments_count = $this->comments->countComments(['has_parent' => false, 'object_id' => $product->id, 'type' => 'product', 'approved' => 1,]);

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

					$product->related_products = $dataRelatedProducts;
				}
			}

			$smarty->assign($params['var'], $products);
		}
	}

	/**
	 * Get new products plugin
	 */
	public function getIsNewProductsPlugin($params, $smarty)
	{
		if (!isset($params['visible'])) {
			$params['visible'] = 1;
		}

		$params['is_new'] = 1;

		if (!empty($params['var'])) {
			$products = [];

			foreach ($this->products->getProducts($params) as $p) {
				$products[$p->id] = $p;
				$products[$p->id]->variants = [];
				$products[$p->id]->images = [];
			}

			if (!empty($products)) {
				$productIds = array_keys($products);

				$variants = $this->variants->getVariants(['has_parent' => false, 'product_id' => $productIds]);

				foreach ($variants as &$variant) {
					$products[$variant->product_id]->variants[] = $variant;
				}

				$images = $this->products->getImages(['product_id' => $productIds]);

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

							$this->variants->update_variant($product->variant->id, $v);
						}
					}

					$product->comments_count = $this->comments->countComments(['has_parent' => false, 'object_id' => $product->id, 'type' => 'product', 'approved' => 1,]);

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

					$product->related_products = $dataRelatedProducts;
				}
			}

			$smarty->assign($params['var'], $products);
		}
	}

	/**
	 * Get hit products plugin
	 */
	public function getIsHitProductsPlugin($params, $smarty)
	{
		if (!isset($params['visible'])) {
			$params['visible'] = 1;
		}

		$params['is_hit'] = 1;

		if (!empty($params['var'])) {
			$products = [];

			foreach ($this->products->getProducts($params) as $p) {
				$products[$p->id] = $p;
				$products[$p->id]->variants = [];
				$products[$p->id]->images = [];
			}

			if (!empty($products)) {
				$productIds = array_keys($products);

				$variants = $this->variants->getVariants(['has_parent' => false, 'product_id' => $productIds]);

				foreach ($variants as &$variant) {
					$products[$variant->product_id]->variants[] = $variant;
				}

				$images = $this->products->getImages(['product_id' => $productIds]);

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
							$this->variants->update_variant($product->variant->id, $v);
						}
					}

					$product->comments_count = $this->comments->countComments(['has_parent' => false, 'object_id' => $product->id, 'type' => 'product', 'approved' => 1,]);

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

					$product->related_products = $dataRelatedProducts;
				}
			}

			$smarty->assign($params['var'], $products);
		}
	}

	/**
	 * Get new products plugin
	 */
	public function getNewProductsPlugin($params, $smarty)
	{
		if (!isset($params['visible'])) {
			$params['visible'] = 1;
		}

		if (!isset($params['sort'])) {
			$params['sort'] = 'created';
		}

		if (!empty($params['var'])) {
			$products = [];

			foreach ($this->products->getProducts($params) as $p) {
				$products[$p->id] = $p;
				$products[$p->id]->variants = [];
				$products[$p->id]->images = [];
			}

			if (!empty($products)) {
				$productIds = array_keys($products);

				$variants = $this->variants->getVariants(['has_parent' => false, 'product_id' => $productIds]);

				foreach ($variants as &$variant) {
					$products[$variant->product_id]->variants[] = $variant;
				}

				$images = $this->products->getImages(['product_id' => $productIds]);

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
							$this->variants->update_variant($product->variant->id, $v);
						}
					}

					$product->comments_count = $this->comments->countComments(['has_parent' => false, 'object_id' => $product->id, 'type' => 'product', 'approved' => 1,]);

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

					$product->related_products = $dataRelatedProducts;
				}
			}

			$smarty->assign($params['var'], $products);
		}
	}

	/**
	 * Get discounted products plugin
	 */
	public function getDiscountedProductsPlugin($params, $smarty)
	{
		if (!isset($params['visible'])) {
			$params['visible'] = 1;
		}

		$params['discounted'] = 1;

		if (!empty($params['var'])) {
			$products = [];

			foreach ($this->products->getProducts($params) as $p) {
				$products[$p->id] = $p;
				$products[$p->id]->variants = [];
				$products[$p->id]->images = [];
			}

			if (!empty($products)) {
				$productIds = array_keys($products);

				$variants = $this->variants->getVariants(['has_parent' => false, 'product_id' => $productIds]);

				foreach ($variants as &$variant) {
					$products[$variant->product_id]->variants[] = $variant;
				}

				$images = $this->products->getImages(['product_id' => $productIds]);

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
							$this->variants->update_variant($product->variant->id, $v);
						}
					}

					$product->comments_count = $this->comments->countComments(['has_parent' => false, 'object_id' => $product->id, 'type' => 'product', 'approved' => 1,]);

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

					$product->related_products = $dataRelatedProducts;
				}
			}

			$smarty->assign($params['var'], $products);
		}
	}

	/**
	 * Add JavaScript file
	 */
	public function addJavascriptBlock($params, $content, $smarty, &$repeat)
	{
		if (!isset($params['id']) || $repeat || (empty($content)) && empty($params['include'])) {
			return false;
		}

		if (!isset($params['priority'])) {
			$params['priority'] = 10;
		}

		if (!empty($params['include'])) {
			$this->js->addFiles($params['id'], $params['include'], $params['priority']);
		}

		if (!empty($content)) {
			$this->js->addCode($params['id'], $content, $params['priority']);
		}

		if (!empty($params['render'])) {
			if (!isset($params['minify'])) {
				$params['minify'] = null;
			}

			if (!isset($params['combine'])) {
				$params['combine'] = true;
			}

			return $this->js->render($params['id'], $params['minify'], $params['combine']);
		}
	}

	/**
	 * Unregister JavaScript file
	 */
	public function unsetJavascriptFunction($params, $smarty)
	{
		if (!isset($params['id'])) {
			return false;
		}

		$this->js->unplug($params['id']);
	}

	/**
	 * Render packed JavaScript file
	 */
	public function printJavascript($params)
	{
		if (!isset($params['id'])) {
			$params['id'] = null;
		}

		if (!isset($params['combine'])) {
			$params['combine'] = true;
		}

		if (!isset($params['minify'])) {
			$params['minify'] = null;
		}

		return $this->js->render($params['id'], $params['minify'], $params['combine']);
	}

	/**
	 * Register css file
	 */
	public function addStylesheetBlock($params, $content, $smarty, &$repeat)
	{
		if (!isset($params['id']) || $repeat || (empty($content)) && empty($params['include'])) {
			return false;
		}

		if (!isset($params['priority'])) {
			$params['priority'] = 10;
		}

		if (!isset($params['less'])) {
			$params['less'] = false;
		}

		if (!empty($params['include'])) {
			$this->css->addFiles($params['id'], $params['include'], $params['priority'], $params['less']);
		}

		if (!empty($content)) {
			$this->css->addCode($params['id'], $content, $params['priority'], $params['less']);
		}

		if (!empty($params['render'])) {
			if (!isset($params['minify'])) {
				$params['minify'] = null;
			}

			if (!isset($params['combine'])) {
				$params['combine'] = true;
			}

			return $this->css->render($params['id'], $params['minify'], $params['combine']);
		}
	}

	/**
	 * Unregisters CSS file
	 */
	public function unsetStylesheetFunction($params, $smarty)
	{
		if (!isset($params['id'])) {
			return false;
		}

		$this->css->unplug($params['id']);

		return true;
	}

	/**
	 * Print packed CSS file
	 */
	public function printStylesheet($params)
	{
		if (!isset($params['id'])) {
			$params['id'] = null;
		}

		if (!isset($params['combine'])) {
			$params['combine'] = true;
		}

		if (!isset($params['minify'])) {
			$params['minify'] = null;
		}

		return $this->css->render($params['id'], $params['minify'], $params['combine']);
	}
}
