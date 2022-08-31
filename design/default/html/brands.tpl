{* Manufacturers page template *}

{* Canonical page address *}
{$canonical="/brands" scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}"><span itemprop="name">{$page->header|escape}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
	</ol>
</nav>
<!-- Breadcrumb #End /-->

<!-- Page title -->
<h1 data-page="{$page->id}" class="my-4">{$page->header|escape}</h1>

{$page->body}

{get_brands var=all_brands}
{if $all_brands}
	<div class="row">
		{foreach $all_brands as $b}
			<div class="col-lg-3 col-md-4">
				<a href="{$lang_link}brands/{$b->url}">
					<figure class="box item-logo">
						{if $b->image}
							<img src="{$b->image|resize_brands:125:42}" alt="{$b->name|escape}" title="{$b->name|escape}">
						{else}
							<a href="{$lang_link}brands/{$b->url}">
								<h3>{$b->name|escape}</h3>
							</a>
						{/if}
					</figure>
				</a><!-- item-logo.// -->
			</div> <!-- col.// -->
		{/foreach}
	</div> <!-- row.// -->
{else}
	<p>
		{$lang->no_brands_found}
	</p>
{/if}