{* Search Page Template *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->search scope=global}

	{* Canonical *}
	{$canonical="/search" scope=global}
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
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}search">
					<span itemprop="name">{$lang->search}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
	</ol>
</nav>

<div class="search-result-box card-box">
	{* Page Title *}
	{if isset($page->name)}
		<h1 class="my-4">
			<span data-page="{$page->id}">{$page->name|escape}</span>
		</h1>
	{else}
		<h1 class="my-4">{$lang->search}</h1>
	{/if}
	{if $theme_settings->header_type == "1"}
		<div class="row">
			<div class="col-md-8 offset-md-2 mt-4">
				<div class="pt-3 pb-4">
					<form class="input-group search-panel my-4" id="search-param" action="{$lang_link}search">
						<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							<span id="search-concept">{$lang->global_pages}</span>
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item active" data-input="pages-search" href="#{$lang_link}search">{$lang->global_pages}</a></li>
							<li><a class="dropdown-item" data-input="blog-search" href="#{$lang_link}blog">{$lang->global_blog}</a></li>
							<li><a class="dropdown-item" data-input="articles-search" href="#{$lang_link}articles">{$lang->global_articles}</a></li>
							<li><a class="dropdown-item" data-input="products-search" href="#{$lang_link}all-products">{$lang->global_products}</a></li>
						</ul>
						<input id="pages-search" class="form-control" autocomplete="off" type="text" name="keyword" value="{if isset($keyword)}{$keyword|escape}{/if}" placeholder="{$lang->search}...">
						<button type="submit" class="btn btn-success">
							<i class="fal fa-search me-1"></i>
							{$lang->search}
						</button>
					</form>
					<div class="mt-4 text-center">
						{if isset($keyword)}
							<h4>{$lang->search}: {$keyword|escape}</h4>
						{else}
							{$lang->enter_search_query}
						{/if}
						{if isset($pages_count)}{$pages_count}{/if}
					</div>
				</div>
			</div>
		</div>
	{else}
		<div class="my-4 text-center">
			{if isset($keyword)}
				<h4>{$lang->search}: {$keyword|escape}</h4>
			{else}
				{$lang->enter_search_query}
			{/if}
		</div>
	{/if}
	<div class="row">
		<div class="col-md-12">
			{if isset($keyword)}
				{if $pages_search}
					{foreach $pages_search as $page}
						{if $page->url!="404"}
							{if $page->visible}
								<div class="search-item my-3">
									<div class="h4 mb-1">
										<a data-page="{$page->id}" class="text-decoration-none" href="{$lang_link}{$page->url}">{$page->name|escape}</a>
									</div>
									<div class="font-13 mb-3">{$config->root_url}/{$lang_link}{$page->url}</div>
									<div class="mb-0 text-muted">{$page->body|strip_tags|truncate:250}</div>
								</div>
							{/if}
						{/if}
					{/foreach}
				{else}
					<div class="text-center">
						{$lang->nothing_found}
					</div>
				{/if}
			{/if}
		</div>
	</div>
</div>