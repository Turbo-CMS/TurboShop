<?php

require_once __DIR__ . '/Turbo.php';

use Smarty\Smarty;
use Detection\MobileDetect;

class Design extends Turbo
{
	public $smarty;
	public $detect;

	public function __construct()
	{
		parent::__construct();

		$this->detect = new MobileDetect();

		$this->smarty = new Smarty();

		$this->smarty->compile_check = $this->config->smarty_compile_check;
		$this->smarty->caching = $this->config->smarty_caching;
		$this->smarty->cache_lifetime = $this->config->smarty_cache_lifetime;
		$this->smarty->debugging = $this->config->smarty_debugging;
		$this->smarty->error_reporting = E_ALL & ~E_WARNING & ~E_NOTICE & ~E_USER_DEPRECATED;

		$theme = $this->settings->theme;

		$this->smarty->setCompileDir($this->config->root_dir . '/compiled/' . $theme);
		$this->smarty->setTemplateDir($this->config->root_dir . '/design/' . $theme . '/html');

		if (!is_dir($this->smarty->getCompileDir())) {
			mkdir($this->smarty->getCompileDir(), 0777, true);
		}

		$this->smarty->setCacheDir('cache');

		$this->smarty->registerPlugin('function', 'api', [$this, 'apiPlugin']);
		$this->smarty->registerPlugin('function', 'url', [$this, 'urlModifier']);
		$this->smarty->registerPlugin('modifier', 'cut', [$this, 'cutModifier']);
		$this->smarty->registerPlugin('modifier', 'hsl', [$this, 'hslModifier']);
		$this->smarty->registerPlugin('modifier', 'max', [$this, 'maxModifier']);
		$this->smarty->registerPlugin('modifier', 'min', [$this, 'minModifier']);
		$this->smarty->registerPlugin('modifier', 'svg', [$this, 'svgModifier']);
		$this->smarty->registerPlugin('modifier', 'date', [$this, 'dateModifier']);
		$this->smarty->registerPlugin('modifier', 'mask', [$this, 'maskModifier']);
		$this->smarty->registerPlugin('modifier', 'sort', [$this, 'sortModifier']);
		$this->smarty->registerPlugin('modifier', 'time', [$this, 'timeModifier']);
		$this->smarty->registerPlugin('modifier', 'ceil', [$this, 'ceilModifier']);
		$this->smarty->registerPlugin('modifier', 'token', [$this, 'tokenModifier']);
		$this->smarty->registerPlugin('modifier', 'first', [$this, 'firstModifier']);
		$this->smarty->registerPlugin('modifier', 'floor', [$this, 'floorModifier']);
		$this->smarty->registerPlugin('modifier', 'is_svg', [$this, 'isSvgModifier']);
		$this->smarty->registerPlugin('modifier', 'resize', [$this, 'resizeModifier']);
		$this->smarty->registerPlugin('modifier', 'plural', [$this, 'pluralModifier']);
		$this->smarty->registerPlugin('modifier', 'intval', [$this, 'intvalModifier']);
		$this->smarty->registerPlugin('modifier', 'stristr', [$this, 'stristrModifier']);
		$this->smarty->registerPlugin('modifier', 'in_array', [$this, 'inArrayModifier']);
		$this->smarty->registerPlugin('modifier', 'filesize', [$this, 'filesizeModifier']);
		$this->smarty->registerPlugin('modifier', 'floatval', [$this, 'floatvalModifier']);
		$this->smarty->registerPlugin('modifier', 'mb_substr', [$this, 'mbSubstrModifier']);
		$this->smarty->registerPlugin('modifier', 'array_pop', [$this, 'arrayPopModifier']);
		$this->smarty->registerPlugin('modifier', 'urlencode', [$this, 'urlencodeModifier']);
		$this->smarty->registerPlugin('modifier', 'strtotime', [$this, 'strtotimeModifier']);
		$this->smarty->registerPlugin('modifier', 'array_slice', [$this, 'arraySliceModifier']);
		$this->smarty->registerPlugin('modifier', 'resize_posts', [$this, 'resizePostsModifier']);
		$this->smarty->registerPlugin('modifier', 'getimagesize', [$this, 'getimagesizeModifier']);
		$this->smarty->registerPlugin('modifier', 'resize_brands', [$this, 'resizeBrandsModifier']);
		$this->smarty->registerPlugin('modifier', 'resize_catalog', [$this, 'resizeCatalogModifier']);
		$this->smarty->registerPlugin('modifier', 'resize_banners', [$this, 'resizeBannersModifier']);
		$this->smarty->registerPlugin('modifier', 'resize_articles', [$this, 'resizeArticlesModifier']);
		$this->smarty->registerPlugin('modifier', 'format_filesize', [$this, 'formatFilesizeModifier']);

		if ($this->config->smarty_html_minify) {
			$this->smarty->loadFilter('output', 'trimwhitespace');
		}
	}

	/**
	 * Assign
	 */
	public function assign($var, $value)
	{
		return $this->smarty->assign($var, $value);
	}

	/**
	 * Fetch
	 */
	public function fetch($template)
	{
		$this->assign('config', $this->config);
		$this->assign('settings', $this->settings);

		return $this->smarty->fetch($template);
	}

	/**
	 * Set Templates Directory
	 */
	public function setTemplatesDir($dir)
	{
		$this->smarty->setTemplateDir($dir);
	}

	/**
	 * Set Compiled Directory
	 */
	public function setCompiledDir($dir)
	{
		$this->smarty->setCompileDir($dir);
	}

	/**
	 * Get Var
	 */
	public function getVar($name)
	{
		return $this->smarty->getTemplateVars($name);
	}

	/**
	 * Clear Cached
	 */
	public function clearCache()
	{
		$this->smarty->clearAllCache();
	}

	/**
	 * Resize Image
	 */
	private function resizeImage($filename, $width, $height, $setWatermark, $resizedImagesDir)
	{
		$resizedFilename = $this->image->addResizeParams($filename, $width, $height, $setWatermark);
		$resizedFilenameEncoded = $resizedFilename;

		$size = ($width ?: 0) . 'x' . ($height ?: 0) . ($setWatermark ? "w" : '');

		static $imageSizes;

		if (!$imageSizes) {
			$imageSizes = explode('|', $this->settings->image_sizes ?? '');
		}

		if (!in_array($size, $imageSizes, true)) {
			$imageSizes[] = $size;
			$this->settings->image_sizes = implode('|', $imageSizes);
		}

		if (substr($resizedFilenameEncoded, 0, 7) == 'http://' || substr($resizedFilenameEncoded, 0, 8) == 'https://') {
			$resizedFilenameEncoded = rawurlencode($resizedFilenameEncoded);
		}

		$resizedFilenameEncoded = rawurlencode($resizedFilenameEncoded);

		return $this->config->root_url . '/' . $resizedImagesDir . $resizedFilenameEncoded;
	}

	/**
	 * Resize Modifier
	 */
	public function resizeModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_images_dir);
	}

	/**
	 * Resize Catalog
	 */
	public function resizeCatalogModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_category_images_dir);
	}

	/**
	 * Resize Posts 
	 */
	public function resizePostsModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_posts_images_dir);
	}

	/**
	 * Resize Articles
	 */
	public function resizeArticlesModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_articles_images_dir);
	}

	/**
	 * Resize Brands
	 */
	public function resizeBrandsModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_brands_images_dir);
	}

	/**
	 * Resize Banners
	 */
	public function resizeBannersModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_banners_images_dir);
	}

	/**
	 * Token Modifier
	 */
	public function tokenModifier($text)
	{
		return $this->config->token($text);
	}

	/**
	 * URL Modifier
	 */
	public function urlModifier($params)
	{
		if (is_array(reset($params))) {
			return $this->request->url(reset($params));
		} else {
			return $this->request->url($params);
		}
	}

	/**
	 * Plural Modifier
	 */
	public function pluralModifier($number, $singular, $plural1, $plural2 = null)
	{
		$number = is_numeric($number) ? abs($number) : 0;

		if (!empty($plural2)) {
			$p1 = $number % 10;
			$p2 = $number % 100;

			if ($number == 0) {
				return $plural1;
			}

			if ($p1 == 1 && !($p2 >= 11 && $p2 <= 19)) {
				return $singular;
			} elseif ($p1 >= 2 && $p1 <= 4 && !($p2 >= 11 && $p2 <= 19)) {
				return $plural2;
			} else {
				return $plural1;
			}
		} else {
			if ($number == 1) {
				return $singular;
			} else {
				return $plural1;
			}
		}
	}

	/**
	 * First Modifier
	 */
	public function firstModifier($params = [])
	{
		if (!is_array($params)) {
			return null;
		}

		return reset($params);
	}

	/**
	 * Cut Modifier
	 */
	public function cutModifier($array = [], $num = 1)
	{
		if ($num >= 0) {
			return array_slice($array, $num, count($array) - $num, true);
		} else {
			return array_slice($array, 0, count($array) + $num, true);
		}
	}

	/**
	 * Date Modifier
	 */
	public function dateModifier($date, $format = null)
	{
		if ($date === null) {
			$date = date("Y-m-d");
		}

		if (empty($format)) {
			$format = $this->settings->date_format;
		}

		return date($format, strtotime($date));
	}

	/**
	 * Time Modifier
	 */
	public function timeModifier($date, $format = null)
	{
		if ($date === null) {
			return '';
		}

		$timestamp = strtotime($date);

		if ($timestamp === false) {
			return '';
		}

		return date(empty($format) ? 'H:i' : $format, $timestamp);
	}

	/**
	 * API Modifier
	 */
	public function apiPlugin($params, Smarty &$smarty)
	{
		if (!isset($params['module']) || !isset($params['method'])) {
			return false;
		}

		$module = $params['module'];
		$method = $params['method'];
		$var = $params['var'];
		unset($params['module']);
		unset($params['method']);
		unset($params['var']);
		$res = $this->$module->$method($params);
		$smarty->assign($var, $res);
	}

	/**
	 * Is Mobile
	 */
	public function isMobile()
	{
		return $this->detect->isMobile();
	}

	/**
	 * Is Tablet
	 */
	public function isTablet()
	{
		return $this->detect->isTablet();
	}

	/**
	 * Floor Modifier
	 */
	function floorModifier($number)
	{
		return floor($number);
	}

	/**
	 * Ceil Modifier
	 */
	function ceilModifier($number)
	{
		return ceil($number);
	}

	/**
	 * Stristr Modifier
	 */
	function stristrModifier($text)
	{
		return stristr($text, '');
	}

	/**
	 * In Array Modifier
	 */
	function inArrayModifier($value, $array)
	{
		return in_array($value, $array);
	}

	/**
	 * Array Slice Modifier
	 */
	function arraySliceModifier($input, $start, $length)
	{
		return array_slice($input, $start, $length);
	}

	/**
	 * Getimagesize Modifier
	 */
	function getimagesizeModifier($value)
	{
		return getimagesize($value);
	}

	/**
	 * Urlencode Modifier
	 */
	function urlencodeModifier($value)
	{
		return urlencode($value);
	}

	/**
	 * Max Modifier
	 */
	public function maxModifier($a, $b)
	{
		return max($a, $b);
	}

	/**
	 * Min Modifier
	 */
	public function minModifier($a, $b)
	{
		return min($a, $b);
	}

	/**
	 * Strtotime Modifier
	 */
	function strtotimeModifier($string)
	{
		return strtotime($string);
	}

	/**
	 * Array Pop Modifier
	 */
	public function arrayPopModifier($array)
	{
		if (is_array($array)) {
			return array_pop($array);
		}

		return null;
	}

	/**
	 * Floatval Modifier
	 */
	function floatvalModifier($string)
	{
		return floatval($string);
	}

	/**
	 * Intval Modifier
	 */
	function intvalModifier($text)
	{
		return intval($text);
	}

	/**
	 * Filesize Modifier
	 */
	public function filesizeModifier($file)
	{
		return filesize($file);
	}

	/**
	 * Format Filesize Modifier
	 */
	public function formatFilesizeModifier($size)
	{
		$size = max(0, (int) $size);
		$units = array(' b', ' Kb', ' Mb', ' Gb', ' Tb', ' Pb', ' Eb', ' Zb', ' Yb');
		$power = $size > 0 ? floor(log($size, 1024)) : 0;
		return number_format($size / pow(1024, $power), 2, '.', ',') . $units[$power];
	}

	/**
	 * HSL Modifier
	 */
	function hslModifier($hex)
	{
		$hex = str_replace('#', '', $hex);

		$r = hexdec(substr($hex, 0, 2)) / 255;
		$g = hexdec(substr($hex, 2, 2)) / 255;
		$b = hexdec(substr($hex, 4, 2)) / 255;

		$max = max($r, $g, $b);
		$min = min($r, $g, $b);
		$h = ($max + $min) / 2;
		$s = ($max + $min) / 2;
		$l = ($max + $min) / 2;

		if ($max == $min) {
			$h = $s = 0;
		} else {
			$d = $max - $min;
			$s = $l > 0.5 ? $d / (2 - $max - $min) : $d / ($max + $min);
			switch ($max) {
				case $r:
					$h = ($g - $b) / $d + ($g < $b ? 6 : 0);
					break;
				case $g:
					$h = ($b - $r) / $d + 2;
					break;
				case $b:
					$h = ($r - $g) / $d + 4;
					break;
			}
			$h /= 6;
		}

		$h = round($h * 360, 2);
		$s = round($s * 100, 2);
		$l = round($l * 100, 2);

		return array('hue' => $h, 'saturation' => $s, 'lightness' => $l);
	}

	/**
	 * Sort Modifier
	 */
	function sortModifier($settings, $themeSettings)
	{
		usort($settings, function ($a, $b) use ($themeSettings) {
			$valueA = isset($themeSettings[$a->variable]) ? $themeSettings[$a->variable] : null;
			$valueB = isset($themeSettings[$b->variable]) ? $themeSettings[$b->variable] : null;

			if ($valueA == $valueB) {
				return 0;
			}

			if ($valueA === null) {
				return -1;
			}

			if ($valueB === null) {
				return 1;
			}

			return $valueA <=> $valueB;
		});
		return $settings;
	}

	/**
	 * Is SVG Modifier
	 */
	function isSvgModifier($filePath)
	{
		return strtolower(pathinfo($filePath, PATHINFO_EXTENSION)) === 'svg';
	}

	/**
	 * SVG Modifier
	 */
	function svgModifier($filePath)
	{
		if (file_exists($filePath) && is_readable($filePath)) {
			return file_get_contents($filePath);
		} else {
			return '';
		}
	}

	/**
	 * Mb Substr Modifier
	 */
	function mbSubstrModifier($string, $start, $length = null, $encoding = 'UTF-8')
	{
		if ($length === null) {
			return mb_substr($string, $start, null, $encoding);
		} else {
			return mb_substr($string, $start, $length, $encoding);
		}
	}

	/**
	 * Mask Modifier
	 */
	function maskModifier($mask)
	{
		$regex = '^';

		$replace = [
			'+' => '[+]',
			'(' => '\(',
			')' => '\)',
			' ' => ' ',
			'-' => '-',
		];

		$regex .= strtr($mask, $replace);

		$regex = preg_replace_callback('/\+\d+/', function ($matches) {
			$numDigits = strlen($matches[0]) - 1;
			return '[+][0-9]{' . $numDigits . '}';
		}, $regex);

		$regex = preg_replace_callback('/\d+/', function ($matches) {
			if (strpos($matches[0], '+') === false) {
				return '[0-9]{' . strlen($matches[0]) . '}';
			}
			return $matches[0];
		}, $regex);

		$regex = str_replace(['\(', '\)'], ['[(]', '[)]'], $regex);

		$regex .= '$';

		return $regex;
	}
}
