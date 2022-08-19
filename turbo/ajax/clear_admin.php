<?php

session_start();
require_once('../../api/Turbo.php');

class Clear_Admin_Ajax extends Turbo
{
	public function fetch()
	{
		// Cleanup directories
		$this->clean_admin($_SERVER['DOCUMENT_ROOT'] . '/turbo/design/compiled');
		$this->clean_admin($_SERVER['DOCUMENT_ROOT'] . '/cache/');
	}

	// Cleaning function
	private function clean_admin($path)
	{
		$path = rtrim($path, '/') . '/';
		$handle = opendir($path);
		for (; false !== ($file = readdir($handle));)
			if ($file != "." and $file != "..") {
				$fullpath = $path . $file;
				if (is_dir($fullpath)) {
					$this->clean_admin($fullpath);
					rmdir($fullpath);
				} else
					unlink($fullpath);
			}
		closedir($handle);
	}
}
$clear_admin_ajax = new Clear_Admin_Ajax();
$json = json_encode($clear_admin_ajax->fetch());
header("Content-type: application/json; charset=utf-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print $json;
