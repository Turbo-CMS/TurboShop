<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" {if isset($language->label)}xml:lang="{if $language->label == "ua"}uk{else}{$language->label|escape}{/if}" lang="{if $language->label == "ua"}uk{else}{$language->label|escape}{/if}"{/if} {if $theme_settings->theme_color == 'theme_light'}data-theme="light"{elseif $theme_settings->theme_color == 'theme_dark'}data-theme="dark"{else}{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'dark'}data-theme="dark"{elseif isset($smarty.cookies.mode) && $smarty.cookies.mode == 'light'}data-theme="light"{else}data-theme="default"{/if}{/if}>

<head>
	{* Head *}
	{include file='components/meta_css.tpl'}
</head>

<body class="{if $module == 'MainView' && $theme_settings->big_banners_type == '1' && $theme_settings->visible_1}header_opacity{/if} side_left hide_menu_page {if $module == 'MainView'}front_page{/if} {if $module == 'BlogView' || $module == 'ArticlesView'}side_right{/if} {if $module == 'CartView' || $module == 'OrderView'}simple_basket_mode{/if} header_fill_ fixed_y mfixed_y mfixed_view_always title_position_left mmenu_leftside mheader-v1 footer-v1 fill_bg_ header-v3 title-v1 bottom-icons-panel_y with_order with_cabinet with_phones {if $theme_settings->theme_color == 'theme_light'}theme-light{elseif $theme_settings->theme_color == 'theme_dark'}theme-dark{else}{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'dark'}theme-dark{elseif isset($smarty.cookies.mode) && $smarty.cookies.mode == 'light'}theme-light{else}theme-default{/if}{/if}" id="main">
	{* Custom Scripts *}
	{if isset($counters['body_top'])}
		{foreach $counters['body_top'] as $counter}
			{$counter->code}
		{/foreach}
	{/if}

	{* Modals *}
	<div id="popup_iframe_wrapper"></div>

	{* Header Fixed *}
	<div id="panel"></div>

	{* Set Theme *}
	{include file='components/set_theme.tpl'}

	<div class="body {if $module == 'MainView'}index{/if} hover_">
		{* Body Media *}
		<div class="body_media"></div>

		{* Headers *}
		<div class="headers-container">
			{* Header *}
			{if $module == 'CartView' || $module == 'OrderView'}
				{include file='header/header_cart.tpl'}
			{else}
				{include file='header/header.tpl'}
			{/if}

			{* Header Fixed *}
			{if $module != 'CartView' && $module != 'OrderView'}
				{include file='header/header_fixed.tpl'}
			{/if}

			{* Mobile Header *}
			{include file='header/header_mobile.tpl'}
		</div>

		{* Mobile Filter *}
		<div id="mobilefilter" class="scrollbar-filter"></div>

		{* Content *}
		<div {if $module == 'CartView'}id="js-ajax-content"{/if} role="main" class="main banner-auto">
			{$content}
		</div>
	</div>

	{* Browsed Products *}
	{if $module != 'CartView' && $module != 'OrderView'}
		{include file='products/browsed_products.tpl'}
	{/if}

	{* Footer *}
	{if $module == 'CartView' || $module == 'OrderView'}
		{include file='footer/footer_cart.tpl'}
	{else}
		{include file='footer/footer.tpl'}
	{/if}

	{* Bottom Icons Panel *}
	{include file='footer/bottom_icons_panel.tpl'}

	{* Core *}
	{js id="script" priority=99 include=["design/{$settings->theme|escape}/js/core.js"]}{/js}
	{javascript minify=true}

	{* Turbo Message *}
	{include file='components/turbo_message.tpl'}

	{* JS *}
	{include file='components/js.tpl'}
</body>

</html>