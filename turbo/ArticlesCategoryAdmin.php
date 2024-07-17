<?php

require_once 'api/Turbo.php';

class ArticlesCategoryAdmin extends Turbo
{
	private $allowedImageExtensions = ['png', 'gif', 'jpg', 'jpeg', 'ico'];

	public function fetch()
	{
		$category = new stdClass();

		if ($this->request->isMethod('post')) {
			$category->id = $this->request->post('id', 'integer');
			$category->parent_id = $this->request->post('parent_id', 'integer');
			$category->name = $this->request->post('name');
			$category->name_h1 = $this->request->post('name_h1');
			$category->visible = $this->request->post('visible', 'boolean');
			$category->url = trim($this->request->post('url', 'string'));
			$category->meta_title = $this->request->post('meta_title');
			$category->meta_keywords = $this->request->post('meta_keywords');
			$category->meta_description = $this->request->post('meta_description');
			$category->description = $this->request->post('description');

			if (($c = $this->articlesCategories->getArticlesCategory($category->url)) && $c->id != $category->id) {
				$this->design->assign('message_error', 'url_exists');
			} elseif (empty($category->name)) {
				$this->design->assign('message_error', 'name_empty');
			} elseif (empty($category->url)) {
				$this->design->assign('message_error', 'url_empty');
			} else {
				if (empty($category->id)) {
					$category->id = $this->articlesCategories->addArticlesCategory($category);
					$this->design->assign('message_success', 'added');
				} else {
					$this->articlesCategories->updateArticlesCategory($category->id, $category);
					$this->design->assign('message_success', 'updated');
				}

				if ($this->request->post('delete_image')) {
					$this->articlesCategories->deleteImage($category->id);
				}

				$image = $this->request->files('image');
				if (!empty($image['name']) && in_array(strtolower(pathinfo($image['name'], PATHINFO_EXTENSION)), $this->allowedImageExtensions)) {
					$this->articlesCategories->deleteImage($category->id);
					move_uploaded_file($image['tmp_name'], $this->root_dir . $this->config->categories_images_dir . $image['name']);
					$this->articlesCategories->updateArticlesCategory($category->id, ['image' => $image['name']]);
				}

				$category = $this->articlesCategories->getArticlesCategory((int) $category->id);
			}
		} else {
			$category->id = $this->request->get('id', 'integer');
			$category = $this->articlesCategories->getArticlesCategory($category->id);
		}

		$articlesCategories = $this->articlesCategories->getArticlesCategoriesTree();

		$this->design->assign('category', $category);
		$this->design->assign('articles_categories', $articlesCategories);

		return $this->design->fetch('articles_category.tpl');
	}
}
