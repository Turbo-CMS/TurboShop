<?php

require_once 'api/Turbo.php';

class CategoryAdmin extends Turbo
{
	private $allowedImageExtentions = ['png', 'gif', 'jpg', 'jpeg', 'ico', 'svg'];

	public function fetch()
	{
		$category = new stdClass();

		if ($this->request->isMethod('post')) {
			$category->id = $this->request->post('id', 'integer');
			$category->parent_id = $this->request->post('parent_id', 'integer');
			$category->name = $this->request->post('name');
			$category->name_h1 = $this->request->post('name_h1');
			$category->code = $this->request->post('code');
			$category->visible = $this->request->post('visible', 'boolean');
			$category->featured = $this->request->post('featured', 'boolean');
			$category->url = trim($this->request->post('url', 'string'));
			$category->meta_title = $this->request->post('meta_title');
			$category->meta_keywords = $this->request->post('meta_keywords');
			$category->meta_description = $this->request->post('meta_description');
			$category->description = $this->request->post('description');

			if (($c = $this->categories->getCategory($category->url)) && $c->id != $category->id) {
				$this->design->assign('message_error', 'url_exists');
			} elseif (empty($category->name)) {
				$this->design->assign('message_error', 'name_empty');
			} elseif (empty($category->url)) {
				$this->design->assign('message_error', 'url_empty');
			} else {
				if (empty($category->id)) {
					$category->id = $this->categories->addCategory($category);
					$this->design->assign('message_success', 'added');
				} else {
					$this->categories->updateCategory($category->id, $category);
					$this->design->assign('message_success', 'updated');
				}

				if ($this->request->post('delete_image')) {
					$this->categories->deleteImage($category->id);
				}

				if ($this->request->post('delete_icon')) {
					$this->categories->deleteIcon($category->id);
				}

				$image = $this->request->files('image');

				if (!empty($image['name']) && in_array(strtolower(pathinfo($image['name'], PATHINFO_EXTENSION)), $this->allowedImageExtentions)) {
					$this->categories->deleteImage($category->id);
					move_uploaded_file($image['tmp_name'], $this->root_dir . $this->config->categories_images_dir . $image['name']);
					$this->categories->updateCategory($category->id, ['image' => $image['name']]);
				}

				$icon = $this->request->files('icon');

				if (!empty($icon['name']) && in_array(strtolower(pathinfo($icon['name'], PATHINFO_EXTENSION)), $this->allowedImageExtentions)) {
					$this->categories->deleteIcon($category->id);
					move_uploaded_file($icon['tmp_name'], $this->root_dir . $this->config->categories_images_dir . $icon['name']);
					$this->categories->updateCategory($category->id, ['icon' => $icon['name']]);
				}

				$category = $this->categories->getCategory((int) $category->id);
			}
		} else {
			$category->id = $this->request->get('id', 'integer');
			$category = $this->categories->getCategory($category->id);
		}

		$categories = $this->categories->getCategoriesTree();

		$this->design->assign('category', $category);
		$this->design->assign('categories', $categories);

		return  $this->design->fetch('category.tpl');
	}
}
