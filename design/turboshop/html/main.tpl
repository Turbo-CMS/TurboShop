{* Home Page *}

{$wrapper = 'index.tpl' scope=global}

{* Canonical *}
{$canonical="" scope=global}

<div class="container">
	{* Big Banner *}
	{if $theme_settings->visible_1}
		{include file='banners/big_banners.tpl'}
	{/if}

	{* Catalog Sections *}
	{if $theme_settings->visible_2}
		{include file='main/catalog_sections.tpl'}
	{/if}

	{* Products Tab *}
	{if $theme_settings->visible_3}
		{include file='main/products_tab.tpl'}
	{/if}

	{* Brands *}
	{if $theme_settings->visible_4}
		{include file='main/brands.tpl'}
	{/if}

	{* Banners Text *}
	{if $theme_settings->visible_5}
		{include file='main/banners_text.tpl'}
	{/if}

	{* Teasers *}
	{if $theme_settings->visible_6}
		{include file='main/teasers.tpl'}
	{/if}

	{* Bottom Banners *}
	{if $theme_settings->visible_7}
		{include file='main/bottom_banners.tpl'}
	{/if}

	{* Custom Products *}
	{if $theme_settings->visible_8}
		{include file='main/custom_products.tpl'}
	{/if}

	{* Company Text *}
	{if $theme_settings->visible_9}
		{include file='main/company_text.tpl'}
	{/if}

	{* Blog *}
	{if $theme_settings->visible_10}
		{include file='main/blog.tpl'}
	{/if}

	{* Articles *}
	{if $theme_settings->visible_11}
		{include file='main/articles.tpl'}
	{/if}
</div>