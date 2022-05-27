<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Image extends Turbo
{
	private	$allowed_extentions = array('png', 'gif', 'jpg', 'jpeg', 'ico');

	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * Creating an Image Preview
	 * @param $filename image file (without file path)
	 * @param max_w maximum width
	 * @param max_h max height
	 * @return $string preview filename 
	 */
	function resize($filename, $is_category = 0, $is_post = 0, $is_article = 0, $is_brands = 0, $is_banners = 0)
	{
		list($source_file, $width, $height, $set_watermark) = $this->get_resize_params($filename);

		$size = ($width ? $width : 0) . 'x' . ($height ? $height : 0) . ($set_watermark ? "w" : '');
		$image_sizes = array();
		if ($this->settings->image_sizes)
			$image_sizes = explode('|', $this->settings->image_sizes);
		if (!in_array($size, $image_sizes)) {
			header("http/1.0 404 not found");
			exit();
		}

		// If the file is remote (http://), upload it to ourselves
		if (substr($source_file, 0, 7) == 'http://' || substr($source_file, 0, 8) == 'https://') {
			// Original file name
			if (!$original_file = $this->download_image($source_file))
				return false;

			$resized_file = $this->add_resize_params($original_file, $width, $height, $set_watermark);
		} else {
			$original_file = $source_file;
		}

		$resized_file = $this->add_resize_params($original_file, $width, $height, $set_watermark);

		// Paths to folders with pictures
		if ($is_category == 1) {
			$originals_dir = $this->config->root_dir . $this->config->categories_images_dir;
			$preview_dir = $this->config->root_dir . $this->config->resized_category_images_dir;
		} elseif ($is_brands == 1) {
			$originals_dir = $this->config->root_dir . $this->config->brands_images_dir;
			$preview_dir = $this->config->root_dir . $this->config->resized_brands_images_dir;
		} elseif ($is_banners == 1) {
			$originals_dir = $this->config->root_dir . $this->config->banners_images_dir;
			$preview_dir = $this->config->root_dir . $this->config->resized_banners_images_dir;
		} elseif ($is_post == 1) {
			$originals_dir = $this->config->root_dir . $this->config->posts_images_dir;
			$preview_dir = $this->config->root_dir . $this->config->resized_posts_images_dir;
		} elseif ($is_article == 1) {
			$originals_dir = $this->config->root_dir . $this->config->articles_images_dir;
			$preview_dir = $this->config->root_dir . $this->config->resized_articles_images_dir;
		} else {
			$originals_dir = $this->config->root_dir . $this->config->original_images_dir;
			$preview_dir = $this->config->root_dir . $this->config->resized_images_dir;
		}

		$watermark_offet_x = $this->settings->watermark_offset_x;
		$watermark_offet_y = $this->settings->watermark_offset_y;

		$sharpen = min(100, $this->settings->images_sharpen) / 100;
		$watermark_transparency =  1 - min(100, $this->settings->watermark_transparency) / 100;


		if ($set_watermark && is_file($this->config->root_dir . $this->config->watermark_file))
			$watermark = $this->config->root_dir . $this->config->watermark_file;
		else
			$watermark = null;

		if (class_exists('Imagick') && $this->config->use_imagick)
			$this->image_constrain_imagick($originals_dir . $original_file, $preview_dir . $resized_file, $width, $height, $watermark, $watermark_offet_x, $watermark_offet_y, $watermark_transparency, $sharpen);
		else
			$this->image_constrain_gd($originals_dir . $original_file, $preview_dir . $resized_file, $width, $height, $watermark, $watermark_offet_x, $watermark_offet_y, $watermark_transparency);

		return $preview_dir . $resized_file;
	}

	public function add_resize_params($filename, $width = 0, $height = 0, $set_watermark = false)
	{
		if ('.' != ($dirname = pathinfo($filename,  PATHINFO_DIRNAME)))
			$file = $dirname . '/' . pathinfo($filename, PATHINFO_FILENAME);
		else
			$file = pathinfo($filename, PATHINFO_FILENAME);
		$ext = pathinfo($filename, PATHINFO_EXTENSION);

		if ($width > 0 || $height > 0)
			$resized_filename = $file . '.' . ($width > 0 ? $width : '') . 'x' . ($height > 0 ? $height : '') . ($set_watermark ? 'w' : '') . '.' . $ext;
		else
			$resized_filename = $file . '.' . ($set_watermark ? 'w.' : '') . $ext;

		return $resized_filename;
	}

	public function get_resize_params($filename)
	{
		// Defining resize parameters
		if (!preg_match('/(.+)\.([0-9]*)x([0-9]*)(w)?\.([^\.]+)$/', $filename, $matches))
			return false;

		$file = $matches[1];					// requested file name
		$width = $matches[2];					// future image width
		$height = $matches[3];					// future image height
		$set_watermark = $matches[4] == 'w';	// whether to put a watermark
		$ext = $matches[5];						// file extension

		return array($file . '.' . $ext, $width, $height, $set_watermark);
	}


	public function download_image($filename)
	{
		// Fill only if there is such a file in the database
		$this->db->query('SELECT 1 FROM __images WHERE filename=? LIMIT 1', $filename);
		if (!$this->db->result())
			return false;

		// Original file name
		$basename = explode('&', pathinfo($filename, PATHINFO_BASENAME));
		$uploaded_file = array_shift($basename);
		$base = urldecode(pathinfo($uploaded_file, PATHINFO_FILENAME));
		$ext = pathinfo($uploaded_file, PATHINFO_EXTENSION);

		// If such a file exists, you need to come up with a different name
		$new_name = urldecode($uploaded_file);

		while (file_exists($this->config->root_dir . $this->config->original_images_dir . $new_name)) {
			$new_base = pathinfo($new_name, PATHINFO_FILENAME);
			if (preg_match('/_([0-9]+)$/', $new_base, $parts))
				$new_name = $base . '_' . ($parts[1] + 1) . '.' . $ext;
			else
				$new_name = $base . '_1.' . $ext;
		}
		$this->db->query('UPDATE __images SET filename=? WHERE filename=?', $new_name, $filename);

		// Before long copying, let's take this name
		fclose(fopen($this->config->root_dir . $this->config->original_images_dir . $new_name, 'w'));
		copy($filename, $this->config->root_dir . $this->config->original_images_dir . $new_name);
		return $new_name;
	}

	public function upload_image($filename, $name)
	{
		// Original file name
		$name = $this->correct_filename($name);
		$uploaded_file = $new_name = pathinfo($name, PATHINFO_BASENAME);
		$base = pathinfo($uploaded_file, PATHINFO_FILENAME);
		$ext = pathinfo($uploaded_file, PATHINFO_EXTENSION);

		if (in_array(strtolower($ext), $this->allowed_extentions)) {
			while (file_exists($this->config->root_dir . $this->config->original_images_dir . $new_name)) {
				$new_base = pathinfo($new_name, PATHINFO_FILENAME);
				if (preg_match('/_([0-9]+)$/', $new_base, $parts))
					$new_name = $base . '_' . ($parts[1] + 1) . '.' . $ext;
				else
					$new_name = $base . '_1.' . $ext;
			}
			if (move_uploaded_file($filename, $this->config->root_dir . $this->config->original_images_dir . $new_name))
				return $new_name;
		}

		return false;
	}

	/**
	 * Create previews with gd
	 * @param $src_file source file
	 * @param $dst_file result file
	 * @param max_w maximum width
	 * @param max_h max height 
	 * @return bool
	 */
	private function image_constrain_gd($src_file, $dst_file, $max_w, $max_h, $watermark = null, $watermark_offet_x = 0, $watermark_offet_y = 0, $watermark_opacity = 1)
	{
		$quality = 100;

		// Source image options
		@list($src_w, $src_h, $src_type) = array_values(getimagesize($src_file));
		$src_type = image_type_to_mime_type($src_type);

		if (empty($src_w) || empty($src_h) || empty($src_type))
			return false;

		// Does it need to be cut?
		if (!$watermark && ($src_w <= $max_w) && ($src_h <= $max_h)) {
			// No - just copy the file
			if (!copy($src_file, $dst_file))
				return false;
			return true;
		}

		// Preview size when scaled down proportionally
		@list($dst_w, $dst_h) = $this->calc_contrain_size($src_w, $src_h, $max_w, $max_h);

		// Reading the image
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

		if (empty($src_img))
			return false;

		$src_colors = imagecolorstotal($src_img);

		if ($this->settings->smart_resize) {
			// create destination image (indexed, if possible)
			if ($src_colors > 0 && $src_colors <= 256)
				$dst_img = imagecreate($max_w, $max_h);
			else
				$dst_img = imagecreatetruecolor($max_w, $max_h);

			if (empty($dst_img))
				return false;

			$transparent_index = imagecolortransparent($src_img);
			if ($transparent_index >= 0 && $transparent_index <= 128) {
				$t_c = imagecolorsforindex($src_img, $transparent_index);
				$transparent_index = imagecolorallocate($dst_img, $t_c['red'], $t_c['green'], $t_c['blue']);
				if ($transparent_index === false)
					return false;
				if (!imagefill($dst_img, 0, 0, $transparent_index))
					return false;
				imagecolortransparent($dst_img, $transparent_index);
			}
			// or preserve alpha transparency for png
			elseif ($src_type === 'image/png') {
				if (!imagealphablending($dst_img, false))
					return false;
				$transparency = imagecolorallocatealpha($dst_img, 255, 255, 255, 127);
				if (false === $transparency)
					return false;
				if (!imagefill($dst_img, 0, 0, $transparency))
					return false;
				if (!imagesavealpha($dst_img, true))
					return false;
			} else {
				$transparent_index = imagecolorallocate($dst_img, 255, 255, 255);
				if ($transparent_index === false)
					return false;
				if (!imagefill($dst_img, 0, 0, $transparent_index))
					return false;
				imagecolortransparent($dst_img, $transparent_index);
			}

			$xpos = 0;
			$ypos = 0;

			$scale = min($max_w / $src_w, $max_h / $src_h);

			if ($scale == 1 && $src_type != 'image/png') {
				return;
			}

			$new_width = (int)($src_w * $scale);
			$new_height = (int)($src_h * $scale);
			$xpos = (int)(($max_w - $new_width) / 2);
			$ypos = (int)(($max_h - $new_height) / 2);

			// resample the image with new sizes
			if (!imagecopyresampled($dst_img, $src_img, $xpos, $ypos, 0, 0, $new_width, $new_height, $src_w, $src_h))
				return false;
		} else {
			// create destination image (indexed, if possible)
			if ($src_colors > 0 && $src_colors <= 256)
				$dst_img = imagecreate($dst_w, $dst_h);
			else
				@$dst_img = imagecreatetruecolor($dst_w, $dst_h);

			if (empty($dst_img))
				return false;

			$transparent_index = imagecolortransparent($src_img);
			if ($transparent_index >= 0 && $transparent_index <= 128) {
				$t_c = imagecolorsforindex($src_img, $transparent_index);
				$transparent_index = imagecolorallocate($dst_img, $t_c['red'], $t_c['green'], $t_c['blue']);
				if ($transparent_index === false)
					return false;
				if (!imagefill($dst_img, 0, 0, $transparent_index))
					return false;
				imagecolortransparent($dst_img, $transparent_index);
			}
			// or preserve alpha transparency for png
			elseif ($src_type === 'image/png') {
				if (!imagealphablending($dst_img, false))
					return false;
				$transparency = imagecolorallocatealpha($dst_img, 0, 0, 0, 127);
				if (false === $transparency)
					return false;
				if (!imagefill($dst_img, 0, 0, $transparency))
					return false;
				if (!imagesavealpha($dst_img, true))
					return false;
			}

			// resample the image with new sizes
			if (!@imagecopyresampled($dst_img, $src_img, 0, 0, 0, 0, $dst_w, $dst_h, $src_w, $src_h))
				return false;
		}

		// Watermark
		if (!empty($watermark) && is_readable($watermark)) {
			$overlay = imagecreatefrompng($watermark);

			// Get the size of overlay 
			$owidth = imagesx($overlay);
			$oheight = imagesy($overlay);

			$watermark_x = min(($dst_w - $owidth) * $watermark_offet_x / 100, $dst_w);
			$watermark_y = min(($dst_h - $oheight) * $watermark_offet_y / 100, $dst_h);

			imagecopy($dst_img, $overlay, $watermark_x, $watermark_y, 0, 0, $owidth, $oheight);
			//imagecopymerge($dst_img, $overlay, $watermark_x, $watermark_y, 0, 0, $owidth, $oheight, $watermark_opacity*100); 

		}

		// recalculate quality value for png image
		if ('image/png' === $src_type) {
			$quality = round(($quality / 100) * 10);
			if ($quality < 1)
				$quality = 1;
			elseif ($quality > 10)
				$quality = 10;
			$quality = 10 - $quality;
		}

		// Saving the image
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
	 * Creating previews using imagick
	 * @param $src_file source file
	 * @param $dst_file result file
	 * @param max_w maximum width
	 * @param max_h max height
	 * @return bool
	 */
	private function image_constrain_imagick($src_file, $dst_file, $max_w, $max_h, $watermark = null, $watermark_offet_x = 0, $watermark_offet_y = 0, $watermark_opacity = 1, $sharpen = 0.2)
	{
		$thumb = new Imagick();

		// Reading the image
		if (!$thumb->readImage($src_file))
			return false;

		// Original image dimensions
		$src_w = $thumb->getImageWidth();
		$src_h = $thumb->getImageHeight();

		// Does it need to be cut?
		if (!$watermark && ($src_w <= $max_w) && ($src_h <= $max_h)) {
			// No - just copy the file
			if (!copy($src_file, $dst_file))
				return false;
			return true;
		}

		// Preview size when scaled down proportionally
		list($dst_w, $dst_h) = $this->calc_contrain_size($src_w, $src_h, $max_w, $max_h);

		// We reduce
		$thumb->thumbnailImage($dst_w, $dst_h);
		if ($this->settings->smart_resize) {
			$canvas = new Imagick();
			$canvas->newImage($max_w, $max_h, new ImagickPixel("white"));

			// Setting up a watermark
			if ($watermark && is_readable($watermark)) {
				$overlay = new Imagick($watermark);
				//$overlay->setImageOpacity($watermark_opacity);
				//$overlay_compose = $overlay->getImageCompose();
				$overlay->evaluateImage(Imagick::EVALUATE_MULTIPLY, $watermark_opacity, Imagick::CHANNEL_ALPHA);

				// Get the size of overlay 
				$owidth = $overlay->getImageWidth();
				$oheight = $overlay->getImageHeight();

				$watermark_x = min(($max_w - $owidth) * $watermark_offet_x / 100, $max_w);
				$watermark_y = min(($max_h - $oheight) * $watermark_offet_y / 100, $max_h);
			}

			// Animated gifs require frame traversal
			foreach ($thumb as $frame) {
				// We reduce
				$frame->thumbnailImage($dst_w, $dst_h);

				/* Set the virtual canvas to correct size */
				$frame->setImagePage($dst_w, $dst_h, 0, 0);

				// Focusing
				if ($sharpen > 0)
					$thumb->adaptiveSharpenImage($sharpen, $sharpen);
				$canvas->compositeImage($frame, $frame->getImageCompose(), ($max_w - $dst_w) / 2, ($max_h - $dst_h) / 2);
				if (isset($overlay) && is_object($overlay)) {
					// $frame->compositeImage($overlay, $overlay_compose, $watermark_x, $watermark_y, imagick::COLOR_ALPHA);
					$canvas->compositeImage($overlay, imagick::COMPOSITE_OVER, $watermark_x, $watermark_y, imagick::COLOR_ALPHA);
				}
			}

			// We remove comments, etc. from the picture
			$canvas->stripImage();

			//$thumb->setImageCompressionQuality(100);

			// Recording a picture
			if (!$canvas->writeImages($dst_file, true))
				return false;

			// Cleaning
			$thumb->destroy();
			if (isset($overlay) && is_object($overlay))
				$overlay->destroy();
			$canvas->destroy();
		} else {
			// Setting up a watermark
			if ($watermark && is_readable($watermark)) {
				$overlay = new Imagick($watermark);
				//$overlay->setImageOpacity($watermark_opacity);
				//$overlay_compose = $overlay->getImageCompose();
				$overlay->evaluateImage(Imagick::EVALUATE_MULTIPLY, $watermark_opacity, Imagick::CHANNEL_ALPHA);

				// Get the size of overlay 
				$owidth = $overlay->getImageWidth();
				$oheight = $overlay->getImageHeight();

				$watermark_x = min(($dst_w - $owidth) * $watermark_offet_x / 100, $dst_w);
				$watermark_y = min(($dst_h - $oheight) * $watermark_offet_y / 100, $dst_h);
			}

			// Animated gifs require frame traversal
			foreach ($thumb as $frame) {
				// We reduce
				$frame->thumbnailImage($dst_w, $dst_h);

				/* Set the virtual canvas to correct size */
				$frame->setImagePage($dst_w, $dst_h, 0, 0);

				// Focusing
				if ($sharpen > 0)
					$thumb->adaptiveSharpenImage($sharpen, $sharpen);

				if (isset($overlay) && is_object($overlay)) {
					// $frame->compositeImage($overlay, $overlay_compose, $watermark_x, $watermark_y, imagick::COLOR_ALPHA);
					$frame->compositeImage($overlay, imagick::COMPOSITE_OVER, $watermark_x, $watermark_y, imagick::COLOR_ALPHA);
				}
			}

			// We remove comments, etc. from the picture 
			$thumb->stripImage();

			// $thumb->setImageCompressionQuality(100);

			// Recording a picture
			if (!$thumb->writeImages($dst_file, true))
				return false;

			// Cleaning
			$thumb->destroy();
			if (isset($overlay) && is_object($overlay))
				$overlay->destroy();
		}
		return true;
	}


	/**
	 * Calculates the dimensions of the image to which it must be proportionally reduced in order to fit into the square $max_w x $max_h
	 * @param src_w source image width
	 * @param src_h source image height
	 * @param max_w maximum width
	 * @param max_h max height 
	 * @return array(w, h)
	 */
	function calc_contrain_size($src_w, $src_h, $max_w = 0, $max_h = 0)
	{
		if ($src_w == 0 || $src_h == 0)
			return false;

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
		return array($dst_w, $dst_h);
	}


	private function files_identical($fn1, $fn2)
	{
		$buffer_len = 1024;
		if (!$fp1 = fopen(dirname(dirname(__FILE__)) . '/' . $fn1, 'rb'))
			return FALSE;

		if (!$fp2 = fopen($fn2, 'rb')) {
			fclose($fp1);
			return FALSE;
		}

		$same = TRUE;
		while (!feof($fp1) and !feof($fp2))
			if (fread($fp1, $buffer_len) !== fread($fp2, $buffer_len)) {
				$same = FALSE;
				break;
			}

		if (feof($fp1) !== feof($fp2))
			$same = FALSE;

		fclose($fp1);
		fclose($fp2);

		return $same;
	}

	private function correct_filename($filename)
	{
		$ru = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я");
		$en = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

		$res = str_replace($ru, $en, $filename);
		$res = preg_replace("/[\s]+/ui", '-', $res);
		$res = preg_replace("/[^a-zA-Z0-9\.\-\_]+/ui", '', $res);
		$res = strtolower($res);
		return $res;
	}
}
