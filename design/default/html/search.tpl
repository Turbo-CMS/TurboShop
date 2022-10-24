{* Search page template *}

{* Canonical page address *}
{$canonical="/{$page->url}" scope=global}

<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="1">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}"><span itemprop="name">{$page->header|escape}</span></a>
			<meta itemprop="position" content="2">
		</li>
	</ol>
</nav>

<div class="search-result-box card-box">
	<h1 data-page="{$page->id}" class="mb-3">{$lang->site_search}</h1>
	<div class="row">
		<div class="col-md-8 offset-md-2 mt-4">
			<div class="pt-3 pb-4">
				<form class="input-group my-4" action="{$lang_link}search">
					<input class="form-control" autocomplete="off" type="text" name="keyword" value="{$keyword|escape}" placeholder="{$lang->search}...">
					<button type="submit" class="btn btn-success"><i class="fal fa-search me-1"></i> {$lang->search}</button>
				</form>
				<div class="mt-4 text-center">
					{if $keyword}
						<h4>{$lang->search}: {$keyword|escape}</h4>
					{/if}
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			{if $keyword}
				{if $posts || $pages_search || $articles}

					<!-- Blog -->
					{foreach $posts as $post}
						<div class="search-item mt-3">
							<h4 class="mb-1"><a data-post="{$post->id}" class="text-decoration-none" href="{$lang_link}blog/{$post->url}">{$post->name|escape}</a></h4>
							<div class="font-13 mb-3">{$config->root_url}/{$lang_link}blog/{$post->url}</div>
							<small>{$post->date|date}</small>
							<p class="mb-0 text-muted">{$post->annotation|strip_tags|truncate:250}</p>
						</div>
					{/foreach}

					<!-- Articles -->
					{foreach $articles as $article}
						<div class="search-item mt-3">
							<h4 class="mb-1"><a data-article="{$article->id}" class="text-decoration-none" href="{$lang_link}article/{$article->url}">{$article->name|escape}</a></h4>
							<div class="font-13 mb-3">{$config->root_url}/{$lang_link}article/{$article->url}</div>
							<small>{$article->date|date}</small>
							<p class="mb-0 text-muted">{$article->annotation|strip_tags|truncate:250}</p>
						</div>
					{/foreach}

					<!-- Pages -->
					{foreach $pages_search as $page}
						{if $page->visible}
							<div class="search-item mt-3">
								<h4 class="mb-1"><a data-page="{$page->id}" class="text-decoration-none" href="{$lang_link}{$page->url}">{$page->name|escape}</a></h4>
								<div class="font-13 mb-3">{$config->root_url}/{$lang_link}{$page->url}</div>
								<p class="mb-0 text-muted">{$page->body|strip_tags|truncate:250}</p>
							</div>
						{/if}
					{/foreach}

					<div class="col-md-12">
						{include file='pagination.tpl'}
					</div>
				{else}
					<p class="text-center">
						{$lang->nothing_found}
					</p>
				{/if}

			{else}
				<p class="text-center">
					{$lang->enter_search_query}
				</p>
			{/if}
			<div class="clearfix"></div>
		</div>
	</div>
</div>