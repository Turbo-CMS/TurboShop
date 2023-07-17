{* Blog post list *}

{* Canonical page address *}
{if isset($keyword)}
	{$canonical="/blog/?keyword={$keyword|escape}" scope=global}
{else}
	{$canonical="/blog" scope=global}
{/if}

<!-- Breadcrumb /-->
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="1">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}blog"><span itemprop="name">{$lang->global_blog}</span></a>
			<meta itemprop="position" content="2">
		</li>
	</ol>
</nav>
<!-- Breadcrumb #End /-->

{if $posts}
	<div class="btn-toolbar justify-content-between my-4" role="toolbar" aria-label="Blog sort">
		{if isset($keyword)}
			<h1>#{$keyword|escape}</h1>
		{else}
			<h1>{$page->name|escape}</h1>
		{/if}
		<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownSortLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			{$lang->sort_by}
		</a>
		<div class="dropdown-menu" aria-labelledby="dropdownSortLink">
			<a class="dropdown-item {if $sort=='date'}active{/if}" href="{url sort=date page=null}">{$lang->sort_date}</a>
			<a class="dropdown-item {if $sort=='rate'}active{/if}" href="{url sort=rate page=null}">{$lang->by_rating}</a>
		</div>
	</div>
	<div class="row">
		{foreach $posts as $post}
			<div class="col-md-12 col-lg-6">
				<!-- Blog Post -->
				<div itemscope itemtype="http://schema.org/Blog" class="card mb-4">
					<article itemprop="blogPosts" itemscope itemtype="http://schema.org/BlogPosting">
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
						{if $post->image}
							<img class="card-img-top" src="{$post->image|resize_posts:750:300}" alt="{$post->name|escape}">
						{else}
							<span class="text-center mt-4">
								<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$article->name|escape}" />
							</span>
						{/if}
						<div class="card-body">
							<a href="{$lang_link}blog/{$post->url}" class="text-decoration-none card-title">
								<h2 itemprop="name headline" data-post="{$post->id}" class="h5">{$post->name|escape}</h2>
							</a>
							<p class="card-text"><small itemprop="datePublished" content="{$post->date}" class="text-muted"><i class="fal fa-calendar-alt"></i> {$post->date|date}</small></p>
							<p itemprop="description" class="card-text">{$post->annotation}</p>
							<div class="btn-group" role="group" aria-label="Blog group">
					<a class="btn btn-link text-muted" href="{$lang_link}blog/{$post->url}"><i class="far fa-comment"></i><span class="badge text-muted text-decoration-none">{if isset($post->comments_count)}{$post->comments_count}{/if}</span></a>
								<a class="btn btn-link text-muted" href="{$lang_link}blog/{$post->url}"><i class="far fa-eye"></i><span class="badge text-muted text-decoration-none">{$post->views}</span></a>
							</div>
							<span class="float-end btn-group vote">
								<a class="btn vote-button-plus" href="ajax/blog.rate.php?id={$post->id}&rate=up"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
								{if $post->rate>0}
									<span class="btn vote-value pos">{$post->rate}</span>
								{elseif $post->rate == 0}
									<span class="btn text-muted vote-value">{$post->rate}</span>
								{else}
									<span class="btn vote-value neg">{$post->rate}</span>
								{/if}
								<a class="btn vote-button-minus" href="ajax/blog.rate.php?id={$post->id}&rate=down"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
							</span>
						</div>
					</article>
				</div>
			</div>
		{/foreach}
	</div>
	<!-- Pagination -->
	{include file='pagination.tpl'}
{else}
	<p>
		{$lang->no_post_found}
	</p>
{/if}