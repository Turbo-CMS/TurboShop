{* Home page *}

{$wrapper = 'index.tpl' scope=global}

{* Canonical page address *}
{$canonical="" scope=global}

{* Featured products *}
{get_featured_products var=featured_products limit=3}
{if $featured_products}
	<header class="section-heading">
		<a href="{$lang_link}featured" class="btn btn-outline-primary float-end">{$lang->see_all}</a>
		<h2 class="section-title my-2">{$lang->featured_products}</h2>
	</header>
	<hr>
	<div class="row">
		{foreach $featured_products as $product}
			{include file='grid.tpl'}
		{/foreach}
	</div>
{/if}

{* New products *}
{get_is_new_products var=new_products limit=3}
{if $new_products}
	<header class="section-heading">
		<a href="{$lang_link}new" class="btn btn-outline-primary float-end">{$lang->see_all}</a>
		<h2 class="section-title my-2">{$lang->new_arrivals}</h2>
	</header>
	<hr>
	<div class="row">
		{foreach $new_products as $product}
			{include file='grid.tpl'}
		{/foreach}
	</div>
{/if}

{* Discounted products *}
{get_discounted_products var=discounted_products limit=3}
{if $discounted_products}
	<header class="section-heading">
		<a href="{$lang_link}sale" class="btn btn-outline-primary float-end">{$lang->see_all}</a>
		<h2 class="section-title my-2">{$lang->sale}</h2>
	</header>
	<hr>
	<div class="row">
		{foreach $discounted_products as $product}
			{include file='grid.tpl'}
		{/foreach}
	</div>
{/if}

{* Hit *}
{get_is_hit_products var=hit_products limit=3}
{if $hit_products}
	<header class="section-heading">
		<a href="{$lang_link}hit" class="btn btn-outline-primary float-end">{$lang->see_all}</a>
		<h2 class="section-title my-2">{$lang->bestsellers}</h2>
	</header>
	<hr>
	<div class="row">
		{foreach $hit_products as $product}
			{include file='grid.tpl'}
		{/foreach}
	</div>
{/if}

{* Featured Categories *}
{get_featured_categories var=featured_categories}
{if $featured_categories}
	<h2 class="my-2">{$lang->popular_categories}</h2>
	<hr>
	<div class="row">
		{foreach $categories as $c}
			{if $c->featured}
				{if $c->visible}
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card">
							<div class="img-wrap">
								{if $c->image}
									<div class="image">
										<a href="{$lang_link}catalog/{$c->url}"><img class="card-img-top" src="{$c->image|resize_catalog:240:240}" alt="{$c->name}"></a>
									</div>
								{else}
									<div class="image">
										<a href="{$lang_link}catalog/{$c->url}"><img style="width: 170px; height: 170px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$c->name}" /></a>
									</div>
								{/if}
							</div>
							<div class="card-body">
								<a data-category="{$c->id}" class="title text-decoration-none" href="{$lang_link}catalog/{$c->url}">{$c->name|escape}</a>
							</div>
							{if $c->subcategories}
								<ul class="list-group list-group-flush">
									{foreach $c->subcategories as $cs}
										{if $cs->featured}
											{if $cs->visible}
												<li class="list-group-item"><a data-category="{$cs->id}" href="{$lang_link}catalog/{$cs->url}">{$cs->name}</a></li>
											{/if}
										{/if}
									{/foreach}
								</ul>
							{/if}
						</div>
					</div>
				{/if}
			{/if}
		{/foreach}
	</div>
{/if}

{* Page title *}
<h1>{$page->header}</h1>
{* Page body *}
{$page->body}