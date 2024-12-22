{* Wishlist *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->wishlist scope=global}

	{* Canonical *}
	{$canonical="/wishlist" scope=global}
{/if}

{* Page Title *}
{if $page}
	<h1 class="my-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-4">{$lang->wishlist|escape}</h1>
{/if}

{if $products}
	{* View Button *}
	<div class="btn-toolbar justify-content-between mb-4" role="toolbar" aria-label="toolbarView">
		<span></span>
		<div class="btn-group" role="group" aria-label="View">
			<button onclick="document.cookie='view=grid;path=/';document.location.reload();" type="button" class="btn btn-outline-secondary {if !isset($smarty.cookies.view) || $smarty.cookies.view == 'grid' || $smarty.cookies.view != 'list'}active{/if}"><i class="fal fa-th"></i></button>
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
		{$lang->wishlist_no_products|escape}
	</div>
{/if}

{* Page Body *}
{if $page}
	{$page->body}
{/if}