<div class="row">
	{foreach $categories as $c}
		{if $c->visible}
			<div class="col-sm-6 col-md-4 col-lg-3 col-xl-2 mb-5">
				<div class="card border-0 rounded-0 border-end">
					<div class="img-wrap">
						{if $c->image}
							<div class="image">
								<a href="{$lang_link}catalog/{$c->url}">
									<img class="card-img-top" src="{$c->image|resize_catalog:240:240}" alt="{$c->name}">
								</a>
							</div>
						{else}
							<div class="image">
								<a href="{$lang_link}catalog/{$c->url}">
									<img style="width: 170px; height: 170px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$c->name}">
								</a>
							</div>
						{/if}
					</div>
					<div class="card-body">
						<div class="card-title fs-5 lh-sm {if !$c->subcategories}text-center{/if}">
							<a data-category="{$c->id}" class="text-decoration-none" href="{$lang_link}catalog/{$c->url}">
								{if $c->code}<i class="fal fa-{$c->code|escape} me-1"></i>{/if}
								{$c->name|escape}
							</a>
						</div>
						{if $c->subcategories}
							<ul class="nav flex-column">
								{foreach $c->subcategories as $cs}
									{if $cs->visible}
										<li class="nav-item">
											<a data-category="{$cs->id}" href="{$lang_link}catalog/{$cs->url}" class="nav-link ps-0">
												{if $cs->code}<i class="fal fa-{$cs->code|escape} me-1"></i>{/if}
												{$cs->name}
											</a>
										</li>
									{/if}
								{/foreach}
							</ul>
						{/if}
					</div>
				</div>
			</div>
		{/if}
	{/foreach}
</div>

{* Page Body *}
{if $page}
	<div class="mt-5">{$page->body}</div>
{/if}