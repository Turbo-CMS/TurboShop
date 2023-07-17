<?php

require_once 'api/Turbo.php';

class ArticlesAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->isMethod('post')) {
			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);
			$positions = array_reverse($positions);

			foreach ($positions as $i => $position) {
				$this->articles->updateArticle($ids[$i], ['position' => $position]);
			}

			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'disable':
						$this->articles->updateArticle($ids, ['visible' => 0]);
						break;
					case 'enable':
						$this->articles->updateArticle($ids, ['visible' => 1]);
						break;
					case 'delete':
						foreach ($ids as $id) {
							$this->articles->deleteArticle($id);
						}
						break;
				}
			}
		}

		$filter = ['page' => max(1, $this->request->get('page', 'integer')), 'limit' => $this->settings->articles_num_admin];
		$f = $this->request->get('filter', 'string');

		if ($f) {
			if ($f == 'visible') {
				$filter['visible'] = 1;
			} elseif ($f == 'hidden') {
				$filter['visible'] = 0;
			}

			$this->design->assign('filter', $f);
		}

		$articlesCategories = $this->articlesCategories->getArticlesCategoriesTree();
		$this->design->assign('articles_categories', $articlesCategories);

		$categoryId = $this->request->get('category_id', 'integer');
		$category = $this->articlesCategories->getArticlesCategory($categoryId);

		$this->design->assign('category', $category);

		if ($categoryId && $category) {
			$filter['category_id'] = $category->children;
		}

		$keyword = $this->request->get('keyword', 'string');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		$postsCount = $this->articles->countArticles($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $postsCount;
		}

		$posts = $this->articles->getArticles($filter);

		$this->design->assign('posts_count', $postsCount);
		$this->design->assign('pages_count', ceil($postsCount / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);
		$this->design->assign('posts', $posts);

		return $this->design->fetch('articles.tpl');
	}
}
