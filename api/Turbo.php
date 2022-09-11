<?php

/**
 * The main Turbo class for accessing the Turbo API
 *
 * @author		Turbo CMS
 * @link		https://turbo-cms.com
 *
 */

class Turbo
{
	// Properties - API Classes
	private $classes = array(
		'seo'                   => 'Seo',
		'faq'                   => 'FAQ',
		'blog'                  => 'Blog',
		'cart'                  => 'Cart',
		'cache'		            => 'Cache',
		'files'                 => 'Files',
		'money'                 => 'Money',
		'pages'                 => 'Pages',
		'menus'                 => 'Menus',
		'image'                 => 'Image',
		'users'                 => 'Users',
		'notify'                => 'Notify',
		'brands'                => 'Brands',
		'orders'                => 'Orders',
		'config'                => 'Config',
		'design'                => 'Design',
		'import'                => 'Import',
		'coupons'               => 'Coupons',
		'request'               => 'Request',
		'payment'               => 'Payment',
		'banners'               => 'Banners',
		'tgnotify'              => 'TgNotify',
		'db'                    => 'Database',
		'settings'              => 'Settings',
		'comments'              => 'Comments',
		'articles'              => 'Articles',
		'managers'              => 'Managers',
		'products'              => 'Products',
		'variants'              => 'Variants',
		'features'              => 'Features',
		'delivery'              => 'Delivery',
		'feedbacks'             => 'Feedbacks',
		'callbacks'             => 'Callbacks',
		'languages'             => 'Languages',
		'js'                    => 'Javascript',
		'css'                   => 'Stylesheet',
		'categories'            => 'Categories',
		'reportstat'            => 'ReportStat',
		'subscribes'            => 'Subscribes',
		'translations'          => 'Translations',
		'articles_categories'   => 'ArticlesCategories',
		'backend_translations'  => 'BackendTranslations'
	);

	// Created objects
	private static $objects = array();

	/**
	 * The constructor will be left empty, but we will define it in case parent::__construct() is called in API classes
	 */
	public function __construct()
	{
		//error_reporting(E_ALL & !E_STRICT);
	}

	/**
	 * Magic method, creates the desired API object
	 */
	public function __get($name)
	{
		// If such an object already exists, return it.
		if (isset(self::$objects[$name])) {
			return (self::$objects[$name]);
		}

		// If the requested API does not exist - error
		if (!array_key_exists($name, $this->classes)) {
			return null;
		}

		// Determine the name of the desired class
		$class = $this->classes[$name];

		// We connect it
		include_once(dirname(__FILE__) . '/' . $class . '.php');

		// Saved for future references
		self::$objects[$name] = new $class();

		// Returning the created object
		return self::$objects[$name];
	}
}
