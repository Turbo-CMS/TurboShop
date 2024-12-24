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
	<h1 class="my-3">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-3">{$lang->wishlist|escape}</h1>
{/if}

{if $products}
	{* View Button *}
	<div class="d-flex align-items-center justify-content-end border-bottom">
		<div class="btn-group mb-3 d-none d-md-flex" role="group" aria-label="viewButton">
			<button onclick="document.cookie='view=big;path=/';document.location.reload();" type="button" class="btn btn-sm btn-outline-primary {if !isset($smarty.cookies.view) || $smarty.cookies.view == 'big'}active{/if}">
				<i class="fa fa-grid-round"></i>
			</button>
			<button onclick="document.cookie='view=grid;path=/';document.location.reload();" type="button" class="btn btn-sm btn-outline-primary {if !isset($smarty.cookies.view) || $smarty.cookies.view == 'grid' || $smarty.cookies.view != 'big'}active{/if}">
				<i class="fa fa-grid-round-4"></i>
			</button>
		</div>
	</div>
	{* Products *}
	<div class="row g-0 border-start infinite">
		{if isset($smarty.cookies.view) && $smarty.cookies.view == 'big'}
			 {* Products Grid Big *}
			{foreach $products as $product}
				<div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-5 col-xxl-3 infinite-item">
					{include file='products/grid_big.tpl'}
				</div>
			{/foreach}
		{else}
			{* Products Grid *}
			{foreach $products as $product}
				<div class="col-6 col-sm-6 col-md-4 col-lg-4 col-xl-3 col-xxl-2 infinite-item">
					{include file='products/grid.tpl'}
				</div>
			{/foreach}
		{/if}
	</div>
	{if $total_pages_num > 1}
		<div class="infinite-btn text-center my-3">
			<a class="icon-link text-decoration-none fs-5" href="javascript:void(0);">
				<i class="far fa-arrow-rotate-right me-1"></i>
				{$lang->show_more|escape}
			</a>
		</div>
		{include file='paginations/chpu_pagination.tpl'}
	{/if}
{else}
	<div class="alert alert-primary mt-3" role="alert">
		{$lang->wishlist_no_products|escape}
	</div>
{/if}

{* Page Body *}
{if $page}
	{$page->body}
{/if}
