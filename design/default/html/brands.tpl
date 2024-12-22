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
{if $page}
	{$page->body}
{/if}

{get_brands var=all_brands}
{if $all_brands}
	<div class="row">
		{foreach $all_brands as $b}
			<div class="col-sm-4 col-md-4 col-lg-4 col-xl-3 col-xxl-3">
				<a data-brand="{$b->id}" href="{$lang_link}brands/{$b->url}">
					<div class="box item-logo">
						{if $b->image}
							<img src="{$b->image|resize_brands:125:42}" alt="{$b->name|escape}" title="{$b->name|escape}">
						{else}
							<a href="{$lang_link}brands/{$b->url}">
								<h3>{$b->name|escape}</h3>
							</a>
						{/if}
					</div>
				</a>
			</div>
		{/foreach}
	</div>
{else}
	<div class="my-1">
		{$lang->no_brands_found|escape}
	</div>
{/if}