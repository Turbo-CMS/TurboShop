<div class="offcanvas-lg offcanvas-start bg-body col-lg-3 overflow-auto h-100" tabindex="-1" id="sidebar" aria-labelledby="sidebarLabel">

	{* Header Sidebar *}
	<div class="offcanvas-header px-0">
		<h5 class="offcanvas-title" id="sidebarLabel">{$lang->catalog|escape}</h5>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#sidebar" aria-label="Close"></button>
	</div>
	
	{if $module=='ArticlesView'}

		{* Articles Sidebar *}
		{include file='sidebar/articles_sidebar.tpl'}

	{elseif $module=='BlogView'}

		{* Blog Sidebar *}
		{include file='sidebar/blog_sidebar.tpl'}

	{else}

		{if $theme_settings->header_type != '2'}
			{if $module!='SearchView'}
				{if $module=='PageView'}
					{* Search Pages *}
					<form class="input-group my-2 my-md-4" action="{$lang_link}search">
						<input id="pages-search" class="form-control" type="text" name="keyword" value="{$keyword|escape}" placeholder="{$lang->search|escape}...">
						<button class="btn btn-success" type="submit"><i class="fal fa-search"></i></button>
					</form>
				{else}
					{* Search Products *}
					<form class="input-group my-2 my-md-4" action="{$lang_link}all-products">
						<input class="input-search form-control" type="text" name="keyword" value="{$keyword|escape}" placeholder="{$lang->product_search|escape}">
						<button class="btn btn-success" type="submit"><i class="fal fa-search"></i></button>
					</form>
				{/if}
			{/if}
		{/if}

		{* Categories *}
		{include file='sidebar/products_categories.tpl'}

		{* All Brands *}
		{if $module!=='ProductsView'}
			{include file='sidebar/all_brands.tpl'}
		{/if}

		{* Filter *}
		{if $module=='ProductsView'}
			{include file='sidebar/filter.tpl'}
		{/if}

		{* Currency *}
		{include file='sidebar/currency.tpl'}

	{/if}

	{* Last Comments *}
	{include file='sidebar/last_comments.tpl'}

</div>