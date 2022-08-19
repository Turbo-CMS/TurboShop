<?php

require_once('api/Turbo.php');

class FAQAdmin extends Turbo
{
	public function fetch()
	{
		$faq = new stdClass;
		if ($this->request->method('post')) {
			$faq->id       = $this->request->post('id', 'integer');
			$faq->name     = $this->request->post('name');
			$faq->visible  = $this->request->post('visible', 'boolean');
			$faq->answer   = $this->request->post('answer');

			if (empty($faq->id)) {
				$faq->id = $this->faq->add_faq($faq);
				$faq = $this->faq->get_faq($faq->id);
				$this->design->assign('message_success', 'added');
			} else {
				$this->faq->update_faq($faq->id, $faq);
				$faq = $this->faq->get_faq($faq->id);
				$this->design->assign('message_success', 'updated');
			}
		} else {
			$faq->id = $this->request->get('id', 'integer');
			$faq = $this->faq->get_faq(intval($faq->id));
		}

		$this->design->assign('faq', $faq);

		return $this->design->fetch('faq.tpl');
	}
}
