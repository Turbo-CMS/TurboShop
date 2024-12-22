<?php

require_once 'Turbo.php';

class Image extends Turbo
{
	private $allowedExtensions = ['png', 'gif', 'jpg', 'jpeg', 'ico'];

	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * Resize
	 */
	function resize($filename, $isCategory = 0, $isPost = 0, $isArticle = 0, $isBrands = 0, $isBanners = 0)
	{
		list($sourceFile, $width, $height, $setWatermark) = $this->getResizeParams($filename);

		$size = ($width ? $width : 0) . 'x' . ($height ? $height : 0) . ($setWatermark ? "w" : '');

		$imageSizes = [];

		if ($this->settings->image_sizes) {
			$imageSizes = explode('|', $this->settings->image_sizes);
		}

		if (!in_array($size, $imageSizes)) {
			header("http/1.0 404 not found");
			exit();
		}

		if (substr($sourceFile, 0, 7) == 'http://' || substr($sourceFile, 0, 8) == 'https://') {
			$originalFile = $this->downloadImage($sourceFile);

			if (!$originalFile) {
				return false;
			}
		} else {
			$originalFile = $sourceFile;
		}

		$resizedFile = $this->addResizeParams($originalFile, $width, $height, $setWatermark);

		if ($isCategory == 1) {
			$originalsDir = $this->config->root_dir . $this->config->categories_images_dir;
			$previewDir = $this->config->root_dir . $this->config->resized_category_images_dir;
		} elseif ($isBrands == 1) {
			$originalsDir = $this->config->root_dir . $this->config->brands_images_dir;
			$previewDir = $this->config->root_dir . $this->config->resized_brands_images_dir;
		} elseif ($isBanners == 1) {
			$originalsDir = $this->config->root_dir . $this->config->banners_images_dir;
			$previewDir = $this->config->root_dir . $this->config->resized_banners_images_dir;
		} elseif ($isPost == 1) {
			$originalsDir = $this->config->root_dir . $this->config->posts_images_dir;
			$previewDir = $this->config->root_dir . $this->config->resized_posts_images_dir;
		} elseif ($isArticle == 1) {
			$originalsDir = $this->config->root_dir . $this->config->articles_images_dir;
			$previewDir = $this->config->root_dir . $this->config->resized_articles_images_dir;
		} else {
			$originalsDir = $this->config->root_dir . $this->config->original_images_dir;
			$previewDir = $this->config->root_dir . $this->config->resized_images_dir;
		}

		$watermarkOffsetX = $this->settings->watermark_offset_x;
		$watermarkOffsetY = $this->settings->watermark_offset_y;

		$sharpen = min(100, $this->settings->images_sharpen) / 100;
		$watermarkTransparency = 1 - min(100, $this->settings->watermark_transparency) / 100;

		$watermarkFile = null;

		if ($setWatermark && is_file($this->config->root_dir . $this->config->watermark_file)) {
			$watermarkFile = $this->config->root_dir . $this->config->watermark_file;
		}

		if (class_exists('Imagick') && $this->config->use_imagick) {
			$this->imageConstrainImagick($originalsDir . $originalFile, $previewDir . $resizedFile, $width, $height, $watermarkFile, $watermarkOffsetX, $watermarkOffsetY, $watermarkTransparency, $sharpen);
		} else {
			$this->imageConstrainGd($originalsDir . $originalFile, $previewDir . $resizedFile, $width, $height, $watermarkFile, $watermarkOffsetX, $watermarkOffsetY, $watermarkTransparency);
		}

		return $previewDir . $resizedFile;
	}

	/**
	 * Add Resize Params
	 */
	public function addResizeParams($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		if ('.' != ($dirname = pathinfo($filename, PATHINFO_DIRNAME))) {
			$file = $dirname . '/' . pathinfo($filename, PATHINFO_FILENAME);
		} else {
			$file = pathinfo($filename, PATHINFO_FILENAME);
		}

		$ext = pathinfo($filename, PATHINFO_EXTENSION);

		if ($width > 0 || $height > 0) {
			$resizedFilename = $file . '.' . ($width > 0 ? $width : '') . 'x' . ($height > 0 ? $height : '') . ($setWatermark ? 'w' : '') . '.' . $ext;
		} else {
			$resizedFilename = $file . '.' . ($setWatermark ? 'w' : '') . '.' . $ext;
		}

		return $resizedFilename;
	}

	/**
	 * Get Resize Parameters
	 */
	public function getResizeParams($filename)
	{
		if (!preg_match('/(.+)\.([0-9]*)x([0-9]*)(w)?\.([^\.]+)$/', $filename, $matches)) {
			return false;
		}

		$file = $matches[1];
		$width = $matches[2];
		$height = $matches[3];
		$setWatermark = $matches[4] == 'w';
		$ext = $matches[5];

		return [$file . '.' . $ext, $width, $height, $setWatermark];
	}

	/**
	 * Downloads Image
	 */
	public function downloadImage($filename)
	{
		$this->db->query('SELECT * FROM __images WHERE filename=? LIMIT 1', $filename);
		$row = $this->db->result();

		if (!$row) {
			return false;
		}

		$parseUrl = parse_url($filename);

		$basename = basename($parseUrl['path']);
		$base = $this->correctFilename(pathinfo($basename, PATHINFO_FILENAME));
		$ext = pathinfo($basename, PATHINFO_EXTENSION);

		$newName = $base . '.' . $ext;

		while (file_exists($this->config->root_dir . $this->config->original_images_dir . $newName)) {
			$newBase = pathinfo($newName, PATHINFO_FILENAME);

			if (preg_match('/_([0-9]+)$/', $newBase, $parts)) {
				$newName = $base . '_' . ($parts[1] + 1) . '.' . $ext;
			} else {
				$newName = $base . '_1.' . $ext;
			}
		}

		$this->db->query('UPDATE __images SET filename=? WHERE filename=?', $newName, $filename);

		fclose(fopen($this->config->root_dir . $this->config->original_images_dir . $newName, 'w'));
		copy($filename, $this->config->root_dir . $this->config->original_images_dir . $newName);

		return $newName;
	}

	/**
	 * Uploads Image
	 */
	public function uploadImage($filename, $name)
	{
		$uploadedFile = $newName = pathinfo($name, PATHINFO_BASENAME);

		$base = pathinfo($uploadedFile, PATHINFO_FILENAME);
		$base = $this->correctFilename($base);
		$ext = pathinfo($uploadedFile, PATHINFO_EXTENSION);
		$newName = $base . '.' . $ext;

		if (in_array(strtolower($ext), $this->allowedExtensions)) {
			while (file_exists($this->config->root_dir . $this->config->original_images_dir . $newName)) {
				$newBase = pathinfo($newName, PATHINFO_FILENAME);

				if (preg_match('/_([0-9]+)$/', $newBase, $parts)) {
					$newName = $base . '_' . ($parts[1] + 1) . '.' . $ext;
				} else {
					$newName = $base . '_1.' . $ext;
				}
			}

			if (move_uploaded_file($filename, $this->config->root_dir . $this->config->original_images_dir . $newName)) {
				return $newName;
			}
		}

		return false;
	}

	/**
	 * Image Constrain GD
	 */
	private function imageConstrainGd($srcFile, $dstFile, $maxW, $maxH, $watermark = null, $watermarkOffsetX = 0, $watermarkOffsetY = 0, $watermarkOpacity = 1)
	{
		if (!file_exists($srcFile)) {
			return false;
		}

		$quality = $this->settings->image_quality;

		@list($srcW, $srcH, $srcType) = array_values(getimagesize($srcFile));
		$srcType = image_type_to_mime_type($srcType);

		if (empty($srcW) || empty($srcH) || empty($srcType)) {
			return false;
		}

		if (!$watermark && ($srcW <= $maxW) && ($srcH <= $maxH)) {
			if (!copy($srcFile, $dstFile)) {
				return false;
			}

			return true;
		}

		switch ($srcType) {
			case 'image/jpeg':
				$srcImg = @imageCreateFromJpeg($srcFile);
				break;
			case 'image/gif':
				$srcImg = @imageCreateFromGif($srcFile);
				break;
			case 'image/png':
				$srcImg = @imageCreateFromPng($srcFile);
				imagealphablending($srcImg, true);
				break;
			default:
				return false;
		}

		if (empty($srcImg)) {
			return false;
		}

		@list($dstW, $dstH) = $this->calcContrainSize($srcW, $srcH, $maxW, $maxH);

		$srcColors = imagecolorstotal($srcImg);

		if ($this->settings->smart_resize) {
			if ($srcColors > 0 && $srcColors <= 256) {
				$dstImg = imagecreate($maxW, $maxH);
			} else {
				$dstImg = imagecreatetruecolor($maxW, $maxH);
			}

			if (empty($dstImg)) {
				return false;
			}

			$transparentIndex = imagecolortransparent($srcImg);

			if ($transparentIndex >= 0 && $transparentIndex <= 128) {
				$tC = imagecolorsforindex($srcImg, $transparentIndex);
				$transparentIndex = imagecolorallocate($dstImg, $tC['red'], $tC['green'], $tC['blue']);

				if ($transparentIndex === false) {
					return false;
				}

				if (!imagefill($dstImg, 0, 0, $transparentIndex)) {
					return false;
				}

				imagecolortransparent($dstImg, $transparentIndex);
			} elseif ($srcType === 'image/png') {

				if (!imagealphablending($dstImg, false)) {
					return false;
				}

				$transparency = imagecolorallocatealpha($dstImg, 255, 255, 255, 127);

				if (false === $transparency) {
					return false;
				}

				if (!imagefill($dstImg, 0, 0, $transparency)) {
					return false;
				}

				if (!imagesavealpha($dstImg, true)) {
					return false;
				}
			} else {
				$transparentIndex = imagecolorallocate($dstImg, 255, 255, 255);

				if ($transparentIndex === false) {
					return false;
				}

				if (!imagefill($dstImg, 0, 0, $transparentIndex)) {
					return false;
				}
			}

			$xPos = 0;
			$yPos = 0;
			$scale = min($maxW / $srcW, $maxH / $srcH);

			if ($scale == 1 && $srcType != 'image/png') {
				return false;
			}

			$newWidth = (int) ($srcW * $scale);
			$newHeight = (int) ($srcH * $scale);

			$xPos = (int) (($maxW - $newWidth) / 2);
			$yPos = (int) (($maxH - $newHeight) / 2);

			if (!imagecopyresampled($dstImg, $srcImg, $xPos, $yPos, 0, 0, $newWidth, $newHeight, $srcW, $srcH)) {
				return false;
			}

			if (!empty($watermark) && is_readable($watermark)) {
				$overlay = @imagecreatefrompng($watermark);

				if ($overlay === false) {
					return false;
				}

				$oWidth = imagesx($overlay);
				$oHeight = imagesy($overlay);

				$watermarkX = min(($maxW - $oWidth) * $watermarkOffsetX / 100, $maxW);
				$watermarkY = min(($maxH - $oHeight) * $watermarkOffsetY / 100, $maxH);

				$this->imagecopymergeAlpha($dstImg, $overlay, $watermarkX, $watermarkY, 0, 0, $oWidth, $oHeight, $watermarkOpacity * 100);
			}
		} else {

			if ($srcColors > 0 && $srcColors <= 256) {
				$dstImg = imagecreate($dstW, $dstH);
			} else {
				$dstImg = imagecreatetruecolor($dstW, $dstH);
			}

			if (empty($dstImg)) {
				return false;
			}

			$transparentIndex = imagecolortransparent($srcImg);

			if ($transparentIndex >= 0 && $transparentIndex <= 128) {
				$tC = imagecolorsforindex($srcImg, $transparentIndex);

				$transparentIndex = imagecolorallocate($dstImg, $tC['red'], $tC['green'], $tC['blue']);

				if ($transparentIndex === false) {
					return false;
				}

				if (!imagefill($dstImg, 0, 0, $transparentIndex)) {
					return false;
				}

				imagecolortransparent($dstImg, $transparentIndex);
			} elseif ($srcType === 'image/png') {

				if (!imagealphablending($dstImg, false)) {
					return false;
				}

				$transparency = imagecolorallocatealpha($dstImg, 0, 0, 0, 127);

				if (false === $transparency) {
					return false;
				}

				if (!imagefill($dstImg, 0, 0, $transparency)) {
					return false;
				}

				if (!imagesavealpha($dstImg, true)) {
					return false;
				}
			}

			if (!imagecopyresampled($dstImg, $srcImg, 0, 0, 0, 0, $dstW, $dstH, $srcW, $srcH)) {
				return false;
			}

			if (!empty($watermark) && is_readable($watermark)) {
				$overlay = @imagecreatefrompng($watermark);

				if ($overlay === false) {
					return false;
				}

				$oWidth = imagesx($overlay);
				$oHeight = imagesy($overlay);

				$watermarkX = min(($dstW - $oWidth) * $watermarkOffsetX / 100, $dstW);
				$watermarkY = min(($dstH - $oHeight) * $watermarkOffsetY / 100, $dstH);

				$this->imagecopymergeAlpha($dstImg, $overlay, $watermarkX, $watermarkY, 0, 0, $oWidth, $oHeight, $watermarkOpacity * 100);
			}
		}

		if ('image/png' === $srcType) {

			$quality = round(($quality / 100) * 10);

			if ($quality < 1) {
				$quality = 1;
			} elseif ($quality > 10) {
				$quality = 10;
			}

			$quality = 10 - $quality;
		}

		switch ($srcType) {
			case 'image/jpeg':
				return imageJpeg($dstImg, $dstFile, $quality);
			case 'image/gif':
				return imageGif($dstImg, $dstFile);
			case 'image/png':
				imagesavealpha($dstImg, true);
				return imagePng($dstImg, $dstFile, $quality);
			default:
				return false;
		}
	}

	/**
	 * Image Constrain Imagick
	 */
	private function imageConstrainImagick($srcFile, $dstFile, $maxW, $maxH, $watermark = null, $watermarkOffsetX = 0, $watermarkOffsetY = 0, $watermarkOpacity = 1, $sharpen = 0.2)
	{
		if (!file_exists($srcFile)) {
			return false;
		}

		$thumb = new Imagick();

		if (!$thumb->readImage($srcFile)) {
			return false;
		}

		$srcW = $thumb->getImageWidth();
		$srcH = $thumb->getImageHeight();

		if (!$watermark && ($srcW <= $maxW) && ($srcH <= $maxH)) {
			return copy($srcFile, $dstFile);
		}

		list($dstW, $dstH) = $this->calcContrainSize($srcW, $srcH, $maxW, $maxH);

		if (!empty($this->settings->smart_resize)) {
			$canvas = new Imagick();
			$canvas->newImage($maxW, $maxH, new ImagickPixel("white"));
		} else {
			$canvas = $thumb;
		}

		$watermarkX = null;
		$watermarkY = null;

		if ($watermark && is_readable($watermark)) {
			$overlay = new Imagick($watermark);
			$overlay->evaluateImage(Imagick::EVALUATE_MULTIPLY, $watermarkOpacity, Imagick::CHANNEL_ALPHA);

			$oWidth = $overlay->getImageWidth();
			$oHeight = $overlay->getImageHeight();

			$watermarkX = min(($dstW - $oWidth) * $watermarkOffsetX / 100, $dstW);
			$watermarkY = min(($dstH - $oHeight) * $watermarkOffsetY / 100, $dstH);
		}

		foreach ($thumb as $frame) {
			$frame->thumbnailImage($dstW, $dstH);
			$frame->setImagePage($dstW, $dstH, 0, 0);

			if ($sharpen > 0) {
				$frame->adaptiveSharpenImage($sharpen, $sharpen);
			}

			if (isset($overlay)) {
				$frame->compositeImage($overlay, Imagick::COMPOSITE_OVER, (int) round($watermarkX), (int) round($watermarkY));
			}

			if (!empty($this->settings->smart_resize)) {
				$canvas->compositeImage($frame, Imagick::COMPOSITE_DEFAULT, (int) (($maxW - $dstW) / 2), (int) (($maxH - $dstH) / 2));
			} else {
				$canvas->compositeImage($frame, Imagick::COMPOSITE_DEFAULT, 0, 0);
			}
		}

		$canvas->stripImage();

		$quality = $this->settings->image_quality;
		$canvas->setImageCompressionQuality($quality);

		if (!$canvas->writeImages($dstFile, true)) {
			return false;
		}

		$thumb->destroy();

		if (isset($overlay)) {
			$overlay->destroy();
		}

		$canvas->destroy();

		return true;
	}

	/**
	 * Calc Contrain Size
	 */
	function calcContrainSize($srcW, $srcH, $maxW = 0, $maxH = 0)
	{
		if ($srcW == 0 || $srcH == 0) {
			return false;
		}

		$dstW = $srcW;
		$dstH = $srcH;

		if ($srcW > $maxW && $maxW > 0) {
			$dstH = $srcH * ($maxW / $srcW);
			$dstW = $maxW;
		}

		if ($dstH > $maxH && $maxH > 0) {
			$dstW = $dstW * ($maxH / $dstH);
			$dstH = $maxH;
		}

		return [round($dstW), round($dstH)];
	}

	/**
	 * Correct Filename
	 */
	public function correctFilename($filename)
	{
		$cyr = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я");
		$lat = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

		$res = str_replace($cyr, $lat, $filename);
		$res = preg_replace("/[\s]+/ui", '-', $res);
		$res = preg_replace("/[^a-zA-Z0-9\.\-\_]+/ui", '', $res);
		$res = strtolower($res);

		return $res;
	}

	/**
	 * Imagecopymerge Alpha
	 */
	private function imagecopymergeAlpha($dstI, $srcI, $dstX, $dstY, $srcX, $srcY, $srcW, $srcH, $pct)
	{
		$dstX = round($dstX);
		$dstY = round($dstY);
		$srcX = round($srcX);
		$srcY = round($srcY);
		$srcW = round($srcW);
		$srcH = round($srcH);
		$pct = round($pct);

		$cut = imagecreatetruecolor($srcW, $srcH);
		imagecopy($cut, $dstI, 0, 0, $dstX, $dstY, $srcW, $srcH);
		imagecopy($cut, $srcI, 0, 0, $srcX, $srcY, $srcW, $srcH);
		imagecopymerge($dstI, $cut, $dstX, $dstY, 0, 0, $srcW, $srcH, $pct);
	}
}
