<?php

require_once 'api/Turbo.php';

class FeedbacksAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$ids = $this->request->post('check');
			if (!empty($ids)) {
				switch ($this->request->post('action')) {
					case 'delete':
						foreach ($ids as $id) {
							$this->feedbacks->deleteFeedback($id);
						}
						break;
					case 'processed':
						foreach ($ids as $id) {
							$this->feedbacks->updateFeedback($id, ['processed' => 1]);
						}
						break;
				}
			}
		}

		$filter = ['page' => max(1, $this->request->get('page', 'integer')), 'limit' => 40,];

		$keyword = $this->request->get('keyword', 'string');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		$feedbacksCount = $this->feedbacks->countFeedbacks($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $feedbacksCount;
		}

		$feedbacks = $this->feedbacks->getFeedbacks($filter, true);

		$this->design->assign('pages_count', ceil($feedbacksCount / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);

		$this->design->assign('feedbacks', $feedbacks);
		$this->design->assign('feedbacks_count', $feedbacksCount);

		return $this->design->fetch('feedbacks.tpl');
	}
}
