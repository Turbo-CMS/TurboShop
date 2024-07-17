{* List Articles *}

{* Canonical *}
{if isset($articles_category)}
	{$canonical="/articles/{$articles_category->url}" scope=global}
{elseif isset($keyword)}
	{$canonical="/articles/?keyword={$keyword|escape}" scope=global}
{elseif isset($author)}
	{$canonical="/articles/?author={$author|escape}" scope=global}
{else}
	{$canonical="/articles" scope=global}
{/if}

{* Breadcrumb *}
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="https://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}">
				<span itemprop="name" title="{$lang->home}"><i class="fal fa-house me-2"></i>{$lang->home}</span>
			</a>
			<meta itemprop="position" content="{$level++}" />
		</li>
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}articles">
				<span itemprop="name">{$lang->global_articles}</span>
			</a>
			<meta itemprop="position" content="{$level++}" />
		</li>
		{if isset($articles_category)}
			{foreach $articles_category->path as $cat}
				<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
					<a itemprop="item" class="text-decoration-none" href="{$lang_link}articles/{$cat->url}">
						<span itemprop="name">{$cat->name|escape}</span>
					</a>
					<meta itemprop="position" content="{$level++}" />
				</li>
			{/foreach}
		{elseif isset($keyword)}
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item active">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}articles?keyword={$keyword|escape}">
					<span itemprop="name">{$lang->search}</span>
				</a>
				<meta itemprop="position" content="{$level++}" />
			</li>
		{elseif isset($author)}
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item active">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}articles?author={$author|escape}">
					<span itemprop="name">{$lang->author}</span>
				</a>
				<meta itemprop="position" content="{$level++}" />
			</li>
		{/if}
	</ol>
</nav>

{if $posts}
	{* Toolbar *}
	<div class="btn-toolbar justify-content-between my-4" role="toolbar" aria-label="ArticlesToolbar">
		{* Title *}
		{if isset($keyword)}
			<h1>#{$keyword|escape}</h1>
		{elseif isset($author)}
			<h1>{$lang->author}: {$author|escape}</h1>
		{elseif isset($page)}
			<h1 data-page="{$page->id}">{$page->name|escape}</h1>
		{else}
			<h1 data-articles-category="{$articles_category->id}">
				{if isset($articles_category->name_h1) && $articles_category->name_h1}
					{$articles_category->name_h1|escape}
				{elseif isset($articles_category->name) && $articles_category->name}
					{$articles_category->name|escape}
				{/if}
			</h1>
		{/if}

		{* Sort *}
		<a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button" id="dropdownSortLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			{$lang->sort_by}
		</a>
		<div class="dropdown-menu" aria-labelledby="dropdownSortLink">
			<a class="dropdown-item {if $sort=='position'}active{/if}" href="{url sort=position page=null}">{$lang->default}</a>
			<a class="dropdown-item {if $sort=='date'}active{/if}" href="{url sort=date page=null}">{$lang->sort_date}</a>
			<a class="dropdown-item {if $sort=='rate'}active{/if}" href="{url sort=rate page=null}">{$lang->by_rating}</a>
		</div>
	</div>

	{* Articles List *}
	<div class="row">
		{foreach $posts as $post}
			<div class="col-md-12 col-lg-6">
				{* Article Item *}
				<div itemscope itemtype="http://schema.org/Article" class="card mb-4">
					<div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
						<meta itemprop="name" content="{$settings->site_name|escape}">
						<span itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
							<meta itemprop="image url" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png" />
							<meta property="url" content="{$config->root_url}/" />
						</span>
					</div>
					<meta itemprop="dateModified" content="{$post->date}">
					<meta itemprop="author" content="{$post->author|escape}">
					<meta itemscope itemprop="mainEntityOfPage" itemType="https://schema.org/WebPage" itemid="/article/{$post->url}" />
					<link itemprop="url" href="/article/{$post->url}" />

					{* Image *}
					{if $post->image}
						<img class="card-img-top" src="{$post->image|resize_articles:750:300}" alt="{$post->name|escape}">
					{else}
						<div class="text-center mt-4">
							<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$article->name|escape}">
						</div>
					{/if}

					<div class="card-body">
						{* Name *}
						<h5 class="card-title">
							<a data-article="{$post->id}" itemprop="name headline" href="{$lang_link}article/{$post->url}" class="text-decoration-none">
								{$post->name|escape}
							</a>
						</h5>

						{* Info *}
						<div class="small text-muted">
							<i class="fal fa-calendar me-1"></i>
							<span itemprop="datePublished" class="text-muted me-1" content="{$post->date}">{$post->date|date}</span>
							{if $post->author}
								<i class="fal fa-user-edit me-1"></i>
								<a class="mr-2 text-decoration-none me-1" href="{$lang_link}articles/?author={$post->author|escape}">
									{$post->author|escape}
								</a>
							{/if}
							{if $post->category->name}
								<i class="fal fa-edit me-1"></i>
								<a href="{$lang_link}articles/{$post->category->url}" class="text-decoration-none">
									{$post->category->name}
								</a>
							{/if}
						</div>

						{* Annotation *}
						<div itemprop="description" class="card-text mt-2">{$post->annotation}</div>

						{* Counts *}
						<div class="btn-group" role="group" aria-label="ArticleCounts">
							<a class="btn btn-link text-muted text-decoration-none" href="{$lang_link}article/{$post->url}">
								<i class="fal fa-comment"></i>
								<span class="badge text-muted">{$post->comments_count}</span>
							</a>
							<a class="btn btn-link text-muted text-decoration-none" href="{$lang_link}article/{$post->url}">
								<i class="fal fa-eye"></i>
								<span class="badge text-muted">{$post->views}</span>
							</a>
						</div>

						{* Rating *}
						<div class="float-end btn-group vote">
							<a class="btn vote-button-plus" href="ajax/articles_rate.php?id={$post->id}&rate=up">
								<i class="fa fa-chevron-up" aria-hidden="true"></i>
							</a>
							{if $post->rate>0}
								<div class="btn vote-value pos">{$post->rate}</div>
							{elseif $post->rate == 0}
								<div class="btn text-muted vote-value">{$post->rate}</div>
							{else}
								<div class="btn vote-value neg">{$post->rate}</div>
							{/if}
							<a class="btn vote-button-minus" href="ajax/articles_rate.php?id={$post->id}&rate=down">
								<i class="fa fa-chevron-down" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	</div>

	{* Pagination *}
	{include file='paginations/pagination.tpl'}

	{* Page description *}
	{if isset($page)}
		{$page->body}
	{/if}

	{* Category description *}
	{if isset($articles_category) && $current_page_num == 1}
		{$articles_category->description}
	{/if}	
{else}
	<div class="mb-3">
		{$lang->no_articles_found}
	</div>
{/if}