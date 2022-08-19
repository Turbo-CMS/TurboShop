<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Articles extends Turbo
{
	/*
	*
	* The function returns an article by its id or url
	* (depending on the argument type, int - id, string - url)
	* @param $id article id or url
	*
	*/
	public function get_article($id)
	{
		if (is_int($id))
			$where = $this->db->placehold(' WHERE b.id=? ', intval($id));
		else
			$where = $this->db->placehold(' WHERE b.url=? ', $id);

		$lang_sql = $this->languages->get_query(array('object' => 'article', 'px' => 'b'));

		$query = $this->db->placehold("SELECT b.id, b.category_id, b.url, b.name, b.author, b.annotation, b.text, b.rate, b.views, b.meta_title,
		                               b.meta_keywords, b.meta_description, b.visible, b.date, b.image, b.position, b.last_modified, $lang_sql->fields
		                               FROM __articles b $lang_sql->join $where LIMIT 1");
		if ($this->db->query($query))
			return $this->db->result();
		else
			return false;
	}

	/*
	*
	* The function returns an array of articles matching the filter
	* @param $filter
	*
	*/
	public function get_articles($filter = array())
	{
		// Default
		$limit = 1000;
		$page = 1;
		$post_id_filter = '';
		$category_id_filter = '';
		$visible_filter = '';
		$keyword_filter = '';
		$order = 'b.position DESC';
		$posts = array();

		$lang_id  = $this->languages->lang_id();
		$px = ($lang_id ? 'l' : 'b');

		if (isset($filter['limit']))
			$limit = max(1, intval($filter['limit']));

		if (isset($filter['page']))
			$page = max(1, intval($filter['page']));

		if (!empty($filter['id']))
			$post_id_filter = $this->db->placehold('AND b.id in(?@)', (array)$filter['id']);

		if (!empty($filter['category_id'])) {
			$category_id_filter = $this->db->placehold('AND b.category_id in(?@)', (array)$filter['category_id']);
		}

		if (isset($filter['visible']))
			$visible_filter = $this->db->placehold('AND b.visible = ?', intval($filter['visible']));

		if (!empty($filter['sort']))
			switch ($filter['sort']) {
				case 'position':
					$order = 'b.position DESC';
					break;
				case 'name':
					$order = 'b.name';
					break;
				case 'date':
					$order = 'b.date DESC,b.id DESC';
					break;
				case 'rate':
					$order = 'b.rate DESC';
					break;
			}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND (' . $px . '.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR ' . $px . '.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
		}

		$sql_limit = $this->db->placehold(' LIMIT ?, ? ', ($page - 1) * $limit, $limit);

		$lang_sql = $this->languages->get_query(array('object' => 'article', 'px' => 'b'));

		$query = $this->db->placehold("SELECT b.id, b.category_id, b.url, b.name, b.author, b.annotation, b.text, b.rate, b.views,
		                                      b.meta_title, b.meta_keywords, b.meta_description, b.image, b.visible,
		                                      b.date, b.position, b.last_modified, $lang_sql->fields
		                                      FROM __articles b $lang_sql->join WHERE 1 $post_id_filter $category_id_filter $visible_filter $keyword_filter
		                                      ORDER BY $order $sql_limit");

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result; // return data from memcached
			} else {
				$this->db->query($query); // otherwise pull from the database
				$result = $this->db->results();
				$this->cache->set($query, $result); // put into cache
				return $result;
			}
		} else {
			$this->db->query($query);
			return $this->db->results();
		}
	}

	/*
	*
	* The function calculates the number of articles that match the filter 
	* @param $filter
	*
	*/
	public function count_articles($filter = array())
	{
		$post_id_filter = '';
		$category_id_filter = '';
		$visible_filter = '';
		$keyword_filter = '';

		if (!empty($filter['id']))
			$post_id_filter = $this->db->placehold('AND b.id in(?@)', (array)$filter['id']);

		if (!empty($filter['category_id'])) {
			$category_id_filter = $this->db->placehold('AND b.category_id in(?@)', (array)$filter['category_id']);
		}

		if (isset($filter['visible']))
			$visible_filter = $this->db->placehold('AND b.visible = ?', intval($filter['visible']));

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND (b.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR b.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
		}

		$query = "SELECT COUNT(distinct b.id) as count
		          FROM __articles b WHERE 1 $post_id_filter $category_id_filter $visible_filter $keyword_filter";

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result; // return data from memcached
			} else {
				if ($this->db->query($query)) {
					$result = $this->db->result('count');
					$this->cache->set($query, $result); // put into cache
					return $result;
				} else
					return false;
			}
		} else {
			if ($this->db->query($query))
				return $this->db->result('count');
			else
				return false;
		}
	}

	/*
	*
	* Article creation
	* @param $article
	*
	*/
	public function add_article($article)
	{
		$article = (array) $article;

		if (empty($article['url'])) {
			$article['url'] = preg_replace("/[\s]+/ui", '-', $article['name']);
			$article['url'] = strtolower(preg_replace("/[^0-9a-zа-я\-]+/ui", '', $article['url']));
		}

		// If there is an article with this URL, add a number to it
		while ($this->get_article((string)$article['url'])) {
			if (preg_match('/(.+)_([0-9]+)$/', $article['url'], $parts))
				$article['url'] = $parts[1] . '_' . ($parts[2] + 1);
			else
				$article['url'] = $article['url'] . '_2';
		}

		$article = (object)$article;
		$result = $this->languages->get_description($article, 'article');
		if (!empty($result->data)) $article = $result->data;

		if ($this->db->query("INSERT INTO __articles SET ?%", $article)) {
			$id = $this->db->insert_id();
			$this->db->query("UPDATE __articles SET `last_modified`=NOW(), position=id WHERE id=?", $id);

			if (!empty($result->description)) {
				$this->languages->action_description($id, $result->description, 'article');
			}
			return $id;
		} else
			return false;
	}

	/*
	*
	* Update article
	* @param $post
	*
	*/
	public function update_article($id, $post)
	{
		$post = (object)$post;
		$result = $this->languages->get_description($post, 'article');
		if (!empty($result->data)) $post = $result->data;

		$query = $this->db->placehold("UPDATE __articles SET `last_modified`=NOW(), ?% WHERE id in(?@) LIMIT ?", $post, (array)$id, count((array)$id));
		if ($this->db->query($query)) {
			if (!empty($result->description)) {
				$this->languages->action_description($id, $result->description, 'article', $this->languages->lang_id());
			}
			return $id;
		} else
			return false;
	}

	/**
	 * The function contributes +1 to the article view
	 * @param $id
	 * @retval object
	 */
	public function update_views($id)
	{
		$this->db->query("UPDATE __articles SET views=views+1 WHERE id=?", $id);
		return true;
	}

	/*
	*
	* Delete article
	* @param $id
	*
	*/
	public function delete_article($id)
	{
		if (!empty($id)) {
			$this->delete_image($id);
			$query = $this->db->placehold("DELETE FROM __articles WHERE id=? LIMIT 1", intval($id));
			if ($this->db->query($query)) {
				// Remove languages
				$query = $this->db->placehold("DELETE FROM __lang_articles WHERE article_id=?", intval($id));
				$this->db->query($query);

				// Remove comments
				$query = $this->db->placehold("DELETE FROM __comments WHERE type='article' AND object_id=? LIMIT 1", intval($id));
				if ($this->db->query($query))
					return true;
			}
		}
		return false;
	}

	public function delete_image($article_id)
	{
		$query = $this->db->placehold("SELECT image FROM __articles WHERE id=?", intval($article_id));
		$this->db->query($query);
		$filename = $this->db->result('image');
		if (!empty($filename)) {
			$query = $this->db->placehold("UPDATE __articles SET image=NULL WHERE id=?", $article_id);
			$this->db->query($query);
			$query = $this->db->placehold("SELECT count(*) as count FROM __articles WHERE image=? LIMIT 1", $filename);
			$this->db->query($query);
			$count = $this->db->result('count');
			if ($count == 0) {
				$file = pathinfo($filename, PATHINFO_FILENAME);
				$ext = pathinfo($filename, PATHINFO_EXTENSION);
				$webp = 'webp';

				// Remove all resizes
				$rezised_images = glob($this->config->root_dir . $this->config->resized_articles_images_dir . $file . "*." . $ext);
				if (is_array($rezised_images)) {
					foreach (glob($this->config->root_dir . $this->config->resized_articles_images_dir . $file . "*." . $ext) as $f) {
						@unlink($f);
					}
				}

				$rezised_images = glob($this->config->root_dir . $this->config->resized_articles_images_dir . $file . "*." . $webp);
				if (is_array($rezised_images)) {
					foreach (glob($this->config->root_dir . $this->config->resized_articles_images_dir . $file . "*." . $webp) as $f) {
						@unlink($f);
					}
				}

				@unlink($this->config->root_dir . $this->config->articles_images_dir . $filename);
			}
		}
	}

	/*
	*
	* Next article
	* @param $post
	*
	*/
	public function get_next_article($id)
	{
		$this->db->query("SELECT date FROM __articles WHERE id=? LIMIT 1", $id);
		$date = $this->db->result('date');
		$this->db->query("SELECT category_id FROM __articles WHERE id=? LIMIT 1", $id);
		$category_id = $this->db->result('category_id');

		$this->db->query(
			"(SELECT id FROM __articles WHERE date=? AND id>? AND visible  ORDER BY id limit 1)
		                   UNION
		                  (SELECT id FROM __articles WHERE date>? AND category_id=? AND visible ORDER BY date, id limit 1)",
			$date,
			$id,
			$date,
			$category_id
		);
		$next_id = $this->db->result('id');
		if ($next_id)
			return $this->get_article(intval($next_id));
		else
			return false;
	}

	/*
	*
	* Previous article
	* @param $post
	*
	*/
	public function get_prev_article($id)
	{
		$this->db->query("SELECT date FROM __articles WHERE id=? LIMIT 1", $id);
		$date = $this->db->result('date');
		$this->db->query("SELECT category_id FROM __articles WHERE id=? LIMIT 1", $id);
		$category_id = $this->db->result('category_id');

		$this->db->query(
			"(SELECT id FROM __articles WHERE date=? AND id<? AND visible ORDER BY id DESC limit 1)
		                   UNION
		                  (SELECT id FROM __articles WHERE date<? AND category_id=? AND visible ORDER BY date DESC, id DESC limit 1)",
			$date,
			$id,
			$date,
			$category_id
		);
		$prev_id = $this->db->result('id');
		if ($prev_id)
			return $this->get_article(intval($prev_id));
		else
			return false;
	}
}
