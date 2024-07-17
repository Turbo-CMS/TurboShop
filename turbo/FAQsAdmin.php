<?php

require_once 'api/Turbo.php';

class FAQsAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->isMethod('post')) {
			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);
			$positions = array_reverse($positions);

			foreach ($positions as $i => $position) {
				$this->faq->updateFaq($ids[$i], ['position' => $position]);
			}

			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'disable':
						$this->faq->updateFaq($ids, ['visible' => 0]);
						break;
					case 'enable':
						$this->faq->update_faq($ids, ['visible' => 1]);
						break;
					case 'delete':
						foreach ($ids as $id) {
							$this->faq->deleteFaq($id);
						}
						break;
				}
			}
		}

		$filter = ['page' => max(1, $this->request->get('page', 'integer')), 'limit' => $this->settings->faq_num_admin,];

		$keyword = $this->request->get('keyword', 'string');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		$faqsCount = $this->faq->countFaqs($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $faqsCount;
		}

		$faqs = $this->faq->getFaqs($filter);

		$this->design->assign('faqs_count', $faqsCount);
		$this->design->assign('pages_count', ceil($faqsCount / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);
		$this->design->assign('faqs', $faqs);

		return $this->design->fetch('faqs.tpl');
	}
}
