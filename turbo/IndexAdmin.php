<?php

require_once('api/Turbo.php');

// This class selects a module depending on the Section parameter and displays it on the screen
class IndexAdmin extends Turbo
{
	// Correspondence of modules and names of the corresponding rights
	private $modules_permissions = array(
		'DashboardAdmin'            => 'dashboard',
		'ProductsAdmin'             => 'products',
		'ProductAdmin'              => 'products',
		'CategoriesAdmin'           => 'categories',
		'CategoryAdmin'             => 'categories',
		'BrandsAdmin'               => 'brands',
		'BrandAdmin'                => 'brands',
		'FeaturesAdmin'             => 'features',
		'FeatureAdmin'              => 'features',
		'OrdersAdmin'               => 'orders',
		'OrderAdmin'                => 'orders',
		'OrdersLabelsAdmin'         => 'labels',
		'OrdersLabelAdmin'          => 'labels',
		'UsersAdmin'                => 'users',
		'UserAdmin'                 => 'users',
		'ExportUsersAdmin'          => 'users',
		'GroupsAdmin'               => 'groups',
		'GroupAdmin'                => 'groups',
		'CouponsAdmin'              => 'coupons',
		'CouponAdmin'               => 'coupons',
		'PagesAdmin'                => 'pages',
		'PageAdmin'                 => 'pages',
		'MenuAdmin'                 => 'menus',
		'BlogAdmin'                 => 'blog',
		'PostAdmin'                 => 'blog',
		'ArticlesCategoriesAdmin'   => 'blog',
		'ArticlesCategoryAdmin'     => 'blog',
		'ArticlesAdmin'             => 'blog',
		'ArticleAdmin'              => 'blog',
		'CommentsAdmin'             => 'comments',
		'CommentAdmin'       		=> 'comments',
		'FeedbacksAdmin'            => 'feedbacks',
		'CallbacksAdmin'            => 'callbacks',
		'SubscribesAdmin'           => 'subscribes',
		'FAQsAdmin'                 => 'faq',
		'FAQAdmin'                  => 'faq',
		'ImportAdmin'               => 'import',
		'ImportYmlAdmin'            => 'import',
		'ExportAdmin'               => 'export',
		'BackupAdmin'               => 'backup',
		'ClearAdmin'                => 'clear',
		'ReportStatsAdmin'          => 'stats',
		'CategoryStatsAdmin'        => 'stats',
		'ReportStatsProdAdmin'      => 'stats',
		'StatsAdmin'                => 'stats',
		'ThemeAdmin'                => 'design',
		'StylesAdmin'               => 'design',
		'TemplatesAdmin'            => 'design',
		'ImagesAdmin'               => 'design',
		'SeoAdmin'                  => 'seo',
		'SettingsCounterAdmin'      => 'seo',
		'SettingsAdmin'             => 'settings',
		'SettingsFeedAdmin'         => 'settings',
		'SystemAdmin'               => 'settings',
		'CurrencyAdmin'             => 'currency',
		'DeliveriesAdmin'           => 'delivery',
		'DeliveryAdmin'             => 'delivery',
		'PaymentMethodAdmin'        => 'payment',
		'PaymentMethodsAdmin'       => 'payment',
		'BannersAdmin'              => 'banners',
		'BannerAdmin'               => 'banners',
		'BannersImagesAdmin'        => 'banners',
		'BannersImageAdmin'         => 'banners',
		'ManagersAdmin'             => 'managers',
		'ManagerAdmin'              => 'managers',
		'LanguageAdmin'             => 'languages',
		'LanguagesAdmin'            => 'languages',
		'TranslationAdmin'          => 'languages',
		'TranslationsAdmin'         => 'languages'
	);

	// Constructor
	public function __construct()
	{
		// Calling the base class constructor
		parent::__construct();

		// Translation of the admin panel
		$backend_translations = $this->backend_translations;
		$file = "turbo/lang/" . $this->settings->lang . ".php";
		if (!file_exists($file)) {
			foreach (glob("turbo/lang/??.php") as $f) {
				$file = "turbo/lang/" . pathinfo($f, PATHINFO_FILENAME) . ".php";
				break;
			}
		}
		require_once($file);

		$this->design->set_templates_dir('turbo/design/html');
		$this->design->set_compiled_dir('turbo/design/compiled');

		// JS functions 
		$this->design->smarty->registerPlugin('block', 'js', array($this, 'add_javascript_block'));
		$this->design->smarty->registerPlugin('function', 'unset_js', array($this, 'unset_javascript_function'));
		$this->design->smarty->registerPlugin('function', 'javascript', array($this, 'print_javascript'));

		// CSS functions
		$this->design->smarty->registerPlugin('block', 'css', array($this, 'add_stylesheet_block'));
		$this->design->smarty->registerPlugin('function', 'unset_css', array($this, 'unset_stylesheet_function'));
		$this->design->smarty->registerPlugin('function', 'stylesheet', array($this, 'print_stylesheet'));

		$this->design->assign('seo', $this->seo);
		$this->design->assign('settings', $this->settings);
		$this->design->assign('config',	$this->config);

		$is_mobile = $this->design->is_mobile();
		$is_tablet = $this->design->is_tablet();
		$this->design->assign('is_mobile', $is_mobile);
		$this->design->assign('is_tablet', $is_tablet);

		// Language
		$languages = $this->languages->languages();
		$this->design->assign('languages', $languages);

		$lang_id = $this->languages->lang_id();
		$this->design->assign('lang_id', $lang_id);

		$lang_label = '';
		$lang_link = '';
		if ($lang_id && $languages) $lang_label = $languages[$lang_id]->label;

		$first_lang = $this->languages->languages();
		$first_lang = reset($first_lang);
		if (isset($first_lang->id) && ($first_lang->id != $lang_id)) {
			$lang_link = $lang_label . '/';
		}

		$this->design->assign('lang_label', $lang_label);
		$this->design->assign('lang_link', $lang_link);

		// Administrator
		$this->manager = $this->managers->get_manager();
		$this->design->assign('manager', $this->manager);

		// We take the name of the module from the get-request
		$module = $this->request->get('module', 'string');
		$module = preg_replace("/[^A-Za-z0-9]+/", "", $module);

		// If you didn't request a module, use the first allowed module
		if (empty($module) || !is_file('turbo/' . $module . '.php')) {
			foreach ($this->modules_permissions as $m => $p) {
				if ($this->managers->access($p)) {
					$module = $m;
					break;
				}
			}
		}
		if (empty($module))
			$module = 'ProductsAdmin';

		// We connect the file with the necessary module
		require_once('turbo/' . $module . '.php');

		$this->design->assign('btr', $backend_translations);

		// We create the corresponding module
		if (class_exists($module))
			$this->module = new $module();
		else
			die("Error creating $module class");
	}

	function fetch()
	{
		$currency = $this->money->get_currency();
		$this->design->assign("currency", $currency);

		// Checking module access rights
		if (
			isset($this->modules_permissions[get_class($this->module)])
			&& $this->managers->access($this->modules_permissions[get_class($this->module)])
		) {
			$content = $this->module->fetch();
			$this->design->assign("content", $content);
		} else {
			$this->design->assign("content", "Permission denied");
		}

		// Counters for the top menu
		$new_orders_counter = $this->orders->count_orders(array('status' => 0));
		$this->design->assign("new_orders_counter", $new_orders_counter);

		$new_comments_counter = $this->comments->count_comments(array('approved' => 0));
		$this->design->assign("new_comments_counter", $new_comments_counter);

		$new_feedbacks_counter = $this->feedbacks->count_feedbacks(array('processed' => 0));
		$this->design->assign("new_feedbacks_counter", $new_feedbacks_counter);

		$new_callbacks_counter = $this->callbacks->count_callbacks(array('processed' => 0));
		$this->design->assign("new_callbacks_counter", $new_callbacks_counter);

		$new_subscribes_counter = $this->subscribes->count_subscribes(array('processed' => 0));
		$this->design->assign("new_subscribes_counter", $new_subscribes_counter);

		$this->design->assign("all_counter", $new_comments_counter + $new_feedbacks_counter + $new_callbacks_counter + $new_subscribes_counter);

		// Current menu
		$menu_id = $this->request->get('menu_id', 'integer');
		$menus = $this->pages->get_menus();
		$menu = $this->pages->get_menu($menu_id);
		$this->design->assign('menu', $menu);
		$this->design->assign('menus', $menus);

		// Create the current site wrapper (usually index.tpl) 
		$wrapper = $this->design->smarty->getTemplateVars('wrapper');
		if (is_null($wrapper))
			$wrapper = 'index.tpl';

		if (!empty($wrapper))
			return $this->body = $this->design->fetch($wrapper);
		else
			return $this->body = $content;
	}

	/*
    * Functions for working with javascript files
    * Register js file(s) or code
    */

	public function add_javascript_block($params, $content, $smarty, &$repeat)
	{
		if (!isset($params['id']) || $repeat || (empty($content)) && empty($params['include']))
			return false;

		if (!isset($params['priority']))
			$params['priority'] = 10;

		if (!empty($params['include']))
			$this->js->add_files($params['id'], $params['include'], $params['priority']);

		if (!empty($content))
			$this->js->add_code($params['id'], $content, $params['priority']);

		if (!empty($params['render'])) {
			if (!isset($params['minify']))
				$params['minify'] = null;

			if (!isset($params['combine']))
				$params['combine'] = true;

			return $this->js->render($params['id'], $params['minify'], $params['combine']);
		}
	}

	/*
    * Unregister js file(s) or code
    */

	public function unset_javascript_function($params, $smarty)
	{
		if (!isset($params['id']))
			return false;

		$this->js->unplug($params['id']);
	}

	/*
    * Output of packed js file 
    */

	public function print_javascript($params)
	{
		if (!isset($params['id']))
			$params['id'] = null;

		if (!isset($params['combine']))
			$params['combine'] = true;

		if (!isset($params['minify']))
			$params['minify'] = null;

		return $this->js->render($params['id'], $params['minify'], $params['combine']);
	}

	/*
    * Functions for working with style files
    * Register css file(s) or code 
    */

	public function add_stylesheet_block($params, $content, $smarty, &$repeat)
	{
		if (!isset($params['id']) || $repeat || (empty($content)) && empty($params['include']))
			return false;

		if (!isset($params['priority']))
			$params['priority'] = 10;

		if (!isset($params['less']))
			$params['less'] = false;

		if (!empty($params['include']))
			$this->css->add_files($params['id'], $params['include'], $params['priority'], $params['less']);

		if (!empty($content))
			$this->css->add_code($params['id'], $content, $params['priority'], $params['less']);

		if (!empty($params['render'])) {
			if (!isset($params['minify']))
				$params['minify'] = null;

			if (!isset($params['combine']))
				$params['combine'] = true;

			return $this->css->render($params['id'], $params['minify'], $params['combine']);
		}
	}

	/*
    * Unregister css file(s) or code
    */

	public function unset_stylesheet_function($params, $smarty)
	{
		if (!isset($params['id']))
			return false;

		$this->css->unplug($params['id']);
	}

	/*
    * Output of packed css file 
    */

	public function print_stylesheet($params)
	{
		if (!isset($params['id']))
			$params['id'] = null;

		if (!isset($params['combine']))
			$params['combine'] = true;

		if (!isset($params['minify']))
			$params['minify'] = null;

		return $this->css->render($params['id'], $params['minify'], $params['combine']);
	}
}
