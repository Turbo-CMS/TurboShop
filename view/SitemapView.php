<?php
 
require_once('View.php');

class SitemapView extends View
{
	function fetch()
	{
		$posts = $this->blog->get_posts(array('visible' => 1));
		$this->design->assign('posts', $posts);

		$categories = $this->categories->get_categories_tree();
		$categories = $this->cat_tree($categories);
		$this->design->assign('cats', $categories);

		$articles_categories = $this->articles_categories->get_articles_categories_tree();
		$articles_categories = $this->articles_cat_tree($articles_categories);
		$this->design->assign('articles_cats', $articles_categories);

		if ($this->page) {
			$this->design->assign('meta_title', $this->page->meta_title);
			$this->design->assign('meta_keywords', $this->page->meta_keywords);
			$this->design->assign('meta_description', $this->page->meta_description);
			$this->design->assign('page', $this->page);
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

		return $this->design->fetch('sitemap.tpl');
	}

	private function cat_tree($categories)
	{

		foreach ($categories as $k => $v) {
			if (isset($v->subcategories)) $this->cat_tree($v->subcategories);
			$categories[$k]->products = $this->products->get_products(array('category_id' => $v->id));
		}

		return $categories;
	}

	private function articles_cat_tree($articles_categories)
	{

		foreach ($articles_categories as $k => $v) {
			if (isset($v->subcategories)) $this->cat_tree($v->subcategories);
			$articles_categories[$k]->articles = $this->articles->get_articles(array('category_id' => $v->id));
		}

		return $articles_categories;
	}
}
