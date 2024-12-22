<?php

require_once 'api/Turbo.php';

class ArticlesCategoriesAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'disable':
						foreach ($ids as $id) {
							$this->articles_categories->updateArticlesCategory($id, ['visible' => 0]);
						}
						break;
					case 'enable':
						foreach ($ids as $id) {
							$this->articles_categories->updateArticlesCategory($id, ['visible' => 1]);
						}
						break;
					case 'delete':
						foreach ($ids as $id) {
							$this->articlesCategories->deleteArticlesCategory($id);
						}
						break;
				}
			}

			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);

			foreach ($positions as $i => $position) {
				$this->articlesCategories->updateArticlesCategory($ids[$i], ['position' => $position]);
			}
		}

		$articlesCategories = $this->articlesCategories->getArticlesCategoriesTree();
		$this->design->assign('articles_categories', $articlesCategories);

		return $this->design->fetch('articles_categories.tpl');
	}
}
