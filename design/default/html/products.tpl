{* List Products *}

{* Canonical *}
{if isset($page)}
	{$canonical="/{$page->url}" scope=global}
{elseif isset($category) && isset($brand)}
	{$canonical="/catalog/{$category->url}/{$brand->url}" scope=global}
{elseif isset($category)}
	{$canonical="/catalog/{$category->url}" scope=global}
{elseif isset($brand)}
	{$canonical="/brands/{$brand->url}" scope=global}
{elseif isset($keyword)}
	{$canonical="/all-products?keyword={$keyword|escape}" scope=global}
{else}
	{$canonical="/all-products" scope=global}
{/if}

{* Breadcrumb *}
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="https://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}">
				<span itemprop="name" title="{$lang->home}"><i class="fal fa-house me-2"></i>{$lang->home}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
		{if isset($page) && !isset($category)}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}">
					<span itemprop="name">{$page->header|escape}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
		{if isset($category)}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}catalog">
					<span itemprop="name">{$lang->catalog}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
			{foreach $category->path as $cat}
				<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
					<a itemprop="item" class="text-decoration-none" href="{$lang_link}catalog/{$cat->url}">
						<span itemprop="name">{$cat->name|escape}</span>
					</a>
					<meta itemprop="position" content="{$level++}">
				</li>
			{/foreach}
			{if isset($brand)}
				<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
					<a itemprop="item" class="text-decoration-none" href="{$lang_link}catalog/{$cat->url}/{$brand->url}">
						<span itemprop="name">{$brand->name|escape}</span>
					</a>
					<meta itemprop="position" content="{$level++}">
				</li>
			{/if}
			{if isset($page)}
				<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
					<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}">
						<span itemprop="name">{$page->header|escape}</span>
					</a>
					<meta itemprop="position" content="{$level++}">
				</li>
			{/if}
		{elseif isset($brand)}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}brands">
					<span itemprop="name">{$lang->global_brands}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}brands/{$brand->url}">
					<span itemprop="name">{$brand->name|escape}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{elseif isset($wishlist)}
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item active">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}wishlist/">
					<span itemprop="name">{$lang->compare}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{elseif isset($keyword)}
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item active">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}all-products?keyword={$keyword|escape}">
					<span itemprop="name">{$lang->search}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
	</ol>
</nav>

{* Page Title *}
{if isset($keyword)}
	<h1 class="my-4">{$lang->search} {$keyword|escape}</h1>
{elseif isset($page)}
	<h1 class="my-4">{$page->name|escape}</h1>
{else}
	<h1 class="my-4">
		{if isset($category) && $category->name_h1}
			{$category->name_h1|escape}
		{elseif isset($category) && $category->name}
			{$category->name|escape}
		{/if}

		{if isset($brand) && $brand->name_h1}
			{$brand->name_h1|escape}
		{elseif isset($brand) && $brand->name}
			{$brand->name|escape}
		{/if}
	</h1>
{/if}

{* Catalog *}
{if isset($page) && $page->url=='catalog'}
	{include file='catalog.tpl'}
{else}
	{* Products List *}
	{if isset($products)}
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
				<button onclick="document.cookie='view=grid;path=/';document.location.reload();" type="button" class="btn btn-outline-secondary {if !isset($smarty.cookies.view) || isset($smarty.cookies.view) && $smarty.cookies.view == 'grid'}active{/if}"><i class="fal fa-th"></i></button>
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
					<div class="col-md-6 col-lg-6 col-xl-4">
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
			{$lang->no_products_found}
		</div>
	{/if}
{/if}

{if $current_page_num == 1}
	{if $page}
		{* Page Body *}
		{$page->body}
	{elseif !$noindex_filter && !isset($smarty.get.page) && !isset($smarty.get.sort)}
		{if isset($category) && $category->description}
			{* Category Description *}
			{$category->description}
		{/if}

		{if isset($brand) && $brand->description}
			{* Brand Description *}
			{$brand->description}
		{/if}
	{/if}
{/if}