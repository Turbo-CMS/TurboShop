<?php

require_once 'Turbo.php';

class Categories extends Turbo
{
	private $allCategories;
	private $categoriesTree;

	/**
	 * Get Categories
	 */
	public function getCategories($filter = [])
	{
		if (!empty($filter['featured']) && !empty($filter['visible'])) {
			$featuredFilter = $this->db->placehold('AND c.featured = ?', (int) $filter['featured']);
			$visibleFilter = $this->db->placehold('AND c.visible = ?', (int) $filter['visible']);

			$query = $this->db->placehold(
				"SELECT 
					c.id, 
					c.name, 
					c.name_h1, 
					c.description, 
					c.featured, 
					c.url, 
					c.image, 
					c.icon, 
					c.code,
					c.last_modified 
				FROM __categories c 
				WHERE 1 
					$featuredFilter 
					$visibleFilter 
				ORDER BY 
					c.position"
			);

			$this->db->query($query);
			$categoriesIds = $this->db->results('id');

			$result = [];
			foreach ($categoriesIds as $id) {
				if (isset($this->allCategories[$id])) {
					$result[$id] = $this->allCategories[$id];
				}
			}

			return $result;
		}

		if (!isset($this->categoriesTree)) {
			$this->initCategories();
		}

		if (!empty($filter['product_id'])) {
			$query = $this->db->placehold("SELECT category_id FROM __products_categories WHERE product_id IN(?@) ORDER BY position", (array) $filter['product_id']);
			$this->db->query($query);

			$categoriesIds = $this->db->results('category_id');

			$result = [];

			foreach ($categoriesIds as $id) {
				if (isset($this->allCategories[$id])) {
					$result[$id] = $this->allCategories[$id];
				}
			}

			return $result;
		}

		return $this->allCategories;
	}

	/**
	 * Get Product Categories
	 */
	public function getProductCategories($productId)
	{
		$query = $this->db->placehold("SELECT product_id, category_id, position FROM __products_categories WHERE product_id IN(?@) ORDER BY position", (array) $productId);
		$this->db->query($query);

		return $this->db->results();
	}

	/**
	 * Get Categories Tree
	 */
	public function getCategoriesTree()
	{
		if (!isset($this->categoriesTree)) {
			$this->initCategories();
		}

		return $this->categoriesTree;
	}

	/**
	 * Get Category
	 */
	public function getCategory($id)
	{
		if (!isset($this->allCategories)) {
			$this->initCategories();
		}

		if (is_int($id) && array_key_exists((int)$id, $this->allCategories)) {
			return $this->allCategories[(int)$id];
		} elseif (is_string($id)) {
			foreach ($this->allCategories as $category) {
				if (isset($category->url) && $category->url == $id) {
					return $this->getCategory((int)$category->id);
				}
			}
		}

		return false;
	}

	/**
	 * Add Category
	 */
	public function addCategory($category)
	{
		$category = (array) $category;

		if (empty($category['url'])) {
			$category['url'] = preg_replace("/[\s]+/ui", '_', $category['name']);
			$category['url'] = strtolower(preg_replace("/[^0-9a-zа-я_]+/ui", '', $category['url']));
		}

		while ($this->getCategory((string) $category['url'])) {
			if (preg_match('/(.+)_([0-9]+)$/', $category['url'], $parts)) {
				$category['url'] = $parts[1] . '_' . ($parts[2] + 1);
			} else {
				$category['url'] = $category['url'] . '_2';
			}
		}

		$category = (object) $category;

		$result = $this->languages->getDescription($category, 'category');

		if (!empty($result->data)) {
			$category = $result->data;
		}

		$this->db->query("INSERT INTO __categories SET ?%", $category);
		$id = $this->db->insertId();
		$this->db->query("UPDATE __categories SET position=id WHERE id=?", $id);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'category');
		}

		unset($this->categoriesTree);
		unset($this->allCategories);

		return $id;
	}

	/**
	 * Update Category
	 */
	public function updateCategory($id, $category)
	{
		$category = (object) $category;

		$result = $this->languages->getDescription($category, 'category');

		if (!empty($result->data)) {
			$category = $result->data;
		}

		$query = $this->db->placehold("UPDATE __categories SET last_modified=NOW(), ?% WHERE id=? LIMIT 1", $category, (int) $id);
		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'category', $this->languages->langId());
		}

		unset($this->categoriesTree);
		unset($this->allCategories);

		return (int) $id;
	}

	/**
	 * Delete Category
	 */
	public function deleteCategory($ids)
	{
		$ids = (array) $ids;

		foreach ($ids as $id) {
			if ($category = $this->getCategory((int) $id)) {
				$this->deleteImage($category->children);
				$this->deleteIcon($category->children);
			}

			if (!empty($category->children)) {
				$query = $this->db->placehold("DELETE FROM __categories WHERE id IN(?@)", $category->children);
				$this->db->query($query);

				$query = $this->db->placehold("DELETE FROM __products_categories WHERE category_id IN(?@)", $category->children);
				$this->db->query($query);

				$this->db->query("DELETE FROM __lang_categories WHERE category_id IN(?@)", $category->children);
				$this->db->query($query);
			}
		}

		unset($this->categoriesTree);
		unset($this->allCategories);

		return $id;
	}

	/**
	 * Add Product Category
	 */
	public function addProductCategory($productId, $categoryId, $position = 0)
	{
		$query = $this->db->placehold("INSERT IGNORE INTO __products_categories SET product_id=?, category_id=?, position=?", $productId, $categoryId, $position);
		$this->db->query($query);
	}

	/**
	 * Delete Product Category
	 */
	public function deleteProductCategory($productId, $categoryId)
	{
		$query = $this->db->placehold("DELETE FROM __products_categories WHERE product_id=? AND category_id=? LIMIT 1", $productId, $categoryId);
		$this->db->query($query);
	}

	/**
	 * Delete Image
	 */
	public function deleteImage($categoriesIds)
	{
		$categoriesIds = (array) $categoriesIds;

		$query = $this->db->placehold("SELECT image FROM __categories WHERE id IN(?@)", $categoriesIds);

		if ($this->db->query($query)) {
			$filenames = $this->db->results('image');
		}

		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __categories SET image=NULL WHERE id IN(?@)", $categoriesIds);
			$this->db->query($query);

			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT count(*) AS count FROM __categories WHERE image=?", $filename);
				$this->db->query($query);

				$count = $this->db->result('count');

				if ($count == 0) {
					$file = pathinfo($filename, PATHINFO_FILENAME);
					$ext = pathinfo($filename, PATHINFO_EXTENSION);
					$webp = 'webp';

					$resizedImages = glob($this->config->root_dir . $this->config->resized_category_images_dir . $file . "*." . $ext);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								@unlink($f);
							}
						}
					}

					$resizedImages = glob($this->config->root_dir . $this->config->resized_category_images_dir . $file . "*." . $webp);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								@unlink($f);
							}
						}
					}

					@unlink($this->config->root_dir . $this->config->categories_images_dir . $filename);
				}
			}

			unset($this->categoriesTree);
			unset($this->allCategories);
		}
	}

	/**
	 * Delete Icon
	 */
	public function deleteIcon($categoriesIds)
	{
		$categoriesIds = (array) $categoriesIds;

		$query = $this->db->placehold("SELECT icon FROM __categories WHERE id IN(?@)", $categoriesIds);

		if ($this->db->query($query)) {
			$filenames = $this->db->results('icon');
		}

		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __categories SET icon=NULL WHERE id IN(?@)", $categoriesIds);
			$this->db->query($query);

			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT COUNT(*) AS count FROM __categories WHERE icon=?", $filename);
				$this->db->query($query);

				$count = $this->db->result('count');

				if ($count == 0) {
					@unlink($this->config->root_dir . $this->config->categories_images_dir . $filename);
				}
			}

			unset($this->categoriesTree);
			unset($this->allCategories);
		}
	}

	/**
	 * Initializes Categories 
	 */
	private function initCategories()
	{
		$tree = new stdClass();
		$tree->subcategories = [];

		$pointers = [];
		$pointers[0] = &$tree;
		$pointers[0]->path = [];
		$pointers[0]->level = 0;

		$langSql = $this->languages->getQuery(['object' => 'category']);

		if ($this->settings->category_count) {
			$query = $this->db->placehold(
				"SELECT 
					c.id,
					c.parent_id,
					c.name,
					c.name_h1,
					c.description,
					c.featured,
					c.url,
					c.meta_title,
					c.meta_keywords,
					c.meta_description,
					c.image,
					c.icon,
					c.code,
					c.visible,
					c.position,
					c.last_modified,
					$langSql->fields,
					COUNT(p.id) AS products_count
				FROM __categories c
				 	$langSql->join
				LEFT JOIN __products_categories pc ON pc.category_id=c.id
				LEFT JOIN __products p ON p.id=pc.product_id AND p.visible
				GROUP BY c.id
				ORDER BY c.parent_id, c.position"
			);
		} else {
			$query = $this->db->placehold(
				"SELECT 
					c.id,
					c.parent_id,
					c.name,
					c.name_h1,
					c.description,
					c.featured,
					c.url,
					c.meta_title,
					c.meta_keywords,
					c.meta_description,
					c.image,
					c.icon,
					c.code,
					c.visible,
					c.position,
					c.last_modified,
					$langSql->fields
				FROM __categories c
				 	$langSql->join
				ORDER BY 
				 	c.parent_id, 
					c.position"
			);
		}

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				$categories = $result;
			} else {
				$this->db->query($query);
				$result = $this->db->results();
				$this->cache->set($query, $result);
				$categories = $result;
			}
		} else {
			$this->db->query($query);
			$categories = $this->db->results();
		}

		foreach ($categories as $category) {
			if (!isset($category->subcategories)) {
				$category->subcategories = [];
			}

			$pointers[$category->id] = $category;

			if (isset($pointers[$category->parent_id])) {
				$pointers[$category->parent_id]->subcategories[] = $category;
				$category->path = $pointers[$category->parent_id]->path;
				$category->path[] = $category;
				$category->level = $pointers[$category->parent_id]->level + 1;
			} else {
				$tree->subcategories[] = $category;
				$category->path = [];
				$category->level = 0;
			}
		}

		foreach (array_reverse(array_keys($pointers)) as $id) {
			if ($id > 0) {
				$category = $pointers[$id];
				$category->children[] = $id;

				$parent_id = $category->parent_id;
				if ($parent_id && isset($pointers[$parent_id])) {
					$pointers[$parent_id]->children = array_merge(
						$category->children,
						$pointers[$parent_id]->children ?? []
					);

					if ($this->settings->category_count && $category->visible) {
						$pointers[$parent_id]->products_count = ($pointers[$parent_id]->products_count ?? 0) + $category->products_count;
					}
				}
			}
		}

		$this->categoriesTree = $tree->subcategories;
		$this->allCategories = $pointers;
	}
}
