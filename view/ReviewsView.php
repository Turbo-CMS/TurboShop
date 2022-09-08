<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com/
 *
 * This class uses the templates reviews.tpl
 *
 */

require_once('View.php');

class ReviewsView extends View
{
	// Display list of comments
	function fetch()
	{
		// Autocomplete name for comment form
		if (!empty($this->user)) {
			$this->design->assign('comment_name', $this->user->name);
		}
		$this->design->assign('comment_rating', 5);

		// Accept comment
		if ($this->request->method('post') && $this->request->post('comment')) {
			$comment = new stdClass;
			$comment->name = $this->request->post('name');

			$comment->text = $this->request->post('text');
			$comment->rating = $this->request->post('rating', 'integer');
			$captcha_code =  $this->request->post('captcha_code', 'string');

			if ($this->settings->comments_tree_reviews == "on") {
				$comment->parent_id = $this->request->post('parent_id');
				$comment->admin = $this->request->post('admin');
			}

			// Pass the comment back to the template - in case of an error, you will need to fill out the form
			$this->design->assign('comment_text', $comment->text);
			$this->design->assign('comment_name', $comment->name);
			$this->design->assign('comment_rating', $comment->rating);

			if ($this->settings->comments_tree_reviews == "on") {
				$this->design->assign('parent_id', $comment->parent_id);
			}

			// Check form completion
			if ($this->settings->captcha_review && ($_SESSION['captcha_review'] != $captcha_code || empty($captcha_code))) {
				$this->design->assign('error', 'captcha');
			} elseif (empty($comment->name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($comment->text)) {
				$this->design->assign('error', 'empty_comment');
			} else {
				// Create a comment
				$comment->type = 'review';
				$comment->ip = $_SERVER['REMOTE_ADDR'];

				// If there were approved comments from the current ip, approve immediately
				$this->db->query("SELECT 1 FROM __comments WHERE approved=1 AND ip=? LIMIT 1", $comment->ip);
				if ($this->db->num_rows() > 0)
					$comment->approved = 1;

				// Add a comment to the database
				$comment_id = $this->comments->add_comment($comment);

				// Send email
				$this->notify->email_comment_admin($comment_id);

				// Retrieve the saved captcha
				unset($_SESSION['captcha_code']);
				header('location: ' . $_SERVER['REQUEST_URI'] . '#comment_' . $comment_id);
			}
		}

		// Number of comments on 1 page
		$items_per_page = 20;

		$filter = array();

		// Select only visible comments
		$filter['approved'] = 1;
		$filter['type'] = 'review';
		$filter['ip'] = $_SERVER['REMOTE_ADDR'];

		// Sorting comments, save in session so that the current sorting remains for the entire site
		if ($sort = $this->request->get('sort', 'string'))
			$_SESSION['sort'] = $sort;
		if (!empty($_SESSION['sort']))
			$filter['sort'] = $_SESSION['sort'];
		else
			$filter['sort'] = 'rate';
			$this->design->assign('sort', $filter['sort']);

		// Current page in pagination
		$current_page = $this->request->get('page', 'integer');

		// If not set, then equal to 1
		$current_page = max(1, $current_page);
		$this->design->assign('current_page_num', $current_page);

		// Calculate the number of pages
		$comments_count = $this->comments->count_comments($filter);

		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$items_per_page = $comments_count;

		$pages_num = ceil($comments_count / $items_per_page);
		$this->design->assign('total_pages_num', $pages_num);

		$filter['page'] = $current_page;
		$filter['limit'] = $items_per_page + 5;

		if ($this->settings->comments_tree_reviews == "on") {
			// Selecting tree comments from the database
			$comments = $this->comments->get_comments_tree($filter);
		} else {
			// Selecting comments from the database
			$comments = $this->comments->get_comments($filter);
		}

		// Passing to the template
		$this->design->assign('comments', $comments);
		// Select and pass the rating to the template 
		$this->design->assign('comments_count', $comments_count);
		$this->db->query("SELECT SUM(rating)/COUNT(id) AS ratings FROM __comments WHERE type='review' AND approved=1 AND admin=0");
		$this->design->assign('ratings', floatval($this->db->result('ratings')));


		// Meta tags
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

		// Last-Modified 
		$LastModified_unix = strtotime($this->settings->lastModifyReviews); // time when the page was last modified
		$LastModified = gmdate("D, d M Y H:i:s \G\M\T", $LastModified_unix);
		$IfModifiedSince = false;
		if (isset($_ENV['HTTP_IF_MODIFIED_SINCE']))
			$IfModifiedSince = strtotime(substr($_ENV['HTTP_IF_MODIFIED_SINCE'], 5));
		if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE']))
			$IfModifiedSince = strtotime(substr($_SERVER['HTTP_IF_MODIFIED_SINCE'], 5));
		if ($IfModifiedSince && $IfModifiedSince >= $LastModified_unix) {
			header($_SERVER['SERVER_PROTOCOL'] . ' 304 Not Modified');
			exit;
		}
		header('Last-Modified: ' . $LastModified);

		$body = $this->design->fetch('reviews.tpl');

		return $body;
	}
}
