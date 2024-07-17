{* List Products *}

{* Canonical *}
{if isset($page)}
	{$canonical="/{$page->url}" scope=global}
{elseif isset($category) && isset($brand)}
	{$canonical="/catalog/{$category->url}/{$brand->url}" scope=global}
{elseif isset($category)}
	{$canonical="/catalog/{$category->url}" scope=global}
{elseif isset($brand)}
	{$canonical="/brands/{$brand->url}" scope=global}
{elseif isset($keyword)}
	{$canonical="/all-products?keyword={$keyword|escape}" scope=global}
{else}
	{$canonical="/all-products" scope=global}
{/if}

{* Load *}
{if isset($smarty.get.tpl) && $smarty.get.tpl == 'new'}
	{$wrapper='loading/new.tpl' scope=global}
{/if}

{if isset($smarty.get.tpl) && $smarty.get.tpl == 'recommend'}
	{$wrapper='loading/recommend.tpl' scope=global}
{/if}

{if isset($smarty.get.tpl) && $smarty.get.tpl == 'stock'}
	{$wrapper='loading/stock.tpl' scope=global}
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
						{if isset($page) && !isset($category)}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}{$page->url}" itemprop="item"><span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$page->header|escape}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{/if}
						{if isset($category)}
							<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<a class="breadcrumbs__link" href="{$lang_link}catalog" title="{$lang->catalog}" itemprop="item">
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->catalog}</span>
									<meta itemprop="position" content="{$level++}">
								</a>
							</div>
							{foreach $category->path as $cat}
								<span class="breadcrumbs__separator">
									<i class="svg inline muted-use fill-dark-light" aria-hidden="true">
										<svg width="7" height="5">
											<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
										</svg>
									</i>
								</span>
								<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
									<a class="breadcrumbs__link" href="{$lang_link}catalog/{$cat->url}" title="{$cat->name|escape}" itemprop="item">
										<span itemprop="name" class="breadcrumbs__item-name font_13">{$cat->name|escape}</span>
										<meta itemprop="position" content="{$level++}">
									</a>
								</div>
							{/foreach}
							{if isset($brand)}
								<span class="breadcrumbs__separator">
									<i class="svg inline muted-use fill-dark-light" aria-hidden="true">
										<svg width="7" height="5">
											<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
										</svg>
									</i>
								</span>
								<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
									<a class="breadcrumbs__link" href="{$lang_link}catalog/{$cat->url}/{$brand->url}" title="{$brand->name|escape}" itemprop="item">
										<span itemprop="name" class="breadcrumbs__item-name font_13">{$brand->name|escape}</span>
										<meta itemprop="position" content="{$level++}">
									</a>
								</div>
							{/if}
							{if isset($page)}
								<span class="breadcrumbs__separator">
									<i class="svg inline muted-use fill-dark-light" aria-hidden="true">
										<svg width="7" height="5">
											<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
										</svg>
									</i>
								</span>
								<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
									<a class="breadcrumbs__link" href="{$lang_link}{$page->url}" title="{$page->header|escape}" itemprop="item">
										<span itemprop="name" class="breadcrumbs__item-name font_13">{$page->header|escape}</span>
										<meta itemprop="position" content="{$level++}">
									</a>
								</div>
							{/if}
						{elseif isset($brand)}
							<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<a class="breadcrumbs__link" href="{$lang_link}brands" title="{$lang->global_brands}" itemprop="item">
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->global_brands}</span>
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
							<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<a class="breadcrumbs__link" href="{$lang_link}brands/{$brand->url}" title="{$brand->name|escape}" itemprop="item">
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$brand->name|escape}</span>
									<meta itemprop="position" content="{$level++}">
								</a>
							</div>
						{elseif isset($wishlist)}
							<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<a class="breadcrumbs__link" href="{$lang_link}wishlist/" title="{$lang->wishlist}" itemprop="item">
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->wishlist}</span>
									<meta itemprop="position" content="{$level++}">
								</a>
							</div>
						{elseif isset($keyword)}
							<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<a class="breadcrumbs__link" href="{$lang_link}all-products?keyword={$keyword|escape}" title="{$lang->search}" itemprop="item">
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->search}</span>
									<meta itemprop="position" content="{$level++}">
								</a>
							</div>
						{/if}
					</div>
				</div>
			</div>
			<!--h1_content-->
			<div class="topic">
				<div class="topic__inner">
					<div class="topic__heading">
						{* Page Title *}
						{if isset($keyword)}
							<h1 id="pagetitle" class="switcher-title">{$lang->search} {$keyword|escape}</h1>
						{elseif isset($page)}
							<h1 id="pagetitle" class="switcher-title" data-page="{$page->id}">{$page->name|escape}</h1>
						{else}
							{if isset($category) && $category->name_h1}
								<h1 id="pagetitle" class="switcher-title" data-category="{$category->id}">
									{$category->name_h1|escape}
								</h1>
							{elseif isset($category) && $category->name}
								<h1 id="pagetitle" class="switcher-title" data-category="{$category->id}">
									{$category->name|escape}
								</h1>
							{/if}

							{if isset($brand) && $brand->name_h1}
								<h1 id="pagetitle" class="switcher-title" data-brand="{$brand->id}">
									{$brand->name_h1|escape}
								</h1>
							{elseif isset($brand) && $brand->name}
								<h1 id="pagetitle" class="switcher-title" data-brand="{$brand->id}">
									{$brand->name|escape}
								</h1>
							{/if}
							</h1>
						{/if}
					</div>
				</div>
			</div>
			<!--/h1_content-->
		</section>
	</div>
</div>
<!--end-title_content-->

{* Catalog *}
{if isset($page) && $page->url=='catalog'}
	{include file='catalog.tpl'}
{else}
	<div class="container">
		<div class="row">
			<div class="maxwidth-theme">
				<div class="col-md-12 col-sm-12 col-xs-12 content-md">
					<div class="right_block narrow_N catalog_page">
						{if isset($brand) && $brand->description}
							<div class="partner-detail">
								<div class="partner-detail__card bordered outer-rounded-x">
									{if $brand->image}
										<div class="partner-detail__card-image">
											<div class="partner-detail__image-wrapper rounded-x">
												<div class="partner-detail__image">
													<span class="partner-detail__image-bg lazyload" title="{$brand->name}" style="background-image: url(&quot;{$brand->image|resize_brands:142:60}&quot;);" data-bg="{$brand->image|resize_brands:142:60}"></span>
												</div>
											</div>
										</div>
									{/if}
									<div class="partner-detail__card-info">
										<div class="partner-detail__content">
											<div class="partner-detail__text-wrapper">
												<div class="partner-detail__text linecamp-4">
													{$brand->description}
												</div>
											</div>
										</div>
										<div class="partner-detail__more-detail-text-link active hide">
											<span class="choise dotted dark_link">{$lang->moredetails}</span>
										</div>
									</div>
								</div>
							</div>
						{/if}
						{* Subcategories *}
						{if isset($category->subcategories)}
							{include file='products/catalog_category.tpl'}
						{/if}
						<div class="main-wrapper flexbox flexbox--direction-row">
							<div class="section-content-wrapper with-leftblock flex-1">
								{if isset($products)}
									<div class="js_wrapper_items">
										<div class="js-load-wrapper">
											<div class="filter-panel sort_header view_table flexbox flexbox--direction-row flexbox--justify-beetwen">
												<div class="filter-panel__part-left">
													<div class="line-block filter-panel__main-info">
														{if isset($category->brands) || isset($features)}
															<div class="line-block__item filter-panel__filter visible-991">
																<div class="fill-theme-hover dark_link">
																	<div class="tb-filter-title filter_title active-filter">
																		<i class="svg inline  svg-inline-icon svg-inline-catalog fill-dark-light" aria-hidden="true">
																			<svg xmlns="http://www.w3.org/2000/svg" width="12" height="10" viewBox="0 0 12 10">
																				<path data-name="Rectangle 636 copy 5" class="cls-1" d="M574.593,665.783L570,670.4V674l-2-1v-2.6l-4.6-4.614a0.94,0.94,0,0,1-.2-1.354,0.939,0.939,0,0,1,.105-0.16,0.969,0.969,0,0,1,.82-0.269h9.747a0.968,0.968,0,0,1,.82.269,0.94,0.94,0,0,1,.087.132A0.945,0.945,0,0,1,574.593,665.783Zm-8.164.216L569,668.581,571.571,666h-5.142Z" transform="translate(-563 -664)"></path>
																			</svg>
																		</i>
																		<span class="font_upper_md dotted font_bold">{$lang->filter}</span>
																	</div>
																	<div class="controls-hr"></div>
																</div>
															</div>
														{/if}
														<div class="line-block__item">
															<div class="filter-panel__sort">
																<div class="dropdown-select dropdown-select--with-dropdown">
																	<div class="dropdown-select__title font_14 font_large fill-dark-light bordered rounded-x shadow-hovered shadow-no-border-hovered">
																		<span>
																			{if $sort=='position'}
																				{$lang->default}
																			{elseif $sort=='name'}
																				{$lang->name_a_z}
																			{elseif $sort=='name_desc'}
																				{$lang->name_z_a}
																			{elseif $sort=='price'}
																				{$lang->cheap_expensive}
																			{elseif $sort=='price_desc'}
																				{$lang->expensive_cheap}
																			{elseif $sort=='rate'}
																				{$lang->by_rating}
																			{/if}
																		</span>
																		<i class="svg inline dropdown-select__icon-down" aria-hidden="true">
																			<svg width="7" height="5">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																			</svg>
																		</i>
																	</div>
																	<div class="dropdown-select__list dropdown-menu-wrapper" role="menu">
																		<div class="dropdown-menu-inner rounded-x">
																			<div class="dropdown-select__list-item font_15">
																				{if $sort=='position'}
																					<span class="dropdown-menu-item color_222 dropdown-menu-item--current">
																						<span>{$lang->default}</span>
																					</span>
																				{else}
																					<a href="{furl sort=position page=null}" class="dropdown-menu-item dark_link">
																						<span>{$lang->default}</span>
																					</a>
																				{/if}
																			</div>
																			<div class="dropdown-select__list-item font_15">
																				{if $sort=='name'}
																					<span class="dropdown-menu-item color_222 dropdown-menu-item--current">
																						<span>{$lang->name_a_z}</span>
																					</span>
																				{else}
																					<a href="{furl sort=name page=null}" class="dropdown-menu-item dark_link">
																						<span>{$lang->name_a_z}</span>
																					</a>
																				{/if}
																			</div>
																			<div class="dropdown-select__list-item font_15">
																				{if $sort=='name_desc'}
																					<span class="dropdown-menu-item color_222 dropdown-menu-item--current">
																						<span>{$lang->name_z_a}</span>
																					</span>
																				{else}
																					<a href="{furl sort=name_desc page=null}" class="dropdown-menu-item dark_link">
																						<span>{$lang->name_z_a}</span>
																					</a>
																				{/if}
																			</div>
																			<div class="dropdown-select__list-item font_15">
																				{if $sort=='price'}
																					<span class="dropdown-menu-item color_222 dropdown-menu-item--current">
																						<span>{$lang->cheap_expensive}</span>
																					</span>
																				{else}
																					<a href="{furl sort=price page=null}" class="dropdown-menu-item dark_link">
																						<span>{$lang->cheap_expensive}</span>
																					</a>
																				{/if}
																			</div>
																			<div class="dropdown-select__list-item font_15">
																				{if $sort=='price_desc'}
																					<span class="dropdown-menu-item color_222 dropdown-menu-item--current">
																						<span>{$lang->expensive_cheap}</span>
																					</span>
																				{else}
																					<a href="{furl sort=price_desc page=null}" class="dropdown-menu-item dark_link">
																						<span>{$lang->expensive_cheap}</span>
																					</a>
																				{/if}
																			</div>
																			<div class="dropdown-select__list-item font_15">
																				{if $sort=='rate'}
																					<span class="dropdown-menu-item color_222 dropdown-menu-item--current">
																						<span>{$lang->by_rating}</span>
																					</span>
																				{else}
																					<a href="{furl sort=rate page=null}" class="dropdown-menu-item dark_link">
																						<span>{$lang->by_rating}</span>
																					</a>
																				{/if}
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="filter-panel__part-right">
													<div class="toggle-panel hide-600">
														{if !isset($smarty.cookies.view) || isset($smarty.cookies.view) && $smarty.cookies.view == 'grid'}
															<span title="{$lang->grid_display}" class="toggle-panel__item toggle-panel__item--current">
																<i class="svg inline" aria-hidden="true">
																	<svg width="10px" height="10px">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/toggle_view.svg#table"></use>
																	</svg>
																</i>
															</span>
														{else}
															<a rel="nofollow prefetch" onclick="document.cookie='view=grid;path=/';document.location.reload();" href="javascript:;" title="{$lang->grid_display}" class="toggle-panel__item muted-use-no-hover">
																<i class="svg inline fill-dark-light" aria-hidden="true">
																	<svg width="10px" height="10px">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/toggle_view.svg#table"></use>
																	</svg>
																</i>
															</a>
														{/if}
														{if isset($smarty.cookies.view) && $smarty.cookies.view == 'list'}
															<span title="{$lang->list_display}" class="toggle-panel__item toggle-panel__item--current">
																<i class="svg inline" aria-hidden="true">
																	<svg width="10px" height="10px">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/toggle_view.svg#list"></use>
																	</svg>
																</i>
															</span>
														{else}
															<a rel="nofollow prefetch" onclick="document.cookie='view=list;path=/';document.location.reload();" href="javascript:;" title="{$lang->list_display}" class="toggle-panel__item muted-use-no-hover">
																<i class="svg inline fill-dark-light" aria-hidden="true">
																	<svg width="10px" height="10px">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/toggle_view.svg#list"></use>
																	</svg>
																</i>
															</a>
														{/if}
														{if isset($smarty.cookies.view) && $smarty.cookies.view == 'price'}
															<span title="{$lang->price_display}" class="toggle-panel__item toggle-panel__item--current">
																<i class="svg inline" aria-hidden="true">
																	<svg width="10px" height="10px">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/toggle_view.svg#price"></use>
																	</svg>
																</i>
															</span>
														{else}
															<a rel="nofollow prefetch" onclick="document.cookie='view=price;path=/';document.location.reload();" href="javascript:;" title="{$lang->price_display}" class="toggle-panel__item muted-use-no-hover">
																<i class="svg inline fill-dark-light" aria-hidden="true">
																	<svg width="10px" height="10px">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/toggle_view.svg#price"></use>
																	</svg>
																</i>
															</a>
														{/if}
													</div>
												</div>
											</div>
											<div class="inner_wrapper relative">
												{if isset($smarty.cookies.view) && $smarty.cookies.view == 'list'}
													<div class="ajax_load list-view">
														<div class="catalog-items catalog_list_template">
															<div class="catalog-list" itemscope="" itemtype="http://schema.org/ItemList">
																<div class="js_append ajax_load list grid-list grid-list--items-1 grid-list--compact grid-list--no-gap">
																	{foreach $products as $product}
																		{include file='products/list.tpl'}
																	{/foreach}
																</div>
																{if $total_pages_num > 1}
																	<div class="bottom_nav_wrapper nav-compact">
																		<div class="bottom_nav">
																			{if $current_page_num < $total_pages_num}
																				<div class="ajax_load_btn">
																					<span class="more_text_ajax btn btn-transparent">
																						{$lang->load_more}
																					</span>
																				</div>
																			{/if}
																			{include file='components/chpu_pagination.tpl'}
																		</div>
																	</div>
																{/if}
															</div>
														</div>
													</div>
												{elseif isset($smarty.cookies.view) && $smarty.cookies.view == 'price'}
													<div class="ajax_load price-view">
														<div class="catalog-items catalog_table_template" data-i-appeared="true">
															<div class="catalog-table" itemscope="" itemtype="http://schema.org/ItemList">
																<div class="catalog-table__outer-wrapper catalog-table--hidden bordered outer-rounded-x">
																	<div id="table-scroller-wrapper" class="js_append ajax_load list grid-list grid-list--items-1 grid-list--compact grid-list--no-gap">
																		<div id="table-scroller-wrapper__header" class="hide-600"></div>
																		{foreach $products as $product name=test}
																			{include file='products/price.tpl'}
																		{/foreach}
																	</div>
																</div>
																{if $total_pages_num > 1}
																	<div class="bottom_nav_wrapper nav-compact">
																		<div class="bottom_nav">
																			{if $current_page_num < $total_pages_num}
																				<div class="ajax_load_btn">
																					<span class="more_text_ajax btn btn-transparent">
																						{$lang->load_more}
																					</span>
																				</div>
																			{/if}
																			{include file='components/chpu_pagination.tpl'}
																		</div>
																	</div>
																{/if}
															</div>
														</div>
													</div>
												{else}
													<div class="ajax_load table-view">
														<div class="catalog-items catalog_block_template">
															<div class="catalog-block" itemscope="" itemtype="http://schema.org/ItemList">
																<div class="js_append ajax_load block grid-list grid-list--fill-bg grid-list--compact {if isset($category->brands) || isset($features) || isset($category->subcategories)}grid-list--items-4-1200{else}grid-list--items-5-1200{/if} grid-list--items-3-992 grid-list--items-2-768 grid-list--items-2-601">
																	{foreach $products as $product}
																		{include file='products/grid.tpl'}
																	{/foreach}
																</div>
																{if $total_pages_num > 1}
																	<div class="bottom_nav_wrapper nav-compact">
																		<div class="bottom_nav">
																			{if $current_page_num < $total_pages_num}
																				<div class="ajax_load_btn">
																					<span class="more_text_ajax btn btn-transparent">
																						{$lang->load_more}
																					</span>
																				</div>
																			{/if}
																			{include file='components/chpu_pagination.tpl'}
																		</div>
																	</div>
																{/if}
															</div>
														</div>
													</div>
												{/if}
												{if $current_page_num == 1}
													{if $page || isset($category) && $category->description}
														<div class="group_description_block bottom color_666">
															{if isset($page->body) && $page->body}
																{* Page Body *}
																{$page->body}
															{elseif !$noindex_filter && !isset($smarty.get.page) && !isset($smarty.get.sort)}
																{if isset($category) && $category->description}
																	{* Category Description *}
																	{$category->description}
																{/if}
															{/if}
														</div>
													{/if}
												{/if}
											</div>
										</div>
									</div>
								{else}
									<div class="personal__wrapper">
										<div class="no_goods catalog_block_view">
											<div class="no_products">
												<div class="wrap_text_empty">
													<span class="big_text font_24">{$lang->section_empty}</span><br>
													<span class="middle_text font_14 color_666">{$lang->no_products_text}</span>
												</div>
											</div>
										</div>
									</div>
								{/if}
							</div>
							{if isset($category->brands) && $category->brands || isset($features) && $features || isset($category->subcategories) && $category->subcategories}
								<div class="left_block">
									<div class="sticky-block sticky-block--show-N">
										{if isset($category->subcategories)}
											<aside class="sidebar">
												<div class="slide-block">
													<div class="slide-block__head title-menu stroke-theme-parent-all color_222 dropdown-select__title fill-dark-light opened" data-id="MENU">
														{$lang->category}
														<i class="svg inline dropdown-select__icon-down" aria-hidden="true">
															<svg width="7" height="5">
																<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
															</svg>
														</i>
													</div>
													<div class="slide-block__body">
														<ul class="nav nav-list side-menu">
															<li class="active opened child">
																<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
																	<a href="{$lang_link}catalog/{$category->url}" class="dark_link top-level-link rounded-x link--active link-with-flag">
																		<span data-category="{$category->id}">{$category->name|escape}</span>
																	</a>
																</span>
																<div class="submenu-wrapper">
																	<ul class="submenu">
																		{foreach $category->subcategories as $c}
																			<li class="opened child">
																				<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
																					<a href="{$lang_link}catalog/{$c->url}" class="dark_link sublink rounded-x sublink--child">
																						<span data-category="{$c->id}">{$c->name|escape}</span>
																					</a>
																				</span>
																				{if isset($c->subcategories)}
																					<div class="submenu-wrapper">
																						<ul class="submenu">
																							{foreach $c->subcategories as $cat}
																								<li class="{if $category && $category->id == $cat->id}active{/if} {if isset($cat->subcategories)}opened child{/if}">
																									<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
																										<a href="{$lang_link}catalog/{$cat->url}" class="dark_link sublink rounded-x">
																											<span data-category="{$cat->id}">{$cat->name|escape}</span>
																										</a>
																									</span>
																									{if isset($cat->subcategories)}
																										<div class="submenu-wrapper">
																											<ul class="submenu">
																												{foreach $cat->subcategories as $cat3}
																													<li class="{if $category && $category->id == $cat3->id}active{/if}">
																														<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
																															<a href="{$lang_link}catalog/{$cat3->url}" class="dark_link sublink rounded-x {if $category && $category->id == $cat3->id}link--active{/if}">
																																<span data-category="{$cat3->id}">{$cat3->name|escape}</span>
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
																		{/foreach}
																	</ul>
																</div>
															</li>
														</ul>
													</div>
												</div>
											</aside>
										{/if}
										{if isset($category->brands) || isset($features)}
											<div class="sidearea">
												<div class="tb_filter tb_filter_vertical catalog swipeignore">
													<div class="smartfilter">
														<div class="tb_filter_parameters_box title color_222 font_12 text-upper font-bold visible-991">
															<div class="tb_filter_parameters_box_title filter_title">
																<i class="svg inline svg-inline-catalog fill-dark-light" aria-hidden="true">
																	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="10" viewBox="0 0 12 10">
																		<path data-name="Rectangle 636 copy 5" class="cls-1" d="M574.593,665.783L570,670.4V674l-2-1v-2.6l-4.6-4.614a0.94,0.94,0,0,1-.2-1.354,0.939,0.939,0,0,1,.105-0.16,0.969,0.969,0,0,1,.82-0.269h9.747a0.968,0.968,0,0,1,.82.269,0.94,0.94,0,0,1,.087.132A0.945,0.945,0,0,1,574.593,665.783Zm-8.164.216L569,668.581,571.571,666h-5.142Z" transform="translate(-563 -664)"></path>
																	</svg>
																</i>
																<span>{$lang->filter}</span>
																<i class="svg inline svg-close close-icons fill-theme-hover fill-use-svg-999" aria-hidden="true">
																	<svg width="14" height="14">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-14-14"></use>
																	</svg>
																</i>
															</div>
														</div>
														<div class="tb_filter_parameters">
															{if ($minprice != 0 && $maxprice != 0) && ($minprice != $maxprice)}
																<form method="post">
																	<div class="tb_filter_parameters_box dropdown-select active">
																		<span class="tb_filter_container_modef" data-f="{$lang->show}"></span>
																		<div class="tb_filter_parameters_box_title dropdown-select__title fill-dark-light">
																			{$lang->general_price}
																			<i class="svg inline dropdown-select__icon-down" aria-hidden="true">
																				<svg width="7" height="5">
																					<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																				</svg>
																			</i>
																		</div>
																		<div class="tb_filter_block">
																			<div class="tb_filter_parameters_box_container">
																				<div class="wrapp_all_inputs wrap_md">
																					<div class="wrapp_change_inputs iblock">
																						<div class="flexbox flexbox--row form-control">
																							<input class="min-price" type="text" name="min_price" id="MAX_SMART_FILTER_P1_MIN" value="{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" size="5" placeholder="{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" autocomplete="off">
																							<input class="max-price" type="text" name="max_price" id="MAX_SMART_FILTER_P1_MAX" value="{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" size="5" placeholder="{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" autocomplete="off">
																						</div>
																					</div>
																					<div class="wrapp_slider iblock">
																						<div class="tb_ui_slider_track" id="drag_track">
																							<div class="tb_ui_slider_part first p1"><span>{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}</span></div>
																							<div class="tb_ui_slider_part last p2"><span>{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}</span></div>
																							<div class="tb_ui_slider_pricebar_VD" style="left: 0px; right: 0%;" id="colorUnavailableActive"></div>
																							<div class="tb_ui_slider_pricebar_VN" style="left: 0%; right: 0%;" id="colorAvailableInactive"></div>
																							<div class="tb_ui_slider_pricebar_V" style="left: 0%; right: 0%;" id="colorAvailableActive"></div>
																							<div class="tb_ui_slider_range" id="drag_tracker" style="left: 0%; right: 0%;">
																								<a class="tb_ui_slider_handle left" style="left:0;" href="javascript:void(0)" id="left_slider"></a>
																								<a class="tb_ui_slider_handle right" style="right: 0%;" href="javascript:void(0)" id="right_slider"></a>
																							</div>
																						</div>
																						<div style="opacity: 0;height: 1px;"></div>
																					</div>
																				</div>
																			</div>
																			<div class="tb_filter_button_box tb_ui_slider_btn active">
																				<div class="tb_filter_block">
																					<div class="tb_filter_parameters_box_container flexbox flexbox--direction-row">
																						<button class="tb_filter_search_reset btn btn-transparent-bg btn-default" type="submit">
																							{$lang->apply}
																						</button>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<input type="hidden" name="rate_from" id="rate_from" value="{$currency->rate_from}">
																	<input type="hidden" name="rate_to" id="rate_to" value="{$currency->rate_to}">
																</form>
															{/if}
															{if !isset($brand)}
																{if isset($category->brands) && $category->brands}
																	<div class="tb_filter_parameters_box active" data-expanded="Y" data-prop_code=brand data-property_id="1">
																		<div class="tb_filter_parameters_box_title dropdown-select__title fill-dark-light">
																			<div class="tb_filter_parameter_label">
																				{$lang->global_brands}
																			</div>
																			<i class="svg inline dropdown-select__icon-down" aria-hidden="true">
																				<svg width="7" height="5">
																					<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																				</svg>
																			</i>
																		</div>
																		<div class="tb_filter_block">
																			<span class="tb_filter_container_modef"></span>
																			<div class="tb_filter_parameters_box_container">
																				<div class="form-checkbox form-checkbox--margined scrolled scrollbar">
																					{foreach $category->brands as $b name=more}
																						{if $smarty.foreach.more.iteration > 5}
																							<div class="hidden_values">
																							{/if}
																							<input type="checkbox" value="" id="BRAND_FILTER_{$b->id}" onclick="location.href = '{furl params=[brand=>$b->url, page=>null]}'" class="form-checkbox__input" {if isset($brand->id) == $b->id || isset($smarty.get.b) && in_array($b->id,$smarty.get.b)}checked{/if}>
																							<label class="tb_filter_param_label form-checkbox__label color-theme-hover" for="BRAND_FILTER_{$b->id}">
																								<span class="tb_filter_input_checkbox">
																									<span class="tb_filter_param_text">{$b->name|escape}</span>
																								</span>
																								<span class="form-checkbox__box form-box"></span>
																							</label>
																							{if $smarty.foreach.more.iteration > 5}
																							</div>
																						{/if}
																					{/foreach}
																					{if $category->brands|count > 5}
																						<div class="inner_expand_text font_14">
																							<span class="expand_block dotted colored-link">{$lang->show_all}</span>
																						</div>
																					{/if}
																				</div>
																			</div>
																			<div class="clearfix"></div>
																		</div>
																	</div>
																{/if}
															{/if}
															{if isset($features)}
																{foreach $features as $f}
																	{if $f->is_color}
																		<div class="tb_filter_parameters_box active" data-expanded="Y" data-prop_code=color data-property_id="2">
																			<div class="tb_filter_parameters_box_title dropdown-select__title fill-dark-light">
																				<div class="tb_filter_parameter_label">
																					{$f->name}
																				</div>
																				<i class="svg inline dropdown-select__icon-down" aria-hidden="true">
																					<svg width="7" height="5">
																						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																					</svg>
																				</i>
																			</div>
																			<div class="tb_filter_block">
																				<span class="tb_filter_container_modef"></span>
																				<div class="tb_filter_parameters_box_container scrolled scrollbar">
																					<div class="line-block line-block--flex-wrap line-block--gap line-block--gap-6">
																						{foreach $f->options as $k=>$o}
																							<div class="line-block__item">
																								<div class="pict">
																									<input style="display: none" type="checkbox" id="FEATURE_FILTER_{$o->id}" value="" onclick="location.href = '{furl params=[$f->url=>$o->translit, page=>null]}'" {if isset($smarty.get.{$f@key}) && in_array($o->translit,$smarty.get.{$f@key})}checked{/if}>
																									<label for="FEATURE_FILTER_{$o->id}" class="sku-props__value sku-props__value--pict {if isset($smarty.get.{$f@key}) && in_array($o->translit,$smarty.get.{$f@key})}sku-props__value--active{/if} {if $o->value == '#ffffff'}white{/if}" title="{$o->value|escape}" style="background-color:{$o->value|escape}"></label>
																								</div>
																							</div>
																						{/foreach}
																					</div>
																				</div>
																				<div class="clearfix"></div>
																			</div>
																		</div>
																	{elseif $f->is_size}
																		<div class="tb_filter_parameters_box active" data-expanded="Y" data-prop_code=size data-property_id="3">
																			<div class="tb_filter_parameters_box_title dropdown-select__title fill-dark-light">
																				<div class="tb_filter_parameter_label">
																					{$f->name}
																				</div>
																				<i class="svg inline dropdown-select__icon-down" aria-hidden="true">
																					<svg width="7" height="5">
																						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																					</svg>
																				</i>
																			</div>
																			<div class="tb_filter_block" style="display: block;">
																				<span class="tb_filter_container_modef"></span>
																				<div class="tb_filter_parameters_box_container">
																					<div class="form-checkbox form-checkbox--margined scrolled scrollbar">
																						<div class="line-block line-block--flex-wrap line-block--gap line-block--gap-6">
																							{foreach $f->options as $k=>$o}
																								<div class="line-block__item">
																									<input type="checkbox" value="" id="FEATURE_FILTER_{$o->id}" class="form-checkbox__input" onclick="location.href = '{furl params=[$f->url=>$o->translit, page=>null]}'" {if isset($smarty.get.{$f@key}) && in_array($o->translit,$smarty.get.{$f@key})}checked{/if}>
																									<label class="tb_filter_param_label sku-props__value font_14 {if isset($smarty.get.{$f@key}) && in_array($o->translit,$smarty.get.{$f@key})}sku-props__value--active{/if}" for="FEATURE_FILTER_{$o->id}">
																										<span class="tb_filter_input_checkbox">
																											<span class="tb_filter_param_text">{$o->value|escape}</span>
																										</span>
																									</label>
																								</div>
																							{/foreach}
																						</div>
																					</div>
																				</div>
																				<div class="clearfix"></div>
																			</div>
																		</div>
																	{else}
																		<div class="tb_filter_parameters_box active" data-expanded="Y" data-prop_code=features data-property_id="{$f->id}">
																			<div class="tb_filter_parameters_box_title dropdown-select__title fill-dark-light">
																				<div class="tb_filter_parameter_label">
																					{$f->name}
																				</div>
																				<i class="svg inline dropdown-select__icon-down" aria-hidden="true">
																					<svg width="7" height="5">
																						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																					</svg>
																				</i>
																			</div>
																			<div class="tb_filter_block">
																				<span class="tb_filter_container_modef"></span>
																				<div class="tb_filter_parameters_box_container">
																					<div class="form-checkbox form-checkbox--margined scrolled scrollbar">
																						{foreach $f->options as $k=>$o name=more}
																							{if $smarty.foreach.more.iteration > 5}
																								<div class="hidden_values">
																								{/if}
																								<input type="checkbox" value="" id="FEATURE_FILTER_{$o->id}" onclick="location.href = '{furl params=[$f->url=>$o->translit, page=>null]}'" class="form-checkbox__input" {if isset($smarty.get.{$f@key}) && in_array($o->translit,$smarty.get.{$f@key})}checked{/if}>
																								<label class="tb_filter_param_label form-checkbox__label color-theme-hover" for="FEATURE_FILTER_{$o->id}">
																									<span class="tb_filter_input_checkbox">
																										<span class="tb_filter_param_text">{$o->value|escape}</span>
																									</span>
																									<span class="form-checkbox__box form-box"></span>
																								</label>
																								{if $smarty.foreach.more.iteration > 5}
																								</div>
																							{/if}
																						{/foreach}
																						{if $f->options|count > 5}
																							<div class="inner_expand_text font_14">
																								<span class="expand_block dotted colored-link">{$lang->show_all}</span>
																							</div>
																						{/if}
																					</div>
																				</div>
																				<div class="clearfix"></div>
																			</div>
																		</div>
																	{/if}
																{/foreach}
															{/if}
														</div>
														<div class="tb_filter_button_box active">
															<div class="tb_filter_block">
																<div class="tb_filter_parameters_box_container flexbox flexbox--direction-row">
																	<a class="tb_filter_search_reset btn btn-transparent-bg btn-default" href="{$lang_link}catalog/{$category->url}">{$lang->reset}</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										{/if}
									</div>
								</div>
							{/if}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}