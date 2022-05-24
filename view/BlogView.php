<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com/
 *
 * This class uses the templates blog.tpl и post.tpl
 *
 */

require_once('View.php');

class BlogView extends View
{
	public function fetch()
	{
		$url = $this->request->get('url', 'string');

		// If a post address is specified,
		if (!empty($url)) {
			// Display post 
			return $this->fetch_post($url);
		} else {
			// Otherwise, display the blog feed
			return $this->fetch_blog($url);
		}
	}

	private function fetch_post($url)
	{
		// Select a post from the database
		$post = $this->blog->get_post($url);

		// Number of views
		if ($post->visible && empty($_SESSION['admin']))
			$this->blog->update_views($post->id);

		// If not found - error
		if (!$post || (!$post->visible && empty($_SESSION['admin'])))
			return false;

		// Last-Modified 
		$LastModified_unix = strtotime($post->last_modified); // time when the page was last modified
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

		// Autocomplete name for comment form
		if (!empty($this->user))
			$this->design->assign('comment_name', $this->user->name);


		// Accept comment
		if ($this->request->method('post') && $this->request->post('comment')) {
			$comment = new stdClass;
			$comment->name = $this->request->post('name');
			$comment->text = $this->request->post('text');
			$captcha_code =  $this->request->post('captcha_code', 'string');

			if ($this->settings->comments_tree_blog == "on") {
				$comment->parent_id = $this->request->post('parent_id');
				$comment->admin = $this->request->post('admin');
			}

			// Pass the comment back to the template - in case of an error, you will need to fill out the form
			$this->design->assign('comment_text', $comment->text);
			$this->design->assign('comment_name', $comment->name);

			if ($this->settings->comments_tree_blog == "on") {
				$this->design->assign('parent_id', $comment->parent_id);
			}

			// Checking the captcha and filling out the form
			if ($this->settings->captcha_post && ($_SESSION['captcha_post'] != $captcha_code || empty($captcha_code))) {
				$this->design->assign('error', 'captcha');
			} elseif (empty($comment->name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($comment->text)) {
				$this->design->assign('error', 'empty_comment');
			} else {
				// Create a comment
				$comment->object_id = $post->id;
				$comment->type      = 'blog';
				$comment->ip        = $_SERVER['REMOTE_ADDR'];

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

		if ($this->settings->comments_tree_blog == "on") {
			$filter = array();
			$filter['type'] = 'blog';
			$filter['object_id'] = $post->id;
			$filter['approved'] = 1;
			$filter['ip'] = $_SERVER['REMOTE_ADDR'];

			// Sorting comments, save in session so that the current sorting remains for the entire site
			if ($sort = $this->request->get('sort', 'string'))
				$_SESSION['sort'] = $sort;
			if (!empty($_SESSION['sort']))
				$filter['sort'] = $_SESSION['sort'];
			else
				$filter['sort'] = 'rate';
			$this->design->assign('sort', $filter['sort']);

			// Read the total number of comments to calculate pages          
			$comments_count = $this->comments->count_comments($filter);

			// Read the total number of comments to calculate pages 
			$comments = $this->comments->get_comments_tree($filter);
			$this->design->assign('comments_count', $comments_count);
		} else {
			// Post comments
			$comments = $this->comments->get_comments(array('type' => 'blog', 'object_id' => $post->id, 'approved' => 1, 'ip' => $_SERVER['REMOTE_ADDR']));
		}

		$this->design->assign('comments', $comments);
		$this->design->assign('post', $post);

		// Tags
		$tags = explode(',', $post->meta_keywords);
		$this->design->assign('tags', array_map("trim", $tags));

		// Neighbor records
		$this->design->assign('next_post', $this->blog->get_next_post($post->id));
		$this->design->assign('prev_post', $this->blog->get_prev_post($post->id));

		// Meta tags
		$this->design->assign('meta_title', $post->meta_title);
		$this->design->assign('meta_keywords', $post->meta_keywords);
		$this->design->assign('meta_description', $post->meta_description);

		$auto_meta = new StdClass;

		$auto_meta->title       = $this->seo->post_meta_title       ? $this->seo->post_meta_title       : '';
		$auto_meta->keywords    = $this->seo->post_meta_keywords    ? $this->seo->post_meta_keywords    : '';
		$auto_meta->description = $this->seo->post_meta_description ? $this->seo->post_meta_description : '';

		$auto_meta_parts = array(
			'{post}' => ($post ? $post->name : ''),
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

		return $this->design->fetch('post.tpl');
	}

	// Display post list
	private function fetch_blog()
	{

		$filter = array();

		// If the keyword is set
		$keyword = $this->request->get('keyword');
		if (!empty($keyword)) {
			$this->design->assign('keyword', $keyword);
			$filter['keyword'] = $keyword;
		}

		// Sorting posts, save in session so that the current sorting remains for the entire site
		if ($sort = $this->request->get('sort', 'string'))
			$_SESSION['sort'] = $sort;
		if (!empty($_SESSION['sort']))
			$filter['sort'] = $_SESSION['sort'];
		else
			$filter['sort'] = 'date';
		$this->design->assign('sort', $filter['sort']);

		// Number of posts on 1 page
		$items_per_page = $this->settings->blog_num;

		// Select only visible posts
		$filter['visible'] = 1;

		// Current page in pagination
		$current_page = $this->request->get('page', 'integer');

		// If not set, then equal to 1
		$current_page = max(1, $current_page);
		$this->design->assign('current_page_num', $current_page);

		// Calculate the number of pages
		$posts_count = $this->blog->count_posts($filter);

		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$items_per_page = $posts_count;

		$pages_num = ceil($posts_count / $items_per_page);
		$this->design->assign('total_pages_num', $pages_num);

		$filter['page'] = $current_page;
		$filter['limit'] = $items_per_page;

		// Select articles from the database
		$posts = $this->blog->get_posts($filter);

		foreach ($posts as $post) {
			$post->comments = count($this->comments->get_comments(array('type' => 'blog', 'object_id' => $post->id, 'approved' => 1, 'ip' => $_SERVER['REMOTE_ADDR'])));
		}

		// Passing to the template
		$this->design->assign('posts', $posts);

		// Meta tags
		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);
		} elseif (isset($keyword)) {
			$this->design->assign('meta_title', $keyword);
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
		$LastModified_unix = strtotime($this->settings->lastModifyPosts); // time when the page was last modified
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

		$body = $this->design->fetch('blog.tpl');

		return $body;
	}
}
