<?php

require_once 'View.php';

class FaqView extends View
{
	public function fetch()
	{
		$filter = [];

		// Search
		$keyword = $this->request->get('keyword');

		if (!empty($keyword)) {
			$this->design->assign('keyword', $keyword);
			$filter['keyword'] = $keyword;
		}

		// Sort
		if ($sort = $this->request->get('sort', 'string')) {
			$_SESSION['sort'] = $sort;
		}

		if (!empty($_SESSION['sort'])) {
			$filter['sort'] = $_SESSION['sort'];
		} else {
			$filter['sort'] = 'date';
		}

		$this->design->assign('sort', $filter['sort']);

		// Pagination
		$itemsPerPage = '20';

		$filter['visible'] = 1;

		$currentpage = $this->request->get('page', 'integer');
		$currentpage = max(1, $currentpage);

		$this->design->assign('current_page_num', $currentpage);

		$faqCount = $this->blog->countPosts($filter);

		if ($this->request->get('page') == 'all') {
			$itemsPerPage = $faqCount;
		}

		$pagesNum = ceil($faqCount / $itemsPerPage);

		$this->design->assign('total_pages_num', $pagesNum);

		$filter['page'] = $currentpage;
		$filter['limit'] = $itemsPerPage;

		// Get Faq
		$faqs = $this->faq->getFaqs($filter);

		// Design
		$this->design->assign('faqs', $faqs);

		// Meta Tags
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

		$autoMeta->title = preg_replace("/\{.*\}/", '', $autoMeta->title);
		$autoMeta->keywords = preg_replace("/\{.*\}/", '', $autoMeta->keywords);
		$autoMeta->description = preg_replace("/\{.*\}/", '', $autoMeta->description);

		$this->design->assign('auto_meta', $autoMeta);

		// Last Modified
		$lastModifiedUnix = strtotime($this->settings->lastModifyFAQ);
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
		$body = $this->design->fetch('faq.tpl');

		return $body;
	}
}
