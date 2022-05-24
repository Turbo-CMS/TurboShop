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
		'config'                => 'Config',
		'request'               => 'Request',
		'db'                    => 'Database',
		'settings'              => 'Settings',
		'seo'                   => 'Seo',
		'design'                => 'Design',
		'js'                    => 'Javascript',
		'css'                   => 'Stylesheet',
		'cache'		            => 'Cache',
		'products'              => 'Products',
		'variants'              => 'Variants',
		'categories'            => 'Categories',
		'brands'                => 'Brands',
		'features'              => 'Features',
		'money'                 => 'Money',
		'pages'                 => 'Pages',
		'menus'                 => 'Menus',
		'blog'                  => 'Blog',
		'cart'                  => 'Cart',
		'image'                 => 'Image',
		'import'                => 'Import',
		'reportstat'            => 'ReportStat',
		'delivery'              => 'Delivery',
		'payment'               => 'Payment',
		'orders'                => 'Orders',
		'users'                 => 'Users',
		'coupons'               => 'Coupons',
		'comments'              => 'Comments',
		'feedbacks'             => 'Feedbacks',
		'callbacks'             => 'Callbacks',
		'subscribes'            => 'Subscribes',
		'faq'                   => 'FAQ',
		'banners'               => 'Banners',
		'notify'                => 'Notify',
		'managers'              => 'Managers',
		'backend_translations'  => 'BackendTranslations',
		'languages'             => 'Languages',
		'translations'          => 'Translations',
		'files'                 => 'Files',
		'articles'              => 'Articles',
		'articles_categories'   => 'ArticlesCategories'
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
