<?php

require_once('api/Turbo.php');

########################################
class FeedbacksAdmin extends Turbo
{

	function fetch()
	{

		// Action processing 	
		if ($this->request->method('post')) {
			// Actions with selected
			$ids = $this->request->post('check');
			if (!empty($ids))
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id)
								$this->feedbacks->delete_feedback($id);
							break;
						}
					case 'processed': {
							foreach ($ids as $id)
								$this->feedbacks->update_feedback($id, array('processed' => 1));
							break;
						}
				}
		}

		// Display
		$filter = array();
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = 40;

		// Search
		$keyword = $this->request->get('keyword', 'string');
		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		$feedbacks_count = $this->feedbacks->count_feedbacks($filter);
		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$filter['limit'] = $feedbacks_count;

		$feedbacks = $this->feedbacks->get_feedbacks($filter, true);

		$this->design->assign('pages_count', ceil($feedbacks_count / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);

		$this->design->assign('feedbacks', $feedbacks);
		$this->design->assign('feedbacks_count', $feedbacks_count);

		return $this->design->fetch('feedbacks.tpl');
	}
}
