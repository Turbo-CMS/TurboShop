<?php

session_start();
require_once('../../api/Turbo.php');

class Clear_Site_Ajax extends Turbo
{
	public function fetch()
	{
		// Cleanup directories
		$this->clean_site($_SERVER['DOCUMENT_ROOT'] . '/cache/');
		$this->clean_site($_SERVER['DOCUMENT_ROOT'] . '/compiled/');
	}

	// Cleaning function
	private function clean_site($path)
	{
		$path = rtrim($path, '/') . '/';
		$handle = opendir($path);
		for (; false !== ($file = readdir($handle));)
			if ($file != "." and $file != "..") {
				$fullpath = $path . $file;
				if (is_dir($fullpath)) {
					$this->clean_site($fullpath);
					rmdir($fullpath);
				} else
					unlink($fullpath);
			}
		closedir($handle);
	}
}
$clear_site_ajax = new Clear_Site_Ajax();
$json = json_encode($clear_site_ajax->fetch());
header("Content-type: application/json; charset=utf-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print $json;
