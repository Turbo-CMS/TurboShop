{* Wishlist *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->wishlist scope=global}

	{* Canonical *}
	{$canonical="/wishlist" scope=global}
{/if}

<!--title_content-->
<div class="page-top-info">
	<div class="page-top-wrapper page-top-wrapper--white">
		<section class="page-top maxwidth-theme">
			<div class="cowl">
				<div id="navigation">
					{$level = 1}
					<div class="breadcrumbs swipeignore" itemscope="" itemtype="http://schema.org/BreadcrumbList">
						<div class="breadcrumbs__item" id="tb_breadcrumb_0" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a class="breadcrumbs__link" href="{if $lang_link}{$lang_link}{else}/{/if}" title="{$lang->home}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->home}</span>
								<meta itemprop="position" content="{$level++}">
							</a>
						</div>
						<span class="breadcrumbs__separator">
							<i class="svg inline muted-use fill-dark-light" aria-hidden="true">
								<svg width="7" height="5">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
								</svg>
							</i>
						</span>
						{if isset($page)}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}{$page->url}" itemprop="item"><span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$page->header|escape}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{else}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}wishlist" itemprop="item"><span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->wishlist}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{/if}
					</div>
				</div>
			</div>
			<!--h1_content-->
			<div class="topic">
				<div class="topic__inner">
					<div class="topic__heading">
						<h1 id="pagetitle" class="switcher-title">
							{if isset($page->name)}
								<span data-page="{$page->id}">{$page->name|escape}</span>
							{else}
								{$lang->wishlist}
							{/if}
						</h1>
					</div>
				</div>
			</div>
			<!--/h1_content-->
		</section>
	</div>
</div>
<!--end-title_content-->

<div class="container cabinte-page">
	<div class="row">
		<div class="maxwidth-theme">
			<div class="col-md-12 col-sm-12 col-xs-12 content-md">
				<div class="right_block narrow_Y">
					<div class="personal__wrapper">
						<div class="personal__block personal__block--favorite-products">
							{if isset($products)}
								<!-- items-container -->
								<div class="catalog-items catalog_block_template">
									<div class="catalog-block" itemscope="" itemtype="http://schema.org/ItemList">
										<div class="js_append ajax_load block grid-list grid-list--fill-bg grid-list--compact grid-list--items-4-1200 grid-list--items-3-992 grid-list--items-2-768 grid-list--items-2-601">
											{foreach $products as $product}
												{include file='products/grid.tpl'}
											{/foreach}
										</div>
									</div>
								</div>
								<!-- items-container -->
							{else}
								<div class="col-md-12">
									<div class="alert alert-info">
										{$lang->wishlist_no_products}
									</div>
								</div>
							{/if}
						</div>
					</div>
				</div>
				<div class="left_block">
					<div class="sticky-block sticky-block--show-Y">
						<aside class="sidebar">
							<ul class="nav nav-list side-menu">
								{if $user}
									<li>
										<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
											<a href="{$lang_link}user" onclick="document.cookie='user=personal;path=/';document.location.reload();" class="dark_link top-level-link rounded-x link--active link-with-flag">{$lang->my_account}</a>
										</span>
									</li>
									<li>
										<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
											<a href="{$lang_link}user" onclick="document.cookie='user=private;path=/';document.location.reload();" class="dark_link top-level-link rounded-x link--active link-with-flag">{$lang->personal_data}</a>
										</span>
									</li>
									<li>
										<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
											<a href="{$lang_link}user" onclick="document.cookie='user=orders;path=/';document.location.reload();" class="dark_link top-level-link rounded-x link--active link-with-flag">{$lang->orders_global}</a>
										</span>
									</li>
									<li class="active opened">
										<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
											<a href="{$lang_link}wishlist" class="dark_link top-level-link rounded-x link--active link-with-flag">{$lang->wishlist_products}</a>
										</span>
									</li>
									<li>
										<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
											<a href="{$lang_link}faq" class="dark_link top-level-link rounded-x link-with-flag">{$lang->help}</a>
										</span>
									</li>
									<li>
										<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
											<a href="{$lang_link}user/logout" class="dark_link top-level-link rounded-x link-with-flag">{$lang->logout}</a>
										</span>
									</li>
								{else}
									{foreach $pages as $p}
										{if $p->menu_id == $page->menu_id}
											{if $p->visible}
												<li class="{if $page && $page->id == $p->id}active{/if} {if isset($p->subpages)}opened child{/if}">
													<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
														<a href="{$lang_link}{$p->url}" class="dark_link top-level-link rounded-x link-with-flag {if $page && $page->id == $p->id}link--active{/if}">
															<span data-page="{$p->id}">{$p->header|escape}</span>
														</a>
													</span>
													{if isset($p->subpages)}
														<div class="submenu-wrapper">
															<ul class="submenu">
																{foreach $p->subpages as $p2}
																	<li class="{if $page && $page->id == $p2->id}active{/if} {if isset($p2->subpages)}opened child{/if}">
																		<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
																			<a href="{$lang_link}{$p2->url}" class="dark_link sublink rounded-x {if $page && $page->id == $p2->id}link--active{/if}">
																				<span data-page="{$p2->id}">{$p2->header|escape}</span>
																			</a>
																		</span>
																		{if isset($p2->subpages)}
																			<div class="submenu-wrapper">
																				<ul class="submenu">
																					{foreach $p2->subpages as $p3}
																						<li class="{if $page && $page->id == $p3->id}active{/if}">
																							<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
																								<a href="{$lang_link}{$p3->url}" class="dark_link sublink rounded-x {if $page && $page->id == $p3->id}link--active{/if}">
																									<span data-page="{$p3->id}">{$p3->header|escape}</span>
																								</a>
																							</span>
																						</li>
																					{/foreach}
																				</ul>
																			</div>
																		{/if}
																	</li>
																{/foreach}
															</ul>
														</div>
													{/if}
												</li>
											{/if}
										{/if}
									{/foreach}
								{/if}
							</ul>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>