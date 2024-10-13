{* Single Blog Post *}

{* Canonical *}
{$canonical="/blog/{$post->url}" scope=global}

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
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}blog">
				<span itemprop="name">{$lang->global_blog}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}blog/{$post->url}">
				<span itemprop="name">{$post->name|escape}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
	</ol>
</nav>

<div itemscope itemtype="http://schema.org/BlogPosting">
	{* Schema.org *}
	<div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
		<meta itemprop="name" content="{$settings->site_name|escape}">
		<span itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
			<meta itemprop="image url" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
			<meta property="url" content="{$config->root_url}/">
		</span>
	</div>
	<meta itemprop="dateModified" content="{$post->date}">
	<meta itemprop="author" content="{$settings->site_name|escape}">
	<meta itemscope itemprop="mainEntityOfPage" itemType="https://schema.org/WebPage" itemid="/blog/{$post->url}">
	<link itemprop="url" href="{$lang_link}blog/{$post->url}">

	{* Page Title *}
	<h1 itemprop="headline name" class="mt-4">
		<span data-post="{$post->id}">{$post->name|escape}</span>
	</h1>

	<hr class="text-black-50">

	{* Date & Time *}
	<div class="mb-3">
		<div class="btn btn-link text-muted text-decoration-none">
			<i class="fal fa-calendar"></i>
			<div itemprop="datePublished" content="{$post->date}" class="badge text-muted">{$post->date|date}</div>
		</div>
		<div class="btn btn-link text-muted text-decoration-none">
			<i class="fal fa-eye"></i>
			<div class="badge text-muted">{$post->views}</div>
		</div>
		<div class="btn btn-link text-muted text-decoration-none">
			<i class="fal fa-comment"></i>
			<div class="badge text-muted">{$comments|count}</div>
		</div>
	</div>

	<hr class="text-black-50">

	{if $post->image}
		{* Image *}
		<div class="card mb-4">
			<img itemprop="image" class="img-fluid rounded" src="{$post->image|resize_posts:964:964}" alt="{$post->name|escape}">
		</div>
		<hr class="text-black-50">
	{/if}

	{* Post Content *}
	<article class="block-description content entry-content" itemprop="articleBody">
		{if $post->text|stristr:"h2" || $post->text|stristr:"h3" || $post->text|stristr:"h4"}
			<div class="table-of-contents bg-body-tertiary rounded open">
				<div class="table-of-contents-header pt-3 ps-3 pb-2">
					<h6 class="js-table-of-contents-hide table-of-contents-hide">
						{$lang->table_of_contents}
						<i class="icon-action fa fa-chevron-down ms-2"></i>
					</h6>
				</div>
				<ol data-toc=".content" data-toc-headings="h2,h3,h4" class="table-of-contents-list js-table-of-contents-list"></ol>
			</div>
		{/if}
		{* Post Body *}
		{$post->text}
	</article>

	{* Tags *}
	<div class="tags">
		{foreach $tags as $tag}
			<a class="mr-2 btn btn-outline-primary btn-sm me-1" href="{$lang_link}blog/?keyword={$tag}">#{$tag}</a>
		{/foreach}
	</div>

	{* Rating *}
	<div class="btn-group vote pt-4">
		<a class="btn vote-button-plus" href="ajax/blog_rate.php?id={$post->id}&rate=up">
			<i class="fa fa-chevron-up" aria-hidden="true"></i>
		</a>
		{if $post->rate>0}
			<div class="btn vote-value pos">{$post->rate}</div>
		{elseif $post->rate == 0}
			<div class="btn text-muted vote-value">{$post->rate}</div>
		{else}
			<div class="btn vote-value neg">{$post->rate}</div>
		{/if}
		<a class="btn vote-button-minus" href="ajax/blog_rate.php?id={$post->id}&rate=down">
			<i class="fa fa-chevron-down" aria-hidden="true"></i>
		</a>
	</div>
</div>

{* Netx & Prev *}
{if $prev_post || $next_post}
	<hr class="text-black-50">
	<div class="row">
		<div class="col-lg-6 col-sm-6 col-6 text-start">
			{if $prev_post}
				<a class="text-decoration-none" href="{$lang_link}blog/{$prev_post->url}">
					<i class="fal fa-arrow-left me-2"></i>
					{$prev_post->name}
				</a>
			{/if}
		</div>
		<div class="col-lg-6 col-sm-6 col-6 text-end">
			{if $next_post}
				<a class="text-decoration-none" href="{$lang_link}blog/{$next_post->url}">
					{$next_post->name}
					<i class="fal fa-arrow-right ms-2"></i>
				</a>
			{/if}
		</div>
	</div>
	<hr class="text-black-50">
{/if}

{* Comments *}
{include file='comments/comments_blog.tpl'}