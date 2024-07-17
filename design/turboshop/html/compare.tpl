{* Compare *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->compare scope=global}

	{* Canonical *}
	{$canonical="/compare" scope=global}
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
								<link href="{$lang_link}compare" itemprop="item"><span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->compare}</span>
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
								{$lang->compare}
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

<div class="container">
	<div class="row">
		<div class="maxwidth-theme">
			<div class="col-md-12 col-sm-12 col-xs-12 content-md">
				<div class="right_block narrow_N">
					{if $products}
						<div class="tb_compare" id="tb_catalog_compare_block">
							<div class="tb_compare" id="tb_catalog_compare_block">
								<div class="catalog-compare swipeignore">
									{if $products|count > 1}
										<div class="catalog-compare__top flexbox flexbox--row justify-content-between align-items-normal">
											<div class="catalog-compare__switch form__check form__check--switch form__check--switch--secondary">
												<div class="onoff filter sm">
													<input type="checkbox" id="compare_diff">
													<label for="compare_diff" class="muted">
														{$lang->only_differences}
													</label>
												</div>
											</div>
										</div>
									{/if}
									<div class="catalog-compare__inner loading">
										<div class="catalog-compare loader_circle"></div>
										<div class="table_compare catalog-block">
											<div class="compare-sections__item active">
												<div class="catalog-compare__items catalog_block items block flexbox flexbox--row owl-carousel owl-bg-nav visible-nav owl-carousel--light owl-carousel--outer-dots owl-carousel--button-wide owl-carousel--button-offset-half owl-carousel--after-offset-1" data-plugin-options='{literal}{"nav": true, "autoplay" : false, "dots": false, "autoplayTimeout" : "3000", "smartSpeed":500, "responsiveClass": true, "withSlide": "catalog-compare__props-slider", "rewind": true, "margin": -1, "responsive":{"0":{"items": 2},"768":{"items": 3},"992":{"items": 3},"1200":{"items": 4}}}{/literal}'>
													{foreach $products as $product}
														<div class="catalog-block__wrapper height-100 product">
															<div class="catalog-block__item bordered bg-theme-parent-hover border-theme-parent-hover js-popup-block">
																<div class="catalog-block__inner flexbox height-100">
																	<a href="{$lang_link}compare/remove/{$product->url}" class="remove colored_theme_hover_text stroke-use-grey stroke-theme-use-svg-hover" title="{$lang->delete}">
																		<i class="svg inline remove_item" aria-hidden="true">
																			<svg width="12" height="13">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#remove_img"></use>
																			</svg>
																		</i>
																	</a>
																	<div class="image-list">
																		<div class="image-list-wrapper js-image-block">
																			<div class="btn-fast-view rounded-x hide-600">
																				<div data-event="jqm" class="btn btn-xs btn-default" data-name="fast_view" data-url="{$lang_link}products/{$product->url}?tpl=quickview">
																					{$lang->quick_view}
																				</div>
																			</div>
																			<a href="{$lang_link}products/{$product->url}" class="image-list__link image">
																				{if isset($product->image)}
																					<img class="lazyload img-responsive rounded-x js-replace-img js-popup-image" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$product->image->filename|resize:400:400}" data-big="{$product->image->filename|resize:400:400}" alt="{$product->name|escape}" title="{$product->name|escape}" />
																				{else}
																					<img style="width: 150px; height: 150px;" class="lazyload img-responsive rounded-x js-replace-img js-popup-image" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" data-big="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}" title="{$product->name|escape}" />
																				{/if}
																			</a>
																		</div>
																	</div>
																	<div class="catalog-block__info flex-1 flexbox flexbox--justify-beetwen">
																		<div class="catalog-block__info-top">
																			<div class="catalog-block__info-inner">
																				<div class="catalog-block__info-inner">
																					<div class="catalog-block__info-title linecamp-4 height-auto-t600">
																						<a href="{$lang_link}products/{$product->url}" class="dark_link switcher-title js-popup-title"><span>{$product->name|escape}</span></a>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="catalog-block__info-bottom">
																			<div class="line-block line-block--20 flexbox--wrap flexbox--justify-beetwen">
																				<div class="line-block__item catalog-block__info-bottom--margined js-popup-price catalog-block__info-price">
																					<div class="price color_222">
																						<div class="line-block line-block--6 line-block--align-baseline line-block--flex-wrap">
																							<div class="line-block__item">
																								<div class="price__new">
																									<span class="price__new-val font_18">
																										{$product->variant->price|convert} {$currency->sign|escape}
																									</span>
																								</div>
																							</div>
																							{if $product->variant->compare_price > 0}
																								<div class="line-block__item">
																									<div class="price__old">
																										<span class="price__old-val font_12 color_999">
																											{$product->variant->compare_price|convert}{$currency->sign|escape}
																										</span>
																									</div>
																								</div>
																							{/if}
																						</div>
																					</div>
																				</div>
																				<div class="line-block__item catalog-block__info-bottom--margined catalog-block__info-btn">
																					<div class="js-replace-btns js-config-btns">
																						<div class="buy_block btn-actions__inner">
																							<div class="buttons">
																								<div class="line-block line-block--12-vertical line-block--align-normal flexbox--direction-column">
																									<div class="line-block__item">
																										<span class="item-action item-action--basket">
																											{if $product->variant->stock}
																												<form class="variants" action="{$lang_link}cart">
																													{foreach $product->variants as $v}
																														<input name="variant" value="{$v->id}" type="radio" {if $v@first}checked{/if} style="display:none;">
																													{/foreach}
																													<button type="submit" data-result-text="{$lang->added_cart}" class="btn btn-default btn-sm btn-wide to_cart animate-load" value="{$lang->add_cart}" title="{$lang->add_cart}">{$lang->add_cart}</button>
																												</form>
																											{else}
																												<span class="btn btn-default btn-sm btn-wide disabled">{$lang->add_cart}</span>
																											{/if}
																										</span>
																									</div>
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													{/foreach}
												</div>
												<div class="catalog-compare__props-slider owl-carousel owl-theme" data-plugin-options='{literal}{"nav": false, "dots": false, "autoplay" : false, "autoplayTimeout" : "3000", "smartSpeed":500, "responsiveClass": true, "withSlide1": "catalog-compare__items", "rewind": true, "margin": -1, "responsive":{"0":{"items": 2},"768":{"items": 3},"992":{"items": 3},"1200":{"items": 4}}}{/literal}'>
													{foreach $products as $product}
														<div class="catalog-compare__item-props">
															{foreach $compare_features as $feature}
																{if !$feature->is_color}
																	<div class="catalog-compare__prop-line font_xs">
																		<span class="catalog-compare__prop-name muted">{$feature->name}</span>
																		{foreach $product->features as $f}
																			{if $f->name == $feature->name}
																				{foreach $f->values as $v}
																					{$v->value}{if !$v@last},{/if}
																				{/foreach}
																			{/if}
																		{/foreach}
																	</div>
																{/if}
															{/foreach}
															<div class="catalog-small__item bordered flexbox flexbox--row height-100">
																<a href="{$lang_link}compare/remove/{$product->url}" class="catalog-small__remove remove colored_theme_hover_text stroke-use-grey stroke-theme-use-svg-hover" title="{$lang->delete}">
																	<i class="svg inline remove_item" aria-hidden="true">
																		<svg width="12" height="13">
																			<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#remove_img"></use>
																		</svg>
																	</i>
																</a>
																<div class="catalog-small__img-wrap">
																	<a href="{$lang_link}products/{$product->url}" class="image-list__link">
																		{if isset($product->image)}
																			<img class="lazyload img-responsive rounded-x catalog-small__img" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$product->image->filename|resize:60:60}" data-big="{$product->image->filename|resize:60:60}" alt="{$product->name|escape}" title="{$product->name|escape}" />
																		{else}
																			<img style="width: 60px; height: 60px;" class="lazyload img-responsive rounded-x catalog-small__img" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" data-big="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}" title="{$product->name|escape}" />
																		{/if}
																	</a>
																</div>
																<div class="catalog-small__name">
																	<a href="{$lang_link}products/{$product->url}" class="dark_link switcher-title font_xs"><span class="linecamp-3">{$product->name|escape}</span></a>
																</div>
															</div>
														</div>
													{/foreach}
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					{else}
						<div class="col-md-12">
							<div class="alert alert-info">
								{$lang->compare_no_products}
							</div>
						</div>
					{/if}
				</div>
				<div class="left_block">
					<div class="sticky-block sticky-block--show-Y">
						<aside class="sidebar">
							<ul class="nav nav-list side-menu">
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
							</ul>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{literal}
	<script>
		$(document).ready(function() {
			InitOwlSlider();
			var allSection = $('.compare-sections__item');
			allSection.each(function(index) {
				var section = $(this);
				var $sliderProducts = section.find('.catalog-compare__items'),
					$sliderProps = section.find('.catalog-compare__props-slider'),
					$propsLines = $sliderProps.find(".catalog-compare__prop-line"),
					$sliderProductsItems = $sliderProducts.find(".owl-item"),
					$sliderPropsItems = $sliderProps.find(".owl-item");
				//change products slider
				$sliderProducts.on('change.owl.carousel', function(event) {
					if (event.namespace && event.property.name === 'position') {
						var target = event.relatedTarget.relative(event.property.value, true);
						$sliderProductsItems.removeClass("sync");
						$sliderProductsItems.eq(target).addClass("sync");
						if (target != $sliderProps.find(".owl-item.sync").index())
							$sliderProps.owlCarousel('to', target, 500, true);
					}
				});
				//change props slider
				$sliderProps.on('change.owl.carousel', function(event) {
					if (event.namespace && event.property.name === 'position') {
						var target = event.relatedTarget.relative(event.property.value, true);
						//show props title
						$sliderPropsItems.removeClass("active-title sync");
						$sliderProps.find(".owl-item:nth-child(" + (target + 1) + ")").addClass("active-title");
						$sliderPropsItems.eq(target).addClass("sync");
						if ($sliderProducts.find(".owl-item.sync").index() != target)
							$sliderProducts.owlCarousel('to', target, 500, true);
					}
				});
				tableEqualHeight($sliderProps, $sliderPropsItems);
				$(window).on('resize', function() {
					tableEqualHeight($sliderProps, $sliderPropsItems);
				});
				$propsLines.hover(
					function() {
						var owlItemsActive = $sliderProps.find(".owl-item.active"),
							index = $(this).index();
						$sliderPropsItems.each(function(i, element) {
							$(this).find(".catalog-compare__prop-line").eq(index).addClass("hover-prop");
						});
						owlItemsActive.each(function(i, element) {
							// set border-left
							if (i === 0) {
								$(this).find(".catalog-compare__prop-line").eq(index).addClass("border-left");
							}
							// set border-right
							if (i === owlItemsActive.length - 1) {
								$(this).find(".catalog-compare__prop-line").eq(index).addClass("border-right");
							}
						});
					},
					function() {
						$propsLines.removeClass("hover-prop border-left border-right");
					}
				);
			});
			stickyCompareItems();
		})
	</script>
{/literal}