<?php

require_once '../api/Turbo.php';

$filename = $_GET['file'] ?? '';

if (!$filename || basename($filename) !== $filename) {
	header($_SERVER["SERVER_PROTOCOL"] . " 404 Not Found");
	exit();
}

$isCategory = isset($_GET['is_category']);
$isArticle = isset($_GET['is_article']);
$isPost = isset($_GET['is_post']);
$isBrands = isset($_GET['is_brands']);
$isBanners = isset($_GET['is_banners']);

$turbo = new Turbo();

$resizedFilename = $turbo->image->resize($filename, $isCategory, $isPost, $isArticle, $isBrands, $isBanners);

if (is_readable($resizedFilename)) {
	header('Content-Type: image');
	readfile($resizedFilename);

	if ($turbo->settings->webp_support) {
		$webpFilename = preg_replace('/\.[^.]+$/', '', $resizedFilename) . '.webp';

		if (!file_exists($webpFilename)) {
			$extension = pathinfo($resizedFilename, PATHINFO_EXTENSION);

			if ($extension === 'jpg' || $extension === 'jpeg') {
				$imageToConvert = @imagecreatefromjpeg($resizedFilename);
			} elseif ($extension === 'png') {
				$imageToConvert = @imagecreatefrompng($resizedFilename);
				imagepalettetotruecolor($imageToConvert);
			} else {
				$imageToConvert = null;
			}

			if ($imageToConvert) {
				imagewebp($imageToConvert, $webpFilename, 80);
				imagedestroy($imageToConvert);
			}
		}
	}
} else {
	header($_SERVER["SERVER_PROTOCOL"] . " 404 Not Found");
	exit();
}
