<?php

class Turbo
{
	private $classes = [
		'db' => 'Database',
		'js' => 'Javascript',
		'css' => 'Stylesheet',
		'seo' => 'Seo',
		'faq' => 'FAQ',
		'blog' => 'Blog',
		'cart' => 'Cart',
		'cache' => 'Cache',
		'files' => 'Files',
		'money' => 'Money',
		'pages' => 'Pages',
		'menus' => 'Menus',
		'image' => 'Image',
		'users' => 'Users',
		'notify' => 'Notify',
		'brands' => 'Brands',
		'orders' => 'Orders',
		'config' => 'Config',
		'design' => 'Design',
		'import' => 'Import',
		'coupons' => 'Coupons',
		'request' => 'Request',
		'payment' => 'Payment',
		'banners' => 'Banners',
		'tgnotify' => 'TgNotify',
		'settings' => 'Settings',
		'comments' => 'Comments',
		'articles' => 'Articles',
		'managers' => 'Managers',
		'products' => 'Products',
		'variants' => 'Variants',
		'features' => 'Features',
		'delivery' => 'Delivery',
		'feedbacks' => 'Feedbacks',
		'callbacks' => 'Callbacks',
		'languages' => 'Languages',
		'categories' => 'Categories',
		'reportstat' => 'ReportStat',
		'subscribes' => 'Subscribes',
		'translations' => 'Translations',
		'articlesCategories' => 'ArticlesCategories',
		'backendTranslations' => 'BackendTranslations'
	];

	private static $objects = [];

	public function __construct()
	{
		//error_reporting(E_ALL & !E_STRICT);
	}

	/**
	 * Magic method get
	 */
	public function __get($name)
	{
		if (isset(self::$objects[$name])) {
			return self::$objects[$name];
		}

		if (!array_key_exists($name, $this->classes)) {
			return null;
		}

		$class = $this->classes[$name];

		include_once dirname(__FILE__) . '/' . $class . '.php';

		self::$objects[$name] = new $class();

		return self::$objects[$name];
	}
}
