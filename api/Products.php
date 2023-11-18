<?php

require_once 'Turbo.php';

class Products extends Turbo
{

	/**
	 * Get Products
	 */
	public function getProducts($filter = [])
	{
		$page = 1;
		$categoryIdFilter = '';
		$brandIdFilter = '';
		$productIdFilter = '';
		$featuresFilter = '';
		$isNewFilter = '';
		$isHitFilter = '';
		$keywordFilter = '';
		$visibleFilter = '';
		$isFeaturedFilter = '';
		$isExportFilter = '';
		$discountedFilter = '';
		$inStockFilter = '';
		$groupBy = '';
		$variantFilter = '';
		$colorFilter = '';
		$variantJoin = '';
		$prices = '';
		$sqlLimit = '';

		$langId = $this->languages->langId();
		$px = ($langId) ? 'l' : 'p';

		if (!empty($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (!empty($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (isset($limit) && isset($page)) {
			$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);
		}

		if (!empty($filter['id'])) {
			$productIdFilter = $this->db->placehold('AND p.id IN(?@)', (array) $filter['id']);
		}

		if (!empty($filter['category_id'])) {
			$categoryIdFilter = $this->db->placehold('INNER JOIN __products_categories pc ON pc.product_id = p.id AND pc.category_id in(?@)', (array) $filter['category_id']);
			$groupBy = "GROUP BY p.id";
		}

		if (!empty($filter['brand_id'])) {
			$brandIdFilter = $this->db->placehold('AND p.brand_id IN(?@)', (array) $filter['brand_id']);
		}

		if (isset($filter['featured'])) {
			$isFeaturedFilter = $this->db->placehold('AND p.featured=?', (int) $filter['featured']);
		}

		if (!empty($filter['is_new'])) {
			$isNewFilter = $this->db->placehold('AND p.is_new=?', (int) $filter['is_new']);
		}

		if (!empty($filter['is_hit'])) {
			$isHitFilter = $this->db->placehold('AND p.is_hit=?', (int) $filter['is_hit']);
		}

		if (isset($filter['to_export'])) {
			$isExportFilter = $this->db->placehold('AND p.to_export=?', (int) $filter['to_export']);
		}

		if (isset($filter['discounted'])) {
			$discountedFilter = $this->db->placehold('AND (SELECT 1 FROM __variants pv WHERE pv.product_id=p.id AND pv.compare_price>0 LIMIT 1) = ?', (int) $filter['discounted']);
		}

		if (isset($filter['in_stock'])) {
			$inStockFilter = $this->db->placehold('AND (SELECT count(*)>0 FROM __variants pv WHERE pv.product_id=p.id AND pv.price>0 AND (pv.stock IS NULL OR pv.stock>0) LIMIT 1) = ?', (int) $filter['in_stock']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND p.visible=?', (int) $filter['visible']);
		}

		$currencies = $this->money->getCurrencies(['enabled' => 1]);
		$currency = reset($currencies);
		$order = 'IF((SELECT COUNT(*) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1), 1, 0) DESC, p.position DESC';

		if (!empty($filter['sort'])) {
			switch ($filter['sort']) {
				case 'position':
					$order = 'IF((SELECT COUNT(*) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1), 1, 0) DESC, p.position DESC';
					break;
				case 'name':
					$order = 'IF((SELECT COUNT(*) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1), 1, 0) DESC, p.name';
					break;
				case 'name_desc':
					$order = 'IF((SELECT COUNT(*) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1), 1, 0) DESC, p.name DESC';
					break;
				case 'name_desc':
					$order = 'IF((SELECT COUNT(*) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1), 1, 0) DESC, p.name DESC';
					break;
				case 'price':
					$order = 'IF((SELECT COUNT(*) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1), 1, 0) DESC, (SELECT IF((pv.currency_id !=' . $currency->id . ' AND pv.currency_id > 0), (pv.price*(SELECT rate_to FROM __currencies AS c WHERE c.id =pv.currency_id)/(SELECT rate_from FROM __currencies AS c WHERE c.id = pv.currency_id)), pv.price)  FROM __variants pv WHERE (pv.stock IS NULL OR pv.stock>0) AND p.id = pv.product_id AND pv.position=(SELECT MIN(position) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1) LIMIT 1)';
					break;
				case 'price_desc':
					$order = 'IF((SELECT COUNT(*) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1), 1, 0) DESC, (SELECT IF((pv.currency_id !=' . $currency->id . ' AND pv.currency_id > 0), (pv.price*(SELECT rate_to FROM __currencies AS c WHERE c.id =pv.currency_id)/(SELECT rate_from FROM __currencies AS c WHERE c.id = pv.currency_id)), pv.price)  FROM __variants pv WHERE (pv.stock IS NULL OR pv.stock>0) AND p.id = pv.product_id AND pv.position=(SELECT MIN(position) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1) LIMIT 1) DESC';
					break;
				case 'created':
					$order = 'p.created DESC';
					break;
				case 'random':
					$order = 'RAND()';
					break;
				case 'rating':
					$order = 'IF((SELECT COUNT(*) FROM __variants WHERE (stock>0 OR stock IS NULL) AND product_id=p.id LIMIT 1), 1, 0) DESC, p.rating DESC, p.position DESC';
					break;
			}
		}

		if (isset($filter['variants'])) {
			$variantFilter = $this->db->placehold('AND pv.name IN(?@)', (array) $filter['variants']);
			$variantJoin = 'LEFT JOIN __variants pv ON pv.product_id = p.id';
		}

		if (isset($filter['colors'])) {
			$colorFilter = $this->db->placehold('AND pv.color IN(?@)', (array) $filter['colors']);
			$variantJoin = 'LEFT JOIN __variants pv ON pv.product_id = p.id';
		}

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$kw = $this->db->escape(trim($keyword));
				if ($kw !== '') {
					$keywordFilter .= $this->db->placehold("AND (p.name LIKE '%$kw%' OR p.meta_keywords LIKE '%$kw%' OR p.id in (SELECT product_id FROM __variants WHERE sku LIKE '%$kw%'))");
				}
			}
		}

		if (!empty($filter['features']) && !empty($filter['features'])) {
			$featuresFilter = '';
			foreach ($filter['features'] as $feature => $value) {
				$featuresFilter .= $this->db->placehold('AND p.id IN (SELECT product_id FROM __options WHERE feature_id=? AND translit IN(?@))', $feature, (array) $value);
			}
		}

		if (!empty($filter['min_price']) && !empty($filter['max_price'])) {
			$prices = $this->db->placehold('AND p.id in(SELECT v.product_id FROM __variants v WHERE IF((v.currency_id !=' . $currency->id . ' AND v.currency_id>0), (v.price*(SELECT rate_to FROM __currencies AS c WHERE c.id=v.currency_id)/(SELECT rate_from FROM __currencies AS c WHERE c.id=v.currency_id)), v.price) >=? AND IF((v.currency_id !=' . $currency->id . ' AND v.currency_id>0), (v.price*(SELECT rate_to FROM __currencies AS c WHERE c.id=v.currency_id)/(SELECT rate_from FROM __currencies AS c WHERE c.id=v.currency_id)), v.price) <=? AND v.product_id=p.id)', (int) $filter['min_price'], (int) $filter['max_price']);
		}

		$langSql = $this->languages->getQuery(['object' => 'product']);

		$query = $this->db->placehold(
			"SELECT  
				p.id,
				p.url,
				p.brand_id,
				p.name,
				p.annotation,
				p.body,
				p.position,
				p.sale_to,
				p.created AS created,
				p.visible, 
				p.to_export,
				p.featured,
				p.is_new, 
				p.is_hit, 
				p.rating,
				p.votes,
				p.meta_title, 
				p.meta_keywords, 
				p.meta_description, 
				b.name AS brand,
				b.url AS brand_url,
				$langSql->fields
			FROM __products p
			$langSql->join
			$categoryIdFilter 
			LEFT JOIN __brands b ON p.brand_id=b.id
			WHERE 
				1
				$productIdFilter
				$brandIdFilter
				$featuresFilter
				$keywordFilter
				$variantFilter
				$variantJoin
				$colorFilter
				$isFeaturedFilter
				$isNewFilter
				$isHitFilter
				$isExportFilter
				$discountedFilter
				$inStockFilter
				$visibleFilter
				$prices
			$groupBy
			ORDER BY $order
			$sqlLimit"
		);

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result;
			} else {
				$this->db->query($query);
				$result = $this->db->results();
				$this->cache->set($query, $result);
				return $result;
			}
		} else {
			$this->db->query($query);
			return $this->db->results();
		}
	}

	/**
	 * Count Products
	 */
	public function countProducts($filter = [])
	{
		$categoryIdFilter = '';
		$brandIdFilter = '';
		$productIdFilter = '';
		$keywordFilter = '';
		$visibleFilter = '';
		$isFeaturedFilter = '';
		$isNewFilter = '';
		$isHitFilter = '';
		$isExportFilter = '';
		$inStockFilter = '';
		$discountedFilter = '';
		$featuresFilter = '';
		$variantFilter = '';
		$colorFilter = '';
		$variantJoin = '';
		$prices = '';

		$langId = $this->languages->langId();
		$px = ($langId) ? 'l' : 'p';

		if (!empty($filter['category_id'])) {
			$categoryIdFilter = $this->db->placehold('INNER JOIN __products_categories pc ON pc.product_id = p.id AND pc.category_id IN(?@)', (array) $filter['category_id']);
		}

		if (!empty($filter['brand_id'])) {
			$brandIdFilter = $this->db->placehold('AND p.brand_id IN(?@)', (array) $filter['brand_id']);
		}

		if (!empty($filter['id'])) {
			$productIdFilter = $this->db->placehold('AND p.id IN(?@)', (array) $filter['id']);
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$kw = $this->db->escape(trim($keyword));
				if ($kw !== '') {
					$keywordFilter .= $this->db->placehold("AND (p.name LIKE '%$kw%' OR p.meta_keywords LIKE '%$kw%' OR p.id in (SELECT product_id FROM __variants WHERE sku LIKE '%$kw%'))");
				}
			}
		}

		if (isset($filter['variants'])) {
			$variantFilter = $this->db->placehold(' AND pv.name IN(?@)', (array) $filter['variants']);
			$variantJoin = 'LEFT JOIN __variants pv ON pv.product_id = p.id';
		}

		if (isset($filter['colors'])) {
			$colorFilter = $this->db->placehold(' AND pv.color IN(?@)', (array) $filter['colors']);
			$variantJoin = 'LEFT JOIN __variants pv ON pv.product_id = p.id';
		}

		if (isset($filter['featured'])) {
			$isFeaturedFilter = $this->db->placehold('AND p.featured=?', (int) $filter['featured']);
		}

		if (!empty($filter['is_new'])) {
			$isNewFilter = $this->db->placehold('AND p.is_new=?', (int) $filter['is_new']);
		}

		if (!empty($filter['is_hit'])) {
			$isHitFilter = $this->db->placehold('AND p.is_hit=?', (int) $filter['is_hit']);
		}

		if (!empty($filter['to_export'])) {
			$isExportFilter = $this->db->placehold('AND p.to_export=?', (int) $filter['to_export']);
		}

		if (isset($filter['in_stock'])) {
			$inStockFilter = $this->db->placehold('AND (SELECT count(*)>0 FROM __variants pv WHERE pv.product_id=p.id AND pv.price>0 AND (pv.stock IS NULL OR pv.stock>0) LIMIT 1) =?', (int) $filter['in_stock']);
		}

		if (isset($filter['discounted'])) {
			$discountedFilter = $this->db->placehold('AND (SELECT 1 FROM __variants pv WHERE pv.product_id=p.id AND pv.compare_price>0 LIMIT 1) =?', (int) $filter['discounted']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND p.visible=?', (int) $filter['visible']);
		}

		if (!empty($filter['features']) && !empty($filter['features'])) {
			foreach ($filter['features'] as $feature => $value) {
				$featuresFilter .= $this->db->placehold('AND p.id IN(SELECT product_id FROM __options WHERE feature_id=? AND translit in(?@) ) ', $feature, (array) $value);
			}
		}

		$currency = $this->money->getCurrencies(['enabled' => 1]);
		$currency = reset($currency);

		if (!empty($filter['min_price']) && !empty($filter['max_price'])) {
			$prices = $this->db->placehold('AND p.id IN(SELECT v.product_id FROM __variants v WHERE IF((v.currency_id != ' . $currency->id . ' AND v.currency_id>0), (v.price*(SELECT rate_to FROM __currencies AS c WHERE c.id=v.currency_id)/(SELECT rate_from FROM __currencies AS c WHERE c.id=v.currency_id)), v.price) >=? AND IF((v.currency_id != ' . $currency->id . ' AND v.currency_id > 0), (v.price*(SELECT rate_to FROM __currencies AS c WHERE c.id=v.currency_id)/(SELECT rate_from FROM __currencies AS c WHERE c.id=v.currency_id)), v.price) <=? AND v.product_id=p.id)', (int) $filter['min_price'], (int) $filter['max_price']);
		}

		$langSql = $this->languages->getQuery(['object' => 'product']);

		$query = $this->db->placehold(
			"SELECT COUNT(DISTINCT p.id) AS count
			FROM __products AS p
			$langSql->join
			$categoryIdFilter
			WHERE 1
				$brandIdFilter
				$productIdFilter
				$keywordFilter
				$variantFilter
				$variantJoin
				$colorFilter
				$isFeaturedFilter
				$isNewFilter
				$isHitFilter
				$isExportFilter
				$inStockFilter
				$discountedFilter
				$visibleFilter
				$prices
				$featuresFilter"
		);

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result;
			} else {
				if ($this->db->query($query)) {
					$result = $this->db->result('count');
					$this->cache->set($query, $result);
					return $result;
				} else {
					return false;
				}
			}
		} else {
			if ($this->db->query($query)) {
				return $this->db->result('count');
			} else {
				return false;
			}
		}
	}

	/**
	 * Get Product
	 */
	public function getProduct($id)
	{
		if (is_int($id)) {
			$filter = $this->db->placehold('p.id=?', $id);
		} else {
			$filter = $this->db->placehold('p.url=?', $id);
		}

		$langSql = $this->languages->getQuery(['object' => 'product']);

		$query = $this->db->placehold(
			"SELECT DISTINCT
				p.id,
				p.url,
				p.brand_id,
				p.name,
				p.annotation,
				p.body,
				p.position,
				p.sale_to,
				p.created AS created,
				p.visible,
				p.to_export,
				p.featured,
				p.is_new,
				p.is_hit,
				p.rating,
				p.votes,
				p.meta_title,
				p.meta_keywords,
				p.meta_description,
				p.last_modified,
				$langSql->fields
			FROM __products AS p
			$langSql->join
			WHERE $filter
			GROUP BY p.id
			LIMIT 1"
		);

		$this->db->query($query);
		return $this->db->result();
	}

	/**
	 * Update Product
	 */
	public function updateProduct($id, $product)
	{
		$product = (object) $product;

		$query = $this->db->placehold("UPDATE __products SET ?%, last_modified=NOW() WHERE id IN(?@) LIMIT ?", $product, (array) $id, count((array) $id));

		if ($this->db->query($query)) {
			$result = $this->languages->getDescription($product, 'product');

			if (!empty($result->description)) {
				$this->languages->actionDescription($id, $result->description, 'product', $this->languages->langId());
			}

			return $id;
		} else {
			return false;
		}
	}

	/**
	 * Add Product
	 */
	public function addProduct($product)
	{
		$product = (array) $product;

		if (empty($product['url'])) {
			$product['url'] = preg_replace("/[\s]+/ui", '-', $product['name']);
			$product['url'] = strtolower(preg_replace("/[^0-9a-zа-я\-]+/ui", '', $product['url']));
		}

		while ($this->getProduct((string)$product['url'])) {
			if (preg_match('/(.+)_([0-9]+)$/', $product['url'], $parts)) {
				$product['url'] = $parts[1] . '_' . ($parts[2] + 1);
			} else {
				$product['url'] = $product['url'] . '_2';
			}
		}

		$product = (object) $product;

		$result = $this->languages->getDescription($product, 'product');

		if (!empty($result->data)) {
			$product = $result->data;
		}

		if ($this->db->query("INSERT INTO __products SET ?%", $product)) {
			$id = $this->db->insertId();

			$this->db->query("UPDATE __products SET `last_modified`=NOW(), position=id WHERE id=?", $id);

			if (!empty($result->description)) {
				$this->languages->actionDescription($id, $result->description, 'product');
			}

			return $id;
		} else {
			return false;
		}
	}

	/**
	 * Delete Product
	 */
	public function deleteProduct($id)
	{
		if (!empty($id)) {
			$variants = $this->variants->getVariants(['product_id' => $id]);

			foreach ($variants as $variant) {
				$this->variants->deleteVariant($variant->id);
			}

			$images = $this->getImages(['product_id' => $id]);

			foreach ($images as $image) {
				$this->deleteImage($image->id);
			}

			$query = $this->db->placehold('DELETE FROM __products_videos WHERE product_id=?', $id);
			$this->db->query($query);

			$categories = $this->categories->getCategories(['product_id' => $id]);

			foreach ($categories as $category) {
				$this->categories->deleteProductCategory($id, $category->id);
			}

			$options = $this->features->getOptions(['product_id' => $id]);

			foreach ($options as $option) {
				$this->features->deleteOption($id, $option->feature_id);
			}

			$related = $this->getRelatedProducts([$id]);

			foreach ($related as $relation) {
				$this->deleteRelatedProduct($id, $relation->related_id);
			}

			$query = $this->db->placehold("DELETE FROM __related_products WHERE related_id=?", (int) $id);
			$this->db->query($query);

			$recommended = $this->getRecommendedProducts([$id]);

			foreach ($recommended as $r) {
				$this->deleteRelatedProduct($id, $r->recommended_id);
			}

			$query = $this->db->placehold("DELETE FROM __recommended_products WHERE recommended_id=?", (int) $id);
			$this->db->query($query);

			$comments = $this->comments->getComments(['object_id' => $id, 'type' => 'product']);

			foreach ($comments as $comment) {
				$this->comments->deleteComment($comment->id);
			}

			$this->db->query('UPDATE __purchases SET product_id=NULL WHERE product_id=?', (int) $id);
			$query = $this->db->placehold("DELETE FROM __lang_products WHERE product_id=?", (int) $id);
			$this->db->query($query);

			$query = $this->db->placehold("DELETE FROM __products WHERE id=? LIMIT 1", (int) $id);

			if ($this->db->query($query)) {
				return true;
			}
		}

		return false;
	}

	/**
	 * Duplicate Product
	 */
	public function duplicateProduct($id)
	{
		$product = $this->getProduct($id);
		$product->id = null;
		$product->external_id = '';
		$product->created = null;

		$this->db->query('UPDATE __products SET position=position+1 WHERE position>?', $product->position);
		$newId = $this->products->addProduct($product);
		$this->db->query('UPDATE __products SET position=? WHERE id=?', $product->position + 1, $newId);
		$this->db->query('UPDATE __products SET url="" WHERE id=?', $newId);

		$categories = $this->categories->getProductCategories($id);

		foreach ($categories as $category) {
			$this->categories->addProductCategory($newId, $category->category_id);
		}

		$images = $this->getImages(['product_id' => $id]);

		foreach ($images as $image) {
			$this->addImage($newId, $image->filename);
		}

		$videos = $this->getVideos(['product_id' => $id]);

		foreach ($videos as $video) {
			$this->addProductVideo($newId, $video->link);
		}

		$variants = $this->variants->getVariants(['product_id' => $id]);

		foreach ($variants as $variant) {
			$variant->product_id = $newId;
			unset($variant->id);

			if ($variant->infinity) {
				$variant->stock = null;
			}

			unset($variant->infinity);

			if ($variant->oprice) {
				$variant->price = $variant->oprice;
			}

			if ($variant->compare_oprice) {
				$variant->compare_price = $variant->compare_oprice;
			}

			unset($variant->oprice);
			unset($variant->compare_oprice);
			$variant->external_id = '';
			$this->variants->addVariant($variant);
		}

		$options = $this->features->getOptions(['product_id' => $id]);

		foreach ($options as $option) {
			$this->features->updateOption($newId, $option->feature_id, $option->value);
		}

		$related = $this->getRelatedProducts([$id]);

		foreach ($related as $r) {
			$this->addRelatedProduct($newId, $r->related_id);
		}

		$recommended = $this->getRecommendedProducts([$id]);

		foreach ($recommended as $r) {
			$this->addRecommendedProduct($newId, $r->recommended_id);
		}

		$this->multiDuplicateProduct($id, $newId);

		return $newId;
	}

	/**
	 * Get Related Products
	 */
	public function getRelatedProducts($productIds = [])
	{
		if (empty($productIds)) {
			return [];
		}

		$productIdFilter = $this->db->placehold('AND product_id IN(?@)', $productIds);

		$query = $this->db->placehold("SELECT product_id, related_id, position FROM __related_products WHERE 1 $productIdFilter ORDER BY position");
		$this->db->query($query);

		return $this->db->results();
	}

	/**
	 * Get Related Products ID
	 */
	public function getRelatedProductIds($productIds = [])
	{
		$relatedProductIds = [];

		if (empty($productIds)) {
			return $relatedProductIds;
		}

		$productIdFilter = $this->db->placehold('AND product_id IN(?@)', (array) $productIds);

		$query = $this->db->placehold("SELECT DISTINCT related_id FROM __related_products WHERE 1 $productIdFilter");
		$this->db->query($query);

		$results = $this->db->results();

		foreach ($results as $result) {
			$relatedProductIds[] = $result->related_id;
		}

		return $relatedProductIds;
	}

	/**
	 * Add Related Product
	 */
	public function addRelatedProduct($productId, $relatedId, $position = 0)
	{
		$query = $this->db->placehold('INSERT IGNORE INTO __related_products SET product_id=?, related_id=?, position=?', $productId, $relatedId, $position);
		$this->db->query($query);

		return $relatedId;
	}

	/**
	 * Delete Related Product
	 */
	public function deleteRelatedProduct($productId, $relatedId)
	{
		$query = $this->db->placehold("DELETE FROM __related_products WHERE product_id=? AND related_id=? LIMIT 1", $productId, $relatedId);
		$this->db->query($query);
	}

	/**
	 * Get recommended products
	 */
	public function getRecommendedProducts($productIds = [])
	{
		if (empty($productIds)) {
			return [];
		}

		$productIdFilter = $this->db->placehold('AND product_id IN(?@)', $productIds);

		$query = $this->db->placehold("SELECT product_id, recommended_id, position FROM __recommended_products WHERE 1 $productIdFilter ORDER BY position");
		$this->db->query($query);

		return $this->db->results();
	}

	/**
	 * Add Recommended Product 
	 */
	public function addRecommendedProduct($productId, $recommendedId, $position = 0)
	{
		$query = $this->db->placehold("INSERT IGNORE INTO __recommended_products SET product_id=?, recommended_id=?, position=?", $productId, $recommendedId, $position);
		$this->db->query($query);

		return $recommendedId;
	}

	/**
	 * Delete Recommended Product
	 */
	public function deleteRecommendedProduct($productId, $recommendedId)
	{
		$query = $this->db->placehold("DELETE FROM __recommended_products WHERE product_id=? AND recommended_id=? LIMIT 1", (int) $productId, (int) $recommendedId);
		$this->db->query($query);
	}

	/**
	 * Get Images
	 */
	function getImages($filter = [])
	{
		$productIdFilter = '';
		$groupBy = '';

		if (!empty($filter['product_id'])) {
			$productIdFilter = $this->db->placehold('AND i.product_id IN(?@)', (array) $filter['product_id']);
		}

		$query = $this->db->placehold(
			"SELECT i.id, i.product_id, i.name, i.filename, i.position
			FROM __images AS i 
			WHERE 1 $productIdFilter $groupBy 
			ORDER BY i.product_id, i.position"
		);

		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Add Image
	 */
	public function addImage($productId, $filename, $name = '')
	{
		$query = $this->db->placehold("SELECT id FROM __images WHERE product_id=? AND filename=?", $productId, $filename);
		$this->db->query($query);
		$id = $this->db->result('id');

		if (empty($id)) {
			$query = $this->db->placehold("INSERT INTO __images SET product_id=?, filename=?, name=?", $productId, $filename, $name);
			$this->db->query($query);
			$id = $this->db->insertId();

			$query = $this->db->placehold("UPDATE __images SET position=id WHERE id=?", $id);
			$this->db->query($query);
		}

		return $id;
	}

	/**
	 * Update Image
	 */
	public function updateImage($id, $image)
	{
		$query = $this->db->placehold("UPDATE __images SET ?% WHERE id=?", $image, $id);
		$this->db->query($query);

		return $id;
	}

	/**
	 * Delete Image
	 */
	public function deleteImage($id)
	{
		$query = $this->db->placehold("SELECT filename FROM __images WHERE id=?", $id);
		$this->db->query($query);

		$filename = $this->db->result('filename');

		$query = $this->db->placehold("DELETE FROM __images WHERE id=? LIMIT 1", $id);
		$this->db->query($query);

		$query = $this->db->placehold("SELECT count(*) AS count FROM __images WHERE filename=? LIMIT 1", $filename);
		$this->db->query($query);

		$count = $this->db->result('count');

		if ($count == 0) {
			$file = pathinfo($filename, PATHINFO_FILENAME);
			$ext = pathinfo($filename, PATHINFO_EXTENSION);
			$webp = 'webp';

			$resizedImages = glob($this->config->root_dir . $this->config->resized_images_dir . $file . "*." . $ext);

			if (is_array($resizedImages)) {
				foreach ($resizedImages as $f) {
					if (is_file($f)) {
						unlink($f);
					}
				}
			}

			$resizedImages = glob($this->config->root_dir . $this->config->resized_images_dir . $file . "*." . $webp);

			if (is_array($resizedImages)) {
				foreach ($resizedImages as $f) {
					if (is_file($f)) {
						unlink($f);
					}
				}
			}

			unlink($this->config->root_dir . $this->config->original_images_dir . $filename);
		}
	}

	/**
	 * Get Next Product
	 */
	public function getNextProduct($id)
	{
		$this->db->query("SELECT position FROM __products WHERE id = ? LIMIT 1", $id);
		$position = (int) $this->db->result('position');

		$this->db->query("SELECT pc.category_id FROM __products_categories pc WHERE product_id=? ORDER BY position LIMIT 1", $id);
		$categoryId = (int) $this->db->result('category_id');

		$query = $this->db->placehold(
			"SELECT id 
			FROM __products p, __products_categories pc
			WHERE pc.product_id=p.id AND p.position>? 
			AND pc.position=(SELECT MIN(pc2.position) FROM __products_categories pc2 WHERE pc.product_id=pc2.product_id)
			AND pc.category_id=? 
			AND p.visible 
			ORDER BY p.position 
			LIMIT 1",
			$position,
			$categoryId
		);

		$this->db->query($query);
		return $this->getProduct((int) $this->db->result('id'));
	}

	/**
	 * Get Prev Product
	 */
	public function getPrevProduct($id)
	{
		$this->db->query("SELECT position FROM __products WHERE id=? LIMIT 1", $id);
		$position = (int) $this->db->result('position');

		$this->db->query("SELECT pc.category_id FROM __products_categories pc  WHERE product_id=? ORDER BY position LIMIT 1", $id);
		$categoryId = (int) $this->db->result('category_id');

		$query = $this->db->placehold(
			"SELECT id 
			FROM __products p, __products_categories pc
			WHERE pc.product_id=p.id AND p.position<? 
			AND pc.position=(SELECT MIN(pc2.position) FROM __products_categories pc2 WHERE pc.product_id=pc2.product_id)
			AND pc.category_id=? 
			AND p.visible 
			ORDER BY p.position DESC 
			LIMIT 1",
			$position,
			$categoryId
		);

		$this->db->query($query);
		return $this->getProduct((int) $this->db->result('id'));
	}

	/**
	 * Get Videos 
	 */
	function getVideos($filter = [])
	{
		$productIdFilter = '';
		$groupBy = '';
		$videos = [];

		if (!empty($filter['product_id'])) {
			$productIdFilter = $this->db->placehold('AND product_id IN(?@)', (array) $filter['product_id']);
		}

		$query = $this->db->placehold("SELECT * FROM __products_videos WHERE 1 $productIdFilter $groupBy ORDER BY product_id, position");
		$this->db->query($query);
		$results = $this->db->results();

		foreach ($results as &$video) {
			preg_match('~v=([A-Za-z0-9_-]+)~', $video->link, $match);
			$video->vid = $match[1];
			$videos[] = $video;
		}

		return $videos;
	}

	/**
	 * Add Video
	 */
	public function addProductVideo($productId, $link, $position = 0)
	{
		$query = $this->db->placehold("SELECT id FROM __products_videos WHERE product_id=? AND link=?", $productId, $link);
		$this->db->query($query);
		$id = $this->db->result('id');

		if (empty($id)) {
			$query = $this->db->placehold("INSERT INTO __products_videos SET product_id=?, link=?", $productId, $link);
			$this->db->query($query);
			$id = $this->db->insertId();
			$query = $this->db->placehold("UPDATE __products_videos SET position=id WHERE id=?", $id);
			$this->db->query($query);
		}

		return $id;
	}

	/**
	 * Duplicate Product
	 */
	public function multiDuplicateProduct($id, $newId)
	{
		$langId = $this->languages->langId();

		if (!empty($langId)) {
			$languages = $this->languages->getLanguages();
			$prdFields = $this->languages->getFields('products');
			$variantFields = $this->languages->getFields('variants');

			foreach ($languages as $language) {
				if ($language->id != $langId) {
					$this->languages->setLangId($language->id);
					if (!empty($prdFields)) {
						$oldPrd = $this->getProduct($id);
						$updPrd = new stdClass();

						foreach ($prdFields as $field) {
							$updPrd->{$field} = $oldPrd->{$field};
						}

						$updPrd = get_object_vars($updPrd);
						$this->updateProduct($newId, $updPrd);
					}

					if (!empty($variantFields)) {
						$variants = $this->variants->getVariants(['product_id' => $newId]);
						$oldVariants = $this->variants->getVariants(['product_id' => $id]);

						foreach ($oldVariants as $i => $oldVariant) {
							$updVariant = new stdClass();

							foreach ($variantFields as $field) {
								$updVariant->{$field} = $oldVariant->{$field};
							}

							$this->variants->updateVariant($variants[$i]->id, $updVariant);
						}
					}

					$options = $this->features->getOptions(['product_id' => $id]);

					foreach ($options as $option) {
						$this->features->updateOption($newId, $option->feature_id, $option->value);
					}

					$this->languages->setLangId($langId);
				}
			}
		}
	}
}
