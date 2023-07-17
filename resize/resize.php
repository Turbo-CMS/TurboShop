<?php

require_once '../api/Turbo.php';

$filename = $_GET['file'] ?? null;

if (!$filename) {
    header($_SERVER["SERVER_PROTOCOL"] . "404 Not Found");
    exit('404 Not Found');
}

$isCategory = (bool)($_GET['is_category'] ?? false);
$isArticle = (bool)($_GET['is_article'] ?? false);
$isPost = (bool)($_GET['is_post'] ?? false);
$isBrands = (bool)($_GET['is_brands'] ?? false);
$isBanners = (bool)($_GET['is_banners'] ?? false);

$turbo = new Turbo();

$resizedFilename = $turbo->image->resize($filename, $isCategory, $isPost, $isArticle, $isBrands, $isBanners);

if (is_readable($resizedFilename)) {
    header('Content-type: image');
    readfile($resizedFilename);

    if ($turbo->settings->webp_support) {
        $webpFilename = preg_replace('/\.[^.]+$/', '', $resizedFilename) . ".webp";
        $info = getimagesize($resizedFilename);

        if (!file_exists($webpFilename)) {
            if ($info['mime'] == 'image/jpeg') {
                $imageToConvert = imagecreatefromjpeg($resizedFilename);
                imagewebp($imageToConvert, $webpFilename, 80);
            } elseif ($info['mime'] == 'image/png') {
                $imageToConvert = imagecreatefrompng($resizedFilename);
                imagepalettetotruecolor($imageToConvert);
                imagewebp($imageToConvert, $webpFilename, 80);
            }
        }
    }
} else {
    header($_SERVER["SERVER_PROTOCOL"] . "404 Not Found");
    exit('404 Not Found');
}
