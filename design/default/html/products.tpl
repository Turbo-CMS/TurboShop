{* List Products *}

{* Canonical *}
{if $page}
	{$canonical="/{$page->url}" scope=global}
{elseif $category && $brand}
	{$canonical="/catalog/{$category->url}/{$brand->url}" scope=global}
{elseif $category}
	{$canonical="/catalog/{$category->url}" scope=global}
{elseif $brand}
	{$canonical="/brands/{$brand->url}" scope=global}
{elseif $keyword}
	{$canonical="/all-products?keyword={$keyword|escape}" scope=global}
{else}
	{$canonical="/all-products" scope=global}
{/if}

{* Page Title *}
{if $keyword}
	<h1 class="my-4">{$lang->search|escape} {$keyword|escape}</h1>
{elseif $page}
	<h1 class="my-4"><span data-page="{$page->id}">{$page->name|escape}</span></h1>
{else}
	<h1 class="my-4">
		{if $category && $category->name_h1}
			<span data-category="{$category->id}">{$category->name_h1|escape}</span>
		{elseif $category && $category->name}
			<span data-category="{$category->id}">{$category->name|escape}</span>
		{/if}

		{if $brand && $brand->name_h1}
			<span data-brand="{$brand->id}">{$brand->name_h1|escape}</span>
		{elseif $brand && $brand->name}
			<span data-brand="{$brand->id}">{$brand->name|escape}</span>
		{/if}
	</h1>
{/if}

{* Catalog *}
{if $page && $page->url=='catalog'}
	{include file='catalog.tpl'}
{else}
	{* Products List *}
	{if $products}
		<div class="btn-toolbar justify-content-between mb-4" role="toolbar" aria-label="toolbarSort">
			{* Sort *}
			<div class="btn-group d-flex d-lg-none" role="group" aria-label="sortFilter">
				<div class="btn-group" role="group">
					{include file='products/sort.tpl'}
				</div>
				<button type="button" class="btn btn-outline-secondary" data-bs-toggle="offcanvas" href="#sidebar" role="button" aria-controls="sidebar"><i class="fal fa-filter"></i></button>
			</div>
			<div class="d-none d-lg-block">
				{include file='products/sort.tpl'}
			</div>

			{* View Button *}
			<div class="btn-group" role="group" aria-label="viewButton">
				<button onclick="document.cookie='view=grid;path=/';document.location.reload();" type="button" class="btn btn-outline-secondary {if !isset($smarty.cookies.view) || $smarty.cookies.view == 'grid' || $smarty.cookies.view != 'list'}active{/if}"><i class="fal fa-th"></i></button>
				<button onclick="document.cookie='view=list;path=/';document.location.reload();" type="button" class="btn btn-outline-secondary {if isset($smarty.cookies.view) && $smarty.cookies.view == 'list'}active{/if}"><i class="fal fa-th-list"></i></button>
			</div>
		</div>
		<div class="row">
			{if isset($smarty.cookies.view) && $smarty.cookies.view == 'list'}
				{* Products List *}
				<main class="col-md-12">
					{include file='products/list.tpl'}
					{include file='paginations/chpu_pagination.tpl'}
				</main>
			{else}
				{* Products Grid *}
				{foreach $products as $product}
					<div class="col-sm-6 col-md-6 col-lg-6 col-xl-4 col-xxl-4">
						{include file='products/grid.tpl'}
					</div>
				{/foreach}
				<main class="col-md-12">
					{include file='paginations/chpu_pagination.tpl'}
				</main>
			{/if}
		</div>
	{else}
		<div class="my-1">
			{$lang->no_products_found|escape}
		</div>
	{/if}
{/if}

{if $current_page_num == 1}
	{if $page}
		{* Page Body *}
		{$page->body}
	{elseif !$is_filter && !isset($smarty.get.page) && !isset($smarty.get.sort)}
		{if $category && $category->description}
			{* Category Description *}
			{$category->description}
		{/if}

		{if $brand && $brand->description}
			{* Brand Description *}
			{$brand->description}
		{/if}
	{/if}
{/if}