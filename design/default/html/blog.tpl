{* Blog List *}

{* Canonical *}
{if $keyword}
	{$canonical="/blog/?keyword={$keyword|escape}" scope=global}
{else}
	{$canonical="/blog" scope=global}
{/if}

{if $posts}
	{* Toolbar *}
	<div class="btn-toolbar justify-content-between my-4" role="toolbar" aria-label="BlogToolbar">
		{* Title *}
		{if $keyword}
			<h1>#{$keyword|escape}</h1>
		{else}
			<h1 data-page="{$page->id}">{$page->name|escape}</h1>
		{/if}

		{* Sort *}
		<div class="align-self-center">
			<a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button" id="dropdownSortLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				{$lang->sort_by|escape}
			</a>
			<div class="dropdown-menu" aria-labelledby="dropdownSortLink">
				<a class="dropdown-item {if $sort=='date'}active{/if}" href="{url sort=date page=null}">{$lang->sort_date|escape}</a>
				<a class="dropdown-item {if $sort=='rate'}active{/if}" href="{url sort=rate page=null}">{$lang->by_rating|escape}</a>
			</div>
		</div>
	</div>
	{* Blog List *}
	<div class="row">
		{foreach $posts as $post}
			<div class="col-md-12 col-lg-6">
				{* Post Item *}
				<div itemscope itemtype="http://schema.org/Blog" class="card mb-4">
					<article itemprop="blogPosts" itemscope itemtype="http://schema.org/BlogPosting">
						{* Schema.org *}
						<div itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
							<meta itemprop="name" content="{$settings->site_name|escape}">
							<span itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
								<meta itemprop="image url" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png" />
								<meta property="url" content="{$config->root_url}/" />
							</span>
						</div>
						<meta itemprop="dateModified" content="{$post->date}">
						<meta itemprop="author" content="{$settings->site_name|escape}">
						<meta itemscope itemprop="mainEntityOfPage" itemType="https://schema.org/WebPage" itemid="/blog/{$post->url}" />
						<link itemprop="url" href="/blog/{$post->url}" />

						{* Image *}
						{if $post->image}
							<img class="card-img-top" src="{$post->image|resize_posts:750:300}" alt="{$post->name|escape}">
						{else}
							<span class="text-center mt-4">
								<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$post->name|escape}">
							</span>
						{/if}

						<div class="card-body">
							{* Name *}
							<h5 class="card-title">
								<a data-post="{$post->id}" itemprop="name headline" href="{$lang_link}blog/{$post->url}" class="text-decoration-none">
									{$post->name|escape}
								</a>
							</h5>

							{* Date *}
							<div class="mb-2">
								<small itemprop="datePublished" content="{$post->date}" class="text-muted">
									<i class="fal fa-calendar"></i>
									{$post->date|date}
								</small>
							</div>

							{* Description *}
							<div itemprop="description" class="card-text">{$post->annotation}</div>

							{* Count *}
							<div class="btn-group" role="group" aria-label="BlogCount">
								<a class="btn btn-link text-muted text-decoration-none" href="{$lang_link}blog/{$post->url}">
									<i class="fal fa-comment"></i>
									<span class="badge text-muted">
										{$post->comments_count}
									</span>
								</a>
								<a class="btn btn-link text-muted text-decoration-none" href="{$lang_link}blog/{$post->url}">
									<i class="fal fa-eye"></i>
									<span class="badge text-muted">{$post->views}</span>
								</a>
							</div>

							{* Rating *}
							<div class="float-end btn-group vote">
								<a class="btn vote-button-plus" href="ajax/blog_rate.php?id={$post->id}&rate=up">
									<i class="fa fa-chevron-up" aria-hidden="true"></i>
								</a>
								{if $post->rate > 0}
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
					</article>
				</div>
			</div>
		{/foreach}
	</div>

	{* Pagination *}
	{include file='paginations/pagination.tpl'}
{else}
	<div class="mb-3">
		{$lang->no_post_found|escape}
	</div>
{/if}