<?php

require_once 'View.php';

class FeedbackView extends View
{
	public function fetch()
	{
		$feedback = new stdClass();

		// Feedback form
		if ($this->request->isMethod('post') && $this->request->post('feedback')) {
			$feedback->name = $this->request->post('name');
			$feedback->email = $this->request->post('email');
			$feedback->message = $this->request->post('message');

			$captchaCode = $this->request->post('captcha_code');

			$this->design->assign('name', $feedback->name);
			$this->design->assign('email', $feedback->email);
			$this->design->assign('message', $feedback->message);

			if (empty($feedback->name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($feedback->email)) {
				$this->design->assign('error', 'empty_email');
			} elseif (empty($feedback->message)) {
				$this->design->assign('error', 'empty_text');
			} elseif ($this->settings->captcha_feedback && ($_SESSION['captcha_feedback'] != $captchaCode || empty($captchaCode))) {
				$this->design->assign('error', 'captcha');
			} else {
				$this->design->assign('message_sent', true);
				$feedback->ip = $_SERVER['REMOTE_ADDR'];
				$feedbackId = $this->feedbacks->addFeedback($feedback);
				$this->notify->emailFeedbackAdmin($feedbackId);
				unset($_SESSION['captcha_code']);
			}
		}

		// Meta Tags
		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);
		}

		$autoMeta = new stdClass();

		$autoMeta->title = $this->seo->page_meta_title ?: '';
		$autoMeta->keywords = $this->seo->page_meta_keywords ?: '';
		$autoMeta->description = $this->seo->page_meta_description ?: '';

		$autoMetaParts = [
			'{page}' => $this->page ? $this->page->header : '',
			'{site_url}' => $this->seo->am_url ?: '',
			'{site_name}' => $this->seo->am_name ?: '',
			'{site_phone}' => $this->seo->am_phone ?: '',
			'{site_email}' => $this->seo->am_email ?: '',
		];

		$autoMeta->title = strtr($autoMeta->title, $autoMetaParts);
		$autoMeta->keywords = strtr($autoMeta->keywords, $autoMetaParts);
		$autoMeta->description = strtr($autoMeta->description, $autoMetaParts);

		$autoMeta->title = preg_replace("/\{.*\}/", '', $autoMeta->title);
		$autoMeta->keywords = preg_replace("/\{.*\}/", '', $autoMeta->keywords);
		$autoMeta->description = preg_replace("/\{.*\}/", '', $autoMeta->description);

		$this->design->assign('auto_meta', $autoMeta);

		// Display
		return $this->design->fetch('feedback.tpl');
	}
}
