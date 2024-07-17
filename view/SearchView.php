<?php

require_once 'View.php';

class SearchView extends View
{
	public function fetch()
	{
		$filter['visible'] = 1;

		// Search
		$keyword = $this->request->get('keyword', 'string');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		// Get Pages
		$pagesSearch = $this->pages->getPages($filter);

		// Design
		$this->design->assign('pages_search', $pagesSearch);

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

		// Display
		return $this->design->fetch('search.tpl');
	}
}
