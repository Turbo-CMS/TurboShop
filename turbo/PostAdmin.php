<?php

require_once 'api/Turbo.php';

class PostAdmin extends Turbo
{
	private $allowedImageExtensions = ['png', 'gif', 'jpg', 'jpeg', 'ico'];

	public function fetch()
	{
		$post = new stdClass();

		if ($this->request->isMethod('post')) {
			$post->id = $this->request->post('id', 'integer');
			$post->name = $this->request->post('name');
			$post->date = date('Y-m-d', strtotime($this->request->post('date')));
			$post->visible = $this->request->post('visible', 'boolean');
			$post->url = $this->request->post('url', 'string');
			$post->meta_title = $this->request->post('meta_title');
			$post->meta_keywords = $this->request->post('meta_keywords');
			$post->meta_description = $this->request->post('meta_description');
			$post->annotation = $this->request->post('annotation');
			$post->text = $this->request->post('body');

			if (($a = $this->blog->getPost($post->url)) && $a->id != $post->id) {
				$this->design->assign('message_error', 'url_exists');
			} else {
				if (empty($post->id)) {
					$post->id = $this->blog->addPost($post);
					$post = $this->blog->getPost($post->id);
					$this->design->assign('message_success', 'added');
				} else {
					$this->blog->updatePost($post->id, $post);
					$post = $this->blog->getPost($post->id);
					$this->design->assign('message_success', 'updated');
				}

				if ($this->request->post('delete_image')) {
					$this->blog->deleteImage($post->id);
				}

				$image = $this->request->files('image');

				if (!empty($image['name']) && in_array(strtolower(pathinfo($image['name'], PATHINFO_EXTENSION)), $this->allowedImageExtensions)) {
					$this->blog->deleteImage($post->id);
					move_uploaded_file($image['tmp_name'], $this->root_dir . $this->config->posts_images_dir . $image['name']);
					$this->blog->updatePost($post->id, ['image' => $image['name']]);
				}

				$post = $this->blog->getPost((int) $post->id);
			}
		} else {
			$post->id = $this->request->get('id', 'integer');
			$post = $this->blog->getPost((int) $post->id);
		}

		if (empty($post)) {
			$post = new stdClass();
			$post->date = date($this->settings->date_format, time());
		}

		$this->design->assign('post', $post);

		return $this->design->fetch('post.tpl');
	}
}
