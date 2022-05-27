<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once(dirname(__FILE__) . '/' . 'Turbo.php');
require_once(dirname(dirname(__FILE__)) . '/Smarty/libs/Smarty.class.php');
require_once 'Mobile_Detect.php';
class Design extends Turbo
{
	public $smarty;
	public $detect;
	public function __construct()
	{
		parent::__construct();

		// Creating and configuring Smarty
		$this->detect = new Mobile_Detect();
		$this->smarty = new Smarty();
		$this->smarty->compile_check = $this->config->smarty_compile_check;
		$this->smarty->caching = $this->config->smarty_caching;
		$this->smarty->cache_lifetime = $this->config->smarty_cache_lifetime;
		$this->smarty->debugging = $this->config->smarty_debugging;
		$this->smarty->error_reporting = E_ALL & ~E_WARNING & ~E_NOTICE;

		// We take the theme from the settings
		$theme = $this->settings->theme;

		$this->smarty->compile_dir = $this->config->root_dir . '/compiled/' . $theme;
		$this->smarty->template_dir = $this->config->root_dir . '/design/' . $theme . '/html';

		// Create a folder for the compiled templates of the current theme
		if (!is_dir($this->smarty->compile_dir))
			mkdir($this->smarty->compile_dir, 0777);

		$this->smarty->cache_dir = 'cache';

		$this->smarty->registerPlugin('modifier', 'resize_articles', array($this, 'resize_articles_modifier'));
		$this->smarty->registerPlugin('modifier', 'resize_catalog',  array($this, 'resize_catalog_modifier'));
		$this->smarty->registerPlugin('modifier', 'resize_brands',   array($this, 'resize_brands_modifier'));
		$this->smarty->registerPlugin('modifier', 'resize_banners',  array($this, 'resize_banners_modifier'));
		$this->smarty->registerPlugin('modifier', 'resize_posts',    array($this, 'resize_posts_modifier'));
		$this->smarty->registerPlugin('modifier', 'resize',		     array($this, 'resize_modifier'));
		$this->smarty->registerPlugin('modifier', 'token',		     array($this, 'token_modifier'));
		$this->smarty->registerPlugin('modifier', 'plural',		     array($this, 'plural_modifier'));
		$this->smarty->registerPlugin('function', 'url', 		     array($this, 'url_modifier'));
		$this->smarty->registerPlugin('modifier', 'first',		     array($this, 'first_modifier'));
		$this->smarty->registerPlugin('modifier', 'cut',		     array($this, 'cut_modifier'));
		$this->smarty->registerPlugin('modifier', 'date',		     array($this, 'date_modifier'));
		$this->smarty->registerPlugin('modifier', 'time',		     array($this, 'time_modifier'));
		$this->smarty->registerPlugin('function', 'api',		     array($this, 'api_plugin'));

		if ($this->config->smarty_html_minify)
			$this->smarty->loadFilter('output', 'trimwhitespace');
	}

	public function assign($var, $value)
	{
		return $this->smarty->assign($var, $value);
	}

	public function fetch($template)
	{
		// We transfer to the design what may be needed in it
		$this->assign('config',		$this->config);
		$this->assign('settings',	$this->settings);
		return $this->smarty->fetch($template);
	}

	public function set_templates_dir($dir)
	{
		$this->smarty->template_dir = $dir;
	}

	public function set_compiled_dir($dir)
	{
		$this->smarty->compile_dir = $dir;
	}

	public function get_var($name)
	{
		return $this->smarty->getTemplateVars($name);
	}

	public function clear_cache()
	{
		$this->smarty->clearAllCache();
	}

	public function resize_modifier($filename, $width = 0, $height = 0, $set_watermark = false)
	{
		$resized_filename = $this->image->add_resize_params($filename, $width, $height, $set_watermark);
		$resized_filename_encoded = $resized_filename;

		$size = ($width ? $width : 0) . 'x' . ($height ? $height : 0) . ($set_watermark ? "w" : '');
		$image_sizes = array();
		if ($this->settings->image_sizes)
			$image_sizes = explode('|', $this->settings->image_sizes);
		if (!in_array($size, $image_sizes)) {
			$image_sizes[] = $size;
			$this->settings->image_sizes = implode('|', $image_sizes);
		}

		if (substr($resized_filename_encoded, 0, 7) == 'http://' || substr($resized_filename_encoded, 0, 8) == 'https://')
			$resized_filename_encoded = rawurlencode($resized_filename_encoded);

		$resized_filename_encoded = rawurlencode($resized_filename_encoded);

		return $this->config->root_url . '/' . $this->config->resized_images_dir . $resized_filename_encoded;
	}

	public function resize_catalog_modifier($filename, $width = 0, $height = 0, $set_watermark = false)
	{
		$resized_filename = $this->image->add_resize_params($filename, $width, $height, $set_watermark);
		$resized_filename_encoded = $resized_filename;

		$size = ($width ? $width : 0) . 'x' . ($height ? $height : 0) . ($set_watermark ? "w" : '');
		$image_sizes = array();
		if ($this->settings->image_sizes)
			$image_sizes = explode('|', $this->settings->image_sizes);
		if (!in_array($size, $image_sizes)) {
			$image_sizes[] = $size;
			$this->settings->image_sizes = implode('|', $image_sizes);
		}

		if (substr($resized_filename_encoded, 0, 7) == 'http://' || substr($resized_filename_encoded, 0, 8) == 'https://')
			$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		return $this->config->root_url . '/' . $this->config->resized_category_images_dir . $resized_filename_encoded;
	}

	public function resize_posts_modifier($filename, $width = 0, $height = 0, $set_watermark = false)
	{
		$resized_filename = $this->image->add_resize_params($filename, $width, $height, $set_watermark);
		$resized_filename_encoded = $resized_filename;

		$size = ($width ? $width : 0) . 'x' . ($height ? $height : 0) . ($set_watermark ? "w" : '');
		$image_sizes = array();
		if ($this->settings->image_sizes)
			$image_sizes = explode('|', $this->settings->image_sizes);
		if (!in_array($size, $image_sizes)) {
			$image_sizes[] = $size;
			$this->settings->image_sizes = implode('|', $image_sizes);
		}

		if (substr($resized_filename_encoded, 0, 7) == 'http://' || substr($resized_filename_encoded, 0, 8) == 'https://')
			$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		return $this->config->root_url . '/' . $this->config->resized_posts_images_dir . $resized_filename_encoded;
	}

	public function resize_articles_modifier($filename, $width = 0, $height = 0, $set_watermark = false)
	{
		$resized_filename = $this->image->add_resize_params($filename, $width, $height, $set_watermark);
		$resized_filename_encoded = $resized_filename;

		$size = ($width ? $width : 0) . 'x' . ($height ? $height : 0) . ($set_watermark ? "w" : '');
		$image_sizes = array();
		if ($this->settings->image_sizes)
			$image_sizes = explode('|', $this->settings->image_sizes);
		if (!in_array($size, $image_sizes)) {
			$image_sizes[] = $size;
			$this->settings->image_sizes = implode('|', $image_sizes);
		}

		if (substr($resized_filename_encoded, 0, 7) == 'http://' || substr($resized_filename_encoded, 0, 8) == 'https://')
			$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		return $this->config->root_url . '/' . $this->config->resized_articles_images_dir . $resized_filename_encoded;
	}

	public function resize_brands_modifier($filename, $width = 0, $height = 0, $set_watermark = false)
	{
		$resized_filename = $this->image->add_resize_params($filename, $width, $height, $set_watermark);
		$resized_filename_encoded = $resized_filename;

		$size = ($width ? $width : 0) . 'x' . ($height ? $height : 0) . ($set_watermark ? "w" : '');
		$image_sizes = array();
		if ($this->settings->image_sizes)
			$image_sizes = explode('|', $this->settings->image_sizes);
		if (!in_array($size, $image_sizes)) {
			$image_sizes[] = $size;
			$this->settings->image_sizes = implode('|', $image_sizes);
		}

		if (substr($resized_filename_encoded, 0, 7) == 'http://' || substr($resized_filename_encoded, 0, 8) == 'https://')
			$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		return $this->config->root_url . '/' . $this->config->resized_brands_images_dir . $resized_filename_encoded;
	}

	public function resize_banners_modifier($filename, $width = 0, $height = 0, $set_watermark = false)
	{
		$resized_filename = $this->image->add_resize_params($filename, $width, $height, $set_watermark);
		$resized_filename_encoded = $resized_filename;

		$size = ($width ? $width : 0) . 'x' . ($height ? $height : 0) . ($set_watermark ? "w" : '');
		$image_sizes = array();
		if ($this->settings->image_sizes)
			$image_sizes = explode('|', $this->settings->image_sizes);
		if (!in_array($size, $image_sizes)) {
			$image_sizes[] = $size;
			$this->settings->image_sizes = implode('|', $image_sizes);
		}

		if (substr($resized_filename_encoded, 0, 7) == 'http://' || substr($resized_filename_encoded, 0, 8) == 'https://')
			$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		$resized_filename_encoded = rawurlencode($resized_filename_encoded);


		return $this->config->root_url . '/' . $this->config->resized_banners_images_dir . $resized_filename_encoded;
	}

	public function token_modifier($text)
	{
		return $this->config->token($text);
	}

	public function url_modifier($params)
	{
		if (is_array(reset($params)))
			return $this->request->url(reset($params));
		else
			return $this->request->url($params);
	}

	public function plural_modifier($number, $singular, $plural1, $plural2 = null)
	{
		$number = abs($number);
		if (!empty($plural2)) {
			$p1 = $number % 10;
			$p2 = $number % 100;
			if ($number == 0)
				return $plural1;
			if ($p1 == 1 && !($p2 >= 11 && $p2 <= 19))
				return $singular;
			elseif ($p1 >= 2 && $p1 <= 4 && !($p2 >= 11 && $p2 <= 19))
				return $plural2;
			else
				return $plural1;
		} else {
			if ($number == 1)
				return $singular;
			else
				return $plural1;
		}
	}

	public function first_modifier($params = array())
	{
		if (!is_array($params))
			return false;
		return reset($params);
	}

	public function cut_modifier($array, $num = 1)
	{
		if ($num >= 0)
			return array_slice($array, $num, count($array) - $num, true);
		else
			return array_slice($array, 0, count($array) + $num, true);
	}

	public function date_modifier($date, $format = null)
	{
		if (empty($date))
			$date = date("Y-m-d");
		return date(empty($format) ? $this->settings->date_format : $format, strtotime($date));
	}

	public function time_modifier($date, $format = null)
	{
		return date(empty($format) ? 'H:i' : $format, strtotime($date));
	}

	public function api_plugin($params, &$smarty)
	{
		if (!isset($params['module']))
			return false;
		if (!isset($params['method']))
			return false;

		$module = $params['module'];
		$method = $params['method'];
		$var = $params['var'];
		unset($params['module']);
		unset($params['method']);
		unset($params['var']);
		$res = $this->$module->$method($params);
		$smarty->assign($var, $res);
	}

	public function is_mobile()
	{
		$res = $this->detect->isMobile();
		return $res;
	}
	public function is_tablet()
	{
		$res = $this->detect->isTablet();
		return $res;
	}
}
