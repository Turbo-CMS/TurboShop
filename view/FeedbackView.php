<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 * This class uses the templates feedback.tpl
 *
 */

require_once('View.php');

class FeedbackView extends View
{
	function fetch()
	{
		$feedback = new stdClass;
		if ($this->request->method('post') && $this->request->post('feedback')) {
			$feedback->name         = $this->request->post('name');
			$feedback->email        = $this->request->post('email');
			$feedback->message      = $this->request->post('message');
			$captcha_code           = $this->request->post('captcha_code');

			$this->design->assign('name',  $feedback->name);
			$this->design->assign('email', $feedback->email);
			$this->design->assign('message', $feedback->message);

			if (empty($feedback->name))
				$this->design->assign('error', 'empty_name');
			elseif (empty($feedback->email))
				$this->design->assign('error', 'empty_email');
			elseif (empty($feedback->message))
				$this->design->assign('error', 'empty_text');
			elseif ($this->settings->captcha_feedback && ($_SESSION['captcha_feedback'] != $captcha_code || empty($captcha_code))) {
				$this->design->assign('error', 'captcha');
			} else {
				$this->design->assign('message_sent', true);

				$feedback->ip = $_SERVER['REMOTE_ADDR'];
				$feedback_id = $this->feedbacks->add_feedback($feedback);

				// Send email
				$this->notify->email_feedback_admin($feedback_id);

				// Retrieve the saved captcha
				unset($_SESSION['captcha_code']);
			}
		}

		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);
		}

		$auto_meta = new StdClass;

		$auto_meta->title       = $this->seo->page_meta_title       ? $this->seo->page_meta_title       : '';
		$auto_meta->keywords    = $this->seo->page_meta_keywords    ? $this->seo->page_meta_keywords    : '';
		$auto_meta->description = $this->seo->page_meta_description ? $this->seo->page_meta_description : '';

		$auto_meta_parts = array(
			'{page}' => ($this->page ? $this->page->header : ''),
			'{site_url}' => ($this->seo->am_url ? $this->seo->am_url : ''),
			'{site_name}' => ($this->seo->am_name ? $this->seo->am_name : ''),
			'{site_phone}' => ($this->seo->am_phone ? $this->seo->am_phone : ''),
			'{site_email}' => ($this->seo->am_email ? $this->seo->am_email : ''),
		);

		$auto_meta->title = strtr($auto_meta->title, $auto_meta_parts);
		$auto_meta->keywords = strtr($auto_meta->keywords, $auto_meta_parts);
		$auto_meta->description = strtr($auto_meta->description, $auto_meta_parts);

		$auto_meta->title = preg_replace("/\{.*\}/", '', $auto_meta->title);
		$auto_meta->keywords = preg_replace("/\{.*\}/", '', $auto_meta->keywords);
		$auto_meta->description = preg_replace("/\{.*\}/", '', $auto_meta->description);

		$this->design->assign('auto_meta', $auto_meta);

		$body = $this->design->fetch('feedback.tpl');

		return $body;
	}
}
