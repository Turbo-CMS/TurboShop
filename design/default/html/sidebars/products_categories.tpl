{if $categories}
	<div class="list-group my-4">
		{foreach $categories as $c}
			{if $c->visible}
				<div class="hidden-sm-down list-group-item {if isset($category->id) && $category->id == $c->id}bg-primary{/if}">
					<a data-category="{$c->id}" class="text-decoration-none" href="{$lang_link}catalog/{$c->url}">
						{if $c->code}<i class="fal fa-{$c->code|escape} me-2"></i>{/if}{$c->name|escape}
						<span class="badge badge-pill bg-light text-dark text-dark float-end">{$c->products_count}</span>
					</a>
					{if isset($c->subcategories)}
						<a data-bs-toggle="collapse" data-parent="#sidebar" class="text-decoration-none" href="#menu-{$c->id}" {if isset($category) && in_array($category->id, $c->children)}aria-expanded="true"{/if}>
							<i class="far fa-angle-down"></i>
						</a>
					{/if}
				</div>
				{if isset($c->subcategories)}
					<div class="collapse cat {if isset($category) && in_array($category->id, $c->children)}show{/if}" id="menu-{$c->id}">
						{foreach $c->subcategories as $cat}
							{if $cat->visible}
								<div class="hidden-sm-down list-group-item {if isset($category->id) && $category->id == $cat->id}bg-primary{/if}">
									<a data-category="{$cat->id}" class="text-decoration-none" href="{$lang_link}catalog/{$cat->url}">
										{if $cat->code}<i class="fal fa-{$cat->code|escape} me-2"></i>{/if}{$cat->name|escape}
										<span class="badge badge-pill bg-light text-dark text-dark float-end">{$cat->products_count}</span>
									</a>
									{if isset($cat->subcategories)}
										<a data-bs-toggle="collapse" aria-expanded="false" class="text-decoration-none" href="#menusub-{$cat->id}" {if isset($category) && in_array($category->id, $cat->children)}aria-expanded="true"{/if}>
											<i class="far fa-angle-down"></i>
										</a>
									{/if}
								</div>
								{if isset($cat->subcategories)}
									<div class="collapse cat3 {if isset($category) && in_array($category->id, $cat->children)}show{/if}" id="menusub-{$cat->id}">
										{foreach $cat->subcategories as $cat3}
											{if $cat3->visible}
												<a href="{$lang_link}catalog/{$cat3->url}" class="list-group-item text-decoration-none {if $category->id == $cat3->id}bg-primary text-white{/if}" data-category="{$cat3->id}" data-parent="#menusub-{$cat->id}">
													{if $cat3->code}<i class="fal fa-{$cat3->code|escape} me-2"></i>{/if}{$cat3->name|escape}
													<span class="badge badge-pill bg-light text-dark float-end">{$cat3->products_count}</span>
												</a>
											{/if}
										{/foreach}
									</div>
								{/if}
							{/if}
						{/foreach}
					</div>
				{/if}
			{/if}
		{/foreach}
		<div class="hidden-sm-down list-group-item {if isset($page) && $page->url=='all-products'}bg-primary{/if}">
			<a href="{$lang_link}all-products" class="text-decoration-none">
				<i class="fal fa-grid-2 me-2"></i>
				{$lang->all_products}
			</a>
		</div>
	</div>
{/if}