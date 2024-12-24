<!DOCTYPE html>
{* General Page *}
<html class="h-100" lang="{if $language && $language->label == "ua"}uk{else}{$language->label|escape}{/if}" {if $theme_settings->theme_color == 'theme_light'}data-bs-theme="light"{elseif $theme_settings->theme_color == 'theme_dark'}data-bs-theme="dark"{else}{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}data-bs-theme="dark"{/if}{/if} {if $module == 'FAQView'}itemscope itemtype="https://schema.org/FAQPage"{/if}>

<head>
	{* Meta *}
	{include file='head/meta.tpl'}
	
	{* CSS *}
	{include file='head/css.tpl'}
	
	{* JS *}
	{include file='head/js.tpl'}
</head>

<body class="d-flex flex-column h-100" itemscope itemtype="https://schema.org/WebPage">
	
	{* Custom Scripts Body Top *}
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
	{include file='modals/login.tpl'}

	{* Fast Order Modal *}
	{include file='modals/fast_order.tpl'}

	{* Header *}
	{include file='header/header.tpl'}

	{* Header Offcanvas Navbar *}
	{include file='header/navbar.tpl'}

	{* Header Offcanvas Categories *}
	{if $categories}
		{include file='header/categories.tpl'}
	{/if}

	{* Main *}
	<main class="pb-5">
		<div class="container-xxl">
			<div class="row">
				{* Sidebar *}
				{if $module=='MainView'}
					{include file='sidebar/main_sidebar.tpl'}
				{/if}

				<div class="{if $module=='MainView'}col-xl-9{else}col-lg-12{/if}">
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

		{* Viewed Products *}
		{if !$wishlist}
			{get_browsed_products var=browsed_products limit=6}
			{if $browsed_products}
				<div class="container-xxl my-3">
					<h2 class="mb-3 fs-5">{$lang->viewed_products|escape}</h2>
					<div class="row g-0 border-start border-top">
						{foreach $browsed_products as $product}
							<div class="col-6 col-sm-6 col-md-4 col-lg-4 col-xl-2">
								{include file='products/grid.tpl'}
							</div>
						{/foreach}
					</div>
				</div>
			{/if}
		{/if}
	</main>

	{* Subscribe *}
	{include file='footer/subscribe.tpl'}
	
	{* Footer *}
	{include file='footer/footer.tpl'}

	{* Toolbar Mobile *}
	{include file='footer/toolbar_mobile.tpl'}

	{* Back to Top *}
	<a href="#" id="back-to-top" title="Back to top"><i class="fal fa-angle-up"></i></a>

	{* Callback Modal *}
	{include file='modals/callback.tpl'}

	{* Toast Callback *}
	{include file='toast/toast_callback.tpl'}

	{* Toast Subscribe *}
	{include file='toast/toast_subscribe.tpl'}

	{* Toast Rate *}
	{include file='toast/toast_rate.tpl'}

	{* Toast Cart *}
	{include file='toast/toast_cart.tpl'}

	{* JS *}
	{include file='scripts/js.tpl'}
</body>

</html>