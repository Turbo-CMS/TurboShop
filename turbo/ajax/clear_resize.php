<?php

session_start();
require_once('../../api/Turbo.php');

class Clear_Resize_Ajax extends Turbo
{
	public function fetch()
	{
		// Cleanup directories
		$this->clean_resize($_SERVER['DOCUMENT_ROOT'] . '/files/articles/preview/');
		$this->clean_resize($_SERVER['DOCUMENT_ROOT'] . '/files/brands/preview/');
		$this->clean_resize($_SERVER['DOCUMENT_ROOT'] . '/files/categories/preview/');
		$this->clean_resize($_SERVER['DOCUMENT_ROOT'] . '/files/posts/preview/');
		$this->clean_resize($_SERVER['DOCUMENT_ROOT'] . '/files/products/');
		$this->clean_resize($_SERVER['DOCUMENT_ROOT'] . '/files/slides/preview/');
	}

	// Cleaning function
	private function clean_resize($path)
	{
		$path = rtrim($path, '/') . '/';
		$handle = opendir($path);
		for (; false !== ($file = readdir($handle));)
			if ($file != "." and $file != "..") {
				$fullpath = $path . $file;
				if (is_dir($fullpath)) {
					$this->clean_resize($fullpath);
					rmdir($fullpath);
				} else
					unlink($fullpath);
			}
		closedir($handle);
	}
}
$clear_resize_ajax = new Clear_Resize_Ajax();
$json = json_encode($clear_resize_ajax->fetch());
header("Content-type: application/json; charset=utf-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print $json;
