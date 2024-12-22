{* Search Page Template *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->search scope=global}

	{* Canonical *}
	{$canonical="/search" scope=global}
{/if}

<div class="row justify-content-center">
	<div class="col-md-12 col-lg-9 col-xl-8">
		<div class="search-result-box card-box">
			{* Page Title *}
			{if $page}
				<h1 class="my-4">
					<span data-page="{$page->id}">{$page->name|escape}</span>
				</h1>
			{else}
				<h1 class="my-4">{$lang->search|escape}</h1>
			{/if}

			<div class="row">
				<div class="col-md-8 offset-md-2 mt-4">
					<div class="pt-3 pb-4">
						<form class="input-group search-panel my-4" id="search-param" action="{$lang_link}search">
							<button class="btn btn-outline-default dropdown-toggle z-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
								<span id="search-concept">{$lang->global_pages|escape}</span>
							</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item active" data-input="pages-search" href="#{$lang_link}search">{$lang->global_pages|escape}</a></li>
								<li><a class="dropdown-item" data-input="blog-search" href="#{$lang_link}blog">{$lang->global_blog|escape}</a></li>
								<li><a class="dropdown-item" data-input="articles-search" href="#{$lang_link}articles">{$lang->global_articles|escape}</a></li>
								<li><a class="dropdown-item" data-input="products-search" href="#{$lang_link}all-products">{$lang->global_products|escape}</a></li>
							</ul>
							<input id="pages-search" class="form-control" autocomplete="off" type="text" name="keyword" value="{$keyword|escape}" placeholder="{$lang->search|escape}...">
							<button type="submit" class="btn btn-success">
								<i class="fal fa-search me-1"></i>
								{$lang->search|escape}
							</button>
						</form>
						<div class="mt-4 text-center">
							{if $keyword}
								<h4>{$lang->search|escape}: {$keyword|escape}</h4>
							{else}
								{$lang->enter_search_query|escape}
							{/if}
							{$pages_count}
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					{if $keyword}
						{if $pages_search}
							{foreach $pages_search as $page}
								{if $page->url!="404"}
									{if $page->visible}
										<div class="search-item my-3">
											<div class="h4 mb-1">
												<a data-page="{$page->id}" class="text-decoration-none" href="{$lang_link}{$page->url}">{$page->name|escape}</a>
											</div>
											<div class="font-13 mb-3 text-success">{$config->root_url}/{$lang_link}{$page->url}</div>
											<div class="mb-0 text-muted">{$page->body|strip_tags|truncate:250}</div>
										</div>
									{/if}
								{/if}
							{/foreach}
						{else}
							<div class="text-center">
								{$lang->nothing_found|escape}
							</div>
						{/if}
					{/if}
				</div>
			</div>
		</div>
	</div>
</div>