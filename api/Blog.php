<?php

require_once 'Turbo.php';

class Blog extends Turbo
{
	/**
	 * Get post
	 */
	public function getPost($id)
	{
		if (is_int($id)) {
			$where = $this->db->placehold('WHERE b.id=?', (int) $id);
		} else {
			$where = $this->db->placehold('WHERE b.url=?', $id);
		}

		$langSql = $this->languages->getQuery(['object' => 'blog']);

		$query = $this->db->placehold(
			"SELECT 
				b.id,
				b.url,
				b.name,
				b.annotation,
				b.text,
				b.rate,
				b.views,
				b.meta_title,
				b.meta_keywords,
				b.meta_description,
				b.visible,
				b.date,
				b.image,
				b.last_modified,
				$langSql->fields
			FROM 
				__blog b 
				$langSql->join 
				$where 
			LIMIT 
				1"
		);

		if ($this->db->query($query)) {
			return $this->db->result();
		} else {
			return false;
		}
	}

	/**
	 * Get posts
	 */
	public function getPosts($filter = [])
	{
		$limit = 1000;
		$page = 1;
		$postIdFilter = '';
		$visibleFilter = '';
		$keywordFilter = '';
		$order = 'b.date DESC';

		$langId = $this->languages->langId();
		$px = ($langId ? 'l' : 'b');

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (!empty($filter['id'])) {
			$postIdFilter = $this->db->placehold('AND b.id IN(?@)', (array) $filter['id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND b.visible=?', (int) $filter['visible']);
		}

		if (!empty($filter['sort'])) {
			switch ($filter['sort']) {
				case 'date':
					$order = 'b.date DESC';
					break;
				case 'rate':
					$order = 'b.rate DESC';
					break;
			}
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (' . $px . '.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR ' . $px . '.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		$langSql = $this->languages->getQuery(['object' => 'blog']);

		$query = $this->db->placehold(
			"SELECT
				b.id,
				b.url,
				b.name,
				b.annotation,
				b.text,
				b.views,
				b.rate,
				b.meta_title,
				b.meta_keywords,
				b.meta_description,
				b.visible,
				b.date,
				b.image,
				b.last_modified,
				$langSql->fields
			FROM
				__blog b 
				$langSql->join
			WHERE
				1
				$postIdFilter
				$visibleFilter
				$keywordFilter
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
	 * Count posts
	 */
	public function countPosts($filter = [])
	{
		$postIdFilter = '';
		$visibleFilter = '';
		$keywordFilter = '';

		if (!empty($filter['id'])) {
			$postIdFilter = $this->db->placehold('AND b.id IN(?@)', (array) $filter['id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND b.visible=?', (int) $filter['visible']);
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (b.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR b.meta_keywords LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		$query = $this->db->placehold(
			"SELECT COUNT(DISTINCT b.id) AS count
			FROM __blog b
			WHERE 1 $postIdFilter $visibleFilter $keywordFilter"
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
	 * Add a post 
	 */
	public function addPost($post)
	{
		if (!isset($post->date)) {
			$dateQuery = ', date=NOW()';
		} else {
			$dateQuery = '';
		}

		$post = (object) $post;
		$result = $this->languages->getDescription($post, 'blog');

		if (!empty($result->data)) {
			$post = $result->data;
		}

		$this->settings->lastModifyPosts = date("Y-m-d H:i:s");
		$query = $this->db->placehold("INSERT INTO __blog SET `last_modified`=NOW(), ?% $dateQuery", $post);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'blog');
		}

		return $id;
	}

	/**
	 * Update post.
	 */
	public function updatePost($id, $post)
	{
		$post = (object) $post;

		$result = $this->languages->getDescription($post, 'blog');
		if (!empty($result->data)) {
			$post = $result->data;
		}

		$this->settings->lastModifyPosts = date("Y-m-d H:i:s");

		$query = $this->db->placehold("UPDATE __blog SET `last_modified` = NOW(), ?% WHERE id IN (?@) LIMIT ?", $post, (array) $id, count((array) $id));
		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'blog', $this->languages->langId());
		}

		return $id;
	}

	/**
	 * Update view
	 */
	public function updateViews($id)
	{
		$this->db->query("UPDATE __blog SET views=views+1 WHERE id=?", $id);

		return true;
	}

	/**
	 * Delete post
	 */
	public function deletePost($id)
	{
		if (!empty($id)) {
			$this->deleteImage($id);
			$query = $this->db->placehold("DELETE FROM __blog WHERE id=? LIMIT 1", (int) $id);

			if ($this->db->query($query)) {
				$this->db->query("DELETE FROM __lang_blog WHERE blog_id=?", (int) $id);

				$query = $this->db->placehold("DELETE FROM __comments WHERE type='blog' AND object_id=?", (int) $id);

				if ($this->db->query($query)) {
					return true;
				}
			}
		}

		return false;
	}

	/**
	 * Delete image
	 */
	public function deleteImage($postId)
	{
		$query = $this->db->placehold("SELECT image FROM __blog WHERE id=?", (int) $postId);

		if ($this->db->query($query)) {
			$filenames = $this->db->results('image');
		}

		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __blog SET image = NULL WHERE id=?", $postId);
			$this->db->query($query);

			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT count(*) AS count FROM __blog WHERE image=? LIMIT 1", $filename);
				$this->db->query($query);

				$count = $this->db->result('count');

				if ($count == 0) {
					$file = pathinfo($filename, PATHINFO_FILENAME);
					$ext = pathinfo($filename, PATHINFO_EXTENSION);
					$webp = 'webp';

					$resizedImages = glob($this->config->root_dir . $this->config->resized_posts_images_dir . $file . "*." . $ext);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								unlink($f);
							}
						}
					}

					$resizedImages = glob($this->config->root_dir . $this->config->resized_posts_images_dir . $file . "*." . $webp);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								unlink($f);
							}
						}
					}

					unlink($this->config->root_dir . $this->config->posts_images_dir . $filename);
				}
			}
		}
	}

	/**
	 * Get next post
	 */
	public function getNextPost($id)
	{
		$this->db->query("SELECT date FROM __blog WHERE id=? LIMIT 1", $id);
		$date = $this->db->result('date');

		$this->db->query(
			"(SELECT id FROM __blog WHERE date=? AND id>? AND visible  ORDER BY id limit 1)
		    UNION
		    (SELECT id FROM __blog WHERE date>? AND visible ORDER BY date, id limit 1)",
			$date,
			$id,
			$date
		);

		$nextId = $this->db->result('id');
		
		if ($nextId) {
			return $this->getPost((int) $nextId);
		} else {
			return false;
		}
	}

	/**
	 * Get previous post
	 */
	public function getPrevPost($id)
	{
		$this->db->query("SELECT date FROM __blog WHERE id=? LIMIT 1", $id);
		$date = $this->db->result('date');

		$this->db->query(
			"(SELECT id FROM __blog WHERE date=? AND id<? AND visible ORDER BY id DESC limit 1)
		    UNION
		    (SELECT id FROM __blog WHERE date<? AND visible ORDER BY date DESC, id DESC limit 1)",
			$date,
			$id,
			$date
		);

		$prevId = $this->db->result('id');

		if ($prevId) {
			return $this->getPost((int) $prevId);
		} else {
			return false;
		}
	}
}
