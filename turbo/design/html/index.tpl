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

	{* CSS *}
	{if $settings->admin_theme == "dark"}
		{css id="main" include=[
			"turbo/design/css/dark-min.css",
			"turbo/design/css/turbo-dark.css",
			"turbo/design/css/media.css",
			"turbo/design/css/bootstrap-select-dark.css",
			"turbo/design/css/jquery.scrollbar.css",
			"turbo/design/css/icon-font.css"
		]}{/css}
		{stylesheet minify=true}
	{else}
		{css id="main" include=[
			"turbo/design/css/light-min.css",
			"turbo/design/css/turbo-light.css",
			"turbo/design/css/media.css",
			"turbo/design/css/bootstrap-select.css",
			"turbo/design/css/jquery.scrollbar.css",
			"turbo/design/css/icon-font.css"
		]}{/css}
		{stylesheet minify=true}
	{/if}

	{* JS *}
	{js id="libs" priority=99 include=[
		"turbo/design/js/jquery/jquery.min.js",
		"turbo/design/js/jquery/jquery.form.min.js",
		"turbo/design/js/jquery/jquery.scrollbar.min.js",
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
					<span class="sidebar-brand-text align-middle">
						<svg class="sidebar-brand-logo align-middle" xmlns="http://www.w3.org/2000/svg" width="172px" height="25.75px" viewBox="0 0 166 25.75">
							<g>
								<path d="M10,24.68a6.22,6.22,0,0,1-4.22-1.43,5.25,5.25,0,0,1-1.63-4.14V11H0V7.72H4.16V2.85h3.7V7.72H13V11H7.86v7.5c0,1.91.87,2.86,2.62,2.86a4.52,4.52,0,0,0,2.38-.61L14,23.84A9,9,0,0,1,10,24.68Zm21.22-17V24.51H27.54V22.77a5.55,5.55,0,0,1-4.64,2.08,6.12,6.12,0,0,1-4.73-1.93,7.28,7.28,0,0,1-1.78-5.16v-10h3.69V17.2a4.82,4.82,0,0,0,1,3.17,3.29,3.29,0,0,0,2.67,1.16A3.81,3.81,0,0,0,26,20.77a4.64,4.64,0,0,0,1.55-1.93V7.72Zm5,16.79V7.72h3.69V10a4.32,4.32,0,0,1,1.68-1.71,4.88,4.88,0,0,1,2.55-.71,7.1,7.1,0,0,1,1.72.21l-.54,3.59a4,4,0,0,0-1.45-.2,4.46,4.46,0,0,0-2.3.67,4.07,4.07,0,0,0-1.66,1.91V24.51Zm21.09.34a6.44,6.44,0,0,1-4.91-1.92v1.58H48.69V0h3.69V9.27a6.47,6.47,0,0,1,4.91-1.88,7.85,7.85,0,0,1,6,2.55,8.74,8.74,0,0,1,2.37,6.18,8.74,8.74,0,0,1-2.37,6.18,7.85,7.85,0,0,1-6,2.55Zm-.41-3.36a4.62,4.62,0,0,0,3.6-1.56,5.47,5.47,0,0,0,1.41-3.81,5.47,5.47,0,0,0-1.41-3.81,4.67,4.67,0,0,0-3.6-1.57A5.2,5.2,0,0,0,52.4,13V19.1a5.13,5.13,0,0,0,4.48,2.39Zm26.45.82a9,9,0,0,1-12.53,0,8.41,8.41,0,0,1-2.53-6.19,8.8,8.8,0,0,1,17.59-.59,5.8,5.8,0,0,1,0,.59,8.43,8.43,0,0,1-2.55,6.23Zm-6.27-.89a4.71,4.71,0,0,0,3.61-1.52,5.29,5.29,0,0,0,1.43-3.78,5.29,5.29,0,0,0-1.43-3.78,4.7,4.7,0,0,0-3.61-1.53,4.76,4.76,0,0,0-3.64,1.53A5.35,5.35,0,0,0,72,16.12a5.33,5.33,0,0,0,1.43,3.78,4.75,4.75,0,0,0,3.63,1.52Zm20.19,3.43a8.69,8.69,0,0,1-6.33-2.5,8.38,8.38,0,0,1-2.54-6.23,8.38,8.38,0,0,1,2.54-6.23,8.65,8.65,0,0,1,6.33-2.5,8.86,8.86,0,0,1,4.65,1.24A8.42,8.42,0,0,1,105.07,12l-3.22,1.75A5.29,5.29,0,0,0,100,11.62a5.11,5.11,0,0,0-6.41.72,5.27,5.27,0,0,0-1.45,3.78,5.27,5.27,0,0,0,1.45,3.78,4.81,4.81,0,0,0,3.66,1.52,5,5,0,0,0,2.75-.8,5.35,5.35,0,0,0,1.85-2.15l3.22,1.74a8.31,8.31,0,0,1-3.17,3.4,9,9,0,0,1-4.65,1.24Zm32.6-.34V15.14a5.39,5.39,0,0,0-.84-3.2,2.89,2.89,0,0,0-2.52-1.16,3.71,3.71,0,0,0-2.25.72,4.44,4.44,0,0,0-1.47,1.93,6.56,6.56,0,0,1,.09,1.08v10h-3.69V15.14a5.26,5.26,0,0,0-.85-3.2,3,3,0,0,0-2.54-1.16,3.89,3.89,0,0,0-3.63,2.38V24.51h-3.69V7.72h3.69V9.3a5.33,5.33,0,0,1,4.47-1.91,5.56,5.56,0,0,1,4.83,2.48A6.42,6.42,0,0,1,127,7.39a6.05,6.05,0,0,1,4.83,2,7.56,7.56,0,0,1,1.71,5.16v10Zm13.77.34a9.08,9.08,0,0,1-4.1-.89,5.76,5.76,0,0,1-2.65-2.67l2.72-1.95A3.69,3.69,0,0,0,141.2,21a4.87,4.87,0,0,0,2.42.62,3,3,0,0,0,1.73-.47,1.47,1.47,0,0,0,.69-1.31,1.53,1.53,0,0,0-.56-1.21,6.22,6.22,0,0,0-2-.94l-1.48-.4c-3-.81-4.44-2.52-4.4-5.14a4.15,4.15,0,0,1,1.72-3.49,6.8,6.8,0,0,1,4.29-1.31,6.2,6.2,0,0,1,5.68,2.85l-2.55,2a3.88,3.88,0,0,0-3.19-1.71,2.93,2.93,0,0,0-1.58.42A1.28,1.28,0,0,0,141.3,12a1.63,1.63,0,0,0,.43,1.15,3.78,3.78,0,0,0,1.58.84l1.71.5a8.11,8.11,0,0,1,3.53,1.9,4.35,4.35,0,0,1,1.17,3.2A4.69,4.69,0,0,1,148,23.4a6.64,6.64,0,0,1-4.39,1.45Z" />
								<path class="sidebar-brand-arrow" d="M154.15,23.63l7.52-7.31L154.15,9l2.15-2.18,9.7,9.47-9.7,9.46Z" />
							</g>
						</svg>
					</span>
					<svg class="sidebar-brand-icon align-middle" xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 62.59 100">
						<path d="M0,88.65,39.72,50,0,11.52,11.35,0,62.59,50,11.35,100Z"/>
					</svg>
				</a>
				<ul class="sidebar-nav">
					{if in_array('dashboard', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('DashboardAdmin'))}active{/if}">
							<a class="sidebar-link" href="index.php?module=DashboardAdmin">
								<i class="align-middle" data-feather="sliders"></i> <span class="align-middle">{$btr->global_dashboard|escape}</span>
							</a>
						</li>
					{/if}
					{if in_array('products', $manager->permissions) || in_array('categories', $manager->permissions) || in_array('brands', $manager->permissions) || in_array('features', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ProductsAdmin','ProductAdmin','CategoriesAdmin','CategoryAdmin','BrandsAdmin','BrandAdmin','FeaturesAdmin','FeatureAdmin'))}active{/if}">
							<a data-bs-target="#catalog" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('ProductsAdmin','ProductAdmin','CategoriesAdmin','CategoryAdmin','BrandsAdmin','BrandAdmin','FeaturesAdmin','FeatureAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="grid"></i> <span class="align-middle">{$btr->global_catalog|escape}</span>
							</a>
							<ul id="catalog" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('ProductsAdmin','ProductAdmin','CategoriesAdmin','CategoryAdmin','BrandsAdmin','BrandAdmin','FeaturesAdmin','FeatureAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('products', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ProductsAdmin', 'ProductAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ProductsAdmin">{$btr->global_products|escape}</a>
									</li>
								{/if}
								{if in_array('categories', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('CategoriesAdmin','CategoryAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CategoriesAdmin">{$btr->global_categories|escape}</a>
									</li>
								{/if}
								{if in_array('brands', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('BrandsAdmin','BrandAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=BrandsAdmin">{$btr->global_brands|escape}</a>
									</li>
								{/if}
								{if in_array('features', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('FeaturesAdmin','FeatureAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=FeaturesAdmin">{$btr->global_features|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('orders', $manager->permissions) || in_array('labels', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('OrdersAdmin', 'OrderAdmin', 'OrdersLabelsAdmin', 'OrdersLabelAdmin'))}active{/if}">
							<a data-bs-target="#orders" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('OrdersAdmin', 'OrderAdmin', 'OrdersLabelsAdmin', 'OrdersLabelAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="shopping-cart"></i>
								<span class="align-middle">{$btr->global_orders|escape}</span>
								{if $new_orders_counter}<span class="sidebar-badge badge bg-primary">{$new_orders_counter}</span>{/if}
							</a>
							<ul id="orders" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('OrdersAdmin', 'OrderAdmin', 'OrdersLabelsAdmin', 'OrdersLabelAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('orders', $manager->permissions)}
									<li class="sidebar-item {if isset($status) && $status==0 || isset($order->status) && $order->status==0}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersAdmin&status=0">{$btr->global_new_order|escape}</a>
									</li>
									<li class="sidebar-item {if isset($status) && $status==1 || isset($order->status) && $order->status==1}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersAdmin&status=1">{$btr->global_accepted_order|escape}</a>
									</li>
									<li class="sidebar-item {if isset($status) && $status==2 || isset($order->status) && $order->status==2}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersAdmin&status=2">{$btr->global_closed_order|escape}</a>
									</li>
									<li class="sidebar-item {if isset($status) && $status==3 || isset($order->status) && $order->status==3}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersAdmin&status=3">{$btr->global_canceled_order|escape}</a>
									</li>
								{/if}
								{if $keyword}
									<li class="sidebar-item active">
										<a class="sidebar-link" href="{url module=OrdersAdmin keyword=$keyword id=null label=null}">{$btr->global_search|escape}</a>
									</li>
								{/if}
								{if in_array('labels', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('OrdersLabelsAdmin', 'OrdersLabelAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=OrdersLabelsAdmin">{$btr->global_labels|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('users', $manager->permissions) || in_array('groups', $manager->permissions) || in_array('coupons', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('UsersAdmin', 'UserAdmin', 'GroupsAdmin', 'GroupAdmin', 'CouponsAdmin', 'CouponAdmin'))}active{/if}">
							<a data-bs-target="#users" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('UsersAdmin', 'UserAdmin', 'GroupsAdmin', 'GroupAdmin', 'CouponsAdmin', 'CouponAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="users"></i> <span class="align-middle">{$btr->global_users|escape}</span>
							</a>
							<ul id="users" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('UsersAdmin', 'UserAdmin', 'GroupsAdmin', 'GroupAdmin', 'CouponsAdmin', 'CouponAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('users', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('UsersAdmin', 'UserAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=UsersAdmin">{$btr->global_users_list|escape}</a>
									</li>
								{/if}
								{if in_array('groups', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('GroupsAdmin','GroupAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=GroupsAdmin">{$btr->global_groups|escape}</a>
									</li>
								{/if}
								{if in_array('coupons', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('CouponsAdmin','CouponAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CouponsAdmin">{$btr->global_coupons|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('pages', $manager->permissions) || in_array('menus', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('PagesAdmin', 'PageAdmin', 'MenuAdmin', 'indexAdmin'))}active{/if}">
							<a data-bs-target="#pages" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('PagesAdmin', 'PageAdmin', 'MenuAdmin', 'indexAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="layers"></i> <span class="align-middle">{$btr->global_pages|escape}</span>
							</a>
							<ul id="pages" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('PagesAdmin', 'PageAdmin', 'MenuAdmin', 'indexAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('pages', $manager->permissions)}
									{foreach $menus as $m}
										<li class="sidebar-item {if isset($m) && isset($menu) && $m->id == $menu->id}active{/if}">
											<a class="sidebar-link" href="index.php?module=PagesAdmin&menu_id={$m->id}">{$m->name}</a>
										</li>
									{/foreach}
								{/if}
								{if in_array('menus', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('MenuAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=MenuAdmin">{$btr->menus_settings|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('blog', $manager->permissions) || in_array('articles', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('BlogAdmin', 'ArticlesCategoriesAdmin', 'ArticlesAdmin', 'ArticleAdmin', 'PostAdmin', 'ArticlesCategoryAdmin'))}active{/if}">
							<a data-bs-target="#blog" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('BlogAdmin', 'ArticlesCategoriesAdmin', 'ArticlesAdmin', 'ArticleAdmin', 'PostAdmin', 'ArticlesCategoryAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="edit-2"></i> <span class="align-middle">{$btr->global_blog|escape}</span>
							</a>
							<ul id="blog" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('BlogAdmin', 'ArticlesCategoriesAdmin', 'ArticlesAdmin', 'ArticleAdmin', 'PostAdmin', 'ArticlesCategoryAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('blog', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('BlogAdmin', 'PostAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=BlogAdmin">{$btr->blog_posts|escape}</a>
									</li>
								{/if}
								{if in_array('articles', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ArticlesCategoriesAdmin', 'ArticlesCategoryAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ArticlesCategoriesAdmin">{$btr->article_categories|escape}</a>
									</li>
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ArticlesAdmin', 'ArticleAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ArticlesAdmin">{$btr->global_articles|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('comments', $manager->permissions) || in_array('feedbacks', $manager->permissions) || in_array('callbacks', $manager->permissions) || in_array('subscribes', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('CommentsAdmin', 'CommentAdmin', 'FeedbacksAdmin', 'SubscribesAdmin', 'CallbacksAdmin'))}active{/if}">
							<a data-bs-target="#feedbacks" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('CommentsAdmin', 'CommentAdmin', 'FeedbacksAdmin', 'SubscribesAdmin', 'CallbacksAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="message-square"></i>
								<span class="align-middle">{$btr->global_feedback|escape}</span>
								{if $all_counter}<span class="sidebar-badge badge bg-secondary">{$all_counter}</span>{/if}
							</a>
							<ul id="feedbacks" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('CommentsAdmin', 'CommentAdmin', 'FeedbacksAdmin', 'SubscribesAdmin', 'CallbacksAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('comments', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('CommentsAdmin', 'CommentAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CommentsAdmin">{$btr->global_comments|escape} {if $new_comments_counter > 0}<span class="sidebar-badge badge bg-danger">{$new_comments_counter}</span>{/if}</a>
									</li>
								{/if}
								{if in_array('feedbacks', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('FeedbacksAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=FeedbacksAdmin">{$btr->global_feedback|escape} {if $new_feedbacks_counter > 0}<span class="sidebar-badge badge bg-warning">{$new_feedbacks_counter}</span>{/if}</a>
									</li>
								{/if}
								{if in_array('callbacks', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('CallbacksAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CallbacksAdmin">{$btr->global_callbacks|escape} {if $new_callbacks_counter > 0}<span class="sidebar-badge badge bg-primary">{$new_callbacks_counter}</span>{/if}</a>
									</li>
								{/if}
								{if in_array('subscribes', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('SubscribesAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SubscribesAdmin">{$btr->global_subscribes|escape} {if $new_subscribes_counter > 0}<span class="sidebar-badge badge bg-info">{$new_subscribes_counter}</span>{/if}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('faq', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('FAQsAdmin', 'FAQAdmin'))}active{/if}">
							<a data-bs-target="#faq" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('FAQsAdmin', 'FAQAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="help-circle"></i> <span class="align-middle">{$btr->global_faq|escape}</span>
							</a>
							<ul id="faq" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('FAQsAdmin', 'FAQAdmin'))}show{/if}" data-bs-parent="#sidebar">
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('FAQsAdmin', 'FAQAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=FAQsAdmin">{$btr->faq_list|escape}</a>
								</li>
							</ul>
						</li>
					{/if}
					{if in_array('import', $manager->permissions) || in_array('export', $manager->permissions) || in_array('backup', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ImportAdmin', 'ImportYmlAdmin', 'ExportAdmin', 'BackupAdmin', 'ClearAdmin'))}active{/if}">
							<a data-bs-target="#auto" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('ImportAdmin', 'ImportYmlAdmin', 'ExportAdmin', 'BackupAdmin', 'ClearAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="repeat"></i>
								<span class="align-middle">{$btr->global_automation|escape}</span>
							</a>
							<ul id="auto" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('ImportAdmin', 'ImportYmlAdmin', 'ExportAdmin', 'BackupAdmin', 'ClearAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('import', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ImportAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ImportAdmin">{$btr->global_import|escape}</a>
									</li>
								{/if}
								{if in_array('import', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ImportYmlAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ImportYmlAdmin">{$btr->global_yml_import|escape}</a>
									</li>
								{/if}
								{if in_array('export', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ExportAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ExportAdmin">{$btr->global_export|escape}</a>
									</li>
								{/if}
								{if in_array('backup', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('BackupAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=BackupAdmin">{$btr->global_backup|escape}</a>
									</li>
								{/if}
								{if in_array('backup', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ClearAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ClearAdmin">{$btr->global_clear|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('stats', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('StatsAdmin', 'ReportStatsAdmin', 'ReportStatsProdAdmin', 'CategoryStatsAdmin'))}active{/if}">
							<a data-bs-target="#stats" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('StatsAdmin', 'ReportStatsAdmin', 'ReportStatsProdAdmin', 'CategoryStatsAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="pie-chart"></i>
								<span class="align-middle">{$btr->global_stats|escape}</span>
							</a>
							<ul id="stats" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('StatsAdmin', 'ReportStatsAdmin', 'ReportStatsProdAdmin', 'CategoryStatsAdmin'))}show{/if}" data-bs-parent="#sidebar">
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('StatsAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=StatsAdmin">{$btr->stats_orders|escape}</a>
								</li>
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ReportStatsAdmin', 'ReportStatsProdAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=ReportStatsAdmin">{$btr->global_products_stat|escape}</a>
								</li>
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('CategoryStatsAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=CategoryStatsAdmin">{$btr->global_categories_stat|escape}</a>
								</li>
							</ul>
						</li>
					{/if}
					{if in_array('seo', $manager->permissions) || in_array('scripts', $manager->permissions) || in_array('robots', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('SeoAdmin', 'SettingsCounterAdmin', 'RobotsAdmin'))}active{/if}">
							<a data-bs-target="#seo" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('SeoAdmin', 'SettingsCounterAdmin', 'RobotsAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="target"></i>
								<span class="align-middle">{$btr->global_seo|escape}</span>
							</a>
							<ul id="seo" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('SeoAdmin', 'SettingsCounterAdmin', 'RobotsAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('seo', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('SeoAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SeoAdmin">{$btr->seo_automation|escape}</a>
									</li>
								{/if}
								{if in_array('scripts', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('SettingsCounterAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SettingsCounterAdmin">{$btr->global_scripts|escape}</a>
									</li>
								{/if}
								{if in_array('robots', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('RobotsAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=RobotsAdmin">Robots.txt</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('design', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ThemeAdmin', 'TemplatesAdmin', 'StylesAdmin', 'ScriptsAdmin', 'ImagesAdmin', 'TranslationsAdmin', 'TranslationAdmin'))}active{/if}">
							<a data-bs-target="#design" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('ThemeAdmin', 'TemplatesAdmin', 'StylesAdmin', 'ScriptsAdmin', 'ImagesAdmin', 'TranslationsAdmin', 'TranslationAdmin', 'ThemeSettingsAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="layout"></i>
								<span class="align-middle">{$btr->global_design|escape}</span>
							</a>
							<ul id="design" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('ThemeAdmin', 'TemplatesAdmin', 'StylesAdmin', 'ScriptsAdmin', 'ImagesAdmin', 'TranslationsAdmin', 'TranslationAdmin', 'ThemeSettingsAdmin'))}show{/if}" data-bs-parent="#sidebar">
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ThemeAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=ThemeAdmin">{$btr->global_templates|escape}</a>
								</li>
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('TemplatesAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=TemplatesAdmin">{$btr->global_template_files|escape}</a>
								</li>
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('StylesAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=StylesAdmin">{$btr->global_template_style|escape}</a>
								</li>
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ScriptsAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=ScriptsAdmin">{$btr->global_template_script|escape}</a>
								</li>
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ImagesAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=ImagesAdmin">{$btr->global_template_images|escape}</a>
								</li>
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('TranslationsAdmin', 'TranslationAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=TranslationsAdmin">{$btr->global_translations|escape}</a>
								</li>
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ThemeSettingsAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=ThemeSettingsAdmin">{$btr->global_theme_settings|escape}</a>
								</li>
							</ul>
						</li>
					{/if}
					{if in_array('banners', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('BannersAdmin', 'BannerAdmin', 'BannersImagesAdmin', 'BannersImageAdmin'))}active{/if}">
							<a data-bs-target="#banners" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('BannersAdmin', 'BannerAdmin', 'BannersImagesAdmin', 'BannersImageAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="image"></i>
								<span class="align-middle">{$btr->global_banners|escape}</span>
							</a>
							<ul id="banners" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('BannersAdmin', 'BannerAdmin', 'BannersImagesAdmin', 'BannersImageAdmin'))}show{/if}" data-bs-parent="#sidebar">
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('BannersAdmin', 'BannerAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=BannersAdmin">{$btr->banners_groups|escape}</a>
								</li>
								<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('BannersImagesAdmin', 'BannersImageAdmin'))}active{/if}">
									<a class="sidebar-link" href="index.php?module=BannersImagesAdmin">{$btr->global_banners_images|escape}</a>
								</li>
							</ul>
						</li>
					{/if}
					{if in_array('settings', $manager->permissions) || in_array('currency', $manager->permissions) || in_array('delivery', $manager->permissions) || in_array('payment', $manager->permissions) || in_array('managers', $manager->permissions) || in_array('languages', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('SettingsAdmin', 'CurrencyAdmin', 'DeliveriesAdmin', 'DeliveryAdmin', 'PaymentMethodsAdmin', 'PaymentMethodAdmin', 'ManagersAdmin', 'ManagerAdmin', 'SettingsFeedAdmin', 'LanguagesAdmin', 'LanguageAdmin', 'SystemAdmin'))}active{/if}">
							<a data-bs-target="#settings" data-bs-toggle="collapse" {if isset($smarty.get.module) && in_array($smarty.get.module, array('SettingsAdmin', 'CurrencyAdmin', 'DeliveriesAdmin', 'DeliveryAdmin', 'PaymentMethodsAdmin', 'PaymentMethodAdmin', 'ManagersAdmin', 'ManagerAdmin', 'SettingsFeedAdmin', 'LanguagesAdmin', 'LanguageAdmin', 'SystemAdmin'))}class="sidebar-link" aria-expanded="true" {else}class="sidebar-link collapsed" aria-expanded="false"{/if}>
								<i class="align-middle" data-feather="settings"></i>
								<span class="align-middle">{$btr->global_settings|escape}</span>
							</a>
							<ul id="settings" class="sidebar-dropdown list-unstyled collapse {if isset($smarty.get.module) && in_array($smarty.get.module, array('SettingsAdmin', 'CurrencyAdmin', 'DeliveriesAdmin', 'DeliveryAdmin', 'PaymentMethodsAdmin', 'PaymentMethodAdmin', 'ManagersAdmin', 'ManagerAdmin', 'SettingsFeedAdmin', 'LanguagesAdmin', 'LanguageAdmin', 'SystemAdmin'))}show{/if}" data-bs-parent="#sidebar">
								{if in_array('settings', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('SettingsAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SettingsAdmin">{$btr->global_settings_site|escape}</a>
									</li>
								{/if}
								{if in_array('settings', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('SettingsFeedAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SettingsFeedAdmin">{$btr->global_setting_feed|escape}</a>
									</li>
								{/if}
								{if in_array('currency', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('CurrencyAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=CurrencyAdmin">{$btr->global_currency|escape}</a>
									</li>
								{/if}
								{if in_array('delivery', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('DeliveriesAdmin', 'DeliveryAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=DeliveriesAdmin">{$btr->global_shipping|escape}</a>
									</li>
								{/if}
								{if in_array('payment', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('PaymentMethodsAdmin', 'PaymentMethodAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=PaymentMethodsAdmin">{$btr->global_payment|escape}</a>
									</li>
								{/if}
								{if in_array('managers', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('ManagersAdmin', 'ManagerAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=ManagersAdmin">{$btr->global_managers|escape}</a>
									</li>
								{/if}
								{if in_array('languages', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('LanguagesAdmin', 'LanguageAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=LanguagesAdmin">{$btr->global_languages|escape}</a>
									</li>
								{/if}
								{if in_array('settings', $manager->permissions)}
									<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('SystemAdmin'))}active{/if}">
										<a class="sidebar-link" href="index.php?module=SystemAdmin">{$btr->global_system|escape}</a>
									</li>
								{/if}
							</ul>
						</li>
					{/if}
					{if in_array('feeds', $manager->permissions)}
						<li class="sidebar-item {if isset($smarty.get.module) && in_array($smarty.get.module, array('FeedsAdmin'))}active{/if}">
							<a class="sidebar-link" href="index.php?module=FeedsAdmin">
								<i class="align-middle" data-feather="rss"></i> <span class="align-middle">{$btr->global_feeds|escape}</span>
							</a>
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
										{$btr->new_notifications|escape} ({$all_counter})
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
														<div class="col-1">
															<i class="text-success mt-n1" data-feather="shopping-cart"></i>
														</div>
														<div class="col-9">
															<div class="text-dark ms-1">{$btr->global_orders|escape}</div>
														</div>
														<div class="col-2 text-end">
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
														<div class="col-1">
															<i class="text-danger mt-n1" data-feather="message-square"></i>
														</div>
														<div class="col-9">
															<div class="text-dark ms-1">{$btr->global_comments|escape}</div>
														</div>
														<div class="col-2 text-end">
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
														<div class="col-1">
															<i class="text-warning mt-n1" data-feather="mail"></i>
														</div>
														<div class="col-9">
															<div class="text-dark ms-1">{$btr->global_feedback|escape}</div>
														</div>
														<div class="col-2 text-end">
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
														<div class="col-1">
															<i class="text-info mt-n1" data-feather="at-sign"></i>
														</div>
														<div class="col-9">
															<div class="text-dark ms-1">{$btr->global_subscribes|escape}</div>
														</div>
														<div class="col-2 text-end">
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
														<div class="col-1">
															<i class="text-primary mt-n1" data-feather="phone"></i>
														</div>
														<div class="col-9">
															<div class="text-dark ms-1">{$btr->global_callback|escape}</div>
														</div>
														<div class="col-2 text-end">
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
								<a href="index.php?module=DashboardAdmin" class="text-muted">&copy; {$smarty.now|date_format:"Y"} <strong>TurboCMS</strong></a>
							</p>
						</div>
						<div class="col-6 text-end">
							<p class="mb-0">
								TurboShop v.{$config->version} | {$manager->login|escape}
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

	{* App *}
	{js id="app" priority=99 include=["turbo/design/js/app.js"]}{/js}
	{javascript minify=true}
	
	{* Flatpickr Lang *}
	{if $settings->lang !='en'}
		<script src="https://npmcdn.com/flatpickr/dist/l10n/{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}.js"></script>
	{/if}

	<script>
		$(function() {
			if ($('.translate-button').length > 0) {
				$(document).ready(function() {
					var targetLang = '{if $lang_label == 'ua'}uk{else}{$lang_label}{/if}';

					$('.translate-button').on('click', function() {
						var inputElement = $(this).closest('.translate-container').find('.translate-input');
						var text = inputElement.val();

						if (text.trim() !== '') {
							$.post('ajax/translate.php', {
								'source_lang': 'auto',
								'target_lang': targetLang,
								'text': text
							}, function(data) {
								inputElement.val(data);
								{if isset($smarty.get.module) && !in_array($smarty.get.module, array('FeatureAdmin','FAQAdmin','DeliveryAdmin','PaymentMethodAdmin'))}
									set_meta();
								{/if}
							});
						}
					});
				});
			}

			if ($('form.js-fast-button').length > 0) {
				$('input,textarea,select, .dropdown-toggle').bind('keyup change dragover click', function() {
					$('.js-fast-save').show();
				});
				$(document).on('click', '.translate-button', function() {
					$('.js-fast-save').show();
				});
				$('.js-fast-save').on('click', function() {
					$('body').find("form.js-fast-button").trigger('submit');
				});
			}
			
			if ($('.js-check-all').length > 0) {
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
			
			if ($('.input-file').length > 0) {
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
			
			if ($('.scrollbar-inner').length > 0) {
				$('.scrollbar-inner').scrollbar();
			}

			if ($(window).width() < 1620) {
				if ($('.scrollbar-variants').length > 0) {
					$('.scrollbar-variants').scrollbar();
				}
			}
			
			if ($(".sortable").length > 0) {
				{literal}
					var el = document.querySelectorAll(".sortable");
					for (var i = 0; i < el.length; i++) {
						var sortable = Sortable.create(el[i], {
							handle: ".move-zone",
							sort: true,
							animation: 150,
							ghostClass: "sortable-ghost",
							chosenClass: "sortable-chosen",
							dragClass: "sortable-drag",
							scrollSensitivity: 30,
							scrollSpeed: 10,
							onUpdate: function(evt) {
								if ($(".product-images-list").length > 0) {
									var itemEl = evt.item;
									if ($(itemEl).closest(".js-droplist-wrap").data("image") == "product") {
										$(".product-images-list").find("li.first-image").removeClass("first-image");
										$(".product-images-list").find("li:nth-child(2)").addClass("first-image");
									}
								}
								if ($(".js-form-list").length > 0) {
									$(".js-form-list").ajaxSubmit();
									notyf.success({message: "{/literal}{$btr->global_success|escape}{literal}", dismissible: true});
								}
							},
						});
					}
				{/literal}
			}
			
			if ($(".js-ajax-action").length > 0) {
				$(document).on("click", ".js-ajax-action", function() {
					ajax_action($(this));
				});
			}
			
			if ($(".js-parent-image").length > 0) {
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
				if ($(".js-parent-image-two").length > 0) {
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
			
			if ($('.js-remove').length > 0) {
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
				if ($(".js-ajax-action").length > 0) {
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
		
			if ($('input').is('.js-meta-field')) {
				$(window).on("load", function() {
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

					if ($(".js-meta-brand").length > 0) {
						$("select[name=brand_id]").on("change", function() {
							set_meta();
						})
					}
					
					if ($(".js-meta-categories").length > 0) {
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
					if ($('input[name="author"]').length > 0) {
						author = $('input[name="author"]').val();
						if (typeof(author) == 'string' && author != '')
							result += ', ' + author;
					}
					if ($(".js-meta-brand").length > 0) {
						brand = $('select[name="brand_id"] option:selected').data('brand-name');
						if (typeof(brand) == 'string' && brand != '')
							result += ', ' + brand;
					}
					$('select[name="categories[]"]').each(function(index) {
						c = $(this).find('option:selected').attr('category-name');
						if (typeof(c) == 'string' && c != '')
							result += ', ' + c;
					});
					$('select[name="category_id"]').each(function(index) {
						c = $(this).find('option:selected').attr('category-name');
						if (typeof(c) == 'string' && c != '')
							result += ', ' + c;
					});
					return result;
				}

				$(document).ready(function() {
					if (typeof tinyMCE !== 'undefined') {
						tinyMCE.init({
							selector: '#js-editor',
							setup: function(editor) {
								editor.on('init', function() {
									generate_meta_description();
								});
							}
						});
					}
				});

				function generate_meta_description() {
					var editor = tinyMCE.get("js-editor");
					if (editor) {
						var description = editor.getContent().replace(/(<([^>]+)>)/ig, " ").replace(/(\&nbsp;)/ig, " ").replace(/^\s+|\s+$/g, '').substr(0, 512);
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
			
			$(window).on('load', function() {
				 $(document).on('click', '.card-actions', function() {
					$(this).closest('.card').find('.collapse-chevron').toggleClass('rotate-180');
					$(this).closest('.card').find('.collapse-card').slideToggle(500);
				});
				
				$(document).on('click', '.js-disable-url', function() {
					if ($('.js-url').attr('readonly')) {
						$('.js-url').removeAttr('readonly');
					} else {
						$('.js-url').attr('readonly', true);
					}

					$(this).find('i').toggleClass('url-unlock');
					$('#block-translit').trigger('click');
				});
				
				if (/Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent)) {
					$('.selectpicker').selectpicker('mobile');
				}
			});

			(function toggleFullscreen() {
				document.querySelectorAll(".js-fullscreen").forEach((e) => {
					e.addEventListener("click", () => {
						if (document.fullscreenElement) {
							document.exitFullscreen();
						} else {
							document.body.requestFullscreen();
						}
					});
				});
			})();
		</script>
	</body>
</html>