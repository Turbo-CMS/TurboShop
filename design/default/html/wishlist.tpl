{* Wish list*}

{* Canonical page address *}
{if isset($page->url)}
	{$canonical="/{$page->url}" scope=global}
{/if}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
		{if isset($page)}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}"><span itemprop="name">{$page->header|escape}</span></a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
	</ol>
</nav>
<!-- Breadcrumb #End /-->

{* Page title *}
{if isset($page->name)}
	<h1 data-page="{$page->id}" class="my-4">{$page->name|escape}</h1>
{/if}

{if isset($products)}
	<div class="btn-toolbar justify-content-between mb-4" role="toolbar" aria-label="Toolbar view">
		<span></span>
		<div class="btn-group" role="group" aria-label="View">
			<button onclick="document.cookie='view=grid;path=/';document.location.reload();" type="button" class="btn btn-secondary {if isset($smarty.cookies.view) && $smarty.cookies.view == 'grid'}active{/if}"><i class="fa fa-th"></i></button>
			<button onclick="document.cookie='view=list;path=/';document.location.reload();" type="button" class="btn btn-secondary {if isset($smarty.cookies.view) && $smarty.cookies.view == 'list'}active{/if}"><i class="fa fa-th-list"></i></button>
		</div>
	</div>
	<div class="row">
		{if isset($smarty.cookies.view) && $smarty.cookies.view == 'list'}
			<main class="col-md-12">
				{include file='list.tpl'}
				{include file='pagination.tpl'}
			</main>
		{else}
			{foreach $products as $product}
				<div class="col-md-6 col-lg-4">
					{include file='grid.tpl'}
				</div>
			{/foreach}
			<main class="col-md-12">
				{include file='pagination.tpl'}
			</main>
		{/if}
	</div>
{else}
	<p>
		{$lang->wishlist_no_products}
	</p>
{/if}

{* Page description (if set) *}
{if isset($page->body)}
	{$page->body}
{/if}