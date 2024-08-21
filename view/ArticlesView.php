<?php

require_once 'View.php';

class ArticlesView extends View
{
	public function fetch()
	{
		$url = $this->request->get('article_url', 'string');

		if (!empty($url)) {
			return $this->fetchArticle($url);
		} else {
			return $this->fetchArticles();
		}
	}

	/**
	 * Fetch Article
	 */
	private function fetchArticle($url)
	{
		// Get Article
		$post = $this->articles->getArticle($url);

		// Views
		if ($post->visible && empty($_SESSION['admin'])) {
			$this->articles->updateViews($post->id);
		}

		// Visible Admin
		if (!$post || (!$post->visible && empty($_SESSION['admin']))) {
			return false;
		}

		// Last Modified
		$lastModifiedUnix = strtotime($post->last_modified);
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

		// Comments
		if (!empty($this->user)) {
			$this->design->assign('comment_name', $this->user->name);
		}

		// Comment Form
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

			if ($this->settings->captcha_article && ($_SESSION['captcha_article'] != $captchaCode || empty($captchaCode))) {
				$this->design->assign('error', 'captcha');
			} elseif (empty($comment->name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($comment->text)) {
				$this->design->assign('error', 'empty_comment');
			} else {
				$comment->object_id = $post->id;
				$comment->type = 'article';
				$comment->ip = $_SERVER['REMOTE_ADDR'];

				$approveComment = $this->db->query("SELECT 1 FROM __comments WHERE approved=1 AND ip=? LIMIT 1", $comment->ip);

				if ($this->db->numRows($approveComment) > 0) {
					$comment->approved = 1;
				}

				$commentId = $this->comments->addComment($comment);

				$this->notify->emailCommentAdmin($commentId);

				unset($_SESSION['captcha_code']);

				header('Location: ' . $_SERVER['REQUEST_URI'] . '#comment_' . $commentId);
			}
		}

		// Comments List
		$filter = [
			'approved' => 1,
			'type' => 'article',
			'has_parent' => false,
			'object_id' => $post->id,
			'ip' => $_SERVER['REMOTE_ADDR']
		];

		// Sort
		if ($sort = $this->request->get('sort', 'string')) {
			$_SESSION['comments_article'] = $sort;
		}

		if (!empty($_SESSION['comments_article'])) {
			$filter['sort'] = $_SESSION['comments_article'];
		} else {
			$filter['sort'] = 'rate';
		}

		$this->design->assign('sort', $filter['sort']);

		// Pagination Comments
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

		foreach ($this->comments->getComments() as $c) {
			$children[$c->parent_id][] = $c;
		}

		// Design
		$this->design->assign('post', $post);
		$this->design->assign('comments', $comments);
		$this->design->assign('children', $children);
		$this->design->assign('comments_count', $commentsCount);

		// Category
		$category = $this->articlesCategories->getArticlesCategory((int)$post->category_id);
		$this->design->assign('articles_category', $category);

		// Tags
		$tags = explode(',', $post->meta_keywords);
		$this->design->assign('tags', array_map("trim", $tags));

		// Get All Posts 
		$allPosts = $this->articles->getArticles();

		$allTags = [];

		foreach ($allPosts as $post) {
			// Get Tags
			$tags = explode(',', $post->meta_keywords);
			$tags = array_map("trim", $tags);

			// Merge Tags
			$allTags = array_merge($allTags, $tags);
		}

		// Remove Duplicates
		$allTags = array_unique($allTags);

		// Design
		$this->design->assign('all_tags', $allTags);

		// Next Prev
		$this->design->assign('next_post', $this->articles->getNextArticle($post->id));
		$this->design->assign('prev_post', $this->articles->getPrevArticle($post->id));

		// Meta Tags
		$this->design->assign('meta_title', $post->meta_title);
		$this->design->assign('meta_keywords', $post->meta_keywords);
		$this->design->assign('meta_description', $post->meta_description);

		$autoMeta = new stdClass();

		$autoMeta->title = $this->seo->article_meta_title ?: '';
		$autoMeta->keywords = $this->seo->article_meta_keywords ?: '';
		$autoMeta->description = $this->seo->article_meta_description ?: '';

		$autoMetaParts = [
			'{post}' => $post ? $post->name : '',
			'{category}' => $category ? $category->name : '',
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
		return $this->design->fetch('article.tpl');
	}

	/**
	 * Fetch Articles
	 */
	private function fetchArticles()
	{
		$filter = [];

		// Search
		$keyword = $this->request->get('keyword');

		if (!empty($keyword)) {
			$this->design->assign('keyword', $keyword);
			$filter['keyword'] = $keyword;
		}

		// Author
		$author = $this->request->get('author');

		if (!empty($author)) {
			$this->design->assign('author', $author);
			$filter['author'] = $author;
		}

		// Category
		$categoryUrl = trim($this->request->get('category', 'string'));

		if (!empty($categoryUrl)) {
			$category = $this->articlesCategories->getArticlesCategory((string) $categoryUrl);

			if (empty($category) || (!$category->visible && empty($_SESSION['admin']))) {
				return false;
			}

			$this->design->assign('articles_category', $category);

			$filter['category_id'] = $category->children;
		}

		// Sort
		if ($sort = $this->request->get('sort', 'string')) {
			$_SESSION['sort_articles'] = $sort;
		}

		if (!empty($_SESSION['sort_articles'])) {
			$filter['sort'] = $_SESSION['sort_articles'];
		} else {
			$filter['sort'] = 'position';
		}

		$this->design->assign('sort', $filter['sort']);

		// Pagination
		$itemsPerPage = $this->settings->articles_num;

		$filter['visible'] = 1;

		$currentPage = $this->request->get('page', 'integer');
		$currentPage = max(1, $currentPage);

		$this->design->assign('current_page_num', $currentPage);

		$postsCount = $this->articles->countArticles($filter);

		if ($this->request->get('page') == 'all') {
			$itemsPerPage = $postsCount;
		}

		$pagesNum = ceil($postsCount / $itemsPerPage);

		$this->design->assign('total_pages_num', $pagesNum);

		$filter['page'] = $currentPage;
		$filter['limit'] = $itemsPerPage;

		// Get Articles
		$posts = $this->articles->getArticles($filter);

		// Count Comments - Post Category
		foreach ($posts as $post) {
			$post->comments_count = $this->comments->countComments(['object_id' => $post->id, 'type' => 'article', 'approved' => 1,]);
			$post->category = $this->articlesCategories->getArticlesCategory((int) $post->category_id);
		}

		// Design
		$this->design->assign('posts', $posts);

		// Get All Posts 
		$allPosts = $this->articles->getArticles();

		$allTags = [];

		foreach ($allPosts as $post) {
			// Get Tags
			$tags = explode(',', $post->meta_keywords);
			$tags = array_map("trim", $tags);

			// Merge Tags
			$allTags = array_merge($allTags, $tags);
		}

		// Remove Duplicates
		$allTags = array_unique($allTags);

		// Design
		$this->design->assign('all_tags', $allTags);

		// Meta Tags
		$autoMeta = new stdClass();

		$autoMetaParts = [
			'{category}' => isset($category, $category->name) ? $category->name : '',
			'{page}' => $this->page ? $this->page->header : '',
			'{site_url}' => $this->seo->am_url ?: '',
			'{site_name}' => $this->seo->am_name ?: '',
			'{site_phone}' => $this->seo->am_phone ?: '',
			'{site_email}' => $this->seo->am_email ?: '',
		];

		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);

			$lastModifiedUnix = strtotime($this->page->last_modified);

			$autoMeta->title = $this->seo->page_meta_title ?: '';
			$autoMeta->keywords = $this->seo->page_meta_keywords ?: '';
			$autoMeta->description = $this->seo->page_meta_description ?: '';
		} elseif (isset($category)) {
			$this->design->assign('meta_title', $category->meta_title);
			$this->design->assign('meta_keywords', $category->meta_keywords);
			$this->design->assign('meta_description', $category->meta_description);

			$lastModifiedUnix = strtotime($category->last_modified);

			$autoMeta->title = $this->seo->category_article_meta_title ?: '';
			$autoMeta->keywords = $this->seo->category_article_meta_keywords ?: '';
			$autoMeta->description = $this->seo->category_article_meta_description ?: '';
		} elseif (isset($keyword)) {
			$this->design->assign('meta_title', $keyword);
		}

		$autoMeta->title = strtr($autoMeta->title, $autoMetaParts);
		$autoMeta->keywords = strtr($autoMeta->keywords, $autoMetaParts);
		$autoMeta->description = strtr($autoMeta->description, $autoMetaParts);

		$autoMeta->title = preg_replace("/\{.*\}/", '', $autoMeta->title);
		$autoMeta->keywords = preg_replace("/\{.*\}/", '', $autoMeta->keywords);
		$autoMeta->description = preg_replace("/\{.*\}/", '', $autoMeta->description);

		$this->design->assign('auto_meta', $autoMeta);

		// Last Modified
		if (isset($lastModifiedUnix)) {
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
		}

		// Display
		$body = $this->design->fetch('articles.tpl');

		return $body;
	}
}
