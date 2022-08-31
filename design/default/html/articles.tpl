{* List of articles *}

{* Canonical page address *}
{if $articles_category}
	{$canonical="/articles/{$articles_category->url}" scope=global}
{elseif $keyword}
	{$canonical="/articles/?keyword={$keyword|escape}" scope=global}
{else}
	{$canonical="/articles" scope=global}
{/if}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="https://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}articles"><span itemprop="name">{$lang->index_articles}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
		{foreach from=$articles_category->path item=cat}
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}articles/{$cat->url}"><span itemprop="name">{$cat->name|escape}</span></a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/foreach}
	</ol>
</nav>
<!-- Breadcrumb #End /-->

{if $posts}
	<div class="btn-toolbar justify-content-between my-4" role="toolbar" aria-label="Articles sort">
		{if $keyword}
			<h1>#{$keyword|escape}</h1>
		{elseif $page}
			<h1>{$page->name|escape}</h1>
		{else}
			<h1>{if $articles_category->name_h1}{$articles_category->name_h1|escape}{else}{$articles_category->name|escape}{/if}</h1>
		{/if}
		<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownSortLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			{$lang->sort_by}
		</a>
		<div class="dropdown-menu" aria-labelledby="dropdownSortLink">
			<a class="dropdown-item {if $sort=='position'}active{/if}" href="{url sort=position page=null}">{$lang->default}</a>
			<a class="dropdown-item {if $sort=='date'}active{/if}" href="{url sort=date page=null}">{$lang->sort_date}</a>
			<a class="dropdown-item {if $sort=='rate'}active{/if}" href="{url sort=rate page=null}">{$lang->by_rating}</a>
		</div>
	</div>
	{foreach $posts as $post}
		<!-- Blog Post -->
		<div itemscope itemtype="http://schema.org/Article" class="card mb-4 my-4">
			<div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
				<meta itemprop="name" content="{$settings->site_name|escape}">
				<span itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
					<meta itemprop="image url" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
					<meta property="url" content="{$config->root_url}/">
				</span>
			</div>
			<meta itemprop="dateModified" content="{$post->date}">
			<meta itemprop="author" content="{$post->author|escape}">
			<meta itemscope itemprop="mainEntityOfPage" itemType="https://schema.org/WebPage" itemid="/article/{$post->url}">
			<link itemprop="url" href="/article/{$post->url}">
			<div class="card-body">
				<a href="{$lang_link}article/{$post->url}" class="text-decoration-none">
					<h2 data-article="{$post->id}" itemprop="name headline" class="card-title">{$post->name|escape}</h2>
				</a>
				<p class="card-text">
					<small class="text-muted">
						<i class="fal fa-calendar-alt"></i><span itemprop="datePublished" class="me-1" content="{$post->date}">{$post->date|date}</span> 
						{if $post->author}<i class="fal fa-user-edit"></i><a class="text-decoration-none" href="{$lang_link}articles/?keyword={$post->author|escape}">{$post->author|escape}</a>{/if} 
						{if $post->category->name}<span class="ms-1"><i class="fal fa-edit"></i></span> <a href="{$lang_link}articles/{$post->category->url}" class="text-decoration-none">{$post->category->name}</a>{/if}
					</small>
				</p>
				{if $post->image}<img itemprop="image" class="card-img-top" src="{$post->image|resize_articles:750:750}" alt="{$post->name|escape}">{/if}
				<p itemprop="description" class="card-text">{$post->annotation}</p>
				<div class="btn-group" role="group" aria-label="Article group">
					<a class="btn btn-link text-muted" href="{$lang_link}article/{$post->url}"><i class="far fa-comment"></i><span class="badge text-muted text-decoration-none">{$post->comments}</span></a>
					<a class="btn btn-link text-muted" href="{$lang_link}article/{$post->url}"><i class="far fa-eye"></i><span class="badge text-muted text-decoration-none">{$post->views}</span></a>
				</div>
				<span class="float-end btn-group vote">
					<a class="btn vote-button-plus" href="ajax/articles.rate.php?id={$post->id}&rate=up"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
					{if $post->rate>0}
						<span class="btn vote-value pos">{$post->rate}</span>
					{elseif $post->rate == 0}
						<span class="btn text-muted vote-value">{$post->rate}</span>
					{else}
						<span class="btn vote-value neg">{$post->rate}</span>
					{/if}
					<a class="btn vote-button-minus" href="ajax/articles.rate.php?id={$post->id}&rate=down"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
				</span>
			</div>
		</div>
	{/foreach}
	<!-- Pagination -->
	{include file='pagination.tpl'}
{else}
	<p>
		{$lang->no_articles_found}
	</p>
{/if}