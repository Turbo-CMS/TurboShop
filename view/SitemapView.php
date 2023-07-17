<?php

require_once 'View.php';

class SitemapView extends View
{
	function fetch()
	{
		$posts = $this->blog->getPosts(['visible' => 1]);
		$this->design->assign('posts', $posts);

		$categories = $this->categories->getCategoriesTree();
		$categories = $this->categoryTree($categories);
		$this->design->assign('cats', $categories);

		$articlesCategories = $this->articlesCategories->getArticlesCategoriesTree();
		$articlesCategories = $this->articleCategoryTree($articlesCategories);
		$this->design->assign('articles_cats', $articlesCategories);

		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);
			$this->design->assign('page', $this->page);
		}

		$autoMeta = new stdClass();

		$autoMeta->title = $this->seo->page_meta_title ?? '';
		$autoMeta->keywords = $this->seo->page_meta_keywords ?? '';
		$autoMeta->description = $this->seo->page_meta_description ?? '';

		$autoMetaParts = [
			'{page}' => ($this->page ? $this->page->header : ''),
			'{site_url}' => ($this->seo->am_url ?: ''),
			'{site_name}' => ($this->seo->am_name ?: ''),
			'{site_phone}' => ($this->seo->am_phone ?: ''),
			'{site_email}' => ($this->seo->am_email ?: ''),
		];

		foreach ($autoMeta as $key => $value) {
			$autoMeta->$key = strtr($value, $autoMetaParts);
			$autoMeta->$key = preg_replace("/\{.*\}/", '', $autoMeta->$key);
		}

		$this->design->assign('posts', $posts);
		$this->design->assign('cats', $categories);
		$this->design->assign('articles_cats', $articlesCategories);
		$this->design->assign('auto_meta', $autoMeta);

		return $this->design->fetch('sitemap.tpl');
	}

	private function categoryTree($categories)
	{
		foreach ($categories as $key => $category) {
			if (isset($category->subcategories)) {
				$this->categoryTree($category->subcategories);
			}

			$categories[$key]->products = $this->products->getProducts(['category_id' => $category->id]);
		}

		return $categories;
	}

	private function articleCategoryTree($articlesCategories)
	{
		foreach ($articlesCategories as $key => $articleCategory) {
			if (isset($articleCategory->subcategories)) {
				$this->articleCategoryTree($articleCategory->subcategories);
			}

			$articlesCategories[$key]->articles = $this->articles->getArticles(['category_id' => $articleCategory->id]);
		}

		return $articlesCategories;
	}
}
