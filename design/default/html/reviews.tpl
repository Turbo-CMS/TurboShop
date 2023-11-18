{* Reviews *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->reviews_global scope=global}

	{* Canonical *}
	{$canonical="/reviews" scope=global}
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
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}reviews">
					<span itemprop="name">{$lang->reviews_global}</span>
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
	<h1 class="my-4">{$lang->reviews_global}</h1>
{/if}

{* Rating Wrap *}
<div class="rating-wrap mb-2 ratings reviews">
	<ul class="rating-stars rater-starsOff" style="width:132px;">
		<li style="width:{$ratings*100/5|string_format:'%.0f'}%" class="stars-active rater-starsOn">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
		</li>
		<li>
			<i class="far fa-star"></i>
			<i class="far fa-star"></i>
			<i class="far fa-star"></i>
			<i class="far fa-star"></i>
			<i class="far fa-star"></i>
		</li>
	</ul>
	{if $ratings> 0}
		<div class="label-rating">
			<span class="rater-rating h3">{$ratings|string_format:"%.1f"}</span>
		</div>
	{/if}
</div>

{* Post Body *}
{$page->body}

{* Comments *}
{include file='comments/comments_reviews.tpl'}