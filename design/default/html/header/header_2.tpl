<div class="border-bottom">
	<div class="bg-body-tertiary py-1">
		<div class="container">
			<div class="row">
				<div class="col-6 text-start">
					{* Theme Mode *}
					<div class="nav-link">
						<div class="form-check form-switch">
							{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
								<input role="button" type="checkbox" onclick="document.cookie='mode=;path=/';document.location.reload();" class="form-check-input" id="darkSwitch">
								<label role="button" class="custom-control-label" for="darkSwitch"><i class="fal fa-moon"></i></label>
							{else}
								<input role="button" type="checkbox" onclick="document.cookie='mode=mode;path=/';document.location.reload();" class="form-check-input" id="darkSwitch" checked>
								<label role="button" class="custom-control-label" for="darkSwitch"><i class="fal fa-sun-bright"></i></label>
							{/if}
						</div>
					</div>
				</div>
				<div class="col-6 text-end">
					<div class="d-flex justify-content-end">
						{* Callback *}
						<a class="nav-link me-3" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#callbackModal" role="button">
							<i class="fal fa-headset text-primary me-1"></i>
							<span class="d-none d-lg-inline-block">{$lang->callback}</span>
						</a>
						{* Languages & Currencies *}
						{if $languages|count > 1 || $currencies|count > 1}
							<div class="dropdown">
								<a class="dropdown-toggle text-reset text-decoration-none" href="#{$lang_link}" data-bs-toggle="dropdown" aria-expanded="false">
									<span class="flag-icon flag-icon-{$language->label|escape} me-1"></span>
									{$language->label|escape|capitalize} / {$currency->sign|escape}
								</a>
								<ul class="dropdown-menu my-1">
									{if $currencies|count > 1}
										<li class="dropdown-item">
											<select class="form-select form-select-sm" onchange="location.href=this.value">
												{foreach $currencies as $c}
													{if $c->enabled}
														<option value="{url currency_id=$c->id}" {if $c->id==$currency->id}selected="selected"{/if}>{$c->sign|escape} {$c->code|escape}</option>
													{/if}
												{/foreach}
											</select>
										</li>
									{/if}
									{foreach $languages as $l}
										<li>
											<a class="dropdown-item pb-1 {if $language->id == $l->id}active{/if}" href="{$l->url}">
												<span class="flag-icon flag-icon-{$l->label}"></span>
												{$l->name}
											</a>
										</li>
									{/foreach}
								</ul>
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="py-3">
		<div class="container">
			<div class="row w-100 align-items-center gx-lg-2 gx-0">
				<div class="col-xxl-3 col-lg-3">
					{* Logo *}
					{if $module=='MainView'}
						<div class="navbar-brand d-none d-lg-block">
							<div class="h2">
								<i class="fal fa-shopping-bag text-success"></i>
								<span class="logo-main">TurboShop</span>
							</div>
						</div>
					{else}
						<a class="{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}text-white{else}text-dark{/if} card-link text-decoration-none navbar-brand d-none d-lg-block" href="{if $lang_link}{$lang_link}{else}/{/if}">
							<span class="h2">
								<i class="fal fa-shopping-bag text-success"></i>
								TurboShop
							</span>
						</a>
					{/if}
					<div class="d-flex justify-content-between w-100 d-lg-none">
						{* Logo Mobile *}
						{if $module=='MainView'}
							<div class="navbar-brand">
								<div class="h2">
									<i class="fal fa-shopping-bag text-success"></i>
									<span class="logo-main">TurboShop</span>
								</div>
							</div>
						{else}
							<a class="{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}text-white{else}text-dark{/if} card-link text-decoration-none navbar-brand" href="{if $lang_link}{$lang_link}{else}/{/if}">
								<span class="h2">
									<i class="fal fa-shopping-bag text-success"></i>
									TurboShop
								</span>
							</a>
						{/if}
						{* Informers Mobile *}
						<div class="d-flex align-items-center lh-1">
							<div class="list-inline me-4">
								<div class="list-inline-item">
									{if $user}
										<a href="{$lang_link}user" class="text-primary">
											<i class="fal fa-user fs-5"></i>
										</a>
									{else}
										<a href="#!" class="text-muted" data-bs-toggle="modal" data-bs-target="#userModal">
											<i class="fal fa-user fs-5"></i>
										</a>
									{/if}
								</div>
								<div class="list-inline-item">
									<div id="cart-informer-mobile">
										{include file='informers/cart_informer_mobile.tpl'}
									</div>
								</div>
							</div>
							<button class="navbar-toggler collapsed" type="button" data-bs-toggle="offcanvas" data-bs-target="#navbar-default" aria-controls="navbar-default" aria-label="Toggle navigation">
								<i class="fal fa-bars text-muted fs-5"></i>
							</button>
						</div>
					</div>
				</div>
				{* Search *}
				<div class="col-xxl-7 col-lg-7 d-none d-lg-block">
					<form class="input-group search-panel my-4" id="search-param" action="{$lang_link}all-products">
						<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"><span id="search-concept">{$lang->global_products}</span></button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item active" data-input="products-search" href="#{$lang_link}all-products">{$lang->global_products}</a></li>
							<li><a class="dropdown-item" data-input="pages-search" href="#{$lang_link}search">{$lang->global_pages}</a></li>
							<li><a class="dropdown-item" data-input="blog-search" href="#{$lang_link}blog">{$lang->global_blog}</a></li>
							<li><a class="dropdown-item" data-input="articles-search" href="#{$lang_link}articles">{$lang->global_articles}</a></li>
						</ul>
						<input id="products-search" class="form-control" autocomplete="off" type="text" name="keyword" value="{if isset($keyword)}{$keyword|escape}{/if}" placeholder="{$lang->search}...">
						<button type="submit" class="btn btn-success"><i class="fal fa-search me-1"></i> {$lang->search}</button>
					</form>
				</div>
				{* Informers Desktop *}
				<div class="col-md-2 col-xxl-2 text-end d-none d-lg-block">
					<div class="list-inline">
						<div class="list-inline-item me-4 me-lg-3">
							<div id="wishlist-informer">
								{include file='informers/wishlist_informer_2.tpl'}
							</div>
						</div>
						<div class="list-inline-item me-4 me-lg-3">
							<div id="compare-informer">
								{include file='informers/compare_informer_2.tpl'}
							</div>
						</div>
						<div class="list-inline-item me-4 me-lg-3">
							{if $user}
								<a href="{$lang_link}user" class="text-primary">
									<i class="fal fa-user fs-5"></i>
								</a>
							{else}
								<a href="#!" class="text-muted" data-bs-toggle="modal" data-bs-target="#userModal">
									<i class="fal fa-user fs-5"></i>
								</a>
							{/if}
						</div>
						<div class="list-inline-item">
							<div id="cart-informer-2">
								{include file='informers/cart_informer_2.tpl'}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	{* Navbar *}
	<nav class="navbar navbar-expand-lg navbar-light navbar-default py-0 pb-lg-4 " aria-label="Offcanvas navbar large">
		<div class="container">
			<div class="offcanvas offcanvas-start" tabindex="-1" id="navbar-default" aria-labelledby="navbar-defaultLabel">
				<div class="offcanvas-header pb-1">
					{* Logo Offcanvas *}
					{if $module=='MainView'}
						<div class="h2">
							<i class="fal fa-shopping-bag text-success"></i>
							<span class="logo-main">TurboShop</span>
						</div>
					{else}
						<a class="{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}text-white{else}text-dark{/if} text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}">
							<span class="h2">
								<i class="fal fa-shopping-bag text-success"></i>
								TurboShop
							</span>
						</a>
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					{* Search Offcanvas *}
					<div class="d-block d-lg-none mb-4">
						<form class="input-group search-panel my-4" id="search-param" action="{$lang_link}search">
							<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"></button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item active" data-input="pages-search" href="#{$lang_link}search">{$lang->global_pages}</a></li>
								<li><a class="dropdown-item" data-input="blog-search" href="#{$lang_link}blog">{$lang->global_blog}</a></li>
								<li><a class="dropdown-item" data-input="articles-search" href="#{$lang_link}articles">{$lang->global_articles}</a></li>
								<li><a class="dropdown-item" data-input="products-search" href="#{$lang_link}all-products">{$lang->global_products}</a></li>
							</ul>
							<input id="pages-search" class="form-control" autocomplete="off" type="text" name="keyword" value="{if isset($keyword)}{$keyword|escape}{/if}" placeholder="{$lang->search}...">
							<button type="submit" class="btn btn-success"><i class="fal fa-search me-1"></i></button>
						</form>
					</div>
					{* All Departament Offcanvas *}
					<div class="d-block d-lg-none mb-4">
						<a class="btn btn-primary w-100 d-flex justify-content-center align-items-center" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
							<i class="fal fa-grid-2 me-1"></i>
							{$lang->all_departments}
						</a>
						<div class="all-departament collapse mt-2" id="collapseExample">
							<div class="card card-body px-0 py-2">
								<ul class="mb-0 list-unstyled">
									{foreach $categories as $c}
										<li>
											<a class="dropdown-item {if isset($category->id) && $category->id == $c->id}active{/if}" href="{$lang_link}catalog/{$c->url}">
												{if $c->code}<i class="fal fa-{$c->code|escape} me-2"></i>{/if}{$c->name|escape}
											</a>
										</li>
									{/foreach}
								</ul>
							</div>
						</div>
					</div>
					{* All Departament *}
					<div class="dropdown me-3 d-none d-lg-block">
						<button class="btn btn-primary px-6" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fal fa-grid-2 me-1"></i>
							{$lang->all_departments}
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							{foreach $categories as $c}
								<li>
									<a class="dropdown-item {if isset($category->id) && $category->id == $c->id}active{/if}" href="{$lang_link}catalog/{$c->url}">
										{if $c->code}<i class="fal fa-{$c->code|escape} me-2"></i>{/if}<span data-category="{$c->id}">{$c->name|escape}</span>
									</a>
								</li>
							{/foreach}
						</ul>
					</div>
					{* Pages *}
					<div class="mb-0">
						<ul class="navbar-nav align-items-center">
							{foreach $pages as $p}
								{if $p->menu_id == 1}
									{if $p->visible}
										<li class="nav-item dropdown w-100 w-lg-auto {if $page && $page->id == $p->id}active{/if}">
											<a class="nav-link {if isset($p->subpages)}dropdown-toggle{/if}" href="{$lang_link}{$p->url}" id="dropdown-{$p->id}" {if isset($p->subpages)}data-bs-toggle="dropdown" aria-expanded="false"{/if} aria-haspopup="true"><span data-page="{$p->id}">{$p->header}</span></a>
											{if isset($p->subpages)}
												<ul class="dropdown-menu" aria-labelledby="dropdown-{$p->id}">
													{foreach $p->subpages as $p2}
														<li><a class="dropdown-item {if $page && $page->id == $p2->id}active{/if}" href="{$lang_link}{$p2->url}"><span data-page="{$p2->id}">{$p2->header}</span></a></li>
													{/foreach}
												</ul>
											{/if}
										</li>
									{/if}
								{/if}
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>