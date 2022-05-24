<?php

/**
 * Turbo CMS
 *
 * @copyright	Turbo CMS
 * @link		https://turbo-cms.com
 * @author		Turbo CMS
 *
 */

require_once('api/Turbo.php');

class BlogAdmin extends Turbo
{
	public function fetch()
	{
		// Action processing
		if ($this->request->method('post')) {
			// Actions with selected
			$ids = $this->request->post('check');
			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'disable': {
							$this->blog->update_post($ids, array('visible' => 0));
							break;
						}
					case 'enable': {
							$this->blog->update_post($ids, array('visible' => 1));
							break;
						}
					case 'delete': {
							foreach ($ids as $id)
								$this->blog->delete_post($id);
							break;
						}
				}
		}

		$filter = array();
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = $this->settings->blog_num_admin;

		// Search
		$keyword = $this->request->get('keyword', 'string');
		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		$posts_count = $this->blog->count_posts($filter);
		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$filter['limit'] = $posts_count;

		$posts = $this->blog->get_posts($filter);
		$this->design->assign('posts_count', $posts_count);

		$this->design->assign('pages_count', ceil($posts_count / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);

		$this->design->assign('posts', $posts);
		return $this->design->fetch('blog.tpl');
	}
}
