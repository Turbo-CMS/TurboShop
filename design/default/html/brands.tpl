{* Brands Page *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->global_brands scope=global}

	{* Canonical *}
	{$canonical="/brands" scope=global}
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
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}brands">
					<span itemprop="name">{$lang->global_brands}</span>
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
	<h1 class="my-4">{$lang->global_brands}</h1>
{/if}

{* Page Body *}
{if isset($page->body)}
	{$page->body}
{/if}

{get_brands var=all_brands}
{if $all_brands}
	<div class="row">
		{foreach $all_brands as $b}
			<div class="col-lg-3 col-md-4">
				<a data-brand="{$b->id}" href="{$lang_link}brands/{$b->url}">
					<div class="box item-logo">
						{if $b->image}
							<img src="{$b->image|resize_brands:125:42}" alt="{$b->name|escape}" title="{$b->name|escape}">
						{else}
							<a href="{$lang_link}brands/{$b->url}">
								<h3>{$b->name|escape}</h3>
							</a>
						{/if}
					</div>
				</a>
			</div>
		{/foreach}
	</div>
{else}
	<div class="my-1">
		{$lang->no_brands_found}
	</div>
{/if}