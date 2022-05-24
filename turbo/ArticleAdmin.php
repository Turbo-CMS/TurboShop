<?php

require_once('api/Turbo.php');

class ArticleAdmin extends Turbo
{
	private $allowed_image_extentions = array('png', 'gif', 'jpg', 'jpeg', 'ico');
	public function fetch()
	{
		$post = new stdClass;
		if ($this->request->method('post')) {
			$post->id = $this->request->post('id', 'integer');
			$post->name = $this->request->post('name');
			$post->date = date('Y-m-d', strtotime($this->request->post('date')));

			$post->visible = $this->request->post('visible', 'boolean');
			$post->category_id = $this->request->post('category_id', 'integer');

			$post->url = trim($this->request->post('url', 'string'));
			$post->meta_title = $this->request->post('meta_title');
			$post->meta_keywords = $this->request->post('meta_keywords');
			$post->meta_description = $this->request->post('meta_description');

			$post->author = $this->request->post('author');

			$post->annotation = $this->request->post('annotation');
			$post->text = $this->request->post('body');

			// Do not allow duplicate section URLs
			if (($a = $this->articles->get_article($post->url)) && $a->id != $post->id) {
				$this->design->assign('message_error', 'url_exists');
			} else {
				if (empty($post->id)) {
					// Last-Modified
					if ($post->category_id > 0) {
						$this->db->query('update __articles_categories set last_modified=now() where id=?', $post->category_id);
					}

					$post->id = $this->articles->add_article($post);
					$post = $this->articles->get_article($post->id);
					$this->design->assign('message_success', 'added');
				} else {
					// Last-Modified                    
					$this->db->query('select category_id from __articles where id=?', $post->id);
					$c_ids = $this->db->results('category_id');
					if (!empty($c_ids)) {
						$this->db->query('update __articles_categories set last_modified=now() where id in(?@)', $c_ids);
					}

					$this->articles->update_article($post->id, $post);
					$post = $this->articles->get_article($post->id);
					$this->design->assign('message_success', 'updated');
				}
				if ($this->request->post('delete_image')) {
					$this->articles->delete_image($post->id);
				}

				$image = $this->request->files('image');
				if (!empty($image['name']) && in_array(strtolower(pathinfo($image['name'], PATHINFO_EXTENSION)), $this->allowed_image_extentions)) {
					$this->articles->delete_image($post->id);
					move_uploaded_file($image['tmp_name'], $this->root_dir . $this->config->articles_images_dir . $image['name']);
					$this->articles->update_article($post->id, array('image' => $image['name']));
				}
				$post = $this->articles->get_article(intval($post->id));
			}
		} else {
			$post->id = $this->request->get('id', 'integer');
			$post = $this->articles->get_article(intval($post->id));
		}

		if (empty($post)) {
			$post = new stdClass;
			$post->date = date($this->settings->date_format, time());
		}

		$this->design->assign('post', $post);

		// Categories
		$articles_categories = $this->articles_categories->get_articles_categories_tree();
		$this->design->assign('articles_categories', $articles_categories);

		return $this->design->fetch('article.tpl');
	}
}
