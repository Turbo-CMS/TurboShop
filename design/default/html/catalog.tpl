<div class="row">
	{foreach $categories as $c}
		{if $c->visible}
			<div class="col-lg-4 col-md-4 col-sm-6 mb-4">
				<a href="{$lang_link}catalog/{$c->url}" class="text-decoration-none fs-5">
					{if $c->code}<i class="fal fa-{$c->code|escape} me-1"></i>{/if}
					{$c->name}
				</a>
				<ul class="list-group list-group-flush mb-1">
					{if $c->subcategories}
						{foreach $c->subcategories as $cat}
							{if $cat->visible}
								<li class="list-group-item">
									<a href="{$lang_link}catalog/{$cat->url}" class="text-decoration-none">
										{if $cat->code}<i class="fal fa-{$cat->code|escape} me-1"></i>{/if}
										{$cat->name}
									</a>
								</li>
							{/if}
						{/foreach}
					{/if}
				</ul>
			</div>
		{/if}
	{/foreach}
</div>

{* Page Body *}
{if $page}
	<div class="mt-5">{$page->body}</div>
{/if}