<?php

require_once('api/Turbo.php');

class IndexAdmin extends Turbo
{
	private $modules_permissions = [
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
		'CommentAdmin'              => 'comments',
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
		'SettingsCounterAdmin'      => 'scripts',
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
	];

	public function __construct()
	{
		parent::__construct();

		$backendTranslations = $this->backendTranslations;
		$file = "turbo/lang/" . $this->settings->lang . ".php";

		if (!file_exists($file)) {
			foreach (glob("turbo/lang/??.php") as $f) {
				$file = "turbo/lang/" . pathinfo($f, PATHINFO_FILENAME) . ".php";
				break;
			}
		}

		require_once($file);

		$this->design->setTemplatesDir('turbo/design/html');
		$this->design->setCompiledDir('turbo/design/compiled');

		$this->design->smarty->registerPlugin('block', 'js', [$this, 'addJavascriptBlock']);
		$this->design->smarty->registerPlugin('function', 'unset_js', [$this, 'unsetJavascriptFunction']);
		$this->design->smarty->registerPlugin('function', 'javascript', [$this, 'printJavascript']);

		$this->design->smarty->registerPlugin('block', 'css', [$this, 'addStylesheetBlock']);
		$this->design->smarty->registerPlugin('function', 'unset_css', [$this, 'unsetStylesheetFunction']);
		$this->design->smarty->registerPlugin('function', 'stylesheet', [$this, 'printStylesheet']);

		$this->design->assign('seo', $this->seo);
		$this->design->assign('settings', $this->settings);
		$this->design->assign('config',  $this->config);

		$isMobile = $this->design->isMobile();
		$isTablet = $this->design->isTablet();
		$this->design->assign('is_mobile', $isMobile);
		$this->design->assign('is_tablet', $isTablet);

		$languages = $this->languages->languages();
		$this->design->assign('languages', $languages);

		$langId = $this->languages->langId();
		$this->design->assign('lang_id', $langId);

		$langLabel = '';
		$langLink = '';

		if ($langId && $languages) {
			$langLabel = $languages[$langId]->label;
		}

		$firstLang = $this->languages->languages();
		$firstLang = reset($firstLang);

		if (isset($firstLang->id) && ($firstLang->id != $langId)) {
			$langLink = $langLabel . '/';
		}

		$this->design->assign('lang_label', $langLabel);
		$this->design->assign('lang_link', $langLink);

		$this->manager = $this->managers->getManager();
		$this->design->assign('manager', $this->manager);

		$module = $this->request->get('module', 'string');
		$module = preg_replace("/[^A-Za-z0-9]+/", "", $module);

		if (empty($module) || !is_file('turbo/' . $module . '.php')) {
			foreach ($this->modules_permissions as $m => $p) {
				if ($this->managers->access($p)) {
					$module = $m;
					break;
				}
			}
		}

		if (empty($module)) {
			$module = 'ProductsAdmin';
		}

		require_once('turbo/' . $module . '.php');

		$this->design->assign('btr', $backendTranslations);

		if (class_exists($module)) {
			$this->module = new $module();
		} else {
			die("Error creating $module class");
		}
	}

	private $manager;
	private $module;

	function fetch()
	{
		$currency = $this->money->getCurrency();
		$this->design->assign("currency", $currency);

		if (isset($this->modules_permissions[get_class($this->module)]) && $this->managers->access($this->modules_permissions[get_class($this->module)])) {
			$content = $this->module->fetch();
			$this->design->assign("content", $content);
		} else {
			$this->design->assign("content", "Permission denied");
		}

		$newOrdersCounter = $this->orders->countOrders(['status' => 0]);
		$this->design->assign('new_orders_counter', $newOrdersCounter);

		$newCommentsCounter = $this->comments->countComments(['approved' => 0]);
		$this->design->assign('new_comments_counter', $newCommentsCounter);

		$newFeedbacksCounter = $this->feedbacks->countFeedbacks(['processed' => 0]);
		$this->design->assign('new_feedbacks_counter', $newFeedbacksCounter);

		$newCallbacksCounter = $this->callbacks->countCallbacks(['processed' => 0]);
		$this->design->assign('new_callbacks_counter', $newCallbacksCounter);

		$newSubscribesCounter = $this->subscribes->countSubscribes(['processed' => 0]);
		$this->design->assign('new_subscribes_counter', $newSubscribesCounter);

		$totalCounter = $newOrdersCounter + $newCommentsCounter + $newFeedbacksCounter + $newCallbacksCounter + $newSubscribesCounter;
		$this->design->assign('all_counter', $totalCounter);

		$menuId = $this->request->get('menu_id', 'integer');
		$menus = $this->pages->getMenus();
		$menu = $this->pages->getMenu($menuId);
		$this->design->assign('menu', $menu);
		$this->design->assign('menus', $menus);

		$wrapper = $this->design->smarty->getTemplateVars('wrapper');

		if (is_null($wrapper)) {
			$wrapper = 'index.tpl';
		}

		if (!empty($wrapper)) {
			$body = $this->design->fetch($wrapper);
			return $body;
		} else {
			$body = $content;
			return $body;
		}
	}

	/**
	 * Add JavaScript file
	 */
	public function addJavascriptBlock($params, $content, $smarty, &$repeat)
	{
		if (!isset($params['id']) || $repeat || (empty($content)) && empty($params['include'])) {
			return false;
		}

		if (!isset($params['priority'])) {
			$params['priority'] = 10;
		}

		if (!empty($params['include'])) {
			$this->js->addFiles($params['id'], $params['include'], $params['priority']);
		}

		if (!empty($content)) {
			$this->js->addCode($params['id'], $content, $params['priority']);
		}

		if (!empty($params['render'])) {
			if (!isset($params['minify'])) {
				$params['minify'] = null;
			}

			if (!isset($params['combine'])) {
				$params['combine'] = true;
			}

			return $this->js->render($params['id'], $params['minify'], $params['combine']);
		}
	}

	/**
	 * Unregister JavaScript file
	 */
	public function unsetJavascriptFunction($params, $smarty)
	{
		if (!isset($params['id'])) {
			return false;
		}

		$this->js->unplug($params['id']);
	}

	/**
	 * Render packed JavaScript file
	 */
	public function printJavascript($params)
	{
		if (!isset($params['id'])) {
			$params['id'] = null;
		}

		if (!isset($params['combine'])) {
			$params['combine'] = true;
		}

		if (!isset($params['minify'])) {
			$params['minify'] = null;
		}

		return $this->js->render($params['id'], $params['minify'], $params['combine']);
	}

	/**
	 * Register css file
	 */
	public function addStylesheetBlock($params, $content, $smarty, &$repeat)
	{
		if (!isset($params['id']) || $repeat || (empty($content)) && empty($params['include'])) {
			return false;
		}

		if (!isset($params['priority'])) {
			$params['priority'] = 10;
		}

		if (!isset($params['less'])) {
			$params['less'] = false;
		}

		if (!empty($params['include'])) {
			$this->css->addFiles($params['id'], $params['include'], $params['priority'], $params['less']);
		}

		if (!empty($content)) {
			$this->css->addCode($params['id'], $content, $params['priority'], $params['less']);
		}

		if (!empty($params['render'])) {
			if (!isset($params['minify'])) {
				$params['minify'] = null;
			}

			if (!isset($params['combine'])) {
				$params['combine'] = true;
			}

			return $this->css->render($params['id'], $params['minify'], $params['combine']);
		}
	}

	/**
	 * Unregisters CSS file
	 */
	public function unsetStylesheetFunction($params, $smarty)
	{
		if (!isset($params['id'])) {
			return false;
		}

		$this->css->unplug($params['id']);

		return true;
	}

	/**
	 * Print packed CSS file
	 */
	public function printStylesheet($params)
	{
		if (!isset($params['id'])) {
			$params['id'] = null;
		}

		if (!isset($params['combine'])) {
			$params['combine'] = true;
		}

		if (!isset($params['minify'])) {
			$params['minify'] = null;
		}

		return $this->css->render($params['id'], $params['minify'], $params['combine']);
	}
}
