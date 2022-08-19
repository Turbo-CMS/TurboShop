<div class="row">
	{foreach $categories as $c}
		{if $c->visible}
			<div class="col-lg-4 col-md-4 col-sm-6">
				<a href="{$lang_link}catalog/{$c->url}" class="text-decoration-none">
					<h5>{if $c->code}<i class="fal fa-{$c->code|escape} me-1"></i>{/if} {$c->name}</h5>
				</a>
				<ul class="list-group list-group-flush">
					{if $c->subcategories}
						{foreach $c->subcategories as $cat}
							{if $cat->visible}
								<li class="list-group-item"><a href="{$lang_link}catalog/{$cat->url}" class="text-decoration-none">{if $cat->code}<i class="fal fa-{$cat->code|escape} me-1"></i>{/if} {$cat->name}</a></li>
							{/if}
						{/foreach}
					{/if}
				</ul>
			</div>
		{/if}
	{/foreach}
</div>
<p class="mt-5">{$page->body}</p>