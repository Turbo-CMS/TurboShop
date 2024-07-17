<?php

session_start();

require_once '../../api/Turbo.php';

class ClearSiteAjax extends Turbo
{
	public function fetch()
	{
		$this->cleanSite($_SERVER['DOCUMENT_ROOT'] . '/cache/');
		$this->cleanSite($_SERVER['DOCUMENT_ROOT'] . '/compiled/');
	}

	private function cleanSite($path)
	{
		$path = rtrim($path, '/') . '/';

		$handle = opendir($path);

		while (false !== ($file = readdir($handle))) {
			if ($file != "." && $file != "..") {
				$fullpath = $path . $file;

				if (is_dir($fullpath)) {
					$this->cleanSite($fullpath);
					rmdir($fullpath);
				} else {
					@unlink($fullpath);
				}
			}
		}

		closedir($handle);
	}
}

$clearSiteAjax = new ClearSiteAjax();

$json = json_encode($clearSiteAjax->fetch());

header("Content-type: application/json; charset=utf-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print $json;
