<?php

require_once __DIR__ . '/Turbo.php';
require_once dirname(__DIR__) . '/smarty/libs/Smarty.class.php';
require_once 'MobileDetect.php';

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

		$this->smarty->compile_dir = $this->config->root_dir . '/compiled/' . $theme;
		$this->smarty->template_dir = $this->config->root_dir . '/design/' . $theme . '/html';

		if (!is_dir($this->smarty->compile_dir)) {
			mkdir($this->smarty->compile_dir, 0777);
		}

		$this->smarty->cache_dir = 'cache';

		$this->smarty->registerPlugin('modifier', 'resize_articles', [$this, 'resizeArticlesModifier']);
		$this->smarty->registerPlugin('modifier', 'resize_catalog', [$this, 'resizeCatalogModifier']);
		$this->smarty->registerPlugin('modifier', 'resize_brands', [$this, 'resizeBrandsModifier']);
		$this->smarty->registerPlugin('modifier', 'resize_banners', [$this, 'resizeBannersModifier']);
		$this->smarty->registerPlugin('modifier', 'resize_posts', [$this, 'resizePostsModifier']);
		$this->smarty->registerPlugin('modifier', 'resize', [$this, 'resizeModifier']);
		$this->smarty->registerPlugin('modifier', 'token', [$this, 'tokenModifier']);
		$this->smarty->registerPlugin('modifier', 'plural', [$this, 'pluralModifier']);
		$this->smarty->registerPlugin('function', 'url', [$this, 'urlModifier']);
		$this->smarty->registerPlugin('modifier', 'first', [$this, 'firstModifier']);
		$this->smarty->registerPlugin('modifier', 'cut', [$this, 'cutModifier']);
		$this->smarty->registerPlugin('modifier', 'date', [$this, 'dateModifier']);
		$this->smarty->registerPlugin('modifier', 'time', [$this, 'timeModifier']);
		$this->smarty->registerPlugin('function', 'api', [$this, 'apiPlugin']);
		$this->smarty->registerPlugin('modifier', 'floor', [$this, 'floorModifier']);
		$this->smarty->registerPlugin('modifier', 'ceil', [$this, 'ceilModifier']);
		$this->smarty->registerPlugin('modifier', 'stristr', [$this, 'stristrModifier']);
		$this->smarty->registerPlugin('modifier', 'in_array', [$this, 'inArrayModifier']);
		$this->smarty->registerPlugin('modifier', 'array_slice', [$this, 'arraySliceModifier']);
		$this->smarty->registerPlugin('modifier', 'getimagesize', [$this, 'getimagesizeModifier']);
		$this->smarty->registerPlugin('modifier', 'urlencode', [$this, 'urlencodeModifier']);

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
	 * Set templates directory
	 */
	public function setTemplatesDir($dir)
	{
		$this->smarty->template_dir = $dir;
	}

	/**
	 * Set compiled directory
	 */
	public function setCompiledDir($dir)
	{
		$this->smarty->compile_dir = $dir;
	}

	/**
	 * Get var
	 */
	public function getVar($name)
	{
		return $this->smarty->getTemplateVars($name);
	}

	/**
	 * Clear cached
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
	 * Resize modifier
	 */
	public function resizeModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_images_dir);
	}

	/**
	 * Resize catalog
	 */
	public function resizeCatalogModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_category_images_dir);
	}

	/**
	 * Resize posts 
	 */
	public function resizePostsModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_posts_images_dir);
	}

	/**
	 * Resize articles
	 */
	public function resizeArticlesModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_articles_images_dir);
	}

	/**
	 * Resize brands
	 */
	public function resizeBrandsModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_brands_images_dir);
	}

	/**
	 * Resize banners
	 */
	public function resizeBannersModifier($filename, $width = 0, $height = 0, $setWatermark = false)
	{
		return $this->resizeImage($filename, $width, $height, $setWatermark, $this->config->resized_banners_images_dir);
	}

	/**
	 * Token modifier
	 */
	public function tokenModifier($text)
	{
		return $this->config->token($text);
	}

	/**
	 * URL modifier
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
	 * Plural modifier
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
	 * First modifier
	 */
	public function firstModifier($params = [])
	{
		if (!is_array($params)) {
			return null;
		}

		return reset($params);
	}

	/**
	 * Cut modifier
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
	 * Date modifier
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
	 * Time modifier
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
	 * API modifier
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
	 * Is mobile
	 */
	public function isMobile()
	{
		return $this->detect->isMobile();
	}

	/**
	 * Is tablet
	 */
	public function isTablet()
	{
		return $this->detect->isTablet();
	}

	/**
	 * Floor modifier
	 */
	function floorModifier($number)
	{
		return floor($number);
	}

	/**
	 * Ceil modifier
	 */
	function ceilModifier($number)
	{
		return ceil($number);
	}

	/**
	 * Stristr modifier
	 */
	function stristrModifier($text)
	{
		return stristr($text, '');
	}

	/**
	 * In array modifier
	 */
	function inArrayModifier($value, $array)
	{
		return in_array($value, $array);
	}

	/**
	 * Array slice modifier
	 */
	function arraySliceModifier($input, $start, $length)
	{
		return array_slice($input, $start, $length);
	}

	/**
	 * Getimagesize modifier
	 */
	function getimagesizeModifier($value)
	{
		return getimagesize($value);
	}

	/**
	 * Urlencode modifier
	 */
	function urlencodeModifier($value)
	{
		return urlencode($value);
	}
}
