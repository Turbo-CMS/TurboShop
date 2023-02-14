<!DOCTYPE html>
<html lang="{$settings->lang}">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="icon" href="design/images/favicon.svg" />

	<title>{$meta_title|escape}</title>

	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

	{if $settings->admin_theme == "dark"}
		{css id="main" include=[
			"turbo/design/css/dark.css",
			"turbo/design/css/turbo-dark.css",
			"turbo/design/css/media.css",
			"turbo/design/css/bootstrap-select-dark.css",
			"turbo/design/css/jquery.scrollbar.css",
			"turbo/design/css/icon-font.css"
		]}{/css}
		{stylesheet minify=true}
	{else}
		{css id="main" include=[
			"turbo/design/css/light.css",
			"turbo/design/css/turbo.css",
			"turbo/design/css/media.css",
			"turbo/design/css/bootstrap-select.css",
			"turbo/design/css/jquery.scrollbar.css",
			"turbo/design/css/icon-font.css"
		]}{/css}
		{stylesheet minify=true}
	{/if}
	{js id="libs" priority=99 include=[
		"turbo/design/js/jquery/jquery.js",
		"turbo/design/js/jquery/jquery.form.min.js",
		"turbo/design/js/jquery.scrollbar.min.js",
		"turbo/design/js/bootstrap-select.js",
		"turbo/design/js/sortable.min.js"
	]}{/js}
	{javascript minify=true}
</head>

<body data-theme="{$settings->admin_theme}" data-layout="{$settings->layout}" data-sidebar-position="{$settings->position}" data-sidebar-layout="{$settings->sidebar}">
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.php?module=DashboardAdmin">
					{if $settings->admin_theme == "light"}
						<img src="design/images/logo_dark.svg" class="align-middle" alt="TurboCMS" />
						<span class="sidebar-brand-text align-middle me-3">
							<img src="design/images/logo_title_dark.svg" alt="TurboCMS">
						</span>
					{else}
						<img src="design/images/logo.svg" class="align-middle" alt="TurboCMS" />
						<span class="sidebar-brand-text align-middle me-3">
							<img src="design/images/logo_title.svg" alt="TurboCMS">
						</span>
					{/if}
				</a>
				<ul class="sidebar-nav">
					{if in_array('dashboard', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('DashboardAdmin'))}active{/if}">
							<a class="sidebar-link" href="index.php?module=DashboardAdmin">
								<i class="align-middle" data-feather="sliders"></i> <span class="align-middle">{$btr->global_dashboard|escape}</span>
							</a>
						</li>
					{/if}
					{if in_array('products', $manager->permissions) || in_array('categories', $manager->permissions) || in_array('brands', $manager->permissions) || in_array('features', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('ProductsAdmin','ProductAdmin','CategoriesAdmin','CategoryAdmin','BrandsAdmin','BrandAdmin','FeaturesAdmin','FeatureAdmin'))}active{/if}">
							<a data-bs-target="#catalog" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('ProductsAdmin','ProductAdmin','CategoriesAdmin','CategoryAdmin','BrandsAdmin','BrandAdmin','FeaturesAdmin','FeatureAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="grid"></i> <span class="align-middle">{$btr->global_catalog|escape}</span>
							</a>
							<ul id="catalog" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('ProductsAdmin','ProductAdmin','CategoriesAdmin','CategoryAdmin','BrandsAdmin','BrandAdmin','FeaturesAdmin','FeatureAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('products', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('ProductsAdmin', 'ProductAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ProductsAdmin">{$btr->global_products|escape}</a>
									</li>
								{/if}
								{if in_array('categories', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('CategoriesAdmin','CategoryAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CategoriesAdmin">{$btr->global_categories|escape}</a>
									</li>
								{/if}
								{if in_array('brands', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('BrandsAdmin','BrandAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=BrandsAdmin">{$btr->global_brands|escape}</a>
									</li>
								{/if}
								{if in_array('features', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('FeaturesAdmin','FeatureAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=FeaturesAdmin">{$btr->global_features|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('orders', $manager->permissions) || in_array('labels', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('OrdersAdmin', 'OrderAdmin', 'OrdersLabelsAdmin', 'OrdersLabelAdmin'))}active{/if}">
							<a data-bs-target="#orders" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('OrdersAdmin', 'OrderAdmin', 'OrdersLabelsAdmin', 'OrdersLabelAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="shopping-cart"></i>
								<span class="align-middle">{$btr->global_orders}</span>
								{if $new_orders_counter}<span class="sidebar-badge badge bg-primary">{$new_orders_counter}</span>{/if}
							</a>
							<ul id="orders" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('OrdersAdmin', 'OrderAdmin', 'OrdersLabelsAdmin', 'OrdersLabelAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('orders', $manager->permissions)}
									<li class="sidebar-item {if $status===0}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersAdmin&status=0">{$btr->global_new_order}</a>
									</li>
									<li class="sidebar-item {if $status===1}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersAdmin&status=1">{$btr->global_accepted_order|escape}</a>
									</li>
									<li class="sidebar-item {if $status===2}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersAdmin&status=2">{$btr->global_closed_order|escape}</a>
									</li>
									<li class="sidebar-item {if $status===3}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersAdmin&status=3">{$btr->global_canceled_order|escape}</a>
									</li>
								{/if}
								{if $keyword}
									<li class="sidebar-item active">
										<a class="sidebar-link" href="{url module=OrdersAdmin keyword=$keyword id=null label=null}">{$btr->global_search_order|escape}</a>
									</li>
								{/if}
								{if in_array('labels', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('OrdersLabelsAdmin', 'OrdersLabelAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersLabelsAdmin">{$btr->global_labels}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('users', $manager->permissions) || in_array('groups', $manager->permissions) || in_array('coupons', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('UsersAdmin', 'UserAdmin', 'GroupsAdmin', 'GroupAdmin', 'CouponsAdmin', 'CouponAdmin'))}active{/if}">
							<a data-bs-target="#users" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('UsersAdmin', 'UserAdmin', 'GroupsAdmin', 'GroupAdmin', 'CouponsAdmin', 'CouponAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="users"></i> <span class="align-middle">{$btr->global_users|escape}</span>
							</a>
							<ul id="users" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('UsersAdmin', 'UserAdmin', 'GroupsAdmin', 'GroupAdmin', 'CouponsAdmin', 'CouponAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('users', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('UsersAdmin', 'UserAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=UsersAdmin">{$btr->global_users_list|escape}</a>
									</li>
								{/if}
								{if in_array('groups', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('GroupsAdmin','GroupAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=GroupsAdmin">{$btr->global_groups|escape}</a>
									</li>
								{/if}
								{if in_array('coupons', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('CouponsAdmin','CouponAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CouponsAdmin">{$btr->global_coupons|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('pages', $manager->permissions) || in_array('menus', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('PagesAdmin', 'PageAdmin', 'MenuAdmin', 'indexAdmin'))}active{/if}">
							<a data-bs-target="#pages" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('PagesAdmin', 'PageAdmin', 'MenuAdmin', 'indexAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="layers"></i> <span class="align-middle">{$btr->global_pages|escape}</span>
							</a>
							<ul id="pages" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('PagesAdmin', 'PageAdmin', 'MenuAdmin', 'indexAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('pages', $manager->permissions)}
									{foreach $menus as $m}
										<li class="sidebar-item {if $m->id == $menu->id}active{/if}">
											<a class="sidebar-link" href="index.php?module=PagesAdmin&menu_id={$m->id}">{$m->name}</a>
										</li>
									{/foreach}
								{/if}
								{if in_array('menus', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('MenuAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=MenuAdmin">{$btr->menus_settings|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('blog', $manager->permissions) || in_array('articles', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('BlogAdmin', 'ArticlesCategoriesAdmin', 'ArticlesAdmin', 'ArticleAdmin', 'PostAdmin', 'ArticlesCategoryAdmin'))}active{/if}">
							<a data-bs-target="#blog" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('BlogAdmin', 'ArticlesCategoriesAdmin', 'ArticlesAdmin', 'ArticleAdmin', 'PostAdmin', 'ArticlesCategoryAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="edit-2"></i> <span class="align-middle">{$btr->global_blog|escape}</span>
							</a>
							<ul id="blog" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('BlogAdmin', 'ArticlesCategoriesAdmin', 'ArticlesAdmin', 'ArticleAdmin', 'PostAdmin', 'ArticlesCategoryAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('blog', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('BlogAdmin', 'PostAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=BlogAdmin">{$btr->blog_posts|escape}</a>
									</li>
								{/if}
								{if in_array('articles', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('ArticlesCategoriesAdmin', 'ArticlesCategoryAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ArticlesCategoriesAdmin">{$btr->article_categories|escape}</a>
									</li>
									<li class="sidebar-item {if in_array($smarty.get.module, array('ArticlesAdmin', 'ArticleAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ArticlesAdmin">{$btr->global_articles|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('comments', $manager->permissions) || in_array('feedbacks', $manager->permissions) || in_array('callbacks', $manager->permissions) || in_array('subscribes', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('CommentsAdmin', 'CommentAdmin', 'FeedbacksAdmin', 'SubscribesAdmin', 'CallbacksAdmin'))}active{/if}">
							<a data-bs-target="#feedbacks" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('CommentsAdmin', 'CommentAdmin', 'FeedbacksAdmin', 'SubscribesAdmin', 'CallbacksAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="message-square"></i>
								<span class="align-middle">{$btr->global_feedback|escape}</span>
								{if $all_counter}<span class="sidebar-badge badge bg-secondary">{$all_counter}</span>{/if}
							</a>
							<ul id="feedbacks" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('CommentsAdmin', 'CommentAdmin', 'FeedbacksAdmin', 'SubscribesAdmin', 'CallbacksAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('comments', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('CommentsAdmin', 'CommentAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CommentsAdmin">{$btr->global_comments|escape} {if $new_comments_counter > 0}<span class="sidebar-badge badge bg-danger">{$new_comments_counter}</span>{/if}</a>
									</li>
								{/if}
								{if in_array('feedbacks', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('FeedbacksAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=FeedbacksAdmin">{$btr->global_feedback|escape} {if $new_feedbacks_counter > 0}<span class="sidebar-badge badge bg-warning">{$new_feedbacks_counter}</span>{/if}</a>
									</li>
								{/if}
								{if in_array('callbacks', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('CallbacksAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CallbacksAdmin">{$btr->global_callbacks|escape} {if $new_callbacks_counter > 0}<span class="sidebar-badge badge bg-primary">{$new_callbacks_counter}</span>{/if}</a>
									</li>
								{/if}
								{if in_array('subscribes', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('SubscribesAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SubscribesAdmin">{$btr->global_subscribes|escape} {if $new_subscribes_counter > 0}<span class="sidebar-badge badge bg-info">{$new_subscribes_counter}</span>{/if}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('faq', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('FAQsAdmin', 'FAQAdmin'))}active{/if}">
							<a data-bs-target="#faq" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('FAQsAdmin', 'FAQAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="help-circle"></i> <span class="align-middle">{$btr->global_faq|escape}</span>
							</a>
							<ul id="faq" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('FAQsAdmin', 'FAQAdmin'))}show{/if}" data-bs-parent="#sidebar">
								<li class="sidebar-item {if in_array($smarty.get.module, array('FAQsAdmin', 'FAQAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=FAQsAdmin">{$btr->faq_list|escape}</a>
								</li>
							</ul>
						</li>
					{/if}
					{if in_array('import', $manager->permissions) || in_array('export', $manager->permissions) || in_array('backup', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('ImportAdmin', 'ImportYmlAdmin', 'ExportAdmin', 'BackupAdmin', 'ClearAdmin'))}active{/if}">
							<a data-bs-target="#auto" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('ImportAdmin', 'ImportYmlAdmin', 'ExportAdmin', 'BackupAdmin', 'ClearAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="repeat"></i>
								<span class="align-middle">{$btr->global_automation|escape}</span>
							</a>
							<ul id="auto" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('ImportAdmin', 'ImportYmlAdmin', 'ExportAdmin', 'BackupAdmin', 'ClearAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('import', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('ImportAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ImportAdmin">{$btr->global_import|escape}</a>
									</li>
								{/if}
								{if in_array('import', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('ImportYmlAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ImportYmlAdmin">{$btr->global_yml_import|escape}</a>
									</li>
								{/if}
								{if in_array('export', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('ExportAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ExportAdmin">{$btr->global_export|escape}</a>
									</li>
								{/if}
								{if in_array('backup', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('BackupAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=BackupAdmin">{$btr->global_backup|escape}</a>
									</li>
								{/if}
								{if in_array('backup', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('ClearAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ClearAdmin">{$btr->global_clear|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('stats', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('StatsAdmin', 'ReportStatsAdmin', 'ReportStatsProdAdmin', 'CategoryStatsAdmin'))}active{/if}">
							<a data-bs-target="#stats" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('StatsAdmin', 'ReportStatsAdmin', 'ReportStatsProdAdmin', 'CategoryStatsAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="pie-chart"></i>
								<span class="align-middle">{$btr->global_stats|escape}</span>
							</a>
							<ul id="stats" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('StatsAdmin', 'ReportStatsAdmin', 'ReportStatsProdAdmin', 'CategoryStatsAdmin'))}show{/if}" data-bs-parent="#sidebar">
								<li class="sidebar-item {if in_array($smarty.get.module, array('StatsAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=StatsAdmin">{$btr->stats_orders|escape}</a>
								</li>
								<li class="sidebar-item {if in_array($smarty.get.module, array('ReportStatsAdmin', 'ReportStatsProdAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=ReportStatsAdmin">{$btr->global_products_stat|escape}</a>
								</li>
								<li class="sidebar-item {if in_array($smarty.get.module, array('CategoryStatsAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=CategoryStatsAdmin">{$btr->global_categories_stat|escape}</a>
								</li>
							</ul>
						</li>
					{/if}
					{if in_array('seo', $manager->permissions) || in_array('scripts', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('SeoAdmin', 'SettingsCounterAdmin'))}active{/if}">
							<a data-bs-target="#seo" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('SeoAdmin', 'SettingsCounterAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="target"></i>
								<span class="align-middle">{$btr->global_seo|escape}</span>
							</a>
							<ul id="seo" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('SeoAdmin', 'SettingsCounterAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('seo', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('SeoAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SeoAdmin">{$btr->seo_automation|escape}</a>
									</li>
								{/if}
								{if in_array('scripts', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('SettingsCounterAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SettingsCounterAdmin">{$btr->global_scripts|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('design', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('ThemeAdmin', 'TemplatesAdmin', 'StylesAdmin', 'ImagesAdmin', 'TranslationsAdmin', 'TranslationAdmin'))}active{/if}">
							<a data-bs-target="#design" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('ThemeAdmin', 'TemplatesAdmin', 'StylesAdmin', 'ImagesAdmin', 'TranslationsAdmin', 'TranslationAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="layout"></i>
								<span class="align-middle">{$btr->global_design|escape}</span>
							</a>
							<ul id="design" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('ThemeAdmin', 'TemplatesAdmin', 'StylesAdmin', 'ImagesAdmin', 'TranslationsAdmin', 'TranslationAdmin'))}show{/if}" data-bs-parent="#sidebar">
								<li class="sidebar-item {if in_array($smarty.get.module, array('ThemeAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=ThemeAdmin">{$btr->global_templates|escape}</a>
								</li>
								<li class="sidebar-item {if in_array($smarty.get.module, array('TemplatesAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=TemplatesAdmin">{$btr->global_template_files|escape}</a>
								</li>
								<li class="sidebar-item {if in_array($smarty.get.module, array('StylesAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=StylesAdmin">{$btr->global_template_style|escape}</a>
								</li>
								<li class="sidebar-item {if in_array($smarty.get.module, array('ImagesAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=ImagesAdmin">{$btr->global_template_images|escape}</a>
								</li>
								<li class="sidebar-item {if in_array($smarty.get.module, array('TranslationsAdmin', 'TranslationAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=TranslationsAdmin">{$btr->global_translations|escape}</a>
								</li>
							</ul>
						</li>
					{/if}
					{if in_array('banners', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('BannersAdmin', 'BannerAdmin', 'BannersImagesAdmin', 'BannersImageAdmin'))}active{/if}">
							<a data-bs-target="#banners" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('BannersAdmin', 'BannerAdmin', 'BannersImagesAdmin', 'BannersImageAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="image"></i>
								<span class="align-middle">{$btr->global_banners|escape}</span>
							</a>
							<ul id="banners" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('BannersAdmin', 'BannerAdmin', 'BannersImagesAdmin', 'BannersImageAdmin'))}show{/if}" data-bs-parent="#sidebar">
								<li class="sidebar-item {if in_array($smarty.get.module, array('BannersAdmin', 'BannerAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=BannersAdmin">{$btr->banners_groups|escape}</a>
								</li>
								<li class="sidebar-item {if in_array($smarty.get.module, array('BannersImagesAdmin', 'BannersImageAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=BannersImagesAdmin">{$btr->global_banners_images|escape}</a>
								</li>
							</ul>
						</li>
					{/if}
					{if in_array('settings', $manager->permissions) || in_array('currency', $manager->permissions) || in_array('delivery', $manager->permissions) || in_array('payment', $manager->permissions) || in_array('managers', $manager->permissions) || in_array('languages', $manager->permissions)}
						<li class="sidebar-item {if in_array($smarty.get.module, array('SettingsAdmin', 'CurrencyAdmin', 'DeliveriesAdmin', 'DeliveryAdmin', 'PaymentMethodsAdmin', 'PaymentMethodAdmin', 'ManagersAdmin', 'ManagerAdmin', 'SettingsFeedAdmin', 'LanguagesAdmin', 'LanguageAdmin', 'SystemAdmin'))}active{/if}">
							<a data-bs-target="#settings" data-bs-toggle="collapse" {if in_array($smarty.get.module, array('SettingsAdmin', 'CurrencyAdmin', 'DeliveriesAdmin', 'DeliveryAdmin', 'PaymentMethodsAdmin', 'PaymentMethodAdmin', 'ManagersAdmin', 'ManagerAdmin', 'SettingsFeedAdmin', 'LanguagesAdmin', 'LanguageAdmin', 'SystemAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false" {/if}>
								<i class="align-middle" data-feather="settings"></i>
								<span class="align-middle">{$btr->global_settings|escape}</span>
							</a>
							<ul id="settings" class="sidebar-dropdown list-unstyled collapse {if in_array($smarty.get.module, array('SettingsAdmin', 'CurrencyAdmin', 'DeliveriesAdmin', 'DeliveryAdmin', 'PaymentMethodsAdmin', 'PaymentMethodAdmin', 'ManagersAdmin', 'ManagerAdmin', 'SettingsFeedAdmin', 'LanguagesAdmin', 'LanguageAdmin', 'SystemAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('settings', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('SettingsAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SettingsAdmin">{$btr->global_settings_site|escape}</a>
									</li>
								{/if}
								{if in_array('settings', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('SettingsFeedAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SettingsFeedAdmin">{$btr->global_setting_feed|escape}</a>
									</li>
								{/if}
								{if in_array('currency', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('CurrencyAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CurrencyAdmin">{$btr->global_currency|escape}</a>
									</li>
								{/if}
								{if in_array('delivery', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('DeliveriesAdmin', 'DeliveryAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=DeliveriesAdmin">{$btr->global_shipping|escape}</a>
									</li>
								{/if}
								{if in_array('payment', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('PaymentMethodsAdmin', 'PaymentMethodAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=PaymentMethodsAdmin">{$btr->global_payment|escape}</a>
									</li>
								{/if}
								{if in_array('managers', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('ManagersAdmin', 'ManagerAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ManagersAdmin">{$btr->global_managers|escape}</a>
									</li>
								{/if}
								{if in_array('languages', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('LanguagesAdmin', 'LanguageAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=LanguagesAdmin">{$btr->global_languages|escape}</a>
									</li>
								{/if}
								{if in_array('settings', $manager->permissions)}
									<li class="sidebar-item {if in_array($smarty.get.module, array('SystemAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SystemAdmin">{$btr->global_system|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
				</ul>
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
					<i class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
								<div class="position-relative">
									{if $all_counter}
										<i class="align-middle" data-feather="bell"></i>
										<span class="indicator">{$all_counter}</span>
									{else}
										<i class="align-middle" data-feather="bell-off"></i>
									{/if}
								</div>
							</a>
							<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="alertsDropdown">
								<div class="dropdown-menu-header">
									{if $all_counter}
										{$btr->new_notifications|escape}
									{else}
										{$btr->no_notification|escape}
									{/if}
								</div>
								{if $all_counter}
									<div class="list-group">
										{if in_array('orders', $manager->permissions)}
											{if $new_orders_counter > 0}
												<a href="index.php?module=OrdersAdmin" class="list-group-item">
													<div class="row g-0 align-items-center">
														<div class="col-2">
															<i class="text-success" data-feather="shopping-cart"></i>
														</div>
														<div class="col-8">
															<div class="text-dark">{$btr->global_orders|escape}</div>
														</div>
														<div class="col-2">
															<span class="badge bg-success">{$new_orders_counter}</span>
														</div>
													</div>
												</a>
											{/if}
										{/if}
										{if in_array('comments', $manager->permissions)}
											{if $new_comments_counter > 0}
												<a href="index.php?module=CommentsAdmin" class="list-group-item">
													<div class="row g-0 align-items-center">
														<div class="col-2">
															<i class="text-danger" data-feather="message-square"></i>
														</div>
														<div class="col-8">
															<div class="text-dark">{$btr->global_comments|escape}</div>
														</div>
														<div class="col-2">
															<span class="badge bg-danger">{$new_comments_counter}</span>
														</div>
													</div>
												</a>
											{/if}
										{/if}
										{if in_array('feedbacks', $manager->permissions)}
											{if $new_feedbacks_counter > 0}
												<a href="index.php?module=FeedbacksAdmin" class="list-group-item">
													<div class="row g-0 align-items-center">
														<div class="col-2">
															<i class="text-warning" data-feather="mail"></i>
														</div>
														<div class="col-8">
															<div class="text-dark">{$btr->global_feedback|escape}</div>
														</div>
														<div class="col-2">
															<span class="badge bg-warning">{$new_feedbacks_counter}</span>
														</div>
													</div>
												</a>
											{/if}
										{/if}
										{if in_array('subscribes', $manager->permissions)}
											{if $new_subscribes_counter > 0}
												<a href="index.php?module=SubscribesAdmin" class="list-group-item">
													<div class="row g-0 align-items-center">
														<div class="col-2">
															<i class="text-info" data-feather="at-sign"></i>
														</div>
														<div class="col-8">
															<div class="text-dark">{$btr->global_subscribes|escape}</div>
														</div>
														<div class="col-2">
															<span class="badge bg-info">{$new_subscribes_counter}</span>
														</div>
													</div>
												</a>
											{/if}
										{/if}
										{if in_array('callbacks', $manager->permissions)}
											{if $new_callbacks_counter > 0}
												<a href="index.php?module=CallbacksAdmin" class="list-group-item">
													<div class="row g-0 align-items-center">
														<div class="col-2">
															<i class="text-primary" data-feather="phone"></i>
														</div>
														<div class="col-8">
															<div class="text-dark">{$btr->global_callback|escape}</div>
														</div>
														<div class="col-2">
															<span class="badge bg-primary">{$new_callbacks_counter}</span>
														</div>
													</div>
												</a>
											{/if}
										{/if}
									</div>
								{/if}
							</div>
						</li>
						{include file="include_languages.tpl"}
						<li class="nav-item">
							<a class="nav-icon js-fullscreen d-none d-lg-block" href="#">
								<div class="position-relative">
									<i class="align-middle" data-feather="maximize"></i>
								</div>
							</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-icon pe-md-0 dropdown-toggle" href="#" data-bs-toggle="dropdown">
								<i class="align-middle me-1" data-feather="user"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" target="_blank" href="{$config->root_url}/{$lang_link}"><i class="align-middle me-1 mt-n1" data-feather="external-link"></i> {$btr->global_go_to_site|escape}</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="index.php?module=ManagerAdmin&login={$manager->login|escape}"><i class="align-middle me-1 mt-n1" data-feather="user"></i> {$manager->login|capitalize|escape}</a>
								<a class="dropdown-item" href="index.php?module=SettingsAdmin"><i class="align-middle me-1" data-feather="settings"></i> {$btr->global_settings|escape}</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="{$config->root_url}?logout"><i class="align-middle me-1" data-feather="power"></i> {$btr->global_exit|escape}</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>

			<main class="content">
				<div class="container-fluid p-0">
					{$content}
				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a href="index.php?module=DashboardAdmin" class="text-muted"><strong>TurboCMS</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<p class="mb-0">
								{$smarty.now|date_format:"Y"} v.{$config->version} | {$manager->login|escape}
							</p>
						</div>
					</div>
				</div>
			</footer>
		</div>

	</div>
	<div class="js-fast-save justify-content-center">
		<button type="submit" class="btn btn-primary"><i class="align-middle" data-feather="check"></i> {$btr->global_apply|escape}</button>
	</div>
	<div class="modal fade" id="actionModal" tabindex="-1" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">{$btr->global_confirm|escape}</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<div class="d-grid gap-2 d-sm-block">
						<button type="button" class="btn btn-success js-submit-delete me-sm-1"><i class="align-middle" data-feather="check"></i> {$btr->global_yes|escape}</button>
						<button type="button" class="btn btn-danger js-dismiss-delete" data-bs-dismiss="modal"><i class="align-middle" data-feather="x"></i> {$btr->global_no|escape}</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	{if $product_images}
		<div class="modal fade images-modal" id="imagesModal" tabindex="-1" style="display: none;" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content"></div>
			</div>
		</div>
	{/if}

	{js id="app" priority=99 include=[
		"turbo/design/js/app.js"
	]}{/js}
	{javascript minify=true}
	
	{if $settings->lang !='en'}
		<script src="https://npmcdn.com/flatpickr/dist/l10n/{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}.js"></script>
	{/if}

	<script>
		$(function() {
			if ($('form.js-fast-button').size() > 0) {
				$('input,textarea,select, .dropdown-toggle').bind('keyup change dragover click', function() {
					$('.js-fast-save').show();
				});
				$('.js-fast-save').on('click', function() {
					$('body').find("form.js-fast-button").trigger('submit');
				});
			}
			
			/* Check */
			if ($('.js-check-all').size() > 0) {
				$(document).on('change', '.js-check-all', function() {
					if ($(this).is(":checked")) {
						$('.js-check-all-single').each(function() {
							if (!$(this).is(":checked")) {
								$(this).trigger("click");
							}
						});
					} else {
						$('.js-check-all-single').each(function() {
							if ($(this).is(":checked")) {
								$(this).trigger("click");
							}
						})
					}
				});
			}
			
			/* Delete images for products */
			if ($('.images_list').size() > 0) {
				$('.js-delete').on('click', function() {
					if ($('.js-accept-delete').size() > 0) {
						$('.js-accept-delete').val('1');
						$(this).closest("li").fadeOut(200, function() {
							$(this).remove();
						});
					} else {
						$(this).closest("li").fadeOut(200, function() {
							$(this).remove();
						});
					}
					return false;
				});
			}
			
			/* Input file */
			if ($('.input-file').size() > 0) {
				document.querySelector("html").classList.add('js-input-file');

				var fileInput = document.querySelector(".input-file"),
					button = document.querySelector(".input-file-trigger"),
					the_return = document.querySelector(".input-file-return");

				button.addEventListener("keydown", function(event) {
					if (event.keyCode == 13 || event.keyCode == 32) {
						fileInput.focus();
					}
				});
				button.addEventListener("click", function(event) {
					fileInput.focus();
					return false;
				});
				fileInput.addEventListener("change", function(event) {
					the_return.innerHTML = this.value;
				});
			}
			
			/* Initializing the scrollbar */
			if ($('.scrollbar-inner').size() > 0) {
				$('.scrollbar-inner').scrollbar();
			}
			if ($(window).width() < 1620) {
				if ($('.scrollbar-variants').size() > 0) {
					$('.scrollbar-variants').scrollbar();
				}
			}
			
			/* Initializing sorting */
			if ($(".sortable").size() > 0) {
				{literal}
					var el = document.querySelectorAll(".sortable");
					for (var i = 0; i < el.length; i++) {
						var sortable = Sortable.create(el[i], {
							handle: ".move-zone", // Drag handle selector within list items
							sort: true, // sorting inside list
							animation: 150, // ms, animation speed moving items when sorting, `0` — without animation
							ghostClass: "sortable-ghost", // Class name for the drop placeholder
							chosenClass: "sortable-chosen", // Class name for the chosen item
							dragClass: "sortable-drag", // Class name for the dragging item
							scrollSensitivity: 30, // px, how near the mouse must be to an edge to start scrolling.
							scrollSpeed: 10, // px
							// Changed sorting within list
							onUpdate: function(evt) {
								if ($(".product-images-list").size() > 0) {
									var itemEl = evt.item; // dragged HTMLElement
									if ($(itemEl).closest(".js-droplist-wrap").data("image") == "product") {
										$(".product-images-list").find("li.first-image").removeClass("first-image");
										$(".product-images-list").find("li:nth-child(2)").addClass("first-image");
									}
								}
							{/literal}{if !in_array($smarty.get.module, array("CurrencyAdmin"))}$(".js-form-list").ajaxSubmit();{/if}{literal}
							},
						});
					}
				{/literal}
			}
			
			/* Call an ajax entity update */
			if ($(".js-ajax-action").size() > 0) {
				$(document).on("click", ".js-ajax-action", function() {
					ajax_action($(this));
				});
			}
			
			if ($(".js-parent-image").size() > 0) {
				var image_wrapper = $(".js-new-image").clone(true);
				$(".js-new-image").remove();
				$(document).on("click", '.js-delete-item', function() {
					$(".js-upload-image").removeClass("d-none");
					$(".border-image-item").removeClass("border");
					$(".js-accept-delete").val(1);
					$(this).closest(".js-image-wrapper").remove()
				});
				if (window.File && window.FileReader && window.FileList) {
					$(".js-upload-image").on('dragover', function(e) {
						e.preventDefault();
						{if $settings->admin_theme == "dark"}
							$(this).css('background', '#28323f');
						{else}
							$(this).css('background', '#f8f8f8');
						{/if}
					});
					$(".js-upload-image").on('dragleave', function() {
						{if $settings->admin_theme == "dark"}
							$(this).css('background', '#28323f');
						{else}
							$(this).css('background', '#f8f8f8');
						{/if}
					}); 

					function handleFileSelect(evt) {
						var parent = $(".js-parent-image");
						var files = evt.target.files;
						for (var i = 0, f; f = files[i]; i++) {
							if (!f.type.match('image.*')) {
								continue;
							}
							var reader = new FileReader();
							reader.onload = (function(theFile) {
								return function(e) {
									clone_image = image_wrapper.clone(true);
									clone_image.find("img").attr("src", e.target.result);
									clone_image.find("img").attr("onerror", '$(this).closest(\"div\").remove()');
									clone_image.appendTo(parent);
									$(".js-upload-image").addClass("d-none");
									$(".border-image-item").addClass("border");
								};
							})(f);
							reader.readAsDataURL(f);
						}
						$(".js-upload-image").removeAttr("style");
					}
					$(document).on('change', '.dropzone-image', handleFileSelect);
				}
					}
				if ($(".js-parent-image-two").size() > 0) {
					var image_wrapper_two = $(".js-new-image-two").clone(true);
					$(".js-new-image-two").remove();
					$(document).on("click", '.js-delete-item-two', function() {
						$(".js-upload-image-two").removeClass("d-none");
						$(".border-image-item-two").removeClass("border");
						$(".js-accept-delete-two").val(1);
						$(this).closest(".js-image-wrapper-two").remove()
					});
					if (window.File && window.FileReader && window.FileList) {
						$(".js-upload-image-two").on('dragover', function(e) {
							e.preventDefault();
							{if $settings->admin_theme == "dark"}
								$(this).css('background', '#28323f');
							{else}
								$(this).css('background', '#f8f8f8');
							{/if}
						}); 
 
						$(".js-upload-image-two").on('dragleave', function() {
							{if $settings->admin_theme == "dark"} 
								$(this).css('background', '#28323f');
							{else}
								$(this).css('background', '#f8f8f8');
							{/if} 
						}); 

						function handleFileSelectTwo(evt) {
							var parent = $(".js-parent-image-two");
							var files = evt.target.files;
							for (var i = 0, f; f = files[i]; i++) { 
								if (!f.type.match('image.*')) {
									continue;
								}
								var reader = new FileReader(); 
								reader.onload = (function(theFile) {
									return function(e) {
										clone_image = image_wrapper_two.clone(true);
										clone_image.find("img").attr("src", e.target.result);
										clone_image.find("img").attr("onerror", '$(this).closest(\"div\").remove()');
										clone_image.appendTo(parent);
										$(".js-upload-image-two").addClass("d-none");
										$(".border-image-item-two").addClass("border");
									};
								})(f);
								reader.readAsDataURL(f);
							}
							$(".js-upload-image-two").removeAttr("style");
						}
						$(document).on('change', '.dropzone-image-two', handleFileSelectTwo);
					}
				}
			});
			
			if ($('.js-remove').size() > 0) {
				/* Confirm deletion */
				/*
				 * modal window function with delete confirmation
				 * takes an argument $ this - in fact, the delete button itself
				 * the function is called directly in the tpl files
				 * */
				function success_action($this) {
					$(document).on('click', '.js-submit-delete', function() {
						$('.js-form-list input[type="checkbox"][name*="check"]').attr('checked', false);
						$this.closest(".js-row").find('input[type="checkbox"][name*="check"]').prop('checked', true);
						$this.closest(".js-form-list").find('select[name="action"] option[value=delete]').prop('selected', true);
						$this.closest(".js-form-list").submit();
					});
					$(document).on('click', '.js-dismiss-delete', function() {
						$('.js-form-list input[type="checkbox"][name*="check"]').prop('checked', false);
						$this.closest(".js-form-list").find('select[name="action"] option[value=delete]').removeAttr('selected');
						return false;
					});
				}
			}
			{literal}
				if ($(".js-ajax-action").size() > 0) {
				/* Function for ajax update of fields */
				/* state - the state of the object (enabled / disabled)
				 * id - id of the updated entity
				 * module - type of entity
				 * action - updated field (field in the database)
				 * */
					function ajax_action($this) {
						var state, module, session_id, action, id;
						state = $this.hasClass('js-active-class') ? 0 : 1;
						id = parseInt($this.data('id'));
						module = $this.data('module');
						action = $this.data('action');
						session_id = '{/literal}{$smarty.session.id}{literal}';
						$.ajax({
							type: "POST",
							dataType: 'json',
							url: 'ajax/update_object.php',
							data: {
								object: module,
								id: id,
								values: {[action]: state},
								session_id: session_id
							},
							success: function(data) {
								var msg = "";
								if (data) {
									$this.toggleClass('js-active-class');
									$this.removeClass('unapproved');
									notyf.success({message: '{/literal}{$btr->global_success|escape}{literal}', dismissible: true});
									if (action == 'approved' || action == 'processed') {
										$this.closest('div').find('.js-answer_btn').show();
										$this.closest('.js-row').removeClass('unapproved');
									}
								} else {
									notyf.error({message: '{/literal}{$btr->global_error|escape}{literal}', dismissible: true});
								}
							}
						});
						return false;
					}
				}
			{/literal}
		
			/* Metadata generation functions */
			if ($('input').is('.js-meta-field')) {
				$(window).on("load", function() {
					// Autocomplete meta tags
					header_touched = true;
					meta_title_touched = true;
					meta_keywords_touched = true;
					meta_description_touched = true;
					if ($('input[name="header"]').val() == generate_header() || $('input[name="header"]').val() == '')
						header_touched = false;
					if ($('input[name="meta_title"]').val() == generate_meta_title() || $('input[name="meta_title"]').val() == '')
						meta_title_touched = false;
					if ($('input[name="meta_keywords"]').val() == generate_meta_keywords() || $('input[name="meta_keywords"]').val() == '')
						meta_keywords_touched = false;
					if ($('textarea[name="meta_description"]').val() == generate_meta_description() || $('textarea[name="meta_description"]').val() == '')
						meta_description_touched = false;
					$('input[name="header"]').change(function() { header_touched = true; });
					$('input[name="meta_title"]').change(function() { meta_title_touched = true; });
					$('input[name="meta_keywords"]').change(function() { meta_keywords_touched = true; });
					$('textarea[name="meta_description"]').change(function() { meta_description_touched = true; });

					$('#js-meta-title-counter').text('(' + $('input[name="meta_title"]').val().length + ')');
					$('#js-meta-description-counter').text('(' + $('textarea[name="meta_description"]').val().length + ')');

					$('input[name="name"]').keyup(function() { set_meta(); });
					$('input[name="author"]').keyup(function() { set_meta(); });
					$('input[name="meta_title"]').keyup(function() { $('#js-meta-title-counter').text('(' + $('input[name="meta_title"]').val().length + ')'); });
					$('textarea[name="meta_description"]').keyup(function() { $('#js-meta-description-counter').text('(' + $('textarea[name="meta_description"]').val().length + ')'); });

					if ($(".js-meta-brand").size() > 0) {
						$("select[name=brand_id]").on("change", function() {
							set_meta();
						})
					}
					if ($(".js-meta-categories").size() > 0) {
						$(".js-meta-categories").on("change", function() {
							set_meta();
						})
					}
				});

				function set_meta() {
					if (!header_touched)
						$('input[name="header"]').val(generate_header());
					if (!meta_title_touched)
						$('input[name="meta_title"]').val(generate_meta_title());
					if (!meta_keywords_touched)
						$('input[name="meta_keywords"]').val(generate_meta_keywords());
					if (!meta_description_touched)
						$('textarea[name="meta_description"]').val(generate_meta_description());
					if (!$('#block-translit').is(':checked'))
						$('input[name="url"]').val(generate_url());
				}

				function generate_header() {
					name = $('input[name="name"]').val();
					return name;
				}

				function generate_meta_title() {
					name = $('input[name="name"]').val();
					$('#js-meta-title-counter').text('(' + name.length + ')');
					return name;
				}

				function generate_meta_keywords() {
					name = $('input[name="name"]').val();
					result = name;
					if ($('input[name="author"]').size() > 0) {
						author = $('input[name="author"]').val();
						result += ', ' + author;
					}
					if ($(".js-meta-brand").size() > 0) {
						brand = $('select[name="brand_id"] option:selected').data('brand_name');
						if (typeof(brand) == 'string' && brand != '')
							result += ', ' + brand;
					}
					$('select[name="categories[]"]').each(function(index) {
						c = $(this).find('option:selected').attr('category_name');
						if (typeof(c) == 'string' && c != '')
							result += ', ' + c;
					});
					return result;
				}

				function generate_meta_description() {
					if (typeof(tinyMCE.get("js-editor")) == 'object') {
						description = tinyMCE.get("js-editor").getContent().replace(/(<([^>]+)>)/ig, " ").replace(/(\&nbsp;)/ig, " ").replace(/^\s+|\s+$/g, '').substr(0, 512);
						$('#js-meta-description-counter').text('(' + description.length + ')');
						return description;
					} else {
						return $('.js-editor-class').val().replace(/(<([^>]+)>)/ig, " ").replace(/(\&nbsp;)/ig, " ").replace(/^\s+|\s+$/g, '').substr(0, 512);
					}
				}

				function generate_url() {
					url = $('input[name="name"]').val();
					url = url.replace(/[\s]+/gi, '-');
					url = translit(url);
					url = url.replace(/[^0-9a-z_\-]+/gi, '').toLowerCase();
					return url;
				}

				function translit(str) {
					var cyr = ("А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я").split("-")
					var lat = ("A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch-'-'-Y-y-'-'-E-e-YU-yu-YA-ya").split("-")
					var res = '';
					for (var i = 0, l = str.length; i < l; i++) {
						var s = str.charAt(i),
							n = cyr.indexOf(s);
						if (n >= 0) { res += lat[n]; } else { res += s; }
					}
					return res;
				}
			}
			
			/* Metadata generation functions end */
			$(window).on('load', function() {
				// Information block folding script
				 $(document).on("click", ".card-actions", function() {
					$(this).closest(".card").find('.collapse-chevron').toggleClass('rotate-180');
					$(this).closest(".card").find(".collapse-card").slideToggle(500);
				});
				
				// Blocking link auto-generation
				$(document).on("click", ".js-disable-url", function() {
					if ($(".js-url").attr("readonly")) {
						$(".js-url").removeAttr("readonly");
					} else {
						$(".js-url").attr("readonly", true);
					}

					$(this).find('i').toggleClass("url-unlock");
					$("#block-translit").trigger("click");
				});
				
				// Blocking link auto-generation end
				if (/Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent)) {
					$('.selectpicker').selectpicker('mobile');
				}
			});
		</script>
	</body>
</html>