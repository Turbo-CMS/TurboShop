<?php

require_once 'Turbo.php';

class Articles extends Turbo
{
	/**
	 * Get Article
	 */
	public function getArticle($id)
	{
		if (is_int($id)) {
			$where = $this->db->placehold('WHERE a.id=?', (int) $id);
		} else {
			$where = $this->db->placehold('WHERE a.url=?', $id);
		}

		$langSql = $this->languages->getQuery(['object' => 'article', 'px' => 'a']);

		$query = $this->db->placehold(
			"SELECT 
				a.id, 
				a.category_id, 
				a.url, 
				a.name, 
				a.author, 
				a.annotation, 
				a.text, 
				a.rate, 
				a.views,
				a.meta_title, 
				a.meta_keywords, 
				a.meta_description, 
				a.visible, 
				a.date, 
				a.image, 
				a.position,
				a.last_modified, 
				$langSql->fields 
			FROM 
				__articles a 
				$langSql->join 
				$where 
			LIMIT 1"
		);

		if ($this->db->query($query)) {
			return $this->db->result();
		} else {
			return false;
		}
	}

	/**
	 * Get Articles
	 */
	public function getArticles($filter = [])
	{
		$limit = 1000;
		$page = 1;
		$postIdFilter = '';
		$categoryIdFilter = '';
		$visibleFilter = '';
		$keywordFilter = '';
		$authorFilter = '';
		$order = 'a.position DESC';
		$langId = $this->languages->langId();
		$px = ($langId ? 'l' : 'a');

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (!empty($filter['id'])) {
			$postIdFilter = $this->db->placehold('AND a.id IN(?@)', (array) $filter['id']);
		}

		if (!empty($filter['category_id'])) {
			$categoryIdFilter = $this->db->placehold('AND a.category_id IN(?@)', (array) $filter['category_id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND a.visible=?', (int) $filter['visible']);
		}

		if (!empty($filter['sort'])) {
			switch ($filter['sort']) {
				case 'position':
					$order = 'a.position DESC';
					break;
				case 'name':
					$order = 'a.name';
					break;
				case 'date':
					$order = 'a.date DESC, a.id DESC';
					break;
				case 'rate':
					$order = 'a.rate DESC';
					break;
			}
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (' . $px . '.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR ' . $px . '.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		if (isset($filter['author'])) {
			$authors = explode(' ', $filter['author']);
			foreach ($authors as $author) {
				$authorFilter .= $this->db->placehold('AND (' . $px . '.author LIKE "%' . $this->db->escape(trim($author)) . '%") ');
			}
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		$langSql = $this->languages->getQuery(['object' => 'article', 'px' => 'a']);

		$query = $this->db->placehold(
			"SELECT
				a.id, 
				a.category_id, 
				a.url, 
				a.name, 
				a.author, 
				a.annotation, 
				a.text, 
				a.rate, 
				a.views, 
				a.meta_title, 
				a.meta_keywords, 
				a.meta_description, 
				a.image, 
				a.visible, 
				a.date, 
				a.position,
				a.last_modified, 
				$langSql->fields      
			FROM 
				__articles a 
				$langSql->join 
			WHERE 
				1 
				$postIdFilter 
				$categoryIdFilter 
				$visibleFilter 
				$keywordFilter
				$authorFilter 
			ORDER BY 
				$order 
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
	 * Count Articles
	 */
	public function countArticles($filter = [])
	{
		$postIdFilter = '';
		$categoryIdFilter = '';
		$visibleFilter = '';
		$keywordFilter = '';
		$authorFilter = '';

		if (!empty($filter['id'])) {
			$postIdFilter = $this->db->placehold('AND a.id IN(?@)', (array) $filter['id']);
		}

		if (!empty($filter['category_id'])) {
			$categoryIdFilter = $this->db->placehold('AND a.category_id IN(?@)', (array) $filter['category_id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND a.visible=?', (int) $filter['visible']);
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (a.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR a.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		if (isset($filter['author'])) {
			$authors = explode(' ', $filter['author']);
			foreach ($authors as $author) {
				$authorFilter .= $this->db->placehold('AND (a.author LIKE "%' . $this->db->escape(trim($author)) . '%") ');
			}
		}

		$query = $this->db->placehold(
			"SELECT COUNT(DISTINCT a.id) AS count
             FROM __articles a WHERE 1 $postIdFilter $categoryIdFilter $visibleFilter $keywordFilter $authorFilter"
		);

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result;
			}
		}

		if ($this->db->query($query)) {
			$result = $this->db->result('count');

			if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
				$this->cache->set($query, $result);
			}

			return $result;
		} else {
			return false;
		}
	}

	/**
	 * Add Article
	 */
	public function addArticle($article)
	{
		$article = (array) $article;

		if (empty($article['url'])) {
			$article['url'] = preg_replace("/[\s]+/ui", '-', $article['name']);
			$article['url'] = strtolower(preg_replace("/[^0-9a-zа-я\-]+/ui", '', $article['url']));
		}

		while ($this->getArticle((string) $article['url'])) {
			if (preg_match('/(.+)_([0-9]+)$/', $article['url'], $parts)) {
				$article['url'] = $parts[1] . '_' . ($parts[2] + 1);
			} else {
				$article['url'] = $article['url'] . '_2';
			}
		}

		$article = (object) $article;

		$result = $this->languages->getDescription($article, 'article');

		if (!empty($result->data)) {
			$article = $result->data;
		}

		if ($this->db->query("INSERT INTO __articles SET ?%", $article)) {
			$id = $this->db->insertId();
			$this->db->query("UPDATE __articles SET `last_modified`=NOW(), position=id WHERE id=?", $id);

			if (!empty($result->description)) {
				$this->languages->actionDescription($id, $result->description, 'article');
			}

			return $id;
		} else {
			return false;
		}
	}

	/**
	 * Update Article
	 */
	public function updateArticle($id, $post)
	{
		$post = (object)$post;
		$result = $this->languages->getDescription($post, 'article');

		if (!empty($result->data)) {
			$post = $result->data;
		}

		$query = $this->db->placehold("UPDATE __articles SET `last_modified` = NOW(), ?% WHERE id IN(?@) LIMIT ?", $post, (array) $id, count((array) $id));

		if ($this->db->query($query)) {
			if (!empty($result->description)) {
				$this->languages->actionDescription($id, $result->description, 'article', $this->languages->langId());
			}
			return $id;
		} else {
			return false;
		}
	}

	/**
	 * Update Views
	 */
	public function updateViews($id)
	{
		$this->db->query("UPDATE __articles SET views=views+1 WHERE id=?", $id);

		return true;
	}

	/**
	 * Delete Article
	 */
	public function deleteArticle($id)
	{
		if (!empty($id)) {
			$this->deleteImage($id);
			$query = $this->db->placehold("DELETE FROM __articles WHERE id=? LIMIT 1", (int) $id);

			if ($this->db->query($query)) {
				$query = $this->db->placehold("DELETE FROM __lang_articles WHERE article_id=?", (int) $id);
				$this->db->query($query);

				$query = $this->db->placehold("DELETE FROM __comments WHERE type = 'article' AND object_id=?", (int) $id);
				$this->db->query($query);

				return true;
			}
		}
		return false;
	}

	/**
	 * Delete Image
	 */
	public function deleteImage($articleId)
	{
		$query = $this->db->placehold("SELECT image FROM __articles WHERE id=?", (int) $articleId);

		if ($this->db->query($query)) {
			$filenames = $this->db->results('image');
		}

		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __articles SET image = NULL WHERE id=?", $articleId);
			$this->db->query($query);

			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT count(*) AS count FROM __articles WHERE image=? LIMIT 1", $filename);
				$this->db->query($query);
				$count = $this->db->result('count');

				if ($count == 0) {
					$file = pathinfo($filename, PATHINFO_FILENAME);
					$ext = pathinfo($filename, PATHINFO_EXTENSION);
					$webp = 'webp';

					$resizedImages = glob($this->config->root_dir . $this->config->resized_articles_images_dir . $file . "*." . $ext);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								unlink($f);
							}
						}
					}

					$resizedImages = glob($this->config->root_dir . $this->config->resized_articles_images_dir . $file . "*." . $webp);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								unlink($f);
							}
						}
					}

					unlink($this->config->root_dir . $this->config->articles_images_dir . $filename);
				}
			}
		}
	}

	/**
	 * Get Next Article
	 */
	public function getNextArticle($id)
	{
		$this->db->query("SELECT date FROM __articles WHERE id=? LIMIT 1", $id);
		$date = $this->db->result('date');

		$this->db->query("SELECT category_id FROM __articles WHERE id=? LIMIT 1", $id);
		$categoryId = $this->db->result('category_id');

		$this->db->query(
			"(SELECT id FROM __articles WHERE date=? AND id>? AND visible ORDER BY id LIMIT 1)
        	UNION
        	(SELECT id FROM __articles WHERE date>? AND category_id=? AND visible ORDER BY date, id LIMIT 1)",
			$date,
			$id,
			$date,
			$categoryId
		);

		$nextId = $this->db->result('id');

		if ($nextId) {
			return $this->getArticle((int) $nextId);
		}

		return false;
	}

	/**
	 * Get Prev Article
	 */
	public function getPrevArticle(int $id)
	{
		$this->db->query("SELECT date FROM __articles WHERE id=? LIMIT 1", $id);
		$date = $this->db->result('date');

		$this->db->query("SELECT category_id FROM __articles WHERE id=? LIMIT 1", $id);
		$categoryId = $this->db->result('category_id');

		$this->db->query(
			"(SELECT id FROM __articles WHERE date=? AND id<? AND visible ORDER BY id DESC LIMIT 1)
			UNION
			(SELECT id FROM __articles WHERE date<? AND category_id=? AND visible ORDER BY date DESC, id DESC LIMIT 1)",
			$date,
			$id,
			$date,
			$categoryId
		);

		$prevId = $this->db->result('id');

		if ($prevId) {
			return $this->getArticle((int) $prevId);
		}

		return false;
	}
}
