<!DOCTYPE html>
{* General Page *}
<html class="h-100" {if isset($language->label)}lang="{$language->label|escape}"{/if} {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}data-bs-theme="dark"{/if} {if $module == 'FAQView'}itemscope itemtype="https://schema.org/FAQPage"{/if}>

<head>
	<base href="{$config->root_url}/">

	{if $seo->seo_automation == "on"}
		<title>{($meta_title|default:$auto_meta->title)|escape}</title>
	{else}
		<title>{($auto_meta->title|default:$meta_title)|escape}</title>
	{/if}

	{* Meta Tags *}
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	{if $seo->seo_automation == "on"}
		<meta name="description" content="{($meta_description|default:$auto_meta->description)|escape}">
		<meta name="keywords" content="{($meta_keywords|default:$auto_meta->keywords)|escape}">
	{else}
		<meta name="description" content="{($auto_meta->description|default:$meta_description)|escape}">
		<meta name="keywords" content="{($auto_meta->keywords|default:$meta_keywords)|escape}">
	{/if}

	<meta name="author" content="Turbo CMS">
	<meta name="generator" content="Turbo CMS">

	{if $module=='ProductView'}
		<meta property="og:url" content="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
		<meta property="og:type" content="website">
		<meta property="og:title" content="{$product->name|escape}">
		<meta property="og:description" content='{$product->annotation|strip_tags|escape}'>
		<meta property="og:image" content="{if isset($product->image)}{$product->image->filename|resize:330:300}{/if}">
		<link rel="image_src" href="{if isset($product->image)}{$product->image->filename|resize:330:300}{/if}">
		<meta name="twitter:card" content="product">
		<meta name="twitter:url" content="{$config->root_url}{$canonical}">
		<meta name="twitter:site" content="{$settings->site_name|escape}">
		<meta name="twitter:title" content="{$product->name|escape}">
		<meta name="twitter:description" content="{$product->annotation|strip_tags|escape}">
		<meta name="twitter:image" content="{if isset($product->image)}{$product->image->filename|resize:330:300}{/if}">
		<meta name="twitter:label1" content="{$product->variant->price|convert:null:false} {$currency->code|escape}">
		<meta name="twitter:label2" content="{$settings->site_name|escape}">
	{elseif $module == 'BlogView' && isset($post)}
		<meta property="og:url" content="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
		<meta property="og:type" content="article">
		<meta property="og:title" content="{$post->name|escape}">
		{if $post->image}
			<meta property="og:image" content="{if isset($post->image)}{$post->image|resize_posts:400:300}{/if}">
			<link rel="image_src" href="{if isset($post->image)}{$post->image|resize_posts:400:300}{/if}">
		{else}
			<meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
			<meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
		{/if}
		<meta property="og:description" content='{$post->annotation|strip_tags|escape}'>
		<meta name="twitter:card" content="summary">
		<meta name="twitter:title" content="{$post->name|escape}">
		<meta name="twitter:description" content="{$post->annotation|strip_tags|escape}">
		<meta name="twitter:image" content="{if isset($post->image)}{$post->image|resize_posts:400:300}{{/if}}">
	{elseif $module=='ArticlesView' && isset($post)}
		<meta property="og:url" content="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
		<meta property="og:type" content="article">
		<meta property="og:title" content="{$post->name|escape}">
		{if $post->image}
			<meta property="og:image" content="{if isset($post->image)}{$post->image|resize_articles:400:300}{{/if}}">
			<link rel="image_src" href="{if isset($post->image)}{$post->image|resize_articles:400:300}{/if}">
		{else}
			<meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
			<meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
		{/if}
		<meta property="og:description" content='{$post->annotation|strip_tags|escape}'>
		<meta name="twitter:card" content="summary">
		<meta name="twitter:title" content="{$post->name|escape}">
		<meta name="twitter:description" content="{$post->annotation|strip_tags|escape}">
		<meta name="twitter:image" content="{if isset($post->image)}{$post->image|resize_articles:400:300}{/if}">
	{else}
		<meta property="og:title" content="{$settings->site_name|escape}">
		<meta property="og:type" content="website">
		<meta property="og:url" content="{$config->root_url}">
		<meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
		<meta property="og:site_name" content="{$settings->site_name|escape}">
		{if $seo->seo_automation == "on"}
			<meta property="og:description" content="{($meta_description|default:$auto_meta->description)|escape}">
		{else}
			<meta property="og:description" content="{($auto_meta->description|default:$meta_description)|escape}">
		{/if}
		<link rel="image_src" href="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
		<meta name="twitter:card" content="summary">
		<meta name="twitter:title" content="{$settings->site_name|escape}">
		{if $seo->seo_automation == "on"}
			<meta name="twitter:description" content="{($meta_description|default:$auto_meta->description)|escape}">
		{else}
			<meta name="twitter:description" content="{($auto_meta->description|default:$meta_description)|escape}">
		{/if}
		<meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
	{/if}

	{if $module == 'ProductsView'}
		{if $noindex_filter && !$page}
			<meta name="robots" content="noindex,nofollow">
		{elseif isset($smarty.get.page) || isset($smarty.get.sort)}
			<meta name="robots" content="noindex,follow">
		{elseif isset($smarty.get.keyword)}
			<meta name="robots" content="noindex,follow">
		{else}
			<meta name="robots" content="index,follow">
		{/if}
	{elseif $smarty.get.module == "RegisterView" || $smarty.get.module == "LoginView" || $smarty.get.module == "UserView" || $smarty.get.module == "CartView"}
		<meta name="robots" content="noindex,follow">
	{elseif $smarty.get.module == "OrderView"}
		<meta name="robots" content="noindex,nofollow">
	{elseif $smarty.get.module == "BlogView" && isset($smarty.get.sort) || isset($smarty.get.keyword)}
		<meta name="robots" content="noindex,follow">
	{elseif $smarty.get.module == "ArticlesView" && isset($smarty.get.sort) || isset($smarty.get.keyword) || isset($smarty.get.author)}
		<meta name="robots" content="noindex,follow">
	{else}
		<meta name="robots" content="index,follow">
	{/if}

	{* Canonical *}
	{if isset($canonical)}
		<link rel="canonical" href="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
	{/if}

	{* Language Attribute *}
	{foreach $languages as $lang}
		{if $lang->enabled}
			<link rel="alternate" hreflang="{if $lang@first}x-default{else}{$lang->label}{/if}" href="{$config->root_url}{if !$lang@first}/{/if}{preg_replace('/^(.+)\/$/', '$1', $lang->url)}">
		{/if}
	{/foreach}

	{* CSS *}
	{css id="main" include=[
		"design/{$settings->theme|escape}/css/bootstrap.min.css",
		"design/{$settings->theme|escape}/css/style.css",
		"design/{$settings->theme|escape}/css/fontawesome-all.min.css",
		"design/{$settings->theme|escape}/css/flag-icon.min.css",
		"design/{$settings->theme|escape}/css/jquery.fancybox.min.css",
		"design/{$settings->theme|escape}/css/products.css"
	]}{/css}
	{stylesheet minify=true}

	{if $module == 'ProductView'}
		{css id="product" include=["design/{$settings->theme|escape}/css/product.css"]}{/css}
		{stylesheet minify=true}
	{/if}

	{if $module=='CartView' || $module=='OrderView' }
		{css id="cart" include=["design/{$settings->theme|escape}/css/cart.css"]}{/css}
		{stylesheet minify=true}
	{/if}

	{* Color Theme *}
	{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
		{css id="styles" include=["design/{$settings->theme|escape}/css/style-dark.css"]}{/css}
		{stylesheet minify=true}
	{else}
		{css id="styles" include=["design/{$settings->theme|escape}/css/style-light.css"]}{/css}
		{stylesheet minify=true}
	{/if}

	{* Favicon *}
	<link rel="icon" type="image/x-icon" href="design/{$settings->theme|escape}/images/favicon.ico">
	<link rel="shortcut icon" type="image/x-icon" href="design/{$settings->theme|escape}/images/favicon.ico">
	<link rel="apple-touch-icon" sizes="180x180" href="design/{$settings->theme|escape}/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="design/{$settings->theme|escape}/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="design/{$settings->theme|escape}/images/favicon-16x16.png">
	<link rel="manifest" href="design/{$settings->theme|escape}/images/site.webmanifest">
	<link rel="mask-icon" color="#198754" href="design/{$settings->theme|escape}/images/safari-pinned-tab.svg">

	{* jQuery & Bootstrap *}
	{js id="main" priority=99 include=[
		"design/{$settings->theme|escape}/js/jquery.min.js",
		"design/{$settings->theme|escape}/js/bootstrap.bundle.min.js"
	]}{/js}
	{javascript minify=true}

	{* Custom Scripts *}
	{if isset($counters['head'])}
		{foreach $counters['head'] as $counter}
			{$counter->code}
		{/foreach}
	{/if}
</head>

<body class="d-flex flex-column h-100" itemscope itemtype="https://schema.org/WebPage">

	{* Custom Scripts *}
	{if isset($counters['body_top'])}
		{foreach $counters['body_top'] as $counter}
			{$counter->code}
		{/foreach}
	{/if}

	{* Quickview Modal *}
	<div id="quickview-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content"></div>
		</div>
	</div>

	{* Login Modal *}
	{include file='modals/login.tpl'}

	{* Fast Order Modal *}
	{include file='modals/fast_order.tpl'}

	{* Header *}
	<header>
		{if $theme_settings->header_type == "1"}
			{include file='headers/header_1.tpl'}
		{elseif $theme_settings->header_type == "2"}
			{include file='headers/header_2.tpl'}
		{/if}
	</header>

	{* Page Content *}
	<main>
		<div class="container">
			<div class="row">
				{* Sidebar *}
				{if $theme_settings->main_type != "2" || $module!='MainView'}
					{include file='sidebars/sidebar.tpl'}
				{/if}
				<div class="{if $theme_settings->main_type == "2" && $module == 'MainView'}col-lg-12{else}col-lg-9{/if} order-lg-2 order-1">
					{* Slider *}
					{include file='banners/slider.tpl'}
					{* Content *}
					{$content}
				</div>
			</div>
		</div>
	</main>

	{* Container *}
	<div class="container mt-3">
		{* Brands *}
		{if $module=='MainView'}
			{get_brands var=all_brands visible_brand=1}
			{if $all_brands}
				<div class="section-heading">
					<a href="{$lang_link}brands" class="btn btn-outline-primary float-end">
						{$lang->see_all}
						<i class="fal fa-chevron-right ms-2"></i>
					</a>
					<h2 class="my-2">{$lang->global_brands}</h2>
				</div>
				<hr class="text-black-50">
				<div class="row">
					{foreach $all_brands as $b}
						{if $b@iteration < 7}
							<div class="col-md-4 col-lg-3 col-xl-2">
								<div class="box item-logo">
									{if $b->image}
										<a data-brand="{$b->id}" href="{$lang_link}brands/{$b->url}">
											<img src="{$b->image|resize_brands:125:42}" alt="{$b->name|escape}" title="{$b->name|escape}">
										</a>
									{else}
										<a href="{$lang_link}brands/{$b->url}" class="text-decoration-none">
											<h3 data-brand="{$b->id}">{$b->name|escape}</h3>
										</a>
									{/if}
								</div>
							</div>
						{/if}
					{/foreach}
				</div>
			{/if}
		{/if}

		{* Viewed Products *}
		{get_browsed_products var=browsed_products limit=4}
		{if isset($browsed_products)}
			<h2 class="my-2">{$lang->viewed_products}</h2>
			<hr class="text-black-50">
			<div class="row">
				{foreach $browsed_products as $product}
					<div class="col-md-6 col-lg-4 col-xl-3">
						{include file='products/grid.tpl'}
					</div>
				{/foreach}
			</div>
		{/if}

		{if $module=='MainView'}
			{* Blog *}
			{get_posts var=last_posts limit=3}
			{if isset($last_posts)}
				<div class="section-heading">
					<a href="{$lang_link}blog" class="btn btn-outline-primary float-end">{$lang->see_all}<i class="fal fa-chevron-right ms-2"></i></a>
					<h2 class="section-title my-2">{$lang->global_blog}</h2>
				</div>
				<hr class="text-black-50">
				<div class="row">
					{foreach $last_posts as $post}
						<div class="col-md-6 col-lg-4 mb-3">
							<div class="card h-100">
								{if $post->image}
									<img class="card-img-top" src="{$post->image|resize_posts:750:300}" alt="{$post->name|escape}">
								{else}
									<span class="text-center mt-4">
										<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$article->name|escape}">
									</span>
								{/if}
								<div class="card-body">
									<h5 class="card-title"><a data-post="{$post->id}" class="text-decoration-none" href="{$lang_link}blog/{$post->url}">{$post->name|escape}</a></h5>
									<div class="my-1"><small class="text-muted">{$post->date|date}</small></div>
									<div class="my-1">{$post->annotation|strip_tags|truncate:150}</div>
								</div>
								<div class="card-footer">
									<a href="{$lang_link}blog/{$post->url}" class="btn btn-primary btn-sm">{$lang->more_details}<i class="fal fa-arrow-right ms-2"></i></a>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			{/if}

			{* Articles *}
			{get_articles var=last_articles limit=3}
			{if isset($last_articles)}
				<div class="section-heading">
					<a href="{$lang_link}articles" class="btn btn-outline-primary float-end">{$lang->see_all}<i class="fal fa-chevron-right ms-2"></i></a>
					<h2 class="section-title my-2">{$lang->global_articles}</h2>
				</div>
				<hr class="text-black-50">
				<div class="row">
					{foreach $last_articles as $article}
						<div class="col-md-6 col-lg-4 mb-3">
							<div class="card h-100">
								{if $article->image}
									<img class="card-img-top" src="{$article->image|resize_articles:750:300}" alt="{$article->name|escape}">
								{else}
									<span class="text-center mt-4">
										<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$article->name|escape}">
									</span>
								{/if}
								<div class="card-body">
									<h5 class="card-title"><a data-article="{$article->id}" class="text-decoration-none" href="{$lang_link}article/{$article->url}">{$article->name|escape}</a></h5>
									<div class="small text-muted">
										<i class="fal fa-calendar me-1"></i>
										<span itemprop="datePublished" class="text-muted me-1" content="{$article->date}">{$article->date|date}</span>
										{if $article->author}
											<i class="fal fa-user-edit me-1"></i>
											<a class="mr-2 text-decoration-none me-1" href="{$lang_link}articles/?author={$article->author|escape}">
												{$article->author|escape}
											</a>
										{/if}
										{if $article->category->name}
											<i class="fal fa-edit me-1"></i>
											<a href="{$lang_link}articles/{$article->category->url}" class="text-decoration-none">
												{$article->category->name}
											</a>
										{/if}
									</div>
									<div class="my-1">{$article->annotation|strip_tags|truncate:150}</div>
								</div>
								<div class="card-footer">
									<a href="{$lang_link}article/{$article->url}" class="btn btn-primary btn-sm">{$lang->more_details}<i class="fal fa-arrow-right ms-2"></i></a>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			{/if}
		{/if}
	</div>

	<div class="my-3"></div>

	{* Footer *}
	{if $theme_settings->footer_type == "1"}
		{include file="footer/footer_1.tpl"}
	{elseif $theme_settings->footer_type == "2"}
		{include file="footer/footer_2.tpl"}
	{/if}

	{* Toolbar mobile *}
	<nav class="handheld-toolbar fixed-bottom bg-body-tertiary d-block d-lg-none shadow-top">
		<div class="container-fluid text-center">
			<div class="row align-items-start py-2">
				<div class="col border-end">
					{if $theme_settings->main_type == "2" && $module == 'MainView'}
						<button type="button" class="btn btn-link" data-bs-toggle="offcanvas" data-bs-target="#navbar-default" role="button" aria-controls="navbar-default">
							<i class="fal fa-bars text-muted fs-4"></i>
						</button>
					{else}
						<button type="button" class="btn btn-link" data-bs-toggle="offcanvas" href="#sidebar" role="button" aria-controls="sidebar">
							<i class="fal fa-bars text-muted fs-4"></i>
						</button>
					{/if}
				</div>
				<div class="col border-end">
					<button type="button" class="btn btn-link">
						<a href="{$lang_link}wishlist"><i class="fal fa-heart text-muted fs-4"></i></a>
					</button>
				</div>
				<div class="col border-end">
					<button type="button" class="btn btn-link">
						<a href="{$lang_link}compare"><i class="fal fa-sync text-muted fs-4"></i></a>
					</button>
				</div>
				<div class="col">
					<div id="cart-informer-footer">
						{include file='informers/cart_informer_footer.tpl'}
					</div>
				</div>
			</div>
		</div>
	</nav>

	{* Back to Top *}
	<a href="#" id="back-to-top" title="Back to top"><i class="fal fa-angle-double-up"></i></a>

	{* Callback Modal *}
	{include file="modals/callback.tpl"}

	{* Toast Callback *}
	{include file="modals/toast_callback.tpl"}

	{* Subscribe Modal *}
	{include file="modals/subscribe.tpl"}

	{* Toast Rate *}
	{include file="modals/toast_rate.tpl"}

	{* JS *}
	{js id="main" priority=99 include=[
		"design/{$settings->theme|escape}/js/jquery.maskedinput.min.js",
		"design/{$settings->theme|escape}/js/jquery.autocomplete-min.js",
		"design/{$settings->theme|escape}/js/jquery.fancybox.min.js",
		"design/{$settings->theme|escape}/js/jquery-ui.min.js",
		"design/{$settings->theme|escape}/js/main.js"
	]}{/js}
	{javascript minify=true}

	{* Products *}
	{js id="products" priority=99 include=["design/{$settings->theme|escape}/js/products.js"]}{/js}
	{javascript minify=true}

	{if $module=='CartView'}
		{js id="cart" priority=99 include=["design/{$settings->theme|escape}/js/cart.js"]}{/js}
		{javascript minify=true}
	{/if}

	{if $module=='OrderView'}
		{js id="cart" priority=99 include=["design/{$settings->theme|escape}/js/order.js"]}{/js}
		{javascript minify=true}
	{/if}

	{* Search *}
	{js id="search" priority=99 include=["design/{$settings->theme|escape}/js/search.js"]}{/js}
	{javascript minify=true}

	{* Reviews Rating *}
	{if $module == 'ReviewsView' || $module == 'ProductView'}
		{js id="rating" priority=99 include=["design/{$settings->theme|escape}/js/rating.js"]}{/js}
		{javascript minify=true}
	{/if}

	{* Blog & Articles *}
	{if $module == 'BlogView' && isset($post) || $module=='ArticlesView' && isset($post)}
		{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
			{css id="prism" include=["design/{$settings->theme|escape}/css/prism-dark.css"]}{/css}
			{stylesheet minify=true}
		{else}
			{css id="prism" include=["design/{$settings->theme|escape}/css/prism.css"]}{/css}
			{stylesheet minify=true}
		{/if}

		{js id="prism" priority=99 include=["design/{$settings->theme|escape}/js/prism.js"]}{/js}
		{javascript minify=false}

		{css id="post" include=["design/{$settings->theme|escape}/css/post.css"]}{/css}
		{stylesheet minify=true}

		{js id="post" priority=99 include=[
			"design/{$settings->theme|escape}/js/post.js",
			"design/{$settings->theme|escape}/js/jquery.toc.js"
		]}{/js}
		{javascript minify=true}
	{/if}

	{* Description *}
	{if $module == 'BlogView' && isset($post) || $module=='ArticlesView' && isset($post) || $module=='PageView' || $module=='ProductView'}
		{css id="description" include=["design/{$settings->theme|escape}/css/owl.carousel.css"]}{/css}
		{stylesheet minify=true}

		{js id="description" priority=99 include=[
			"design/{$settings->theme|escape}/js/block.description.js",
			"design/{$settings->theme|escape}/js/owl.carousel.min.js"
		]}{/js}
		{javascript minify=true}
	{/if}

	{* Filter *}
	{if $module == 'ProductsView'}
		{css id="filter" include=["design/{$settings->theme|escape}/css/filter.css"]}{/css}
		{stylesheet minify=true}

		{css id="filter" include=["design/{$settings->theme|escape}/js/ion.rangeSlider/ion.rangeSlider.css"]}{/css}
		{stylesheet minify=true}

		{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
			{css id="filter" include=["design/{$settings->theme|escape}/js/ion.rangeSlider/ion.rangeSlider.skinTurbo.dark.css"]}{/css}
			{stylesheet minify=true}
		{else}
			{css id="filter" include=["design/{$settings->theme|escape}/js/ion.rangeSlider/ion.rangeSlider.skinTurbo.css"]}{/css}
			{stylesheet minify=true}
		{/if}

		{js id="filter" priority=99 include=[
			"design/{$settings->theme|escape}/js/ion.rangeSlider/ion.rangeSlider.min.js",
			"design/{$settings->theme|escape}/js/price-slider.js"
		]}{/js}
		{javascript minify=true}
	{/if}

	{* Product *}
	{if $module=='ProductView'}
		{js id="product" priority=99 include=[
			"design/{$settings->theme|escape}/js/product.js",
			"design/{$settings->theme|escape}/js/rating-product.js"
		]}{/js}
		{javascript minify=true}

		{* Timer Action *}
		{if !empty($product->sale_to)}
			{css id="countdown" include=["design/{$settings->theme|escape}/js/jq-timeTo/timeTo.css"]}{/css}
			{stylesheet minify=true}

			{js id="countdown" priority=99 include=["design/{$settings->theme|escape}/js/jq-timeTo/jquery.time-to.js"]}{/js}
			{javascript minify=true}

			<script>
				$('#countdown').each(function() {
					var prd = $(this).parent();
					$(this).timeTo({
						timeTo: new Date(parseInt($(this).attr('sale_to'))),
						displayDays: true,
						fontSize: 28,
						displayDays: 2,
						{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
							theme: "black",
						{/if}
						displayCaptions: true,
						lang: "{$language->label|escape}",
						callback: function() {
							prd.find('#countdown').hide();
							prd.find('#countdown-title').hide();
							real = prd.find('form.variants .offers-price-old .price-value').first().html();
							if (typeof(real) == 'undefinded' || real == null) {
								return;
							}

							prd.find('form.variants .offers-price-old').first().remove();
							prd.find('form.variants .offers-price .price-value').first().html(real);
						}
					});
				});
			</script>
		{/if}
	{/if}

	{if isset($call_sent)}
		<script>
			$(window).on("load", function() {
				$('#callbackToast').toast('show');
			});
		</script>
	{/if}

	{if isset($call_error)}
		<script>
			$(window).on("load", function() {
				$('#callbackModal').modal('show');
			});
		</script>
	{/if}

	{if isset($subscribe_success) || isset($subscribe_error)}
		<script>
			$(window).on("load", function() {
				$('#subscribe').toast('show');
			});
		</script>
	{/if}

	{if isset($fastorder_error)}
		<script>
			$(window).on("load", function() {
				$('#fastOrder').modal('show');
			});
		</script>
	{/if}

	<script>
		$(function() {
			$('[data-bs-toggle="tooltip"]').tooltip();
		});
	</script>

	{* Online Chat *}
	{if $settings->chat_viber || $settings->chat_whats_app || $settings->chat_telegram || $settings->chat_facebook}
		{css id="chat" include=["design/{$settings->theme|escape}/css/online-chat.css"]}{/css}
		{stylesheet minify=true}

		{js id="chat" priority=99 include=["design/{$settings->theme|escape}/js/online-chat.js"]}{/js}
		{javascript minify=true}

		{include file="service/online_chat.tpl"}
	{/if}

	{* Admintooltip *}
	{if isset($smarty.session.admin) && $smarty.session.admin == 'admin'}
		{$admintooltip}
	{/if}

	{* Custom Scripts *}
	{if isset($counters['body_bottom'])}
		{foreach $counters['body_bottom'] as $counter}
			{$counter->code}
		{/foreach}
	{/if}
</body>

</html>