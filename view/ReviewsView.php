<?php

require_once 'View.php';

class ReviewsView extends View
{
	public function fetch()
	{
		if (!empty($this->user)) {
			$this->design->assign('comment_name', $this->user->name);
		}

		$this->design->assign('comment_rating', 5);

		// Form
		if ($this->request->isMethod('post') && $this->request->post('comment')) {
			$comment = new stdClass();

			$comment->name = $this->request->post('name');
			$comment->text = $this->request->post('text');
			$comment->rating = $this->request->post('rating', 'integer');
			$captchaCode =  $this->request->post('captcha_code', 'string');
			$comment->parent_id = $this->request->post('parent_id');
			$comment->admin = $this->request->post('admin');

			$this->design->assign('comment_text', $comment->text);
			$this->design->assign('comment_name', $comment->name);
			$this->design->assign('comment_rating', $comment->rating);
			$this->design->assign('parent_id', $comment->parent_id);

			if ($this->settings->captcha_review && ($_SESSION['captcha_review'] != $captchaCode || empty($captchaCode))) {
				$this->design->assign('error', 'captcha');
			} elseif (empty($comment->name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($comment->text)) {
				$this->design->assign('error', 'empty_comment');
			} else {
				$comment->type = 'review';
				$comment->ip = $_SERVER['REMOTE_ADDR'];

				$this->db->query("SELECT 1 FROM __comments WHERE approved=1 AND ip=? LIMIT 1", $comment->ip);

				if ($this->db->numRows() > 0) {
					$comment->approved = 1;
				}

				$commentId = $this->comments->addComment($comment);
				$this->notify->emailCommentAdmin($commentId);

				unset($_SESSION['captcha_code']);
				header('location: ' . $_SERVER['REQUEST_URI'] . '#comment_' . $commentId);
			}
		}

		// Reviews list
		$filter = [
			'approved' => 1,
			'type' => 'review',
			'ip' => $_SERVER['REMOTE_ADDR'],
			'has_parent' => false,
		];

		// Sort
		if ($sort = $this->request->get('sort', 'string')) {
			$_SESSION['sort_review'] = $sort;
		}

		if (!empty($_SESSION['sort_review'])) {
			$filter['sort'] = $_SESSION['sort_review'];
		} else {
			$filter['sort'] = 'rate';
		}

		$this->design->assign('sort', $filter['sort']);

		// Pagination
		$itemsPerPage = $this->settings->comments_num;

		$currentPage = $this->request->get('page', 'integer');
		$currentPage = max(1, $currentPage);

		$this->design->assign('current_page_num', $currentPage);

		$commentsCount = $this->comments->countComments($filter);

		if ($this->request->get('page') == 'all') {
			$itemsPerPage = $commentsCount;
		}

		$pagesNum = ceil($commentsCount / $itemsPerPage);
		$this->design->assign('total_pages_num', $pagesNum);

		$filter['page'] = $currentPage;
		$filter['limit'] = $itemsPerPage;

		// Get Comments
		$comments = $this->comments->getComments($filter);

		$children = [];

		foreach ($this->comments->getComments() as $comment) {
			$children[$comment->parent_id][] = $comment;
		}

		// Design
		$this->design->assign('comments', $comments);
		$this->design->assign('children', $children);
		$this->design->assign('comments_count', $commentsCount);

		$this->db->query("SELECT SUM(rating)/COUNT(id) AS ratings FROM __comments WHERE type='review' AND approved=1 AND admin=0 AND rating > 0");
		$this->design->assign('ratings', floatval($this->db->result('ratings')));

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

		$autoMeta->title = preg_replace('/\{.*\}/', '', $autoMeta->title);
		$autoMeta->keywords = preg_replace('/\{.*\}/', '', $autoMeta->keywords);
		$autoMeta->description = preg_replace('/\{.*\}/', '', $autoMeta->description);

		$this->design->assign('auto_meta', $autoMeta);

		// Last Modified
		$lastModifiedUnix = strtotime($this->settings->lastModifyReviews);
		$lastModified = gmdate("D, d M Y H:i:s \G\M\T", $lastModifiedUnix);
		$ifModifiedSince = false;

		if (isset($_ENV['HTTP_IF_MODIFIED_SINCE'])) {
			$ifModifiedSince = strtotime(substr($_ENV['HTTP_IF_MODIFIED_SINCE'], 5));
		}

		if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE'])) {
			$ifModifiedSince = strtotime(substr($_SERVER['HTTP_IF_MODIFIED_SINCE'], 5));
		}

		if ($ifModifiedSince && $ifModifiedSince >= $lastModifiedUnix) {
			header($_SERVER['SERVER_PROTOCOL'] . ' 304 Not Modified');
			exit;
		}

		header('Last-Modified: ' . $lastModified);

		// Display
		$body = $this->design->fetch('reviews.tpl');

		return $body;
	}
}
