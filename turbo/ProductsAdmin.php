<?php

require_once('api/Turbo.php');

class ProductsAdmin extends Turbo
{
	function fetch()
	{
		$filter = [];
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = $this->settings->products_num_admin;

		$categories = $this->categories->getCategoriesTree();
		$this->design->assign('categories', $categories);

		$categoryId = $this->request->get('category_id', 'integer');

		if ($categoryId && $category = $this->categories->getCategory($categoryId)) {
			$filter['category_id'] = $category->children;
		}

		$brands = $this->brands->getBrands(['category_id' => $categoryId]);
		$this->design->assign('brands', $brands);

		$allBrands = $this->brands->getBrands();
		$this->design->assign('all_brands', $allBrands);

		$brand_id = $this->request->get('brand_id', 'integer');

		if ($brand_id && $brand = $this->brands->getBrand($brand_id)) {
			$filter['brand_id'] = $brand->id;
		}

		if ($f = $this->request->get('filter', 'string')) {
			switch ($f) {
				case 'featured':
					$filter['featured'] = 1;
					break;
				case 'new':
					$filter['is_new'] = 1;
					break;
				case 'hit':
					$filter['is_hit'] = 1;
					break;
				case 'discounted':
					$filter['discounted'] = 1;
					break;
				case 'to_export':
					$filter['to_export'] = 1;
					break;
				case 'visible':
					$filter['visible'] = 1;
					break;
				case 'hidden':
					$filter['visible'] = 0;
					break;
				case 'outofstock':
					$filter['in_stock'] = 0;
					break;
			}

			$this->design->assign('filter', $f);
		}

		$keyword = $this->request->get('keyword');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		if ($this->request->isMethod('post')) {
			$prices = $this->request->post('price');
			$stocks = $this->request->post('stock');

			foreach ($prices as $id => $price) {
				$stock = $stocks[$id];

				if ($stock == '∞' || $stock == '') {
					$stock = null;
				}

				$this->variants->updateVariant($id, ['price' => $price, 'stock' => $stock,]);
			}

			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);
			$positions = array_reverse($positions);

			foreach ($positions as $i => $position) {
				$this->products->updateProduct($ids[$i], ['position' => $position]);
			}

			if ($this->request->isMethod('post')) {
				$prices = $this->request->post('price');
				$stocks = $this->request->post('stock');

				foreach ($prices as $id => $price) {
					$stock = $stocks[$id];
					
					if ($stock == '∞' || $stock == '') {
						$stock = null;
					}

					$this->variants->updateVariant($id, ['price' => $price, 'stock' => $stock,]);
				}

				$positions = $this->request->post('positions');
				$ids = array_keys($positions);
				sort($positions);
				$positions = array_reverse($positions);

				foreach ($positions as $i => $position) {
					$this->products->updateProduct($ids[$i], ['position' => $position]);
				}

				$ids = $this->request->post('check');

				if (!empty($ids)) {
					switch ($this->request->post('action')) {
						case 'disable': {
								$this->products->updateProduct($ids, ['visible' => 0]);
								break;
							}
						case 'enable': {
								$this->products->updateProduct($ids, ['visible' => 1]);
								break;
							}
						case 'set_featured': {
								$this->products->updateProduct($ids, ['featured' => 1]);
								break;
							}
						case 'unset_featured': {
								$this->products->updateProduct($ids, ['featured' => 0]);
								break;
							}
						case 'set_is_new': {
								$this->products->updateProduct($ids, ['is_new' => 1]);
								break;
							}
						case 'unset_is_new': {
								$this->products->updateProduct($ids, ['is_new' => 0]);
								break;
							}
						case 'set_is_hit': {
								$this->products->updateProduct($ids, ['is_hit' => 1]);
								break;
							}
						case 'unset_is_hit': {
								$this->products->updatupdateProducte_product($ids, ['is_hit' => 0]);
								break;
							}
						case 'set_export': {
								$this->products->updateProduct($ids, ['to_export' => 1]);
								break;
							}
						case 'unset_export': {
								$this->products->updateProduct($ids, ['to_export' => 0]);
								break;
							}
						case 'delete': {
								foreach ($ids as $id) {
									$this->products->deleteProduct($id);
								}
								break;
							}
						case 'duplicate': {
								foreach ($ids as $id) {
									$this->products->duplicateProduct(intval($id));
								}
								break;
							}
						case 'move_to_page': {
								$targetPage = $this->request->post('target_page', 'integer');
								$filter['page'] = $targetPage;
								$limit = $filter['limit'] * ($targetPage - 1);

								if ($targetPage > $this->request->get('page', 'integer')) {
									$limit += count($ids) - 1;
								} else {
									$ids = array_reverse($ids, true);
								}

								$categoryIdFilter = '';
								$brandIdFilter = '';
								$tempFilter = $filter;
								$tempFilter['page'] = $limit + 1;
								$tempFilter['limit'] = 1;
								$targetProduct = array_pop($this->products->getProducts($tempFilter));
								$targetPosition = $targetProduct->position;

								if ($targetPage > $this->request->get('page', 'integer') && !$targetPosition) {
									$query = $this->db->placehold("SELECT distinct p.position AS target FROM __products p LEFT JOIN __products_categories AS pc ON pc.product_id = p.id WHERE 1 $categoryIdFilter $brandIdFilter ORDER BY p.position DESC LIMIT 1", count($ids));
									$this->db->query($query);
									$targetPosition = $this->db->result('target');
								}

								foreach ($ids as $id) {
									$query = $this->db->placehold("SELECT position FROM __products WHERE id=? LIMIT 1", $id);
									$this->db->query($query);
									$initialPosition = $this->db->result('position');

									if ($targetPosition > $initialPosition) {
										$query = $this->db->placehold("UPDATE __products SET position=position-1 WHERE position>? AND position<=?", $initialPosition, $targetPosition);
									} else {
										$query = $this->db->placehold("UPDATE __products SET position=position+1 WHERE position<? AND position>=?", $initialPosition, $targetPosition);
									}

									$this->db->query($query);
									$query = $this->db->placehold("UPDATE __products SET __products.position = ? WHERE __products.id = ?", $targetPosition, $id);
									$this->db->query($query);
								}
								break;
							}
						case 'move_to_category': {
								$categoryId = $this->request->post('target_category', 'integer');
								$filter['page'] = 1;
								$category = $this->categories->getCategory($categoryId);
								$filter['category_id'] = $category->children;

								foreach ($ids as $id) {
									$query = $this->db->placehold("DELETE FROM __products_categories WHERE category_id=? AND product_id=? LIMIT 1", $categoryId, $id);
									$this->db->query($query);
									$query = $this->db->placehold("UPDATE IGNORE __products_categories SET category_id=? WHERE product_id=? ORDER BY position DESC LIMIT 1", $categoryId, $id);
									$this->db->query($query);

									if ($this->db->affectedRows() == 0) {
										$query = $this->db->query("INSERT IGNORE INTO __products_categories SET category_id=?, product_id=?", $categoryId, $id);
									}
								}
								break;
							}
						case 'change_price': {
								$operation = $this->request->post('op_type', 'integer');
								$saveOld = $this->request->post('save_old', 'integer');
								$value = floatval(str_replace(',', '.', $this->request->post('value')));

								foreach ($this->variants->getVariants(['product_id' => $ids]) as $variant) {
									$price = $variant->price;
									$oldPrice = ($saveOld == 1) ? $variant->price : $variant->compare_price;

									if ($operation == 0) {
										$price += $value;
									} elseif ($operation == 1 && $value !== 0) {
										$price *= (1 + $value / 100);
									}

									$this->variants->updateVariant($variant->id, ['price' => $price, 'compare_price' => $oldPrice]);
								}
								break;
							}
						case 'move_to_brand': {
								$brandId = $this->request->post('target_brand', 'integer');
								$brand = $this->brands->getBrand($brandId);

								$filter['page'] = 1;
								$filter['brand_id'] = $brandId;

								$query = $this->db->placehold("UPDATE __products SET brand_id=? WHERE id IN(?@)", $brandId, $ids);
								$this->db->query($query);

								$brands = $this->brands->getBrands(['category_id' => $categoryId]);
								$this->design->assign('brands', $brands);
								break;
							}
					}
				}
			}
		}

		if (isset($brand)) {
			$this->design->assign('brand', $brand);
		}

		if (isset($category)) {
			$this->design->assign('category', $category);
		}

		$productsCount = $this->products->countProducts($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $productsCount;
		}

		if ($filter['limit'] > 0) {
			$pagesCount = ceil($productsCount / $filter['limit']);
		} else {
			$pagesCount = 0;
		}

		$filter['page'] = min($filter['page'], $pagesCount);
		$this->design->assign('products_count', $productsCount);
		$this->design->assign('pages_count', $pagesCount);
		$this->design->assign('current_page', $filter['page']);

		$products = [];

		foreach ($this->products->getProducts($filter) as $p) {
			$products[$p->id] = $p;
		}

		if (!empty($products)) {
			$productIds = array_keys($products);

			foreach ($products as &$product) {
				$product->variants = [];
				$product->images = [];
			}

			$variants = $this->variants->getVariants(['product_id' => $productIds]);

			foreach ($variants as &$variant) {
				$products[$variant->product_id]->variants[] = $variant;
			}

			$images = $this->products->getImages(array('product_id' => $productIds));
			
			foreach ($images as $image) {
				$products[$image->product_id]->images[$image->id] = $image;
			}
		}

		$this->design->assign('currencies', $this->money->getCurrencies(['enabled' => 1]));
		$this->design->assign('products', $products);

		return $this->design->fetch('products.tpl');
	}
}
