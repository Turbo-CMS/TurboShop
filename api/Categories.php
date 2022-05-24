<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Categories extends Turbo
{
	// List of pointers to categories in the category tree (key = category id)
	private $all_categories;
	// Category tree
	private $categories_tree;

	public function get_categories($filter = array())
	{

		if (!empty($filter['featured']) && !empty($filter['visible'])) {
			$featured_filter = $this->db->placehold('AND c.featured = ?', intval($filter['featured']));
			$visible_filter = $this->db->placehold('AND c.visible = ?', intval($filter['visible']));

			$query = $this->db->placehold("SELECT c.id, c.name, c.name_h1, c.description, c.featured, c.url, c.image, c.last_modified
											FROM __categories c WHERE 1 $featured_filter $visible_filter ORDER BY c.position");
			$this->db->query($query);
			$categories_ids = $this->db->results('id');
			$result = array();
			foreach ($categories_ids as $id)
				if (isset($this->all_categories[$id]))
					$result[$id] = $this->all_categories[$id];
			return $result;
		}

		if (!isset($this->categories_tree))
			$this->init_categories();

		if (!empty($filter['product_id'])) {
			$query = $this->db->placehold("SELECT category_id FROM __products_categories WHERE product_id in(?@) ORDER BY position", (array)$filter['product_id']);
			$this->db->query($query);
			$categories_ids = $this->db->results('category_id');
			$result = array();
			foreach ($categories_ids as $id)
				if (isset($this->all_categories[$id]))
					$result[$id] = $this->all_categories[$id];
			return $result;
		}

		return $this->all_categories;
	}

	// The function returns the category id for the given product
	public function get_product_categories($product_id)
	{
		$query = $this->db->placehold("SELECT product_id, category_id, position FROM __products_categories WHERE product_id in(?@) ORDER BY position", (array)$product_id);
		$this->db->query($query);
		return $this->db->results();
	}

	// The function returns category id for all products
	public function get_products_categories()
	{
		$query = $this->db->placehold("SELECT product_id, category_id, position FROM __products_categories ORDER BY position");
		$this->db->query($query);
		return $this->db->results();
	}

	// The function returns a tree of categories
	public function get_categories_tree()
	{
		if (!isset($this->categories_tree))
			$this->init_categories();

		return $this->categories_tree;
	}

	// The function returns the given category
	public function get_category($id)
	{
		if (!isset($this->all_categories))
			$this->init_categories();
		if (is_int($id) && array_key_exists(intval($id), $this->all_categories))
			return $category = $this->all_categories[intval($id)];
		elseif (is_string($id))
			foreach ($this->all_categories as $category)
				if ($category->url == $id)
					return $this->get_category((int)$category->id);

		return false;
	}

	// Add category
	public function add_category($category)
	{
		$category = (array)$category;
		if (empty($category['url'])) {
			$category['url'] = preg_replace("/[\s]+/ui", '_', $category['name']);
			$category['url'] = strtolower(preg_replace("/[^0-9a-zа-я_]+/ui", '', $category['url']));
		}

		// If there is a category with this URL, add a number to it
		while ($this->get_category((string)$category['url'])) {
			if (preg_match('/(.+)_([0-9]+)$/', $category['url'], $parts))
				$category['url'] = $parts[1] . '_' . ($parts[2] + 1);
			else
				$category['url'] = $category['url'] . '_2';
		}

		$category = (object)$category;

		$result = $this->languages->get_description($category, 'category');
		if (!empty($result->data)) $category = $result->data;

		$this->db->query("INSERT INTO __categories SET ?%", $category);
		$id = $this->db->insert_id();
		$this->db->query("UPDATE __categories SET position=id WHERE id=?", $id);

		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'category');
		}

		unset($this->categories_tree);
		unset($this->all_categories);
		return $id;
	}

	// Change category
	public function update_category($id, $category)
	{
		$category = (object)$category;
		$result = $this->languages->get_description($category, 'category');
		if (!empty($result->data)) $category = $result->data;

		$query = $this->db->placehold("UPDATE __categories SET `last_modified`=NOW(), ?% WHERE id=? LIMIT 1", $category, intval($id));
		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'category', $this->languages->lang_id());
		}

		unset($this->categories_tree);
		unset($this->all_categories);
		return intval($id);
	}

	// Deleting a category
	public function delete_category($ids)
	{
		$ids = (array) $ids;
		foreach ($ids as $id) {
			if ($category = $this->get_category(intval($id)))
				$this->delete_image($category->children);
			if (!empty($category->children)) {
				$query = $this->db->placehold("DELETE FROM __categories WHERE id in(?@)", $category->children);
				$this->db->query($query);
				$query = $this->db->placehold("DELETE FROM __products_categories WHERE category_id in(?@)", $category->children);
				$this->db->query($query);
				$this->db->query("DELETE FROM __lang_categories WHERE category_id in(?@)", $category->children);
			}
		}
		unset($this->categories_tree);
		unset($this->all_categories);
		return $id;
	}

	// Add a category to the given product
	public function add_product_category($product_id, $category_id, $position = 0)
	{
		$query = $this->db->placehold("INSERT IGNORE INTO __products_categories SET product_id=?, category_id=?, position=?", $product_id, $category_id, $position);
		$this->db->query($query);
	}

	// Delete the category of the given product
	public function delete_product_category($product_id, $category_id)
	{
		$query = $this->db->placehold("DELETE FROM __products_categories WHERE product_id=? AND category_id=? LIMIT 1", intval($product_id), intval($category_id));
		$this->db->query($query);
	}

	// Delete category image
	public function delete_image($categories_ids)
	{
		$categories_ids = (array) $categories_ids;
		$query = $this->db->placehold("SELECT image FROM __categories WHERE id in(?@)", $categories_ids);
		$this->db->query($query);
		$filenames = $this->db->results('image');
		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __categories SET image=NULL WHERE id in(?@)", $categories_ids);
			$this->db->query($query);
			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT count(*) as count FROM __categories WHERE image=?", $filename);
				$this->db->query($query);
				$count = $this->db->result('count');
				if ($count == 0) {
					$file = pathinfo($filename, PATHINFO_FILENAME);
					$ext = pathinfo($filename, PATHINFO_EXTENSION);
					$webp = 'webp';

					// Remove all resizes
					$rezised_images = glob($this->config->root_dir . $this->config->resized_category_images_dir . $file . "*." . $ext);
					if (is_array($rezised_images)) {
						foreach (glob($this->config->root_dir . $this->config->resized_category_images_dir . $file . "*." . $ext) as $f) {
							@unlink($f);
						}
					}

					$rezised_images = glob($this->config->root_dir . $this->config->resized_category_images_dir . $file . "*." . $webp);
					if (is_array($rezised_images)) {
						foreach (glob($this->config->root_dir . $this->config->resized_category_images_dir . $file . "*." . $webp) as $f) {
							@unlink($f);
						}
					}

					@unlink($this->config->root_dir . $this->config->categories_images_dir . $filename);
				}
			}
			unset($this->categories_tree);
			unset($this->all_categories);
		}
	}

	// Initialization of categories, after which categories will be selected from a local variable
	private function init_categories()
	{
		// Category tree
		$tree = new stdClass();
		$tree->subcategories = array();

		// Pointers to tree nodes
		$pointers = array();
		$pointers[0] = &$tree;
		$pointers[0]->path = array();
		$pointers[0]->level = 0;

		$lang_sql = $this->languages->get_query(array('object' => 'category'));

		if ($this->settings->category_count) {
			// Select categories with a count of the number of products for each. Can slow down with a large number of goods.
			$query = $this->db->placehold("SELECT c.id, c.parent_id, c.name, c.name_h1, c.description, c.featured, c.url, c.meta_title, c.meta_keywords, c.meta_description, c.image, c.visible, c.position, c.last_modified, $lang_sql->fields, COUNT(p.id) as products_count
											FROM __categories c $lang_sql->join LEFT JOIN __products_categories pc ON pc.category_id=c.id LEFT JOIN __products p ON p.id=pc.product_id AND p.visible GROUP BY c.id ORDER BY c.parent_id, c.position");
		} else {
			// Select all categories
			$query = $this->db->placehold("SELECT c.id, c.parent_id, c.name, c.name_h1, c.description, c.featured, c.url, c.meta_title, c.meta_keywords, c.meta_description, c.image, c.visible, c.position, c.last_modified, $lang_sql->fields
											FROM __categories c $lang_sql->join ORDER BY c.parent_id, c.position");
		}

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				$categories = $result; // return data from memcached
			} else {
				$this->db->query($query); // otherwise pull from the database
				$result = $this->db->results();
				$this->cache->set($query, $result); // put into cache
				$categories = $result;
			}
		} else {
			$this->db->query($query);
			$categories = $this->db->results();
		}

		$finish = false;
		// We don't stop until the categories run out, or until none of the remaining ones have anywhere to stick
		while (!empty($categories)  && !$finish) {
			$flag = false;
			// Loop through all selected categories
			foreach ($categories as $k => $category) {
				if (isset($pointers[$category->parent_id])) {
					// Add the current category to the category tree (through the pointer)
					$pointers[$category->id] = $pointers[$category->parent_id]->subcategories[] = $category;

					// Path to the current category
					$curr = $pointers[$category->id];
					$pointers[$category->id]->path = array_merge((array)$pointers[$category->parent_id]->path, array($curr));

					// Category nesting level
					$pointers[$category->id]->level = 1 + $pointers[$category->parent_id]->level;

					// Remove the used category from the categories array
					unset($categories[$k]);
					$flag = true;
				}
			}
			if (!$flag) $finish = true;
		}

		// For each category id of all its children, find out
		$ids = array_reverse(array_keys($pointers));
		foreach ($ids as $id) {
			if ($id > 0) {
				$pointers[$id]->children[] = $id;

				if (isset($pointers[$pointers[$id]->parent_id]->children))
					$pointers[$pointers[$id]->parent_id]->children = array_merge($pointers[$id]->children, $pointers[$pointers[$id]->parent_id]->children);
				else
					$pointers[$pointers[$id]->parent_id]->children = $pointers[$id]->children;

				if ($this->settings->category_count) {
					// Add the number of products to the parent category if the current one is visible
					if (isset($pointers[$pointers[$id]->parent_id]->products_count) && $pointers[$id]->visible)
						$pointers[$pointers[$id]->parent_id]->products_count += $pointers[$id]->products_count;
				}
			}
		}
		unset($pointers[0]);
		unset($ids);

		$this->categories_tree = $tree->subcategories;
		$this->all_categories = $pointers;
	}
}
