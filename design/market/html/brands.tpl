{* Brands Page *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->global_brands scope=global}

	{* Canonical *}
	{$canonical="/brands" scope=global}
{/if}

{* Page Title *}
{if $page}
	<h1 class="my-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-4">{$lang->global_brands|escape}</h1>
{/if}

{* Page Body *}
{$page->body}

{get_brands var=all_brands}
{if $all_brands}
	<div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3">
		{foreach $all_brands as $b}
			<div class="col">
				<a data-brand="{$b->id}" href="{$lang_link}brands/{$b->url}" class="border rounded d-flex align-items-center justify-content-center p-3 bg-body-emphasis" style="height: 150px;">
					{if $b->image}
						<img src="{$b->image|resize_brands:150:150}" alt="{$b->name|escape}" class="img-fluid">
					{else}
						<img style="width: 80px; height: 80px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$b->name|escape}" class="img-fluid">
					{/if}
				</a>
			</div>
		{/foreach}
	</div>
{else}
	<div class="my-1">
		{$lang->no_brands_found|escape}
	</div>
{/if}