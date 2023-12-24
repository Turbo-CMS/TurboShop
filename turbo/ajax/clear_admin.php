<?php

session_start();

require_once '../../api/Turbo.php';

class ClearAdminAjax extends Turbo
{
    public function fetch()
    {
        $this->cleanAdmin($_SERVER['DOCUMENT_ROOT'] . '/turbo/design/compiled');
        $this->cleanAdmin($_SERVER['DOCUMENT_ROOT'] . '/cache/');
    }

    private function cleanAdmin($path)
    {
        $path = rtrim($path, '/') . '/';

        $handle = opendir($path);

        for (; false !== ($file = readdir($handle));) {
            if ($file != "." && $file != "..") {
                $fullpath = $path . $file;

                if (is_dir($fullpath)) {
                    $this->cleanAdmin($fullpath);
                    rmdir($fullpath);
                } else {
                    @unlink($fullpath);
                }
            }
        }

        closedir($handle);
    }
}

$clearAdminAjax = new ClearAdminAjax();

$json = json_encode($clearAdminAjax->fetch());

header("Content-type: application/json; charset=utf-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print $json;
