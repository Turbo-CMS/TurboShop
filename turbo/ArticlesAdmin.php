<?php

require_once('api/Turbo.php');

class ArticlesAdmin extends Turbo
{
	public function fetch()
	{
		// Action processing
		if ($this->request->method('post')) {

			// Sorting
			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);
			$positions = array_reverse($positions);
			foreach ($positions as $i => $position)
				$this->articles->update_article($ids[$i], array('position' => $position));

			// Actions with selected
			$ids = $this->request->post('check');
			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'disable': {
							$this->articles->update_article($ids, array('visible' => 0));
							break;
						}
					case 'enable': {
							$this->articles->update_article($ids, array('visible' => 1));
							break;
						}
					case 'delete': {
							foreach ($ids as $id)
								$this->articles->delete_article($id);
							break;
						}
				}
		}

		$filter = array();
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = $this->settings->articles_num_admin;

		// Current filter
		if ($f = $this->request->get('filter', 'string')) {

			if ($f == 'visible')
				$filter['visible'] = 1;
			elseif ($f == 'hidden')
				$filter['visible'] = 0;
			$this->design->assign('filter', $f);
		}

		// Categories
		$articles_categories = $this->articles_categories->get_articles_categories_tree();
		$this->design->assign('articles_categories', $articles_categories);

		// Current category
		$category_id = $this->request->get('category_id', 'integer');
		$category = $this->articles_categories->get_articles_category($category_id);
		$this->design->assign('category', $category);
		if ($category_id && $category)
			$filter['category_id'] = $category->children;

		// Search
		$keyword = $this->request->get('keyword', 'string');
		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		$posts_count = $this->articles->count_articles($filter);
		
		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$filter['limit'] = $posts_count;

		$posts = $this->articles->get_articles($filter);
		$this->design->assign('posts_count', $posts_count);

		$this->design->assign('pages_count', ceil($posts_count / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);

		$this->design->assign('posts', $posts);
		return $this->design->fetch('articles.tpl');
	}
}
