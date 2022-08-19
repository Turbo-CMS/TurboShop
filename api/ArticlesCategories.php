<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class ArticlesCategories extends Turbo
{
	// List of pointers to categories in the category tree (key = category id)
	private $all_articles_categories;
	// Category tree
	private $articles_categories_tree;

	// The function returns an array of categories
	public function get_articles_categories($filter = array())
	{
		if (!isset($this->articles_categories_tree))
			$this->init_articles_categories();

		return $this->all_articles_categories;
	}

	// The function returns a tree of categories
	public function get_articles_categories_tree()
	{
		if (!isset($this->articles_categories_tree))
			$this->init_articles_categories();

		return $this->articles_categories_tree;
	}

	// The function returns the given category
	public function get_articles_category($id)
	{
		if (!isset($this->all_articles_categories))
			$this->init_articles_categories();
		if (is_int($id) && array_key_exists(intval($id), $this->all_articles_categories))
			return $category = $this->all_articles_categories[intval($id)];
		elseif (is_string($id))
			foreach ($this->all_articles_categories as $category)
				if ($category->url == $id)
					return $this->get_articles_category((int)$category->id);

		return false;
	}

	// Adding a category
	public function add_articles_category($category)
	{
		$category = (array)$category;
		if (empty($category['url'])) {
			$category['url'] = preg_replace("/[\s]+/ui", '_', $category['name']);
			$category['url'] = strtolower(preg_replace("/[^0-9a-zа-я_]+/ui", '', $category['url']));
		}

		// If there is a category with this URL, add a number to it
		while ($this->get_articles_category((string)$category['url'])) {
			if (preg_match('/(.+)_([0-9]+)$/', $category['url'], $parts))
				$category['url'] = $parts[1] . '_' . ($parts[2] + 1);
			else
				$category['url'] = $category['url'] . '_2';
		}

		$category = (object)$category;

		$result = $this->languages->get_description($category, 'article_category');
		if (!empty($result->data)) $category = $result->data;

		$this->db->query("INSERT INTO __articles_categories SET ?%", $category);
		$id = $this->db->insert_id();
		$this->db->query("UPDATE __articles_categories SET position=id WHERE id=?", $id);

		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'article_category');
		}

		unset($this->articles_categories_tree);
		unset($this->all_articles_categories);
		return intval($id);
	}

	// Change category
	public function update_articles_category($id, $category)
	{
		$category = (object)$category;
		$result = $this->languages->get_description($category, 'article_category');
		if (!empty($result->data)) $category = $result->data;

		$query = $this->db->placehold("UPDATE __articles_categories SET `last_modified`=NOW(), ?% WHERE id=? LIMIT 1", $category, intval($id));
		$this->db->query($query);


		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'article_category', $this->languages->lang_id());
		}

		unset($this->articles_categories_tree);
		unset($this->all_articles_categories);
		return intval($id);
	}

	// Deleting a category
	public function delete_articles_category($id)
	{
		if (!$category = $this->get_articles_category(intval($id)))
			return false;
		foreach ($category->children as $id) {
			if (!empty($id)) {
				$this->delete_image($id);
				$query = $this->db->placehold("DELETE FROM __articles_categories WHERE id=? LIMIT 1", $id);
				$this->db->query($query);
				$this->init_articles_categories();
				$this->db->query($query);
				$this->db->query("DELETE FROM __lang_articles_categories WHERE article_category_id in(?@)", $category->children);
			}
		}
		return true;
	}

	// Delete category image
	public function delete_image($category_id)
	{
		$query = $this->db->placehold("SELECT image FROM __articles_categories WHERE id=?", $category_id);
		$this->db->query($query);
		$filename = $this->db->result('image');
		if (!empty($filename)) {
			$query = $this->db->placehold("UPDATE __articles_categories SET image=NULL WHERE id=?", $category_id);
			$this->db->query($query);
			$query = $this->db->placehold("SELECT count(*) as count FROM __articles_categories WHERE image=? LIMIT 1", $filename);
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
			$this->init_articles_categories();
		}
	}

	// Initialization of categories, after which categories will be selected from a local variable
	private function init_articles_categories()
	{
		// Category tree
		$tree = new stdClass();
		$tree->subcategories = array();

		// Pointers to tree nodes
		$pointers = array();
		$pointers[0] = &$tree;
		$pointers[0]->path = array();

		$lang_sql = $this->languages->get_query(array('object' => 'article_category', 'px' => 'c'));

		// Select all categories
		$query = $this->db->placehold("SELECT c.id, c.parent_id, c.name, c.name_h1, c.description, c.url, c.meta_title, c.meta_keywords, c.meta_description, c.image, c.visible, c.position, c.last_modified, $lang_sql->fields 
										FROM __articles_categories c $lang_sql->join ORDER BY c.parent_id, c.position");

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				$articles_categories = $result; // return data from memcached
			} else {
				$this->db->query($query); // otherwise pull from the database
				$result = $this->db->results();
				$this->cache->set($query, $result); // put into cache
				$articles_categories = $result;
			}
		} else {
			$this->db->query($query);
			$articles_categories = $this->db->results();
		}

		$finish = false;
		// We don't stop until the categories run out, or until none of the remaining ones have anywhere to stick
		while (!empty($articles_categories)  && !$finish) {
			$flag = false;
			// Loop through all selected categories
			foreach ($articles_categories as $k => $category) {
				if (isset($pointers[$category->parent_id])) {
					// Add the current category to the category tree (through the pointer)
					$pointers[$category->id] = $pointers[$category->parent_id]->subcategories[] = $category;

					// Path to the current category
					$curr = $pointers[$category->id];
					$pointers[$category->id]->path = array_merge((array)$pointers[$category->parent_id]->path, array($curr));

					// Remove the used category from the categories array
					unset($articles_categories[$k]);
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
			}
		}
		unset($pointers[0]);
		unset($ids);

		$this->articles_categories_tree = $tree->subcategories;
		$this->all_articles_categories = $pointers;
	}
}
