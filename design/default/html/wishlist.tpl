{* Wishlist *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->wishlist scope=global}

	{* Canonical *}
	{$canonical="/wishlist" scope=global}
{/if}

{* Breadcrumb *}
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}">
				<span itemprop="name" title="{$lang->home}"><i class="fal fa-house me-2"></i>{$lang->home}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
		{if isset($page)}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}">
					<span itemprop="name">{$page->header|escape}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{else}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}wishlist">
					<span itemprop="name">{$lang->wishlist}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
	</ol>
</nav>

{* Page Title *}
{if isset($page->name)}
	<h1 class="my-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-4">{$lang->wishlist}</h1>
{/if}

{if isset($products)}
	{* View Button *}
	<div class="btn-toolbar justify-content-between mb-4" role="toolbar" aria-label="toolbarView">
		<span></span>
		<div class="btn-group" role="group" aria-label="View">
			<button onclick="document.cookie='view=grid;path=/';document.location.reload();" type="button" class="btn btn-outline-secondary {if isset($smarty.cookies.view) && $smarty.cookies.view == 'grid'}active{/if}"><i class="fal fa-th"></i></button>
			<button onclick="document.cookie='view=list;path=/';document.location.reload();" type="button" class="btn btn-outline-secondary {if isset($smarty.cookies.view) && $smarty.cookies.view == 'list'}active{/if}"><i class="fal fa-th-list"></i></button>
		</div>
	</div>
	{* Products *}
	<div class="row">
		{if isset($smarty.cookies.view) && $smarty.cookies.view == 'list'}
			{* Products List *}
			<main class="col-md-12">
				{include file='products/list.tpl'}
				{include file='paginations/pagination.tpl'}
			</main>
		{else}
			{* Products Grid *}
			{foreach $products as $product}
				<div class="col-md-6 col-lg-4">
					{include file='products/grid.tpl'}
				</div>
			{/foreach}
			<main class="col-md-12">
				{include file='paginations/pagination.tpl'}
			</main>
		{/if}
	</div>
{else}
	<div class="my-1">
		{$lang->wishlist_no_products}
	</div>
{/if}

{* Page Body *}
{if isset($page->body)}
	{$page->body}
{/if}