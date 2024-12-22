{* Home Page *}

{* Wrapper *}
{$wrapper = 'index.tpl' scope=global}

{* Canonical *}
{$canonical="" scope=global}

{* Featured Products *}
{get_products featured=1 var=featured_products limit=$theme_settings->featured_limit}
{if $featured_products}
	<div class="d-flex justify-content-between align-items-center py-3">
		<h2 class="fs-5">{$lang->featured_products|escape}</h2>
		<a href="{$lang_link}featured" class="link-underline link-underline-opacity-0 link-underline-opacity-100-hover">
			{$lang->see_all|escape}
			<i class="fal fa-arrow-right"></i>
		</a>
	</div>
	<div class="row g-0 border-start border-top">
		{foreach $featured_products as $product}
			<div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
				{include file='products/grid.tpl'}
			</div>
		{/foreach}
	</div>
{/if}

{* New Products *}
{get_products is_new=1 var=new_products limit=$theme_settings->new_limit}
{if $new_products}
	<div class="d-flex justify-content-between align-items-center py-3">
		<h2 class="fs-5">{$lang->new_arrivals|escape}</h2>
		<a href="{$lang_link}new" class="link-underline link-underline-opacity-0 link-underline-opacity-100-hover">
			{$lang->see_all|escape}
			<i class="fal fa-arrow-right"></i>
		</a>
	</div>
	<div class="row g-0 border-start border-top">
		{foreach $new_products as $product}
			<div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
				{include file='products/grid.tpl'}
			</div>
		{/foreach}
	</div>
{/if}

{* Discounted Products *}
{get_products discounted=1 var=discounted_products limit=$theme_settings->discounted_limit}
{if $discounted_products}
	<div class="d-flex justify-content-between align-items-center py-3">
		<h2 class="fs-5">{$lang->sale|escape}</h2>
		<a href="{$lang_link}sale" class="link-underline link-underline-opacity-0 link-underline-opacity-100-hover">
			{$lang->see_all|escape}
			<i class="fal fa-arrow-right"></i>
		</a>
	</div>
	<div class="row g-0 border-start border-top">
		{foreach $discounted_products as $product}
			<div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
				{include file='products/grid.tpl'}
			</div>
		{/foreach}
	</div>
{/if}

{* Hit Products *}
{get_products is_hit=1 var=hit_products limit=$theme_settings->hit_limit}
{if $hit_products}
	<div class="d-flex justify-content-between align-items-center py-3">
		<h2 class="fs-5">{$lang->bestsellers|escape}</h2>
		<a href="{$lang_link}hit" class="link-underline link-underline-opacity-0 link-underline-opacity-100-hover">
			{$lang->see_all|escape}
			<i class="fal fa-arrow-right"></i>
		</a>
	</div>
	<div class="row g-0 border-start border-top">
		{foreach $hit_products as $product}
			<div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
				{include file='products/grid.tpl'}
			</div>
		{/foreach}
	</div>
{/if}

{* Page Title *}
{if $page}
	<h1 class="mt-3 fs-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>

	{* Page Body *}
	{$page->body}
{/if}
