{* Megamenu *}
<div class="dropdown me-3 d-none d-lg-block has-megamenu">
	<button class="btn btn-outline-menu px-6" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
		<i class="fal fa-grid-2" id="dropdownIcon"></i>
		{$lang->catalog|escape}
	</button>
	<div class="dropdown-menu megamenu">
		<div class="row">
			<div class="col-3">
				<ul class="nav flex-column categories-list">
					{foreach $categories as $c}
						<li class="nav-item position-relative">
							<a class="nav-link link-body-emphasis link-success-hover" href="{$lang_link}catalog/{$c->url}" data-cat="category{$c->id}">
								{if $c->code}<i class="fal fa-{$c->code|escape} me-2"></i>{/if}
								<span data-category="{$c->id}">{$c->name|escape}</span>
								{if $c->subcategories}
									<i class="fal fa-angle-right position-absolute end-0 me-3 top-50 translate-middle-y"></i>
								{/if}
							</a>
						</li>
					{/foreach}
				</ul>
			</div>
			<div class="col-9">
				{foreach $categories as $c name=loop}
					{if $c->subcategories}
						<div class="category-content h-100 {if $smarty.foreach.loop.first}active{else}d-none{/if}" id="category{$c->id}">
							<div class="row h-100">
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
									<div class="col-md-3 h-100">
										<div class="bg-body-emphasis h-100 pt-2">
											<span class="text-secondary ps-3 fs-6">{$lang->popular_categories|escape}</span>
											<ul class="nav flex-column mt-2">
												{foreach $c->subcategories as $cat}
													{if $cat->featured && $cat->visible}
														<li class="nav-item small">
															<a href="{$lang_link}catalog/{$cat->url}" class="nav-link nav-link-hover-underline link-body-emphasis link-success-hover ps-3">
																<span data-category="{$cat->id}">{$cat->name|escape}</span>
															</a>
														</li>
													{/if}
													{foreach $cat->subcategories as $cat3}
														{if $cat3->featured && $cat3->visible}
															<li class="nav-item small">
																<a href="{$lang_link}catalog/{$cat3->url}" class="nav-link nav-link nav-link-hover-underline link-body-emphasis link-success-hover ps-3">
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
								{foreach $c->subcategories as $cat}
									<div class="col-md-3">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link nav-link-hover-underline link-success-hover" href="{$lang_link}catalog/{$cat->url}">
													<span data-category="{$cat->id}">{$cat->name|escape}</span>
												</a>
											</li>
											{foreach $cat->subcategories as $cat3}
												<li class="nav-item small">
													<a class="nav-link nav-link-hover-underline link-body-emphasis link-success-hover" href="{$lang_link}catalog/{$cat3->url}">
														<span data-category="{$cat3->id}">{$cat3->name|escape}</span>
													</a>
												</li>
											{/foreach}
										</ul>
									</div>
								{/foreach}
							</div>
						</div>
					{/if}
				{/foreach}
			</div>
		</div>
	</div>
</div>