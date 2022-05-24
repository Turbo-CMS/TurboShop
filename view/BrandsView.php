<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 * This class uses the template brands.tpl
 *
 */

require_once('View.php');

class BrandsView extends View
{

	public function fetch()
	{
		$brands = $this->brands->get_brands();
		$this->design->assign('brands', $brands);

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
		if (isset($LastModified_unix)) {
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
		}

		return $this->design->fetch('brands.tpl');
	}
}
