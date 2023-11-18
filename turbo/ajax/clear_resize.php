<?php

session_start();
require_once '../../api/Turbo.php';

class ClearResizeAjax extends Turbo
{
    public function fetch()
    {
        $this->cleanResize($_SERVER['DOCUMENT_ROOT'] . '/files/articles/preview/');
        $this->cleanResize($_SERVER['DOCUMENT_ROOT'] . '/files/brands/preview/');
        $this->cleanResize($_SERVER['DOCUMENT_ROOT'] . '/files/categories/preview/');
        $this->cleanResize($_SERVER['DOCUMENT_ROOT'] . '/files/posts/preview/');
        $this->cleanResize($_SERVER['DOCUMENT_ROOT'] . '/files/products/');
        $this->cleanResize($_SERVER['DOCUMENT_ROOT'] . '/files/slides/preview/');
    }

    private function cleanResize($path)
    {
        $path = rtrim($path, '/') . '/';
        $handle = opendir($path);

        for (; false !== ($file = readdir($handle));) {
            if ($file != "." && $file != "..") {
                $fullpath = $path . $file;

                if (is_dir($fullpath)) {
                    $this->cleanResize($fullpath);
                    rmdir($fullpath);
                } else {
                    unlink($fullpath);
                }
            }
        }

        closedir($handle);
    }
}

$clearResizeAjax = new ClearResizeAjax();
$json = json_encode($clearResizeAjax->fetch());

header("Content-type: application/json; charset=utf-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print $json;
