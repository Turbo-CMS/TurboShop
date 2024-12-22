{* Offcanvas Categories *}

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasCategories" aria-labelledby="offcanvasCategoriesLabel">
	<div class="offcanvas-header border-bottom">
		<h5 class="offcanvas-title" id="offcanvasCategoriesLabel" data-category="{$lang->catalog|escape}">{$lang->catalog|escape}</h5>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="{$lang->close|escape}"></button>
	</div>
	<div class="offcanvas-body p-0">
		<ul class="nav">
			{foreach $categories as $c}
				{if $c->visible}
					<li class="nav-item w-100">
						{if $c->subcategories}
							<a href="javascript:void(0);" class="nav-link nav-link link-body-emphasis link-success-hover d-flex align-items-center justify-content-between px-3" data-bs-toggle="offcanvas" data-bs-target="#categories{$c->id}" aria-controls="categories{$c->id}">
								<span class="d-flex align-items-center">
									{if $c->code}<i class="fal fa-{$c->code|escape}"></i>{/if}
									<span class="ms-2" data-category="{$c->id}">{$c->name|escape}</span>
								</span>
								<i class="far fa-angle-right"></i>
							</a>
						{else}
							<a href="{$lang_link}catalog/{$c->url}" class="nav-link nav-link link-body-emphasis link-success-hover d-flex align-items-center justify-content-between px-3">
								<span class="d-flex align-items-center">
									{if $c->code}<i class="fal fa-{$c->code|escape}"></i>{/if}
									<span class="ms-2" data-category="{$c->id}">{$c->name|escape}</span>
								</span>
							</a>
						{/if}
					</li>
				{/if}
			{/foreach}
		</ul>
	</div>
</div>

{foreach $categories as $c}
	{if $c->visible}
		{if $c->subcategories}
			<div class="offcanvas offcanvas-start" tabindex="-1" id="categories{$c->id}" aria-labelledby="categories{$c->id}Label">
				<div class="offcanvas-header border-bottom">
					<h5 class="offcanvas-title" id="categories{$c->id}Label" data-category="{$c->id}">{$c->name|escape}</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="{$lang->close|escape}"></button>
				</div>
				<div class="offcanvas-body p-0">
					<ul class="nav flex-column pt-3">
						<li class="nav-item">
							<a href="javascript:void(0);" class="nav-link link-body-emphasis ps-4" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCategories" aria-controls="offcanvasCategories">
								<i class="fal fa-angle-left"></i>
								{$lang->all_categories|escape}
							</a>
						</li>
						<li class="nav-item">
							<a href="{$lang_link}catalog/{$c->url}" class="nav-link nav-link-hover-underline nav-link-hover-reset ps-4">
								<span data-category="{$c->id}">{$c->name|escape}</span>
							</a>
						</li>

						{assign var="has_featured" value=false}

						{foreach $c->subcategories as $cat}
							{if $cat->featured}
								{assign var="has_featured" value=true}
								{break}
							{/if}
							{foreach $cat->subcategories as $cat3}
								{if $cat3->featured}
									{assign var="has_featured" value=true}
									{break}
								{/if}
							{/foreach}
						{/foreach}

						{if $has_featured}
							<div class="px-3">
								<div class="bg-body-emphasis pt-2">
									<span class="text-muted ps-2 fs-6">{$lang->popular_categories|escape}</span>
									{foreach $c->subcategories as $cat}
										{if $cat->featured && $cat->visible}
											<li class="nav-item small">
												<a href="{$lang_link}catalog/{$cat->url}" class="nav-link nav-link-hover-underline link-body-emphasis link-success-hover ps-2">
													<span data-category="{$cat->id}">{$cat->name|escape}</span>
												</a>
											</li>
										{/if}
										{foreach $cat->subcategories as $cat3}
											{if $cat3->featured && $cat3->visible}
												<li class="nav-item small">
													<a href="{$lang_link}catalog/{$cat3->url}" class="nav-link nav-link nav-link-hover-underline link-body-emphasis link-success-hover ps-2">
														<span data-category="{$cat3->id}">{$cat3->name|escape}</span>
													</a>
												</li>
											{/if}
										{/foreach}
									{/foreach}
								</div>
							</div>
						{/if}

						{foreach $c->subcategories as $cat}
							{if $cat->visible}
								<li class="nav-item">
									<a href="{$lang_link}catalog/{$cat->url}" class="nav-link nav-link-hover-underline link-success-hover ps-4">
										<span data-category="{$cat->id}">{$cat->name|escape}</span>
									</a>
								</li>
							{/if}
							{foreach $cat->subcategories as $cat3}
								{if $cat3->visible}
									<li class="nav-item small">
										<a href="{$lang_link}catalog/{$cat3->url}" class="nav-link nav-link-hover-underline link-body-emphasis link-success-hover ps-4">
											<span data-category="{$cat3->id}">{$cat3->name|escape}</span>
										</a>
									</li>
								{/if}
							{/foreach}
						{/foreach}
					</ul>
				</div>
			</div>
		{/if}
	{/if}
{/foreach}