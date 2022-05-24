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

class FAQsAdmin extends Turbo
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
				$this->faq->update_faq($ids[$i], array('position' => $position));

			// Actions with selected
			$ids = $this->request->post('check');
			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'disable': {
							$this->faq->update_faq($ids, array('visible' => 0));
							break;
						}
					case 'enable': {
							$this->faq->update_faq($ids, array('visible' => 1));
							break;
						}
					case 'delete': {
							foreach ($ids as $id)
								$this->faq->delete_faq($id);
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

		$faqs_count = $this->faq->count_faqs($filter);
		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$filter['limit'] = $faqs_count;

		$faqs = $this->faq->get_faqs($filter);
		$this->design->assign('faqs_count', $faqs_count);

		$this->design->assign('pages_count', ceil($faqs_count / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);

		$this->design->assign('faqs', $faqs);
		return $this->design->fetch('faqs.tpl');
	}
}
