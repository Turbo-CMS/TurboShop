{* List Articles *}

{* Canonical *}
{if $articles_category}
	{$canonical="/articles/{$articles_category->url}" scope=global}
{elseif $keyword}
	{$canonical="/articles/?keyword={$keyword|escape}" scope=global}
{elseif $author}
	{$canonical="/articles/?author={$author|escape}" scope=global}
{else}
	{$canonical="/articles" scope=global}
{/if}

{* Title *}
{if $keyword}
	<h1>{$keyword|escape}</h1>
{elseif $author}
	<h1>{$lang->author|escape}: {$author|escape}</h1>
{elseif $page}
	<h1><span data-page="{$page->id}">{$page->name|escape}</span></h1>
{else}
	<h1>
		{if $articles_category->name_h1}
			<span data-articles-category="{$articles_category->id}">{$articles_category->name_h1|escape}</span>
		{elseif $articles_category->name}
			<span data-articles-category="{$articles_category->id}">{$articles_category->name|escape}</span>
		{/if}
	</h1>
{/if}

{* Articles List *}
<div class="row pt-3 mt-md-2">
	<div class="col-lg-9">
		{if $posts}
			{* Sort *}
			<div class="d-flex justify-content-end mb-3">
				<div class="align-self-center">
					<a class="btn btn-sm btn-outline-default dropdown-toggle" href="#" role="button" id="dropdownSortLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						{$lang->sort_by|escape}
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdownSortLink">
						<a class="dropdown-item {if $sort=='position'}active{/if}" href="{url sort=position page=null}">{$lang->default|escape}</a>
						<a class="dropdown-item {if $sort=='date'}active{/if}" href="{url sort=date page=null}">{$lang->sort_date|escape}</a>
						<a class="dropdown-item {if $sort=='rate'}active{/if}" href="{url sort=rate page=null}">{$lang->by_rating|escape}</a>
					</div>
				</div>
			</div>

			<div class="row">
				{* Articles *}
				{foreach $posts as $post}
					{* Article Item *}
					<div class="col-md-6 col-lg-12 col-xl-6">
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
									<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$post->name|escape}">
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
									{* Date *}
									<i class="fal fa-calendar me-1"></i>
									<span itemprop="datePublished" class="text-muted me-1" content="{$post->date}">{$post->date|date}</span>

									{* Author *}
									{if $post->author}
										<i class="fal fa-user-edit me-1"></i>
										<a class="mr-2 text-decoration-none me-1" href="{$lang_link}articles/?author={$post->author|escape}">
											{$post->author|escape}
										</a>
									{/if}

									{* Category *}
									{if $post->category->name}
										<i class="fal fa-edit me-1"></i>
										<a href="{$lang_link}articles/{$post->category->url}" class="text-decoration-none">
											{$post->category->name}
										</a>
									{/if}
								</div>

								{* Annotation *}
								<div itemprop="description" class="card-text mt-2">{$post->annotation}</div>

								<div class="d-flex justify-content-between align-items-center">
									{* Counts *}
									<div class="btn-group" role="group" aria-label="ArticleCounts">
										<a class="btn btn-link text-muted text-decoration-none" href="{$lang_link}article/{$post->url}">
											<i class="fal fa-message-lines"></i>
											<span class="badge text-muted">{$post->comments_count}</span>
										</a>
										<a class="btn btn-link text-muted text-decoration-none" href="{$lang_link}article/{$post->url}">
											<i class="fal fa-eye"></i>
											<span class="badge text-muted">{$post->views}</span>
										</a>
									</div>

									{* Rating *}
									<div class="d-flex align-items-center vote">
										<a class="vote-button-plus" href="ajax/articles_rate.php?id={$post->id}&rate=up">
											<i class="far fa-thumbs-up cursor-pointer"></i>
										</a>
										{if $post->rate > 0}
											<span class="vote-value mx-3 text-success">{$post->rate}</span>
										{elseif $post->rate == 0}
											<span class="vote-value mx-3">{$post->rate}</span>
										{else}
											<span class="vote-value mx-3 text-danger">{$post->rate}</span>
										{/if}
										<a class="vote-button-minus" href="ajax/articles_rate.php?id={$post->id}&rate=down">
											<i class="far fa-thumbs-down cursor-pointer"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				{/foreach}
			</div>

			{* Pagination *}
			{include file='paginations/pagination.tpl'}

			{* Page description *}
			{$page->body}

			{* Category Description *}
			{if $articles_category && $current_page_num == 1}
				{$articles_category->description}
			{/if}
		{else}
			<div class="alert alert-primary mt-3" role="alert">
				{$lang->no_articles_found|escape}
			</div>
		{/if}
	</div>

	{* Articles Sidebar *}
	{include file='sidebar/articles_sidebar.tpl'}
</div>