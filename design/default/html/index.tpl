<!DOCTYPE html>
{* General Page *}
<html class="h-100" {if $language->label}lang="{$language->label|escape}"{/if} {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}data-bs-theme="dark"{/if} {if $module == 'FAQView'}itemscope itemtype="https://schema.org/FAQPage"{/if}>

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
		{* Twitter *}
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
		{* Twitter *}
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
		{*twitter*}
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
		{* Twitter *}
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
	{elseif $smarty.get.module == "ArticlesView" && isset($smarty.get.sort) || isset($smarty.get.keyword)}
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

	{* Styles *}
	{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
		{css id="styles" include=[
			"design/{$settings->theme|escape}/css/style-dark.css"
		]}{/css}
		{stylesheet minify=true}
	{else}
		{css id="styles" include=[
			"design/{$settings->theme|escape}/css/style-light.css"
		]}{/css}
		{stylesheet minify=true}
	{/if}

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
		{css id="product" include=[
			"design/{$settings->theme|escape}/css/product.css"
		]}{/css}
		{stylesheet minify=true}
	{/if}

	{if $module=='CartView' || $module=='OrderView' }
		{css id="cart" include=[
			"design/{$settings->theme|escape}/css/cart.css"
		]}{/css}
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

	<!-- Quickview Modal -->
	<div id="quickview-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content"></div>
		</div>
	</div>

	<!-- Fast Order Modal -->
	<div class="modal fade" id="FastOrder" tabindex="-1" role="dialog" aria-labelledby="ModalFastOrder" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ModalFastOrder">{$lang->fast_order}</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form class="form fast_order_form" method="post">
					<input type="hidden" class="fast-order-inputarea" name="variant_id" id="fast-order-product-id" value="">
					<input type="hidden" name="IsFastOrder" value="true">
					<div class="modal-body">
						{if isset($fastorder_error)}
							<div class="alert alert-danger" role="alert">
								{if $fastorder_error == 'empty_name'}
									{$lang->enter_your_name}
								{elseif $fastorder_error == 'empty_phone'}
									{$lang->enter_phone_number}
								{elseif $fastorder_error == 'captcha'}
									{$lang->captcha_incorrect}
								{else}
									{$fastorder_error}
								{/if}
							</div>
						{/if}
						<p id="fast-order-product-name" class="modal-caption"></p>
						<div class="form-group has-feedback">
							<div class="input-group mb-3">
								<div class="input-group-text"><i class="fv-icon-no-has fal fa-user"></i></div>
								<input type="text" class="form-control" name="name" value="{if isset($user->name)}{$user->name|escape}{elseif isset($name)}{$name|escape}{/if}" placeholder="{$lang->name}" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-text"><i class="fv-icon-no-has fal fa-phone-alt"></i></div>
								<input type="text" class="form-control" name="phone" id="fastorder-mask" value="{if isset($user->phone)}{$user->phone|escape}{elseif isset($phone)}{$phone|escape}{/if}" placeholder="{$lang->phone}" maxlength="255" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-text"><i class="fv-icon-no-has fal fa-at"></i></div>
								<input type="text" class="form-control" name="email" value="{if isset($user->email)}{$user->email|escape}{elseif isset($email)}{$email|escape}{/if}" placeholder="Email" maxlength="255" required>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-text"><i class="fv-icon-no-has fal fa-map-marker-alt"></i></div>
								<input type="text" class="form-control" name="address" value="{if isset($user->address)}{$user->address|escape}{elseif isset($address)}{$address|escape}{/if}" placeholder="{$lang->address}" maxlength="255">
							</div>
						</div>
						{if $settings->captcha_fastorder}
							<div class="row">
								<div class="form-group col-sm-6 pb-3">
									{get_captcha var="captcha_fastorder"}
									<div class="secret-number">{$captcha_fastorder[0]|escape} + ? = {$captcha_fastorder[1]|escape}</div>
								</div>
								<div class="form-group col-sm-6">
									<input type="text" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha}" autocomplete="off" required>
								</div>
							</div>
						{/if}
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success mx-auto" name="checkout" value="{$lang->send}">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Header -->
	<header>
		<!-- Navigation -->
		<nav itemscope itemtype="https://schema.org/SiteNavigationElement" class="navbar navbar-expand-lg {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}navbar-dark bg-body-tertiary{else}navbar-light bg-light{/if} fixed-top">
			<div class="container">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Menu">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarMenu">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						{foreach $pages as $p}
							{if $p->menu_id == 1}
								{if $p->visible}
									<li itemprop="name" class="nav-item dropdown {if $page && $page->id == $p->id}active{/if}">
										<a itemprop="url" class="nav-link {if isset($p->subpages)}dropdown-toggle{/if}" href="{$lang_link}{$p->url}" id="dropdown{$p->id}" data-page="{$p->id}" {if isset($p->subpages)}data-bs-toggle="dropdown" aria-expanded="false"{/if} aria-haspopup="true">{$p->header}</a>
										{if isset($p->subpages)}
											<div class="dropdown-menu" aria-labelledby="dropdown{$p->id}">
												{foreach $p->subpages as $p2}
													<a itemprop="url" data-page="{$p2->id}" class="dropdown-item" href="{$lang_link}{$p2->url}">{$p2->header}</a>
												{/foreach}
											</div>
										{/if}
									</li>
								{/if}
							{/if}
						{/foreach}
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="nav-link">
							<div class="form-check form-switch">
								{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
									<input type="checkbox" onclick="document.cookie='mode=;path=/';document.location.reload();" class="form-check-input" id="darkSwitch">
									<label class="custom-control-label" for="darkSwitch"><i class="fal fa-moon"></i></label>
								{else}
									<input type="checkbox" onclick="document.cookie='mode=mode;path=/';document.location.reload();" class="form-check-input" id="darkSwitch" checked>
									<label class="custom-control-label" for="darkSwitch"><i class="fal fa-sun"></i></label>
								{/if}
							</div>
						</li>
						{* Languages *}
						{if $languages|count> 1}
							{$cnt = 0}
							{foreach $languages as $ln}
								{if $ln->enabled}
									{$cnt = $cnt+1}
								{/if}
							{/foreach}
							{if $cnt>1}
								<li class="nav-item dropdown">
									{foreach $languages as $l}
										{if $language->id == $l->id}
											<a class="nav-link dropdown-toggle" href="{$lang_link}" id="dropdownLang" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="flag-icon flag-icon-{$l->label}"></span> {$l->label|upper}</a>
										{/if}
									{/foreach}
									<div class="dropdown-menu" aria-labelledby="dropdownLang">
										{foreach $languages as $l}
											{if $l->enabled}
												<a href="{$l->url}" class="dropdown-item {if $language->id == $l->id}active{/if}"><span class="flag-icon flag-icon-{$l->label}"></span> {$l->name}</a>
											{/if}
										{/foreach}
									</div>
								</li>
							{/if}
						{/if}
						<li class="nav-link">
							<span id="wishlist_informer">
								{include file='wishlist_informer.tpl'}
							</span>
						</li>
						<li class="nav-link">
							<span id="compare_informer">
								{include file='compare_informer.tpl'}
							</span>
						</li>
						{if $user}
							<li class="nav-item"><a class="nav-link text-decoration-none" href="{$lang_link}user"><i class="fal fa-user"></i> {$user->name}</a></li>
							<li class="nav-item"><a class="nav-link text-decoration-none" href="{$lang_link}user/logout"><i class="fal fa-sign-out"></i> {$lang->logout}</a></li>
						{else}
							<li class="nav-item"><a class="nav-link text-decoration-none" href="{$lang_link}user/login"><i class="fal fa-sign-in"></i> {$lang->login}</a></li>
							<li class="nav-item"><a class="nav-link text-decoration-none" href="{$lang_link}user/register"><i class="fal fa-user-plus"></i> {$lang->registration}</a></li>
						{/if}
					</ul>
				</div>
				<!-- Cart -->
				<div id="cart_informer">
					{include file='cart_informer.tpl'}
				</div>
			</div>
		</nav>
		<!-- Logo Header -->
		<div class="container">
			<div class="row">
				<!-- Logo -->
				<div class="col-lg-6 mt-2">
					<h1 class="mt-4">
						{if $module=='MainView'}
							<i class="fal fa-shopping-bag text-success"></i> TurboShop
						{else}
							<a class="{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}text-white{else}text-dark{/if} card-link text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><i class="fal fa-shopping-bag text-success"></i> TurboShop</a>
						{/if}
					</h1>
				</div>
				<!-- Header Contacts -->
				<div class="col-lg-6 mt-2">
					<p class="text-end">{$lang->phone_number}<br>
						{$lang->contact_details}
					<div class="callback float-end">
						<a class="btn btn-success btn-sm" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#CallbackModal" role="button"><i class="fal fa-phone-alt"></i> <span>{$lang->callback}</span></a>
					</div>
					</p>
				</div>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<main>
		<div class="container">
			<div class="row">
				<!-- Sidebar -->
				{include file='sidebar.tpl'}
				<!-- /.col-lg-3 -->
				<div class="col-lg-9 order-lg-2 order-1">
					<!-- Sidebar Button -->
					<nav class="navbar navbar-expand-lg navbar-dark bg-primary d-lg-none mt-4 rounded">
						<div class="container-fluid">
							<a class="navbar-brand" href="#">{$lang->catalog}</a>
							<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#sidebar">
								<span class="navbar-toggler-icon"></span>
							</button>
						</div>
					</nav>
					{* Slider *}
					{include file='slider.tpl'}
					<!-- Content -->
					{$content}
				</div>
				<!-- /.col-lg-9 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</main>
	<!-- /.main -->

	<!-- Container -->
	<div class="container mt-5">
		{* Brands *}
		{if $module=='MainView'}
			{get_brands var=all_brands visible_brand=1}
			{if $all_brands}
				<div class="section-heading">
					<a href="{$lang_link}brands" class="btn btn-outline-primary float-end">{$lang->see_all}</a>
					<h2 class="section-title my-2">{$lang->global_brands}</h2>
				</div>
				<hr class="text-black-50">
				<div class="row">
					{foreach $all_brands as $b}
						{if $b@iteration < 7}
							<div class="col-md-4 col-lg-3 col-xl-2">
								<div class="box item-logo">
									{if $b->image}
										<a href="{$lang_link}brands/{$b->url}"><img src="{$b->image|resize_brands:125:42}" alt="{$b->name|escape}" title="{$b->name|escape}"></a>
									{else}
										<a href="{$lang_link}brands/{$b->url}" class="text-decoration-none">
											<h3>{$b->name|escape}</h3>
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
						{include file='grid.tpl'}
					</div>
				{/foreach}
			</div>
		{/if}

		{if $module=='MainView'}
			{* Blog *}
			{get_posts var=last_posts limit=3}
			{if isset($last_posts)}
				<div class="section-heading">
					<a href="{$lang_link}blog" class="btn btn-outline-primary float-end">{$lang->see_all}</a>
					<h2 class="section-title my-2">{$lang->global_blog}</h2>
				</div>
				<hr class="text-black-50">
				<div class="row">
					{foreach $last_posts as $post}
						<div class="col-md-6 col-lg-4 mb-5">
							<div class="card h-100">
								{if $post->image}
									<img class="card-img-top" src="{$post->image|resize_posts:750:300}" alt="{$post->name|escape}">
								{else}
									<span class="text-center mt-4">
										<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$article->name|escape}">
									</span>
								{/if}
								<div class="card-body">
									<h5><a data-post="{$post->id}" class="card-title text-decoration-none" href="{$lang_link}blog/{$post->url}">{$post->name|escape}</a></h5>
									<p class="card-text"><small class="text-muted">{$post->date|date}</small></p>
									<p class="card-text">{$post->annotation|strip_tags|truncate:150}</p>
								</div>
								<div class="card-footer">
									<a href="{$lang_link}blog/{$post->url}" class="btn btn-primary btn-sm">{$lang->more_details}</a>
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
					<a href="{$lang_link}articles" class="btn btn-outline-primary float-end">{$lang->see_all}</a>
					<h2 class="section-title my-2">{$lang->global_articles}</h2>
				</div>
				<hr class="text-black-50">
				<div class="row">
					{foreach $last_articles as $article}
						<div class="col-md-6 col-lg-4 mb-5">
							<div class="card h-100">
								{if $article->image}
									<img class="card-img-top" src="{$article->image|resize_articles:750:300}" alt="{$article->name|escape}">
								{else}
									<span class="text-center mt-4">
										<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$article->name|escape}">
									</span>
								{/if}
								<div class="card-body">
									<h5><a data-article="{$article->id}" class="card-title text-decoration-none" href="{$lang_link}article/{$article->url}">{$article->name|escape}</a></h5>
									<p class="card-text"><small class="text-muted">{$article->date|date}</small></p>
									<p class="card-text">{$article->annotation|strip_tags|truncate:150}</p>
								</div>
								<div class="card-footer">
									<a href="{$lang_link}article/{$article->url}" class="btn btn-primary btn-sm">{$lang->more_details}</a>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			{/if}
		{/if}
	</div>

	<!-- Subscribe -->
	<div class="container-fluid bg-dark mt-auto">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<form class="form-group my-5" id="FormValidation" method="post" novalidate>
					{if isset($subscribe_error)}
						<label class="error text-danger">
							{if $subscribe_error == 'email_exist'}
								{$lang->you_are_already_subscribed}
							{/if}
							{if $subscribe_error == 'empty_email'}
								{$lang->enter_your_email}
							{/if}
						</label>
					{/if}
					{if isset($subscribe_success)}
						<label class="success text-success">
							{$lang->you_have_been_successfully_subscribed}
						</label>
					{/if}
					<div class="input-group mb-2">
						<input type="email" class="form-control {if isset($subscribe_error)}border-danger{/if} {if isset($subscribe_success)}border-success{/if}" name="subscribe_email" value="" placeholder="{$lang->enter_your_email}" size="20" required>
						<button type="submit" class="btn btn-warning" name="subscribe" id="btnValidation" value="{$lang->subscribe_to}"><i class="fa fa-envelope"></i></button>
					</div>
				</form>
			</div>
			<hr class="text-black-50">
		</div>
	</div>

	<!-- Footer -->
	<footer itemscope itemtype="https://schema.org/WPFooter" class="page-footer font-small bg-dark text-white">
		<div class="container text-center text-md-start">
			<div class="row text-center text-md-start">
				<!-- Footer Description -->
				<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
					<h6 class="text-uppercase mb-4 font-weight-bold">{$settings->company_name|escape}</h6>
					<p>{$lang->main_description}</p>
				</div>
				<hr class="text-black-50 w-100 clearfix d-md-none">
				<!-- Footer Links -->
				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
					<h6 class="text-uppercase mb-4 font-weight-bold">{$lang->about_shop}</h6>
					{foreach $pages as $p}
						{if $p->menu_id == 1}
							<p {if $page && $page->id == $p->id}class="selected" {/if}>
								<a data-page="{$p->id}" class="text-decoration-none" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
							</p>
						{/if}
					{/foreach}
				</div>
				<hr class="text-black-50 w-100 clearfix d-md-none">
				<!-- Footer Links -->
				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
					<h6 class="text-uppercase mb-4 font-weight-bold">{$lang->information}</h6>
					{foreach $pages as $p}
						{if $p->menu_id == 3}
							<p {if $page && $page->id == $p->id}class="selected" {/if}>
								<a data-page="{$p->id}" class="text-decoration-none" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
							</p>
						{/if}
					{/foreach}
				</div>
				<hr class="text-black-50 w-100 clearfix d-md-none">
				<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
					<!-- Footer Contacts -->
					<h6 class="text-uppercase mb-4 font-weight-bold">{$lang->contacts}</h6>
					<p><i class="fal fa-map-marker-alt text-white-50 me-2"></i>{$lang->contact_details}</p>
					<p><i class="fal fa-envelope text-white-50 me-2"></i> info@gmail.com</p>
					<p><i class="fal fa-phone-alt text-white-50 me-2"></i> (123) 456-78-90</p>
					<p><i class="fal fa-print text-white-50 me-2"></i> (987) 654-32-10</p>
					<!-- Footer Payment -->
					<p class="text-white-50">
						<i class="fab fa-lg fa-cc-visa"></i>
						<i class="fab fa-lg fa-cc-mastercard"></i>
						<i class="fab fa-lg fa-cc-paypal"></i>
						<i class="fab fa-lg fa-cc-stripe"></i>
						<i class="fab fa-lg fa-cc-apple-pay"></i>
					</p>
				</div>
			</div>
			<hr class="text-black-50">
			<div class="row d-flex align-items-center">
				<div class="col-md-4 col-lg-4">
					<!-- Copyright -->
					<p class="text-center text-md-start text-white-50">© <span itemprop="copyrightYear">{$smarty.now|date_format:"Y"}</span> <strong>TurboCMS</strong></p>
				</div>
				<!-- Made -->
				<div class="col-md-4 col-lg-4">
					<p class="text-center text-md-center text-white-50"><i class="flag-icon flag-icon-ua"></i>
						<strong>Made in Ukraine</strong>
					</p>
				</div>
				<div class="col-md-4 col-lg-4 ml-lg-0">
					<!-- Social Buttons -->
					<div class="text-center text-md-end">
						<ul class="list-unstyled list-inline">
							<li class="list-inline-item">
								<a href="#" class="btn-floating btn-sm rgba-white-slight mx-1">
									<i class="fab fa-facebook-f"></i>
								</a>
							</li>
							<li class="list-inline-item">
								<a href="#" class="btn-floating btn-sm rgba-white-slight mx-1">
									<i class="fab fa-twitter"></i>
								</a>
							</li>
							<li class="list-inline-item">
								<a href="#" class="btn-floating btn-sm rgba-white-slight mx-1">
									<i class="fab fa-google-plus-g"></i>
								</a>
							</li>
							<li class="list-inline-item">
								<a href="#" class="btn-floating btn-sm rgba-white-slight mx-1">
									<i class="fab fa-linkedin-in"></i>
								</a>
							</li>
							<li class="list-inline-item">
								<a href="{$lang_link}sitemap" class="btn-floating btn-sm rgba-white-slight mx-1">
									<i class="fa fa-sitemap"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- Back to Top -->
	<a href="#" id="back-to-top" title="Back to top"><i class="fal fa-angle-double-up"></i></a>

	<!-- Callback Modal -->
	<div class="modal fade fade bd-example-modal-sm" id="CallbackModal" tabindex="-1" role="dialog" aria-labelledby="CallbackModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="CallbackModalLabel">{$lang->request_a_call}</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form class="form feedback_form" method="post">
					<div class="modal-body">
						{if isset($call_error)}
							<div class="alert alert-danger" role="alert">
								{if $call_error == 'empty_name'}
									{$lang->enter_your_name}
								{elseif $call_error == 'empty_phone'}
									{$lang->enter_phone_number}
								{elseif $call_error == 'captcha'}
									{$lang->captcha_incorrect}
								{else}
									{$call_error}
								{/if}
							</div>
						{/if}
						<p class="modal-caption">{$lang->leave_your_phone_number}</p>
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fal fa-user"></i></div>
							<input type="text" class="form-control" name="name" value="{if isset($callname)}{$callname|escape}{elseif isset($user->name)}{$user->name|escape}{/if}" placeholder="{$lang->name}" required>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fal fa-phone-alt"></i></div>
							<input type="text" class="form-control" name="phone" id="call-mask" value="{if isset($callphone)}{$callphone|escape}{elseif isset($user->phone)}{$user->phone|escape}{/if}" placeholder="{$lang->phone}" maxlength="255" required>
						</div>
						{if $settings->captcha_callback}
							<div class="row">
								<div class="form-group col-sm-6 pb-3">
									{get_captcha var="captcha_callback"}
									<div class="secret-number">{$captcha_callback[0]|escape} + ? = {$captcha_callback[1]|escape}</div>
								</div>
								<div class="form-group col-sm-6">
									<input type="text" class="form-control" name="captcha_code" value="" placeholder="{$lang->captcha}" autocomplete="off" required>
								</div>
							</div>
						{/if}
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary mx-auto" name="callback" value="{$lang->send}">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Toast callback success -->
	<div class="position-fixed top-0 start-50 translate-middle-x p-3 mt-5" style="z-index: 1060">
		<div id="CallbackToast" class="toast fade hide align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="d-flex">
				<div class="toast-body">
					{$lang->message_sent}
				</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
	</div>

	<!-- Subscribe Modal -->
	<div class="position-fixed top-0 start-50 translate-middle-x p-3 mt-5" style="z-index: 1060">
		<div id="Subscribe" class="toast fade hide align-items-center text-white {if isset($subscribe_error)}bg-danger{/if} {if isset($subscribe_success)}bg-success{/if} border-0" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="d-flex">
				<div class="toast-body">
					{if isset($subscribe_error)}
						{if $subscribe_error == 'email_exist'}
							{$lang->already_subscribe}
						{/if}
						{if $subscribe_error == 'empty_email'}
							{$lang->enter_your_email}
						{/if}
					{/if}
					{if isset($subscribe_success)}
						{$lang->success_subscribe}
					{/if}
				</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
	</div>

	<!-- Toast rate danger -->
	<div class="position-fixed top-0 start-50 translate-middle-x p-3 mt-5" style="z-index: 1060">
		<div id="rate-danger" class="toast fade hide align-items-center text-white bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="d-flex">
				<div class="toast-body">
					{$lang->already_voted}
				</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
	</div>

	<!-- Toast rate success -->
	<div class="position-fixed top-0 start-50 translate-middle-x p-3 mt-5" style="z-index: 1060">
		<div id="rate" class="toast fade hide align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="d-flex">
				<div class="toast-body">
					{$lang->vote_counted}
				</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
	</div>

	{* Javascripts *}
	{js id="main" priority=99 include=[
		"design/{$settings->theme|escape}/js/jquery.min.js",
		"design/{$settings->theme|escape}/js/bootstrap.bundle.min.js",
		"design/{$settings->theme|escape}/js/jquery.maskedinput.min.js",
		"design/{$settings->theme|escape}/js/jquery.autocomplete-min.js",
		"design/{$settings->theme|escape}/js/jquery.fancybox.min.js",
		"design/{$settings->theme|escape}/js/jquery-ui.min.js",
		"design/{$settings->theme|escape}/js/main.js"
	]}{/js}
	{javascript minify=true}

	{* Products *}
	{js id="products" priority=99 include=[
		"design/{$settings->theme|escape}/js/products.js"
	]}{/js}
	{javascript minify=true}

	{* Search *}
	{if isset($page) && !empty($page) && $page->url=="search"}
		{js id="search" priority=99 include=[
			"design/{$settings->theme|escape}/js/search.js"
		]}{/js}
		{javascript minify=true}
	{/if}

	{* Reviews rating *}
	{if $module == 'ReviewsView' || $module == 'ProductView'}
		{js id="rating" priority=99 include=[
			"design/{$settings->theme|escape}/js/rating.js"
		]}{/js}
		{javascript minify=true}
	{/if}

	{* Blog & Articles *}
	{if $module == 'BlogView' && isset($post) || $module=='ArticlesView' && isset($post)}
		{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
			{css id="prism" include=[
				"design/{$settings->theme|escape}/css/prism-dark.css"
			]}{/css}
			{stylesheet minify=true}
		{else}
			{css id="prism" include=[
				"design/{$settings->theme|escape}/css/prism.css"
			]}{/css}
			{stylesheet minify=true}
		{/if}

		{js id="prism" priority=99 include=[
			"design/{$settings->theme|escape}/js/prism.js"
		]}{/js}
		{javascript minify=false}

		{css id="post" include=[
			"design/{$settings->theme|escape}/css/post.css"
		]}{/css}
		{stylesheet minify=true}

		{js id="post" priority=99 include=[
			"design/{$settings->theme|escape}/js/post.js",
		"design/{$settings->theme|escape}/js/jquery.toc.js"
		]}{/js}
		{javascript minify=true}
	{/if}

	{* Description *}
	{if $module == 'BlogView' && isset($post) || $module=='ArticlesView' && isset($post) || $module=='PageView' || $module=='ProductView'}
		{css id="description" include=[
			"design/{$settings->theme|escape}/css/owl.carousel.css"
		]}{/css}
		{stylesheet minify=true}

		{js id="description" priority=99 include=[
			"design/{$settings->theme|escape}/js/block.description.js",
		"design/{$settings->theme|escape}/js/owl.carousel.min.js"
		]}{/js}
		{javascript minify=true}
	{/if}

	{* Filter *}
	{if $module == 'ProductsView'}
		{css id="filter" include=[
			"design/{$settings->theme|escape}/css/filter.css"
		]}{/css}
		{stylesheet minify=true}

		{css id="filter" include=[
			"design/{$settings->theme|escape}/js/ion.rangeSlider/ion.rangeSlider.css"
		]}{/css}
		{stylesheet minify=true}

		{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
			{css id="filter" include=[
				"design/{$settings->theme|escape}/js/ion.rangeSlider/ion.rangeSlider.skinTurbo.dark.css"
			]}{/css}
			{stylesheet minify=true}
		{else}
			{css id="filter" include=[
				"design/{$settings->theme|escape}/js/ion.rangeSlider/ion.rangeSlider.skinTurbo.css"
			]}{/css}
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

		{* Timer action *}
		{if !empty($product->sale_to)}

			{css id="countdown" include=[
				"design/{$settings->theme|escape}/js/jq-timeTo/timeTo.css"
			]}{/css}
			{stylesheet minify=true}

			{js id="countdown" priority=99 include=[
				"design/{$settings->theme|escape}/js/jq-timeTo/jquery.time-to.js"
			]}{/js}
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
							prd.find('#countdown_title').hide();
							real = prd.find('form.variants .offers_price_old .price_value').first().html();
							if (typeof(real) == 'undefinded' || real == null) {
								return;
							}

							prd.find('form.variants .offers_price_old').first().remove();
							prd.find('form.variants .offers_price .price_value').first().html(real);
						}
					});
				});
			</script>
		{/if}
	{/if}

	{if isset($call_sent)}
		<script>
			$(window).on("load", function() {
				$('#CallbackToast').toast('show');
			});
		</script>
	{/if}
	{if isset($call_error)}
		<script>
			$(window).on("load", function() {
				$('#CallbackModal').modal('show');
			});
		</script>
	{/if}
	{if isset($subscribe_success) || isset($subscribe_error)}
		<script>
			$(window).on("load", function() {
				$('#Subscribe').toast('show');
			});
		</script>
	{/if}
	{if isset($fastorder_error)}
		<script>
			$(window).on("load", function() {
				$('#FastOrder').modal('show');
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
		{css id="chat" include=[
			"design/{$settings->theme|escape}/css/online-chat.css"
		]}{/css}
		{stylesheet minify=true}

		{js id="chat" priority=99 include=[
			"design/{$settings->theme|escape}/js/online-chat.js"
		]}{/js}
		{javascript minify=true}

		{include file="online_chat.tpl"}
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