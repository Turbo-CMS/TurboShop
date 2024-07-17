<?php

require_once 'View.php';

class PageView extends View
{
	public function fetch()
	{
		$url = $this->request->get('page_url', 'string');

		// Get Page
		$page = $this->pages->getPage($url);

		// Visible Admin
		if (empty($page) || (!$page->visible && empty($_SESSION['admin']))) {
			return false;
		}

		// Design
		$this->design->assign('page', $page);

		// Meta Tags
		$this->design->assign('meta_title', $page->meta_title);
		$this->design->assign('meta_keywords', $page->meta_keywords);
		$this->design->assign('meta_description', $page->meta_description);

		$autoMeta = new stdClass();

		$autoMeta->title = $this->seo->page_meta_title ?: '';
		$autoMeta->keywords = $this->seo->page_meta_keywords ?: '';
		$autoMeta->description = $this->seo->page_meta_description ?: '';

		$autoMetaParts = [
			'{page}' => $page ? $page->header : '',
			'{site_url}' => $this->seo->am_url ?: '',
			'{site_name}' => $this->seo->am_name ?: '',
			'{site_phone}' => $this->seo->am_phone ?: '',
			'{site_email}' => $this->seo->am_email ?: ''
		];

		$autoMeta->title = strtr($autoMeta->title, $autoMetaParts);
		$autoMeta->keywords = strtr($autoMeta->keywords, $autoMetaParts);
		$autoMeta->description = strtr($autoMeta->description, $autoMetaParts);

		$autoMeta->title = preg_replace("/\{.*\}/", '', $autoMeta->title);
		$autoMeta->keywords = preg_replace("/\{.*\}/", '', $autoMeta->keywords);
		$autoMeta->description = preg_replace("/\{.*\}/", '', $autoMeta->description);

		$this->design->assign('auto_meta', $autoMeta);

		// Last Modified
		$lastModifiedUnix = strtotime($page->last_modified);
		$lastModified     = gmdate("D, d M Y H:i:s \G\M\T", $lastModifiedUnix);
		$ifModifiedSince  = false;

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
		return $this->design->fetch('page.tpl');
	}
}
