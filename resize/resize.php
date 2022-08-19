<?php

require_once('../api/Turbo.php');

@$filename = $_GET['file'];
@$is_category = $_GET['is_category'];
@$is_article = $_GET['is_article'];
@$is_post = $_GET['is_post'];
@$is_brands = $_GET['is_brands'];
@$is_banners = $_GET['is_banners'];

$turbo = new Turbo();

@$resized_filename =  $turbo->image->resize($filename, $is_category, $is_post, $is_article, $is_brands, $is_banners);

if (is_readable($resized_filename)) {
	header('Content-type: image');
	print file_get_contents($resized_filename);

	if ($turbo->settings->webp_support) {
		$webp_filename = preg_replace('/\.[^.]+$/', '', $resized_filename) . ".webp";
		$info = getimagesize($resized_filename);
		if (file_exists($webp_filename)) {
		} else {
			if ($info['mime'] == 'image/jpeg') {
				$imagetoconvert = imagecreatefromjpeg($resized_filename);
				imagewebp($imagetoconvert, $webp_filename, 80);
			} elseif ($info['mime'] == 'image/png') {
				$imagetoconvert = imagecreatefrompng($resized_filename);
				imagepalettetotruecolor($imagetoconvert);
				imagewebp($imagetoconvert, $webp_filename, 80);
			}
		}
	}
} else {
	header($_SERVER["SERVER_PROTOCOL"] . "404 Not Found");
	exit('404 Not Found');
}
