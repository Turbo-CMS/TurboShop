<?php

require_once 'api/Turbo.php';

class FAQAdmin extends Turbo
{
	public function fetch()
	{
		$faq = new stdClass();

		if ($this->request->method('post')) {
			$faq->id = $this->request->post('id', 'integer');
			$faq->name = $this->request->post('name');
			$faq->visible = $this->request->post('visible', 'boolean');
			$faq->answer = $this->request->post('answer');

			if (empty($faq->id)) {
				$faq->id = $this->faq->addFaq($faq);
				$faq = $this->faq->getFaq($faq->id);
				$this->design->assign('message_success', 'added');
			} else {
				$this->faq->updateFaq($faq->id, $faq);
				$faq = $this->faq->getFaq($faq->id);
				$this->design->assign('message_success', 'updated');
			}
		} else {
			$faq->id = $this->request->get('id', 'integer');
			
			if (!empty($faq->id)) {
				$faq = $this->faq->getFaq((int) $faq->id);
			} else {
				$faq->id = null;
				$faq->name = '';
				$faq->visible = 1;
				$faq->answer = '';
			}
		}

		$this->design->assign('faq', $faq);

		return $this->design->fetch('faq.tpl');
	}
}
