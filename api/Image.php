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
	function resize($filename, $is_category = 0, $is_post = 0, $is_article = 0, $is_brands = 0, $is_banners = 0)
	{
		list($sourceFile, $width, $height, $setWatermark) = $this->getResizeParams($filename);

		$size = ($width ? $width : 0) . 'x' . ($height ? $height : 0) . ($setWatermark ? "w" : '');
		$imageSizes = explode('|', $this->settings->image_sizes);

		if (!in_array($size, $imageSizes)) {
			header("http/1.0 404 not found");
			exit();
		}

		if (substr($sourceFile, 0, 7) == 'http://' || substr($sourceFile, 0, 8) == 'https://') {
			$originalFile = $this->downloadImage($sourceFile);

			if (!$originalFile) {
				return false;
			}

			$resizedFile = $this->addResizeParams($originalFile, $width, $height, $setWatermark);
		} else {
			$originalFile = $sourceFile;
		}

		$resizedFile = $this->addResizeParams($originalFile, $width, $height, $setWatermark);

		switch (true) {
			case ($is_category == 1):
				$originalsDir = $this->config->root_dir . $this->config->categories_images_dir;
				$previewDir = $this->config->root_dir . $this->config->resized_category_images_dir;
				break;
			case ($is_brands == 1):
				$originalsDir = $this->config->root_dir . $this->config->brands_images_dir;
				$previewDir = $this->config->root_dir . $this->config->resized_brands_images_dir;
				break;
			case ($is_banners == 1):
				$originalsDir = $this->config->root_dir . $this->config->banners_images_dir;
				$previewDir = $this->config->root_dir . $this->config->resized_banners_images_dir;
				break;
			case ($is_post == 1):
				$originalsDir = $this->config->root_dir . $this->config->posts_images_dir;
				$previewDir = $this->config->root_dir . $this->config->resized_posts_images_dir;
				break;
			case ($is_article == 1):
				$originalsDir = $this->config->root_dir . $this->config->articles_images_dir;
				$previewDir = $this->config->root_dir . $this->config->resized_articles_images_dir;
				break;
			default:
				$originalsDir = $this->config->root_dir . $this->config->original_images_dir;
				$previewDir = $this->config->root_dir . $this->config->resized_images_dir;
				break;
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
	 * Add resize params
	 */
	public function addResizeParams($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		if (empty($filename) || $filename == null) {
			return '';
		}

		$dirname = pathinfo($filename, PATHINFO_DIRNAME);
		$file = pathinfo($filename, PATHINFO_FILENAME);

		if ('.' != $dirname) {
			$file = $dirname . '/' . $file;
		}

		$ext = pathinfo($filename, PATHINFO_EXTENSION);

		if ($width > 0 || $height > 0) {
			$resizedFilename = $file . '.' . ($width > 0 ? $width : '') . 'x' . ($height > 0 ? $height : '') . ($setWatermark ? 'w' : '') . '.' . $ext;
		} else {
			$resizedFilename = $file . '.' . ($setWatermark ? 'w.' : '') . $ext;
		}

		return $resizedFilename;
	}

	/**
	 * Get resize parameters
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
	 * Downloads image
	 */
	public function downloadImage($filename)
	{
		$this->db->query('SELECT 1 FROM __images WHERE filename=? LIMIT 1', $filename);

		if (!$this->db->result()) {
			return false;
		}

		$basename = explode('&', pathinfo($filename, PATHINFO_BASENAME));
		$uploadedFile = array_shift($basename);
		$base = urldecode(pathinfo($uploadedFile, PATHINFO_FILENAME));
		$ext = pathinfo($uploadedFile, PATHINFO_EXTENSION);
		$newName = urldecode($uploadedFile);

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
	 * Uploads image
	 */
	public function uploadImage($filename, $name)
	{
		$name = $this->correctFilename($name);
		$uploadedFile = $newName = pathinfo($name, PATHINFO_BASENAME);
		$base = pathinfo($uploadedFile, PATHINFO_FILENAME);
		$ext = pathinfo($uploadedFile, PATHINFO_EXTENSION);

		if (in_array(strtolower($ext), $this->allowedExtensions)) {
			while (file_exists($this->config->root_dir . $this->config->original_images_dir . $newName)) {
				$newBase = pathinfo($newName, PATHINFO_FILENAME);
				if (preg_match('/_([0-9]+)$/', $newBase, $parts))
					$newName = $base . '_' . ($parts[1] + 1) . '.' . $ext;
				else
					$newName = $base . '_1.' . $ext;
			}

			if (move_uploaded_file($filename, $this->config->root_dir . $this->config->original_images_dir . $newName)) {
				return $newName;
			}
		}

		return false;
	}

	/**
	 * Image constrain gd
	 */
	private function imageConstrainGd($src_file, $dst_file, $max_w, $max_h, $watermark = null, $watermark_offset_x = 0, $watermark_offset_y = 0, $watermark_opacity = 1)
	{
		$quality = 100;

		list($src_w, $src_h, $src_type) = array_values(is_array(getimagesize($src_file)) ? getimagesize($src_file) : []);
		$src_type = image_type_to_mime_type($src_type);

		if (empty($src_w) || empty($src_h) || empty($src_type)) {
			return false;
		}

		if (!$watermark && ($src_w <= $max_w) && ($src_h <= $max_h)) {
			if (!copy($src_file, $dst_file)) {
				return false;
			}

			return true;
		}

		list($dst_w, $dst_h) = $this->calcContrainSize($src_w, $src_h, $max_w, $max_h);

		switch ($src_type) {
			case 'image/jpeg':
				$src_img = imageCreateFromJpeg($src_file);
				break;
			case 'image/gif':
				$src_img = imageCreateFromGif($src_file);
				break;
			case 'image/png':
				$src_img = imageCreateFromPng($src_file);
				imagealphablending($src_img, true);
				break;
			default:
				return false;
		}

		if (empty($src_img)) {
			return false;
		}

		$src_colors = imagecolorstotal($src_img);

		if ($this->settings->smart_resize) {

			if ($src_colors > 0 && $src_colors <= 256) {
				$dst_img = imagecreate($max_w, $max_h);
			} else {
				$dst_img = imagecreatetruecolor($max_w, $max_h);
			}

			if (empty($dst_img)) {
				return false;
			}

			$transparent_index = imagecolortransparent($src_img);

			if ($transparent_index >= 0 && $transparent_index <= 128) {
				$t_c = imagecolorsforindex($src_img, $transparent_index);
				$transparent_index = imagecolorallocate($dst_img, $t_c['red'], $t_c['green'], $t_c['blue']);

				if ($transparent_index === false) {
					return false;
				}

				if (!imagefill($dst_img, 0, 0, $transparent_index)) {
					return false;
				}

				imagecolortransparent($dst_img, $transparent_index);
			} elseif ($src_type === 'image/png') {
				if (!imagealphablending($dst_img, false)) {
					return false;
				}

				$transparency = imagecolorallocatealpha($dst_img, 255, 255, 255, 127);

				if (false === $transparency) {
					return false;
				}

				if (!imagefill($dst_img, 0, 0, $transparency)) {
					return false;
				}

				if (!imagesavealpha($dst_img, true)) {
					return false;
				}
			} else {
				$transparent_index = imagecolorallocate($dst_img, 255, 255, 255);

				if ($transparent_index === false) {
					return false;
				}

				if (!imagefill($dst_img, 0, 0, $transparent_index)) {
					return false;
				}
			}

			$xpos = 0;
			$ypos = 0;
			$scale = min($max_w / $src_w, $max_h / $src_h);

			if ($scale == 1 && $src_type != 'image/png') {
				return false;
			}

			$new_width = (int) ($src_w * $scale);
			$new_height = (int) ($src_h * $scale);
			$xpos = (int) (($max_w - $new_width) / 2);
			$ypos = (int) (($max_h - $new_height) / 2);

			if (!imagecopyresampled($dst_img, $src_img, $xpos, $ypos, 0, 0, $new_width, $new_height, $src_w, $src_h)) {
				return false;
			}

			if (!empty($watermark) && is_readable($watermark)) {
				$overlay = imagecreatefrompng($watermark);
				$owidth = imagesx($overlay);
				$oheight = imagesy($overlay);
				$watermark_x = min(($max_w - $owidth) * $watermark_offset_x / 100, $max_w);
				$watermark_y = min(($max_h - $oheight) * $watermark_offset_y / 100, $max_h);
				$this->imagecopymergeAlpha($dst_img, $overlay, $watermark_x, $watermark_y, 0, 0, $owidth, $oheight, $watermark_opacity * 100);
			}
		} else {

			if ($src_colors > 0 && $src_colors <= 256) {
				$dst_img = imagecreate($dst_w, $dst_h);
			} else {
				$dst_img = imagecreatetruecolor($dst_w, $dst_h);
			}

			if (empty($dst_img)) {
				return false;
			}

			$transparent_index = imagecolortransparent($src_img);

			if ($transparent_index >= 0 && $transparent_index <= 128) {
				$t_c = imagecolorsforindex($src_img, $transparent_index);
				$transparent_index = imagecolorallocate($dst_img, $t_c['red'], $t_c['green'], $t_c['blue']);

				if ($transparent_index === false) {
					return false;
				}

				if (!imagefill($dst_img, 0, 0, $transparent_index)) {
					return false;
				}

				imagecolortransparent($dst_img, $transparent_index);
			} elseif ($src_type === 'image/png') {
				if (!imagealphablending($dst_img, false)) {
					return false;
				}

				$transparency = imagecolorallocatealpha($dst_img, 0, 0, 0, 127);

				if (false === $transparency) {
					return false;
				}

				if (!imagefill($dst_img, 0, 0, $transparency)) {
					return false;
				}

				if (!imagesavealpha($dst_img, true)) {
					return false;
				}
			}

			if (!@imagecopyresampled($dst_img, $src_img, 0, 0, 0, 0, $dst_w, $dst_h, $src_w, $src_h)) {
				return false;
			}

			if (!empty($watermark) && is_readable($watermark)) {
				$overlay = imagecreatefrompng($watermark);
				$owidth = imagesx($overlay);
				$oheight = imagesy($overlay);
				$watermark_x = min(($dst_w - $owidth) * $watermark_offset_x / 100, $dst_w);
				$watermark_y = min(($dst_h - $oheight) * $watermark_offset_y / 100, $dst_h);
				$this->imagecopymergeAlpha($dst_img, $overlay, $watermark_x, $watermark_y, 0, 0, $owidth, $oheight, $watermark_opacity * 100);
			}
		}

		if ('image/png' === $src_type) {
			$quality = round(($quality / 100) * 10);

			if ($quality < 1) {
				$quality = 1;
			} elseif ($quality > 10) {
				$quality = 10;
			}

			$quality = 10 - $quality;
		}

		switch ($src_type) {
			case 'image/jpeg':
				return imageJpeg($dst_img, $dst_file, $quality);
			case 'image/gif':
				return imageGif($dst_img, $dst_file, $quality);
			case 'image/png':
				imagesavealpha($dst_img, true);
				return imagePng($dst_img, $dst_file, $quality);
			default:
				return false;
		}
	}

	/**
	 * Image constrain imagick
	 */
	private function imageConstrainImagick($src_file, $dst_file, $max_w, $max_h, $watermark = null, $watermark_offset_x = 0, $watermark_offset_y = 0, $watermark_opacity = 1.0, $sharpen = 0.2)
	{
		$thumb = new Imagick();

		try {
			if (!$thumb->readImage($src_file)) {
				return false;
			}
		} catch (ImagickException $e) {
			return false;
		}

		$src_w = $thumb->getImageWidth();
		$src_h = $thumb->getImageHeight();

		if (!$watermark && ($src_w <= $max_w) && ($src_h <= $max_h)) {
			if (!copy($src_file, $dst_file)) {
				return false;
			}

			return true;
		}

		list($dst_w, $dst_h) = $this->calcContrainSize($src_w, $src_h, $max_w, $max_h);

		$thumb->thumbnailImage(round($dst_w), round($dst_h));

		if ($this->settings->smart_resize) {
			$canvas = new Imagick();
			$canvas->newImage($max_w, $max_h, new ImagickPixel("white"));

			if ($watermark && is_readable($watermark)) {
				$overlay = new Imagick($watermark);
				$overlay->evaluateImage(Imagick::EVALUATE_MULTIPLY, $watermark_opacity, Imagick::CHANNEL_ALPHA);
				$owidth = $overlay->getImageWidth();
				$oheight = $overlay->getImageHeight();
				$watermark_x = min(($max_w - $owidth) * $watermark_offset_x / 100, $max_w);
				$watermark_y = min(($max_h - $oheight) * $watermark_offset_y / 100, $max_h);
			}

			foreach ($thumb as $frame) {
				$frame->thumbnailImage((int) $dst_w, (int) $dst_h);
				$frame->setImagePage((int) $dst_w, (int) $dst_h, 0, 0);

				if ($sharpen > 0) {
					$thumb->adaptiveSharpenImage($sharpen, $sharpen);
				}

				$canvas->compositeImage($frame, $frame->getImageCompose(), (int) (($max_w - $dst_w) / 2), (int) (($max_h - $dst_h) / 2));

				if (isset($overlay) && is_object($overlay)) {
					$canvas->compositeImage($overlay, imagick::COMPOSITE_OVER, $watermark_x, $watermark_y);
				}
			}

			$canvas->stripImage();

			if (!$canvas->writeImages($dst_file, true)) {
				return false;
			}

			$thumb->destroy();

			if (isset($overlay) && is_object($overlay)) {
				$overlay->destroy();
			}

			$canvas->destroy();
		} else {
			if ($watermark && is_readable($watermark)) {
				$overlay = new Imagick($watermark);
				$overlay->evaluateImage(Imagick::EVALUATE_MULTIPLY, $watermark_opacity, Imagick::CHANNEL_ALPHA);
				$owidth = $overlay->getImageWidth();
				$oheight = $overlay->getImageHeight();
				$watermark_x = min(($dst_w - $owidth) * $watermark_offset_x / 100, $dst_w);
				$watermark_y = min(($dst_h - $oheight) * $watermark_offset_y / 100, $dst_h);
			}

			foreach ($thumb as $frame) {
				$frame->thumbnailImage(round($dst_w), round($dst_h));
				$frame->setImagePage(round($dst_w), round($dst_h), 0, 0);

				if ($sharpen > 0) {
					$thumb->adaptiveSharpenImage($sharpen, $sharpen);
				}

				if (isset($overlay) && is_object($overlay)) {
					$frame->compositeImage($overlay, imagick::COMPOSITE_OVER, round($watermark_x), round($watermark_y));
				}
			}

			$thumb->stripImage();

			if (!$thumb->writeImages($dst_file, true)) {
				return false;
			}

			$thumb->destroy();

			if (isset($overlay) && is_object($overlay)) {
				$overlay->destroy();
			}
		}

		return true;
	}

	/**
	 * Calc contrain size
	 */
	function calcContrainSize($src_w, $src_h, $max_w = 0, $max_h = 0)
	{
		if ($src_w == 0 || $src_h == 0) {
			return false;
		}

		$dst_w = $src_w;
		$dst_h = $src_h;

		if ($src_w > $max_w && $max_w > 0) {
			$dst_h = $src_h * ($max_w / $src_w);
			$dst_w = $max_w;
		}

		if ($dst_h > $max_h && $max_h > 0) {
			$dst_w = $dst_w * ($max_h / $dst_h);
			$dst_h = $max_h;
		}

		return [$dst_w, $dst_h];
	}

	/**
	 * Correct filename
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
	 * Imagecopymerge alpha
	 */
	private function imagecopymergeAlpha($dst_img, $src_img, $dst_x, $dst_y, $src_x, $src_y, $src_w, $src_h, $pct)
	{
		$cut = imagecreatetruecolor($src_w, $src_h);
		imagecopy($cut, $dst_img, 0, 0, $dst_x, $dst_y, $src_w, $src_h);
		imagecopy($cut, $src_img, 0, 0, $src_x, $src_y, $src_w, $src_h);
		imagecopymerge($dst_img, $cut, $dst_x, $dst_y, 0, 0, $src_w, $src_h, $pct);
	}
}
