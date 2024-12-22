<!DOCTYPE html>
<html class="h-100" {if $language && $language->label}lang="{if $language->label == "ua"}uk{else}{$language->label|escape}{/if}"{/if} {if $theme_settings->theme_color == 'theme_light'}data-bs-theme="light"{elseif $theme_settings->theme_color == 'theme_dark'}data-bs-theme="dark"{else}{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}data-bs-theme="dark"{/if}{/if}>

<head>
	<base href="{$config->root_url}/">

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=0">

	{if $seo->seo_automation == "on"}
		<title>{($meta_title|default:$auto_meta->title)|escape}</title>
	{else}
		<title>{($auto_meta->title|default:$meta_title)|escape}</title>
	{/if}

	{if $seo->seo_automation == "on"}
		<meta name="description" content="{($meta_description|default:$auto_meta->description)|escape}">
		<meta name="keywords" content="{($meta_keywords|default:$auto_meta->keywords)|escape}">
	{else}
		<meta name="description" content="{($auto_meta->description|default:$meta_description)|escape}">
		<meta name="keywords" content="{($auto_meta->keywords|default:$meta_keywords)|escape}">
	{/if}

	<meta name="author" content="TurboCMS">
	<meta name="generator" content="TurboCMS">

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

	<meta name="robots" content="noindex,follow">

	{* Canonical *}
	{if $canonical}
		<link rel="canonical" href="{$config->root_url}{if $lang_link}/{$lang_link|replace:'/':''}{/if}{$canonical}">
	{/if}

	{* Language Attribute *}
	{foreach $languages as $lang}
		{if $lang->enabled}
			<link rel="alternate" hreflang="{if $lang@first}x-default{else}{$lang->label|escape}{/if}" href="{$config->root_url}{if !$lang@first}/{/if}{$lang->url|replace:'/':''}">
		{/if}
	{/foreach}

	{* RSS *}
	<link rel="alternate" type="application/rss+xml" title="{$settings->site_name|escape}" href="{$config->root_url}/{$lang_link}feeds/rss.xml">

	{* CSS *}
	{css id="main" include=[
		"design/{$settings->theme|escape}/css/theme.css",
		"design/{$settings->theme|escape}/vendor/fontawesome/fontawesome.css"
	]}{/css}
	{stylesheet minify=true}

	{* CSS Cart *}
	{css id="cart" include=["design/{$settings->theme|escape}/css/cart/cart.css"]}{/css}
	{stylesheet minify=true}

	{* Favicon *}
	<link rel="icon" type="image/x-icon" href="design/{$settings->theme|escape}/images/favicon.ico">
	<link rel="shortcut icon" type="image/x-icon" href="design/{$settings->theme|escape}/images/favicon.ico">
	<link rel="apple-touch-icon" sizes="180x180" href="design/{$settings->theme|escape}/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="design/{$settings->theme|escape}/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="design/{$settings->theme|escape}/images/favicon-16x16.png">
	<link rel="manifest" href="design/{$settings->theme|escape}/images/site.webmanifest">
	<link rel="mask-icon" color="#198754" href="design/{$settings->theme|escape}/images/safari-pinned-tab.svg">

	{* JS jQuery & Bootstrap *}
	{js id="main" priority=99 include=[
		"design/{$settings->theme|escape}/js/jquery/jquery.min.js",
		"design/{$settings->theme|escape}/vendor/bootstrap/bootstrap.bundle.js"
	]}{/js}
	{javascript minify=true}

	{* Custom Scripts *}
	{if $counters['head']}
		{foreach $counters['head'] as $counter}
			{$counter->code}
		{/foreach}
	{/if}
</head>

<body class="d-flex flex-column h-100">
	{* Custom Scripts *}
	{if $counters['body_top']}
		{foreach $counters['body_top'] as $counter}
			{$counter->code}
		{/foreach}
	{/if}

	<div class="container-xxl d-flex flex-column h-100">
		{* Header *}
		<header class="pb-3 mb-4 border-bottom">
			<a href="{if $lang_link}{$lang_link}{else}/{/if}" class="d-flex align-items-center text-body-emphasis text-decoration-none">
				{* Logo *}
				{assign var="logo" value="design/{$settings->theme|escape}/images/logo.svg"}
				{$logo|svg}
				<span class="fs-2 ms-2 fw-medium">{$theme_settings->logo|escape}</span>
			</a>
		</header>
		
		{* Content *}
		<div class="container-xxl my-4 flex-grow-1">
			{$content}
		</div>
		
		{* Footer *}
		<footer class="py-3">
			<div class="container">
				{* Copyright *}
				<div class="mb-0 text-muted small">© <span>{$smarty.now|date_format:"Y"}</span><strong class="ms-1">TurboCMS</strong></div>
			</div>
		</footer>
	</div>
	
	{* Cart *}
	{if $module=='CartView'}
		{css id="cart" include=["design/{$settings->theme|escape}/css/cart/select2.css"]}{/css}
		{stylesheet minify=true}

		{js id="cart" priority=99 include=["design/{$settings->theme|escape}/js/cart/cart.js"]}{/js}
		{javascript minify=true}
	{/if}

	{* Order *}
	{if $module=='OrderView'}
		{js id="cart" priority=99 include=["design/{$settings->theme|escape}/js/cart/order.js"]}{/js}
		{javascript minify=true}
	{/if}

	{* Tooltip Init *}
	<script>
		$(function() {
			$('[data-bs-toggle="tooltip"]').tooltip();
		});
	</script>

	{* Online Chat *}
	{if $settings->chat_viber || $settings->chat_whats_app || $settings->chat_telegram || $settings->chat_facebook}
		{css id="chat" include=["design/{$settings->theme|escape}/css/service/online-chat.css"]}{/css}
		{stylesheet minify=true}

		{js id="chat" priority=99 include=["design/{$settings->theme|escape}/js/service/online-chat.js"]}{/js}
		{javascript minify=true}

		{include file='service/online_chat.tpl'}
	{/if}

	{* Admintooltip *}
	{if $smarty.session.admin == 'admin'}
		{$admintooltip}
	{/if}

	{* Custom Scripts *}
	{if $counters['body_bottom']}
		{foreach $counters['body_bottom'] as $counter}
			{$counter->code}
		{/foreach}
	{/if}

	{* Cart Informer *}
	<div class="cart-informer">
		<div id="cart-informer">
			{include file='informers/cart_informer.tpl'}
		</div>
		<div id="cart-informer-footer">
			{include file='informers/cart_informer_footer.tpl'}
		</div>
		<div id="cart-informer-sidebar">
			{include file='informers/cart_informer_sidebar.tpl'}
		</div>
	</div>
</body>

</html>