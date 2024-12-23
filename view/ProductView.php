<?php

require_once 'View.php';

class ProductView extends View
{
	function fetch()
	{
		$productUrl = $this->request->get('product_url', 'string');

		if (empty($productUrl)) {
			return false;
		}

		// Get Products
		$product = $this->products->getProduct((string) $productUrl);

		// Visible Admin
		if (empty($product) || (!$product->visible && empty($_SESSION['admin']))) {
			return false;
		}

		// Last Modified
		$lastModifiedUnix = strtotime($product->last_modified);
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

		$product->images = $this->products->getImages(['product_id' => $product->id]);
		$product->image = &$product->images[0];

		// Variants
		$variants = [];

		foreach ($this->variants->getVariants(['product_id' => $product->id]) as $v) {
			$variants[$v->id] = $v;
		}

		$product->variants = $variants;

		if (($variantId = $this->request->get('variant', 'integer')) > 0 && isset($variants[$variantId])) {
			$product->variant = $variants[$variantId];
		} else {
			$product->variant = reset($variants);
		}

		// Features
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

		if (!empty($product->features)) {
			foreach ($product->features as &$f) {
				$feature = $this->features->getFeature((int) $f->feature_id);
				$f->is_color = $feature->is_color;
				$f->is_size = $feature->is_size;
				$f->in_filter = $feature->in_filter;
				$f->url_in_product = $feature->url_in_product;
				$f->url = $feature->url;
			}
		}

		// Comments
		if (!empty($this->user)) {
			$this->design->assign('comment_name', $this->user->name);
		}

		$this->design->assign('comment_rating', 5);

		// Comment Form
		if ($this->request->method('post') && $this->request->post('comment')) {
			$comment = new stdClass();
			$comment->name = $this->request->post('name');
			$comment->text = $this->request->post('text');
			$comment->rating = $this->request->post('rating', 'integer');
			$captchaCode =  $this->request->post('captcha_code', 'string');
			$comment->parent_id = $this->request->post('parent_id');
			$comment->admin = $this->request->post('admin');

			$this->design->assign('comment_text', $comment->text);
			$this->design->assign('comment_name', $comment->name);
			$this->design->assign('comment_rating', $comment->rating);
			$this->design->assign('parent_id', $comment->parent_id);

			if ($this->settings->captcha_product && ($_SESSION['captcha_product'] != $captchaCode || empty($captchaCode))) {
				$this->design->assign('error', 'captcha');
			} elseif (empty($comment->name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($comment->text)) {
				$this->design->assign('error', 'empty_comment');
			} else {
				$comment->object_id = $product->id;
				$comment->type = 'product';
				$comment->ip = $_SERVER['REMOTE_ADDR'];

				$this->db->query("SELECT 1 FROM __comments WHERE approved=1 AND ip=? LIMIT 1", $comment->ip);
				if ($this->db->numRows() > 0) {
					$comment->approved = 1;
				}

				$commentId = $this->comments->addComment($comment);
				$this->notify->emailCommentAdmin($commentId);

				unset($_SESSION['captcha_code']);
				header('location: ' . $_SERVER['REQUEST_URI'] . '#comment_' . $commentId);
			}
		}

		// Comments List
		$filter = [
			'approved' => 1,
			'type' => 'product',
			'has_parent' => false,
			'object_id' => $product->id,
			'ip' => $_SERVER['REMOTE_ADDR']
		];

		// Sort
		if ($sort = $this->request->get('sort', 'string')) {
			$_SESSION['comments_product'] = $sort;
		}

		if (!empty($_SESSION['comments_product'])) {
			$filter['sort'] = $_SESSION['comments_product'];
		} else {
			$filter['sort'] = 'rate';
		}

		$this->design->assign('sort', $filter['sort']);

		// Pagination Comments
		$itemsPerPage = $this->settings->comments_num;

		$currentPage = $this->request->get('page', 'integer');
		$currentPage = max(1, $currentPage);

		$this->design->assign('current_page_num', $currentPage);

		$commentsCount = $this->comments->countComments($filter);

		if ($this->request->get('page') == 'all') {
			$itemsPerPage = $commentsCount;
		}

		$pagesNum = ceil($commentsCount / $itemsPerPage);
		$this->design->assign('total_pages_num', $pagesNum);

		$filter['page'] = $currentPage;
		$filter['limit'] = $itemsPerPage;

		// Get Comments
		$comments = $this->comments->getComments($filter);

		$children = [];

		foreach ($this->comments->getComments() as $c) {
			if (!isset($children[$c->id])) {
				$children[$c->id] = [];
			}
			
			$children[$c->parent_id][] = $c;
		}

		$product->comments_count = $commentsCount;

		$this->design->assign('comments', $comments);
		$this->design->assign('children', $children);
		$this->design->assign('comments_count', $commentsCount);

		$this->db->query("SELECT SUM(rating)/COUNT(id) AS ratings FROM __comments WHERE id IN (SELECT id FROM __comments WHERE type='product' AND object_id = $product->id AND approved=1 AND admin=0 AND rating > 0)");
		$product->ratings = floatval($this->db->result('ratings'));

		// Related Products
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

		// Recommended Products
		$recommendedIds = [];
		$recommendedProducts = [];

		$recommendedProductsArray = $this->products->getRecommendedProducts([$product->id]);

		foreach ($recommendedProductsArray as $recommendedProduct) {
			$recommendedIds[] = $recommendedProduct->recommended_id;
			$recommendedProducts[$recommendedProduct->recommended_id] = null;
		}

		if (!empty($recommendedIds)) {
			$recommendedProductsArray = $this->products->getProducts(['id' => $recommendedIds, 'visible' => 1]);

			foreach ($recommendedProductsArray as $recommendedProduct) {
				$recommendedProducts[$recommendedProduct->id] = $recommendedProduct;
			}

			$recommendedProductsImages = $this->products->getImages(['product_id' => array_keys($recommendedProducts)]);

			foreach ($recommendedProductsImages as $recommendedProductImage) {
				if (isset($recommendedProducts[$recommendedProductImage->product_id])) {
					$recommendedProducts[$recommendedProductImage->product_id]->images[] = $recommendedProductImage;
				}
			}

			$recommendedProductsVariants = $this->variants->getVariants(['product_id' => array_keys($recommendedProducts)]);

			foreach ($recommendedProductsVariants as $recommendedProductVariant) {
				if (isset($recommendedProducts[$recommendedProductVariant->product_id])) {
					$recommendedProducts[$recommendedProductVariant->product_id]->variants[] = $recommendedProductVariant;
				}
			}

			foreach ($recommendedProducts as $id => $recommendedProduct) {
				if (!is_object($recommendedProduct)) {
					unset($recommendedProducts[$id]);
				} else {
					$recommendedProduct->image = &$recommendedProduct->images[0];
					$recommendedProduct->variant = &$recommendedProduct->variants[0];

					$recommendedProductRelatedIds = $this->products->getRelatedProductIds([$recommendedProduct->id]);
					$recommendedProductRelatedProducts = [];

					if (!empty($recommendedProductRelatedIds)) {
						$recommendedProductRelatedProducts = $this->products->getProducts(['id' => $recommendedProductRelatedIds, 'visible' => 1]);
						foreach ($recommendedProductRelatedProducts as $relatedProduct) {
							$relatedProduct->variants = $this->variants->getVariants(['product_id' => $relatedProduct->id]);
							if (!empty($relatedProduct->variants)) {
								$relatedProduct->variant = &$relatedProduct->variants[0];
							}
						}
					}

					$recommendedProduct->comments_count = $this->comments->countComments(['has_parent' => false, 'object_id' => $product->id, 'type' => 'product', 'approved' => 1]);

					$this->db->query("SELECT SUM(rating)/COUNT(id) AS ratings FROM __comments WHERE id IN (SELECT id FROM __comments WHERE type='product' AND object_id = $recommendedProduct->id AND approved=1 AND admin=0 AND rating > 0)");
					$recommendedProduct->ratings = floatval($this->db->result('ratings'));

					$recommendedProduct->related_products = $recommendedProductRelatedProducts;
				}
			}

			$this->design->assign('recommended_products', $recommendedProducts);
		}

		// Files
		$files = $this->files->getFiles(['object_id' => $product->id, 'type' => 'product']);
		$this->design->assign('cms_files', $files);

		// Video
		$product->videos = $this->products->getVideos(['product_id' => $product->id]);

		// Next Prev
		$this->design->assign('next_product', $this->products->getNextProduct($product->id));
		$this->design->assign('prev_product', $this->products->getPrevProduct($product->id));

		// Timer Action
		if (!empty($product->sale_to) && strtotime($product->sale_to) <= time()) {
			$product->sale_to = null;
			if ($product->variant && $product->variant->compare_price) {
				$product->variant->price = $product->variant->compare_price;
				$product->variant->compare_price = 0;
				$v = new stdClass();
				$v->price = $product->variant->price;
				$v->compare_price = 0;
				$this->variants->updateVariant($product->variant->id, $v);
			}
		}

		// Design
		$this->design->assign('product', $product);

		// Category
		$productCategories = $this->categories->getCategories(['product_id' => $product->id]);
		$category = reset($productCategories);
		$this->design->assign('category', reset($productCategories));

		// Brand
		$this->design->assign('brand', $this->brands->getBrand((int) $product->brand_id));

		// Browsed Products 
		$maxVisitedProducts = 100;
		$expire = time() + 60 * 60 * 24 * 30;
		$browsedProducts = [];

		if (!empty($_COOKIE['browsed_products'])) {
			$browsedProducts = explode(',', $_COOKIE['browsed_products']);

			if (($exists = array_search($product->id, $browsedProducts)) !== false) {
				unset($browsedProducts[$exists]);
			}
		}

		$browsedProducts[] = $product->id;
		$cookieVal = implode(',', array_slice($browsedProducts, -$maxVisitedProducts, $maxVisitedProducts));
		setcookie('browsed_products', $cookieVal, $expire, '/');

		// Meta Tags
		$this->design->assign('meta_title', $product->meta_title);
		$this->design->assign('meta_keywords', $product->meta_keywords);
		$this->design->assign('meta_description', $product->meta_description);

		if ($product->brand_id) {
			$brand = $this->brands->getBrand((int) $product->brand_id);
		}

		$page = null;
		$autoMeta = new stdClass();
		$autoMeta->title = $this->seo->product_meta_title ?: '';
		$autoMeta->keywords = $this->seo->product_meta_keywords ?: '';
		$autoMeta->description = $this->seo->product_meta_description ?: '';

		$autoMetaParts = [
			'{product}' => $product ? $product->name : '',
			'{category}' => isset($category, $category->name) ? $category->name : '',
			'{brand}' => isset($brand, $brand->name) ? $brand->name : '',
			'{page}' => $page ? $page->header : '',
			'{price}' => ($product->variant && $product->variant->price != null) ? $this->money->convert($product->variant->price) . ' ' . $this->currency->sign : '',
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

		// Display
		return $this->design->fetch('product.tpl');
	}
}
