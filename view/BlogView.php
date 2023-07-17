<?php

require_once 'View.php';

class BlogView extends View
{
	public function fetch()
	{
		$url = $this->request->get('url', 'string');

		if (!empty($url)) {
			return $this->fetchPost($url);
		} else {
			return $this->fetchBlog();
		}
	}

	/**
	 * Fetch post
	 */
	private function fetchPost($url)
	{
		$post = $this->blog->getPost($url);

		if ($post && $post->visible && empty($_SESSION['admin'])) {
			$this->blog->updateViews($post->id);
		}

		if (!$post || (!$post->visible && empty($_SESSION['admin']))) {
			return false;
		}

		$lastModifiedUnix = strtotime($post->last_modified);
		$lastModified = gmdate('D, d M Y H:i:s \G\M\T', $lastModifiedUnix);
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

		if (!empty($this->user)) {
			$this->design->assign('comment_name', $this->user->name);
		}

		if ($this->request->isMethod('post') && $this->request->post('comment')) {
			$comment = new stdClass();

			$comment->name = $this->request->post('name');
			$comment->text = $this->request->post('text');
			$comment->parent_id = $this->request->post('parent_id');
			$comment->admin = $this->request->post('admin');

			$captchaCode =  $this->request->post('captcha_code', 'string');

			$this->design->assign('comment_text', $comment->text);
			$this->design->assign('comment_name', $comment->name);
			$this->design->assign('parent_id', $comment->parent_id);

			if ($this->settings->captcha_post && ($_SESSION['captcha_post'] != $captchaCode || empty($captchaCode))) {
				$this->design->assign('error', 'captcha');
			} elseif (empty($comment->name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($comment->text)) {
				$this->design->assign('error', 'empty_comment');
			} else {
				$comment->object_id = $post->id;
				$comment->type = 'blog';
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

		$itemsPerPage = $this->settings->comments_num;

		$filter = [
			'approved' => 1,
			'type' => 'blog',
			'has_parent' => false,
			'object_id' => $post->id,
			'ip' => $_SERVER['REMOTE_ADDR'],
		];

		if ($sort = $this->request->get('sort', 'string')) {
			$_SESSION['sort'] = $sort;
		}

		if (!empty($_SESSION['sort'])) {
			$filter['sort'] = $_SESSION['sort'];
		} else {
			$filter['sort'] = 'rate';
		}

		$this->design->assign('sort', $filter['sort']);

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

		$comments = $this->comments->getComments($filter);

		$children = [];

		foreach ($this->comments->getComments() as $c) {
			$children[$c->parent_id][] = $c;
		}

		$this->design->assign('post', $post);
		$this->design->assign('comments', $comments);
		$this->design->assign('children', $children);
		$this->design->assign('comments_count', $commentsCount);

		$tags = explode(',', $post->meta_keywords);
		$this->design->assign('tags', array_map("trim", $tags));

		$this->design->assign('next_post', $this->blog->getNextPost($post->id));
		$this->design->assign('prev_post', $this->blog->getPrevPost($post->id));

		$this->design->assign('meta_title', $post->meta_title);
		$this->design->assign('meta_keywords', $post->meta_keywords);
		$this->design->assign('meta_description', $post->meta_description);

		$autoMeta = new stdClass();

		$autoMeta->title = $this->seo->post_meta_title ?: '';
		$autoMeta->keywords = $this->seo->post_meta_keywords ?: '';
		$autoMeta->description = $this->seo->post_meta_description ?: '';

		$autoMetaParts = [
			'{post}' => $post ? $post->name : '',
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

		return $this->design->fetch('post.tpl');
	}

	/**
	 * Fetches blog
	 */
	private function fetchBlog()
	{
		$filter = [];

		$keyword = $this->request->get('keyword');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		$sort = $this->request->get('sort', 'string');

		if ($sort) {
			$_SESSION['sort'] = $sort;
		}

		if (!empty($_SESSION['sort'])) {
			$filter['sort'] = $_SESSION['sort'];
		} else {
			$filter['sort'] = 'date';
		}

		$this->design->assign('sort', $filter['sort']);

		$itemsPerPage = $this->settings->blog_num;

		$filter['visible'] = 1;

		$currentPage = $this->request->get('page', 'integer');
		$currentPage = max(1, $currentPage);
		$this->design->assign('current_page_num', $currentPage);
		$postsCount = $this->blog->countPosts($filter);

		if ($this->request->get('page') == 'all') {
			$itemsPerPage = $postsCount;
		}

		$pagesNumber = ceil($postsCount / $itemsPerPage);
		$this->design->assign('total_pages_num', $pagesNumber);

		$filter['page'] = $currentPage;
		$filter['limit'] = $itemsPerPage;

		$posts = $this->blog->getPosts($filter);

		foreach ($posts as $post) {
			$post->commentsCount = $this->comments->countComments(['object_id' => $post->id, 'type' => 'blog', 'approved' => 1]);
		}

		$this->design->assign('posts', $posts);

		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);
		} elseif (isset($keyword)) {
			$this->design->assign('meta_title', $keyword);
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

		$lastModifiedUnix = strtotime($this->settings->lastModifyPosts);
		$lastModified = gmdate('D, d M Y H:i:s \G\M\T', $lastModifiedUnix);
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

		$body = $this->design->fetch('blog.tpl');

		return $body;
	}
}
