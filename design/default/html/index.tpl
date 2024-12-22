<!DOCTYPE html>
{* General Page *}
<html class="h-100" lang="{if $language && $language->label == "ua"}uk{else}{$language->label|escape}{/if}" {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}data-bs-theme="dark"{/if} {if $module == 'FAQView'}itemscope itemtype="https://schema.org/FAQPage"{/if}>

<head>
	{* Meta *}
	{include file='head/meta.tpl'}

	{* CSS *}
	{include file='head/css.tpl'}

	{* JS *}
	{include file='head/js.tpl'}
</head>

<body class="d-flex flex-column h-100" itemscope itemtype="https://schema.org/WebPage">

	{* Custom Scripts *}
	{if $counters['body_top']}
		{foreach $counters['body_top'] as $counter}
			{$counter->code}
		{/foreach}
	{/if}

	{* Quickview Modal *}
	<div id="quickview-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content p-3"></div>
		</div>
	</div>

	{* Login Modal *}
	{if $theme_settings->header_type == '2'}
		{include file='modals/login.tpl'}
	{/if}

	{* Fast Order Modal *}
	{include file='modals/fast_order.tpl'}

	{* Header *}
	<header>
		{if $theme_settings->header_type == '1'}
			{include file='header/header_1.tpl'}
		{elseif $theme_settings->header_type == "2"}
			{include file='header/header_2.tpl'}
		{/if}
	</header>

	{* Page Content *}
	<main>
		<div class="container-xxl">
			<div class="row">
				{* Sidebar *}
				{if $theme_settings->main_type != '2' || $module!='MainView'}
					{include file='sidebar/sidebar.tpl'}
				{/if}
				<div class="{if $theme_settings->main_type == '2' && $module == 'MainView'}col-lg-12{else}col-lg-9{/if} order-lg-2 order-1">
					{* Slider *}
					{include file='banners/slider.tpl'}

					{* Breadcrumb *}
					{include file='includes/breadcrumbs.tpl'}

					{* Content *}
					<div {if $module == 'CartView'}id="js-ajax-content"{/if}>
						{$content}
					</div> 
				</div>
			</div>
		</div>
	</main>
	
	{* Widgets *}
	{include file='includes/widgets.tpl'}

	<div class="my-3"></div>

	{* Footer *}
	{if $theme_settings->footer_type == '1'}
		{include file='footer/footer_1.tpl'}
	{elseif $theme_settings->footer_type == '2'}
		{include file='footer/footer_2.tpl'}
	{/if}

	{* Toolbar Mobile *}
	{include file='footer/toolbar_mobile.tpl'}

	{* Back to Top *}
	<a href="#" id="back-to-top" title="Back to top"><i class="fal fa-angle-double-up"></i></a>

	{* Callback Modal *}
	{include file='modals/callback.tpl'}

	{* Toast Callback *}
	{include file='toast/toast_callback.tpl'}

	{* Toast Subscribe *}
	{include file='toast/toast_subscribe.tpl'}

	{* Toast Rate *}
	{include file='toast/toast_rate.tpl'}

	{* JS *}
	{include file='scripts/js.tpl'}
</body>

</html>