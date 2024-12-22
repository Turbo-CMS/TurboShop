{* Single Article *}

{* Canonical *}
{$canonical="/article/{$post->url}" scope=global}

<div itemscope itemtype="http://schema.org/Article">
	{* Schema.org *}
	<div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
		<meta itemprop="name" content="{$settings->site_name|escape}">
		<span itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
			<meta itemprop="image url" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
			<meta property="url" content="{$config->root_url}/">
		</span>
	</div>
	<meta itemprop="dateModified" content="{$post->date}">
	<meta itemprop="author" content="{$post->author|escape}">
	<meta itemscope itemprop="mainEntityOfPage" itemType="https://schema.org/WebPage" itemid="{$lang_link}article/{$post->url}">
	<link itemprop="url" href="{$lang_link}article/{$post->url}">

	{* Page Title *}
	<h1 itemprop="headline name" class="mt-4">
		<span data-article="{$post->id}">{$post->name|escape}</span>
	</h1>

	<hr>

	{* Date & Time *}
	<div class="mb-3">
		{if $post->author}
			<a href="{$lang_link}articles/?keyword={$post->author|escape}" class="btn btn-link text-muted text-decoration-none">
				<i class="fal fa-user"></i>
				<span class="badge text-muted">{$post->author|escape}</span>
			</a>
		{/if}
		<div class="btn btn-link text-muted text-decoration-none">
			<i class="fal fa-calendar"></i>
			<span itemprop="datePublished" content="{$post->date}" class="badge text-muted">{$post->date|date}</span>
		</div>
		<div class="btn btn-link text-muted text-decoration-none">
			<i class="fal fa-eye"></i>
			<span class="badge text-muted">{$post->views}</span>
		</div>
		<div class="btn btn-link text-muted text-decoration-none">
			<i class="fal fa-comment"></i>
			<span class="badge text-muted">{$comments|count}</span>
		</div>
	</div>

	<hr>

	{* Image *}
	{if $post->image}
		<div class="card mb-4">
			<img itemprop="image" class="img-fluid rounded" src="{$post->image|resize_articles:964:964}" alt="{$post->name|escape}">
		</div>
		<hr>
	{/if}

	{* Table of Content *}
	<article class="block-description content entry-content" itemprop="articleBody">
		{if $post->text|stristr:"h2" || $post->text|stristr:"h3" || $post->text|stristr:"h4"}
			<div class="table-of-contents bg-body-tertiary rounded open">
				<div class="table-of-contents-header pt-3 ps-3 pb-2">
					<h6 class="js-table-of-contents-hide table-of-contents-hide">
						{$lang->table_of_contents|escape}
						<i class="icon-action fa fa-chevron-down ms-1"></i>
					</h6>
				</div>
				<ol data-toc=".content" data-toc-headings="h2,h3,h4" class="table-of-contents-list js-table-of-contents-list"></ol>
			</div>
		{/if}

		{* Description *}
		{$post->text}
	</article>
</div>

{* Tags *}
<div class="tags">
	{foreach $tags as $tag}
		<a class="btn btn-outline-primary btn-sm me-1" href="{$lang_link}articles/?keyword={$tag}">#{$tag}</a>
	{/foreach}
</div>

{* Rating *}
<div class="btn-group vote pt-4">
	<a class="btn vote-button-plus" href="ajax/articles_rate.php?id={$post->id}&rate=up">
		<i class="fa fa-chevron-up" aria-hidden="true"></i>
	</a>
	{if $post->rate>0}
		<span class="btn vote-value pos">{$post->rate}</span>
	{elseif $post->rate == 0}
		<span class="btn text-muted vote-value">{$post->rate}</span>
	{else}
		<span class="btn vote-value neg">{$post->rate}</span>
	{/if}
	<a class="btn vote-button-minus" href="ajax/articles_rate.php?id={$post->id}&rate=down">
		<i class="fa fa-chevron-down" aria-hidden="true"></i>
	</a>
</div>

{* Prev & Next *}
{if $prev_post || $next_post}
	<hr>
	<div class="row">
		<div class="col-lg-6 col-sm-6 col-6 text-start">
			{if $prev_post}
				<a class="text-decoration-none" href="{$lang_link}article/{$prev_post->url}">
					<i class="fal fa-arrow-left me-2"></i>
					{$prev_post->name}
				</a>
			{/if}
		</div>
		<div class="col-lg-6 col-sm-6 col-6 text-end">
			{if $next_post}
				<a class="text-decoration-none" href="{$lang_link}article/{$next_post->url}">
					{$next_post->name}
					<i class="fal fa-arrow-right ms-2"></i>
				</a>
			{/if}
		</div>
	</div>

	<hr>
{/if}

{* Comments *}
{include file='comments/comments_aticles.tpl'}