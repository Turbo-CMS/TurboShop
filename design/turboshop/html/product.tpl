{* Product Page *}

{* Modals *}
{if isset($smarty.server.HTTP_X_REQUESTED_WITH) && $smarty.server.HTTP_X_REQUESTED_WITH == 'XMLHttpRequest'}
	{assign var="cleanTpl" value=$smarty.get.tpl|replace:"?":""}
	{if $cleanTpl == 'quickview'}
		{$wrapper = 'modals/quickview.tpl' scope=global}
	{elseif $cleanTpl == 'detail_clothes'}
		{$wrapper = 'modals/detail_clothes.tpl' scope=global}
	{elseif $cleanTpl == 'fast_order'}
		{$wrapper = 'modals/fast_order.tpl' scope=global}
	{elseif $cleanTpl == 'grid'}
		{$wrapper = 'loading/grid.tpl' scope=global}
	{elseif $cleanTpl == 'list'}
		{$wrapper = 'loading/list.tpl' scope=global}
	{elseif $cleanTpl == 'price'}
		{$wrapper = 'loading/price.tpl' scope=global}
	{/if}
{/if}

{* Canonical *}
{$canonical="/products/{$product->url}" scope=global}

<!--title_content-->
<div class="page-top-info">
	<div class="page-top-wrapper page-top-wrapper--white">
		<section class="page-top maxwidth-theme">
			<div class="cowl">
				{$level = 1}
				<div id="navigation">
					<div class="breadcrumbs swipeignore" itemscope="" itemtype="http://schema.org/BreadcrumbList">
						<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a class="breadcrumbs__link" href="{if $lang_link}{$lang_link}{else}/{/if}" title="{$lang->home|escape}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->home|escape}</span>
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
							<a class="breadcrumbs__link" href="{$lang_link}catalog" title="{$lang->catalog|escape}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->catalog|escape}</span>
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
						{foreach $category->path as $cat}
							<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<a class="breadcrumbs__link" href="{$lang_link}catalog/{$cat->url}" title="{$cat->name|escape}" itemprop="item">
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$cat->name|escape}</span>
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
						{/foreach}
						{if $brand}
							<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<a class="breadcrumbs__link" href="{$lang_link}catalog/{$cat->url}/{$brand->url}" title="{$brand->name|escape}" itemprop="item">
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$brand->name|escape}</span>
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
						{/if}
						<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<link href="{$lang_link}products/{$product->url}" itemprop="item">
							<span>
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$product->name|escape}</span>
								<meta itemprop="position" content="{$level++}">
							</span>
						</span>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
<!--end-title_content-->

<div class="container">
	<div class="row">
		<div class="maxwidth-theme">
			<div class="col-md-12 col-sm-12 col-xs-12 content-md">
				<div class="right_block narrow_N catalog_page">
					<div class="main-wrapper flexbox flexbox--direction-row">
						<div class="section-content-wrapper flex-1">
							<div class="product-container detail element_1 clearfix" itemscope="" itemtype="http://schema.org/Product">
								<div class="catalog-detail js-popup-block flexbox flexbox--direction-row">
									<div class="catalog-detail__item flex-1">
										<div class="basket_props_block" id="tb_basket_div_983" style="display: none;"></div>
										<div class="catalog-detail__top-info rounded-4 flexbox flexbox--direction-row flexbox--wrap-nowrap product">
											<meta itemprop="name" content="{$product->name|escape}">
											<link itemprop="url" href="{$lang_link}products/{$product->url}">
											<meta itemprop="category" content="{$category->name|escape}">
											<meta itemprop="description" content="{$product->annotation|escape}">
											<meta itemprop="sku" content="{$product->variant->sku}">
											<div class="detail-gallery-big detail-gallery-big--vertical swipeignore image-list__link">
												<div class="sticky-block">
													<div class="detail-gallery-big-wrapper">
														{if $product->image}
															<link id="main-product-image" href="{$product->image->filename|resize:700:700}" itemprop="image" />
														{/if}
														<div class="gallery-wrapper__aspect-ratio-container">
															<div class="detail-gallery-big-slider-thumbs">
																<div class="gallery-slider-thumb__container">
																	<div class="gallery-slider-thumb-button gallery-slider-thumb-button--prev slider-nav swiper-button-prev" style="display: none">
																		<i class="svg inline stroke-dark-light" aria-hidden="true">
																			<svg width="7" height="12">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
																			</svg>
																		</i>
																	</div>
																	<div class="gallery-slider-thumb js-detail-img-thumb swiper slider-solution gallery-slider-thumb__container--hide-navigation" data-size="{$product->images|count}" data-slide-class-list="gallery__item gallery__item--thumb swiper-slide rounded-x pointer" data-plugin-options='{literal}{"direction":"vertical","init":false,"loop":false,"navigation":{"nextEl":".gallery-slider-thumb-button--next","prevEl":".gallery-slider-thumb-button--prev"},"pagination":false,"slidesPerView":"auto","type":"detail_gallery_thumb","watchSlidesProgress":true,"preloadImages":false,"lazy":{"loadPrevNext":true}}{/literal}'>
																		<div class="gallery__thumb-wrapper thumb swiper-wrapper">
																			{if $product->image}
																				{foreach $product->images as $i=>$image name=img}
																					<div id="thumb-photo-{$smarty.foreach.img.index}" class="gallery__item gallery__item--thumb swiper-slide rounded-x pointer">
																						<img class="gallery__picture rounded-x swiper-lazy" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$image->filename|resize:700:700}" alt="{$product->name|escape}" title="{$product->name|escape}" />
																					</div>
																				{/foreach}
																			{else}
																				<div id="thumb-photo-0" class="gallery__item gallery__item--thumb swiper-slide rounded-x pointer">
																					<img style="width: 45px; height: 45px;" class="gallery__picture rounded-x swiper-lazy" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}" title="{$product->name|escape}" />
																				</div>
																			{/if}
																		</div>
																	</div>
																	<div class="gallery-slider-thumb-button gallery-slider-thumb-button--next slider-nav swiper-button-next" style="display: none">
																		<i class="svg inline stroke-dark-light" aria-hidden="true">
																			<svg width="7" height="12">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
																			</svg>
																		</i>
																	</div>
																</div>
																{* Videos *}
																{if $product->videos}
																	{foreach $product->videos as $video}
																		<div class="video-block popup_video">
																			<a class="video-block__play video-block__play--static video-block__play--sm bg-theme-after various video_link image dark-color" href="https://www.youtube.com/embed/{$video->vid}" title="{$lang->videos_global|escape}">
																				<span class="play text-upper">{$lang->videos_global|escape}</span>
																			</a>
																		</div>
																	{/foreach}
																{/if}
															</div>
															<div class="detail-gallery-big-slider-main">
																<div class="detail-gallery-big-slider big js-detail-img swiper slider-solution slider-solution--show-nav-hover" data-slide-class-list="detail-gallery-big__item detail-gallery-big__item--big swiper-slide" data-plugin-options='{literal}{"direction":"horizontal","init":false,"keyboard":{"enabled":true},"loop":false,"pagination":{"enabled":true,"el":".detail-gallery-big-slider-main .swiper-pagination"},"navigation":{"nextEl":".detail-gallery-big-slider-main .swiper-button-next","prevEl":".detail-gallery-big-slider-main .swiper-button-prev"},"slidesPerView":1,"thumbs":{"swiper":".gallery-slider-thumb"},"type":"detail_gallery_main","preloadImages":false,"lazy":{"loadPrevNext":true}}{/literal}'>
																	<div class="detail-gallery-big-slider__wrapper swiper-wrapper image">
																		{if $product->image}
																			{foreach $product->images as $i=>$image name=img}
																				<div id="big-photo-{$smarty.foreach.img.index}" class="detail-gallery-big__item detail-gallery-big__item--big swiper-slide">
																					<a href="{$image->filename|resize:700:700:$theme_settings->watermark}" data-fancybox="gallery" class="detail-gallery-big__link popup_link fancy fancy-thumbs" title="{$product->name|escape}">
																						<img class="detail-gallery-big__picture swiper-lazy" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$image->filename|resize:700:700:$theme_settings->watermark}" alt="{$product->name|escape}" title="{$product->name|escape}" />
																					</a>
																				</div>
																			{/foreach}
																		{else}
																			<div id="big-photo-0" class="detail-gallery-big__item detail-gallery-big__item--big swiper-slide">
																				<a href="design/{$settings->theme|escape}/images/no-photo.svg" data-fancybox="gallery" class="detail-gallery-big__link popup_link fancy fancy-thumbs" title="{$product->name|escape}">
																					<img style="width: 450px; height: 450px;" class="detail-gallery-big__picture swiper-lazy" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}" title="{$product->name|escape}" />
																				</a>
																			</div>
																		{/if}
																	</div>
																	<div class="slider-nav slider-nav--prev swiper-button-prev" style="display: none">
																		<i class="svg inline stroke-dark-light" aria-hidden="true">
																			<svg width="7" height="12">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
																			</svg>
																		</i>
																	</div>
																	<div class="slider-nav slider-nav--next swiper-button-next" style="display: none">
																		<i class="svg inline stroke-dark-light" aria-hidden="true">
																			<svg width="7" height="12">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
																			</svg>
																		</i>
																	</div>
																</div>
																<div class="swiper-pagination swiper-pagination--bottom visible-767 swiper-pagionation-bullet--line-to-600"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="catalog-detail__main">
												<div class="catalog-detail__sticker-wrapper">
													<div class="sticker sticker--upper">
														{if $product->variant->compare_price> 0}
															<div>
																<div class="sticker__item sticker__item--stock font_10">{$lang->badge_sale|escape}</div>
															</div>
														{/if}
														{if $product->featured}
															<div>
																<div class="sticker__item sticker__item--recommend font_10">{$lang->badge_featured|escape}</div>
															</div>
														{/if}
														{if $product->is_new}
															<div>
																<div class="sticker__item sticker__item--new font_10">{$lang->badge_new|escape}</div>
															</div>
														{/if}
														{if $product->is_hit}
															<div>
																<div class="sticker__item sticker__item--hit font_10">{$lang->badge_hit|escape}</div>
															</div>
														{/if}
														{if !empty($product->sale_to)}
															<div>
																<div class="countdown countdown-type-1 countdown--icons countdown--shadowed compact">
																	<div class="countdown__inner">
																		<span class="countdown__active-to hidden">{$product->sale_to}</span>
																		<span class="countdown__icon countdown__item"></span>
																		<span class="countdown__items"></span>
																	</div>
																</div>
															</div>
														{/if}
													</div>
												</div>
												<div>
													<h1 class="font_32 switcher-title js-popup-title font_20--to-600">
														<span data-product="{$product->id}">{$product->name|escape}</span>
													</h1>
												</div>
												<div class="catalog-detail__info-tc">
													<div class="line-block line-block--20 line-block--align-normal flexbox--justify-beetwen flexbox--wrap">
														<div class="line-block__item">
															<div class="catalog-detail__info-tech">
																<div class="line-block line-block--20 flexbox--wrap js-popup-info">
																	<div class="line-block__item font_14 color_222">
																		<div class="rating" title="{if $product->ratings|string_format:'%.1f'|floatval > 0}{$lang->rating|escape} {$product->ratings|string_format:'%.1f'} {$lang->out_of|escape} 5{else}{$lang->no_ratings|escape}{/if}" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
																			<meta itemprop="ratingValue" content="{$product->ratings|string_format:'%.1f'}">
																			<meta itemprop="reviewCount" content="{$comments_count}">
																			<meta itemprop="bestRating" content="5">
																			<meta itemprop="worstRating" content="1">
																			<div class="line-block line-block--4">
																				<div class="line-block__item flexbox">
																					<i class="svg inline rating__star-svg rating__star-svg--filled" aria-hidden="true">
																						<svg width="16" height="16">
																							<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																						</svg>
																					</i>
																				</div>
																				<div class="line-block__item rating__value">
																					{if $product->ratings|string_format:'%.1f'|floatval > 0}{$product->ratings|string_format:'%.1f'}{else}{$product->ratings|intval}{/if}
																				</div>
																				<div class="line-block__item rating__count">
																					<span data-block="reviews" class="choise dotted font_14 color_222 rating__static-block pointer">
																						{$comments_count} {$comments_count|plural:$lang->comment_1:$lang->comment_2:$lang->comment_3}
																					</span>
																				</div>
																			</div>
																		</div>
																	</div>
																	{* SKU *}
																	{if $product->variant->sku}
																		<div class="line-block__item font_13 color_999" itemprop="additionalProperty" itemscope="" itemtype="http://schema.org/PropertyValue">
																			<span class="article">
																				<meta itemprop="name" content="{$lang->sku|escape}">{$lang->sku|escape}&nbsp;<span class="js-replace-article" data-value="{$product->variant->sku}" itemprop="value">{$product->variant->sku}</span>
																			</span>
																		</div>
																	{/if}
																</div>
															</div>
														</div>
														<div class="line-block__item">
															<div class="flexbox flexbox--row flexbox--wrap">
																<div class="js-replace-icons">
																	{if $wishlist_products && in_array($product->url, $wishlist_products)}
																		<div class="item-action item-action--horizontal item-action--favorite active">
																			<a href="{$lang_link}wishlist" class="item-action__inner item-action__inner--md fill-theme-use-svg-hover fill-dark-light-block active" title="{$lang->added_to_wishlist|escape}">
																				<i class="svg inline" aria-hidden="true">
																					<svg width="18" height="16">
																						<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
																					</svg>
																				</i>
																			</a>
																		</div>
																	{else}
																		<div class="item-action item-action--horizontal item-action--favorite">
																			<a href="{$lang_link}wishlist/{$product->url}" rel="nofollow" class="wishlist item-action__inner item-action__inner--md fill-theme-use-svg-hover fill-dark-light-block" title="{$lang->add_to_wishlist|escape}" data-title_added="{$lang->added_to_wishlist|escape}">
																				<i class="svg inline" aria-hidden="true">
																					<svg width="18" height="16">
																						<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
																					</svg>
																				</i>
																			</a>
																		</div>
																	{/if}
																	{if $smarty.session.compared_products && in_array($product->url, $smarty.session.compared_products)}
																		<div class="item-action item-action--horizontal item-action--compare active">
																			<a href="{$lang_link}compare" class="item-action__inner item-action__inner--md fill-theme-use-svg-hover fill-dark-light-block active" title="{$lang->added_to_compare|escape}">
																				<i class="svg inline" aria-hidden="true">
																					<svg width="20" height="16">
																						<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#compare-20-16"></use>
																					</svg>
																				</i>
																			</a>
																		</div>
																	{else}
																		<div class="item-action item-action--horizontal item-action--compare">
																			<a href="{$lang_link}compare/{$product->url}" rel="nofollow" class="compare item-action__inner item-action__inner--md fill-theme-use-svg-hover fill-dark-light-block" title="{$lang->add_to_compare|escape}" data-title_added="{$lang->added_to_compare|escape}">
																				<i class="svg inline" aria-hidden="true">
																					<svg width="20" height="16">
																						<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#compare-20-16"></use>
																					</svg>
																				</i>
																			</a>
																		</div>
																	{/if}
																</div>
																<div class="item-action item-action--horizontal share fill-theme-hover hover-block">
																	<div class="item-action__inner item-action__inner--md item-action__inner--sm-to-600 shares-block hover-block__item">
																		<i class="svg inline fill-dark-light-block" aria-hidden="true">
																			<svg width="16" height="16">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#share-16-16"></use>
																			</svg>
																		</i>
																		<div class="a2a-share2 hover-block__item-wrapper" style="display: none;">
																			<!-- AddToAny BEGIN -->
																			<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
																				<ul class="a2a-share2__list a2a-share2__list_direction_horizontal">
																					<li class="a2a-share2__item">
																						<a class="a2a_button_facebook"></a>
																					</li>
																					<li class="a2a-share2__item">
																						<a class="a2a_button_x"></a>
																					</li>
																					<li class="a2a-share2__item">
																						<a class="a2a_button_facebook_messenger"></a>
																					</li>
																					<li class="a2a-share2__item">
																						<a class="a2a_button_whatsapp"></a>
																					</li>
																					<li class="a2a-share2__item">
																						<a class="a2a_button_telegram"></a>
																					</li>
																					<li class="a2a-share2__item">
																						<a class="a2a_button_viber"></a>
																					</li>
																					<li class="a2a-share2__item">
																						<a class="a2a_button_google_gmail"></a>
																					</li>
																				</ul>
																			</div>
																			<script async src="https://static.addtoany.com/menu/page.js"></script>
																			<!-- AddToAny END -->
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<form class="variants" action="{$lang_link}cart">
													<div class="catalog-detail__main-parts line-block line-block--40">
														<div class="catalog-detail__main-part catalog-detail__main-part--left flex-1 line-block__item grid-list grid-list--gap-30">
															{if $product->variants|count > 1 || $product->related_products}
																<div class="grid-list__item catalog-detail__offers">
																	<div class="sku-props sku-props--detail">
																		<div class="line-block line-block--flex-wrap line-block--flex-100 line-block--40 line-block--align-flex-end">
																			{if $product->related_products}
																				<div class="line-block__item sku-props__inner sku-props--pict">
																					<div class="sku-props__item">
																						<div class="sku-props__title color_666">
																							{$lang->color|escape} : <span class="sku-props__js-size">{$product->variant->color}</span>
																						</div>
																						<div class="line-block line-block--flex-wrap line-block--6 sku-props__values">
																							{foreach $product->related_products as $related_product}
																								<div class="line-block__item">
																									<a href="{$lang_link}products/{$related_product->url}" class="sku-props__value sku-props__value--pict {if $product->id == $related_product->id}sku-props__value--active{/if} {if $related_product->variant->color_code == '#ffffff'}white{/if}" data-title="{$related_product->variant->color}" title="{$related_product->variant->color}" style="background: {$related_product->variant->color_code}">
																										{$related_product->variant->color}
																									</a>
																								</div>
																							{/foreach}
																						</div>
																					</div>
																				</div>
																			{/if}
																			{if $product->features}
																				{foreach $product->features as $f}
																					{if $f->is_size}
																						{$sizes = $f->is_size}
																					{/if}
																				{/foreach}
																			{/if}
																			{if $product->variants|count > 1}
																				<div class="line-block__item sku-props__inner">
																					<div class="sku-props__item">
																						<div class="sku-props__title color_666">
																							{if $sizes}{$lang->size|escape}{else}{$lang->option|escape}{/if} : <span class="sku-props__js-size">{$product->variant->name}</span>
																						</div>
																						<div class="line-block line-block--flex-wrap line-block--4 sku-props__values">
																							{foreach $product->variants as $v}
																								<div class="line-block__item">
																									<label class="sku-props__value font_16 {if $v@first}sku-props__value--active{/if}" data-title="{$v->name}">
																										<input type="radio" name="variant" value="{$v->id}" data-price="{$v->price|convert}" data-stock="{$v->stock}" {if $v->compare_price}data-compare="{$v->compare_price|convert}" {if $v->compare_price>$v->price && $v->price>0} data-discount="{round((($v->price-$v->compare_price)/$v->compare_price)*100, 0)}%" {/if}{/if} {if $v->name}data-name="{$v->name}" {/if} {if $v->sku}data-sku="{$v->sku}" {/if} {if $v@first}checked{/if} autocomplete="off" style="display: none;">
																										{$v->name}
																									</label>
																								</div>
																							{/foreach}
																						</div>
																					</div>
																				</div>
																			{else}
																				{foreach $product->variants as $v}
																					<input name="variant" value="{$v->id}" type="radio" {if $v@first}checked{/if} style="display:none;">
																				{/foreach}
																			{/if}
																			{if $sizes}
																				<div class="line-block__item">
																					<div class="catalog-detail__pseudo-link catalog-detail__pseudo-link--with-gap table-sizes">
																						<span class="font_13 fill-dark-light-block dark_link" data-event="jqm" data-url="{$lang_link}products/{$product->url}?tpl=detail_clothes" data-name="include_block">
																							<i class="svg inline" aria-hidden="true">
																								<svg width="18" height="11">
																									<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#table_sizes"></use>
																								</svg>
																							</i>
																							<span class="dotted">{$lang->size_table|escape}</span>
																						</span>
																					</div>
																				</div>
																			{/if}
																		</div>
																	</div>
																</div>
															{else}
																{foreach $product->variants as $v}
																	<input name="variant" value="{$v->id}" type="radio" {if $v@first}checked{/if} style="display:none;">
																{/foreach}
															{/if}
															{if $product->features}
																<div class="grid-list__item char-side">
																	<div class="char-side__title font_15 color_222">{$lang->feature|escape}</div>
																	<div class="properties list font_14">
																		<div class="properties__container properties">
																			{foreach $product->features|@array_slice:0:5 as $f}
																				{if !$f->is_color}
																					<div class="properties__item js-prop-replace">
																						<div class="properties__title properties__item--inline js-prop-title">
																							{$f->name}
																						</div>
																						<div class="properties__hr properties__item--inline">—</div>
																						<div class="properties__value properties__item--inline js-prop-value color_222">
																							{foreach $f->values as $v}
																								{$v->value|escape}{if !$v@last},{/if}
																							{/foreach}
																						</div>
																					</div>
																				{/if}
																			{/foreach}
																		</div>
																	</div>
																	<span class="catalog-detail__pseudo-link catalog-detail__pseudo-link--with-gap pointer dark_link font_13">
																		<span class="choise dotted" data-block="char">{$lang->all_features|escape}</span>
																	</span>
																</div>
															{/if}
															<div class="grid-list__item catalog-detail__previewtext" itemprop="description">
																<div class="text-block font_14 color_666">
																	{$product->annotation}
																</div>
																<span class="catalog-detail__pseudo-link catalog-detail__pseudo-link--with-gap dark_link pointer font_13">
																	<span class="choise dotted" data-block="desc">{$lang->all_description|escape}</span>
																</span>
															</div>
															{* Brand *}
															{if $brand}
																<div class="grid-list__item">
																	<div class="brand-detail flexbox line-block--gap line-block--gap-12">
																		{if $brand && $brand->image}
																			<div class="brand-detail-info" itemprop="brand" itemtype="https://schema.org/Brand" itemscope="">
																				<meta itemprop="name" content="{$brand->name|escape}">
																				<div class="brand-detail-info__image rounded-x">
																					<a href="{$lang_link}brands/{$brand->url}">
																						<img class="lazyload" src="{$brand->image|resize_brands:150:25}" data-src="{$brand->image|resize_brands:150:25}" alt="{$brand->name|escape}" title="{$brand->name|escape}" itemprop="image">
																					</a>
																				</div>
																			</div>
																		{/if}
																		<div class="brand-detail-info__preview line-block line-block--gap line-block--gap-8 flexbox--wrap font_14">
																			<div class="line-block__item">
																				<a class="chip chip--transparent bordered" href="{$lang_link}brands/{$brand->url}" target="_blank">
																					<span class="chip__label">{$lang->all_products|escape} {$brand->name|escape}</span>
																				</a>
																			</div>
																			<div class="line-block__item">
																				<a class="chip chip--transparent bordered" href="{$lang_link}catalog/{$category->url}/{$brand->url}" target="_blank">
																					<span class="chip__label">{$lang->all_products_category|escape}</span>
																				</a>
																			</div>
																		</div>
																	</div>
																</div>
															{/if}
															<div class="grid-list__item">
																<div class="catalog-detail__tizers-block outer-rounded-x">
																	<div class="tizers-list outer-rounded-x tizers-list--compact">
																		<div class="tizers-list__items-wrapper grid-list grid-list--items-1 grid-list--gap-20">
																			<div class="tizers-list__item-wrapper grid-list__item">
																				<div class="tizers-list__item color-theme-parent-all tizers-list__item--images-position-LEFT">
																					<div class="tizers-list__item-image-wrapper tizers-list__item-image-wrapper--position-LEFT">
																						<i class="svg inline svg-inline- fill-theme tizers-list__item-image-icon" aria-hidden="true">
																							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																								<path d="M6.41858 10.2198C6.80633 9.83208 7.435 9.83208 7.82276 10.2198L13.7802 16.1772C14.1679 16.565 14.1679 17.1937 13.7802 17.5814C13.3924 17.9692 12.7637 17.9692 12.376 17.5814L6.41858 11.624C6.03083 11.2363 6.03083 10.6076 6.41858 10.2198Z" fill="#5B7FFF"></path>
																								<path fill-rule="evenodd" clip-rule="evenodd" d="M17.0497 3.97161C15.4046 3.97161 14.071 5.30522 14.071 6.95031C14.071 8.59541 15.4046 9.92902 17.0497 9.92902C18.6948 9.92902 20.0284 8.59541 20.0284 6.95031C20.0284 5.30522 18.6948 3.97161 17.0497 3.97161ZM16.0568 6.95031C16.0568 6.40195 16.5013 5.95741 17.0497 5.95741C17.5981 5.95741 18.0426 6.40195 18.0426 6.95031C18.0426 7.49868 17.5981 7.94322 17.0497 7.94322C16.5013 7.94322 16.0568 7.49868 16.0568 6.95031Z" fill="#5B7FFF"></path>
																								<path fill-rule="evenodd" clip-rule="evenodd" d="M9.80856 0.872443C10.3672 0.313828 11.1248 0 11.9148 0H21.0213C22.6664 0 24 1.33361 24 2.97871V12.0852C24 12.8752 23.6862 13.6328 23.1276 14.1914L14.1914 23.1276C13.0282 24.2908 11.1422 24.2908 9.97891 23.1276L0.872443 14.0211C-0.290814 12.8578 -0.290814 10.9718 0.872443 9.80856L9.80856 0.872443ZM11.9148 1.9858C11.6515 1.9858 11.3989 2.09041 11.2127 2.27662L2.27662 11.2127C1.88887 11.6005 1.88887 12.2292 2.27662 12.6169L11.3831 21.7234C11.7708 22.1111 12.3995 22.1111 12.7873 21.7234L21.7234 12.7873C21.9096 12.6011 22.0142 12.3485 22.0142 12.0852V2.97871C22.0142 2.43034 21.5697 1.9858 21.0213 1.9858H11.9148Z" fill="#5B7FFF"></path>
																							</svg>
																						</i>
																					</div>
																					<div class="tizers-list__item-text-wrapper">
																						<span class="tizers-list__item-name font_14 color_222">
																							{$lang->prices_for_brands|escape}
																						</span>
																					</div>
																				</div>
																			</div>
																			<div class="tizers-list__item-wrapper grid-list__item">
																				<div class="tizers-list__item color-theme-parent-all tizers-list__item--images-position-LEFT">
																					<div class="tizers-list__item-image-wrapper tizers-list__item-image-wrapper--position-LEFT">
																						<i class="svg inline svg-inline- fill-theme tizers-list__item-image-icon" aria-hidden="true">
																							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																								<path fill-rule="evenodd" clip-rule="evenodd" d="M0.031959 5.17717C-0.0960143 4.67861 0.16991 4.15411 0.658522 3.97452L10.9749 0.182569C11.6372 -0.0608566 12.3631 -0.0608562 13.0254 0.182569L22.0253 3.49062C23.2108 3.92639 24 5.06529 24 6.34043V17.6596C24 18.9347 23.2108 20.0736 22.0253 20.5094L13.0254 23.8174C12.3631 24.0609 11.6372 24.0609 10.9749 23.8174L1.97502 20.5094C0.789464 20.0736 0.000272504 18.9347 0.000272504 17.6596V16.0432C0.000272504 15.4849 0.447983 15.0324 1.00026 15.0324C1.55254 15.0324 2.00025 15.4849 2.00025 16.0432V17.6596C2.00025 18.0846 2.26331 18.4643 2.6585 18.6095L11.0001 21.6756V10.086L0.666101 6.38254C0.173506 6.206 -0.096845 5.67912 0.031959 5.17717ZM11.6584 2.08244C11.8792 2.0013 12.1211 2.0013 12.3419 2.08244L20.9247 5.23719L12.007 8.30196L3.26297 5.16831L11.6584 2.08244ZM13.0001 21.6756L21.3418 18.6095C21.737 18.4643 22 18.0846 22 17.6596V7.00286L13.0001 10.0959V21.6756Z" fill="#5B7FFF"></path>
																								<path d="M0.05853 9.63845C0.244281 9.11273 0.81649 8.83875 1.33659 9.02651L8.33651 11.5535C8.85662 11.7413 9.12766 12.3196 8.94191 12.8454C8.75616 13.3711 8.18395 13.6451 7.66385 13.4573L0.663929 10.9303C0.143825 10.7426 -0.127221 10.1642 0.05853 9.63845Z" fill="#5B7FFF"></path>
																								<path d="M4.35135 13.5805C3.83423 13.3845 3.25783 13.6494 3.06391 14.1721C2.86999 14.6948 3.13199 15.2774 3.64911 15.4734L7.64906 16.9896C8.16618 17.1856 8.74258 16.9208 8.9365 16.3981C9.13042 15.8754 8.86842 15.2928 8.3513 15.0967L4.35135 13.5805Z" fill="#5B7FFF"></path>
																							</svg>
																						</i>
																					</div>
																					<div class="tizers-list__item-text-wrapper">
																						<span class="tizers-list__item-name font_14 color_222">
																							{$lang->fast_delivery|escape}
																						</span>
																					</div>
																				</div>
																			</div>
																			<div class="tizers-list__item-wrapper grid-list__item">
																				<div class="tizers-list__item color-theme-parent-all tizers-list__item--images-position-LEFT">
																					<div class="tizers-list__item-image-wrapper tizers-list__item-image-wrapper--position-LEFT">
																						<i class="svg inline svg-inline- fill-theme tizers-list__item-image-icon" aria-hidden="true">
																							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																								<path d="M2 4.00737C2 2.90077 2.89543 2.00369 4 2.00369H11C11.5523 2.00369 12 1.55515 12 1.00184C12 0.448541 11.5523 0 11 0H4C1.79086 0 0 1.79416 0 4.00737V12.8633C0 15.7993 1.60233 18.5002 4.1765 19.9034L11.0212 23.6345C11.9518 24.1418 13.0806 24.1197 13.9907 23.5763L20.0758 19.9434C22.5092 18.4906 24 15.862 24 13.024C24 12.4707 23.5523 12.0221 23 12.0221C22.4477 12.0221 22 12.4707 22 13.024C22 15.156 20.8801 17.1307 19.0519 18.2222L12.9669 21.8551C12.6635 22.0362 12.2873 22.0436 11.9771 21.8745L5.13237 18.1434C3.20175 17.091 2 15.0653 2 12.8633V4.00737Z" fill="#5B7FFF"></path>
																								<path fill-rule="evenodd" clip-rule="evenodd" d="M17.4487 0.685033C17.3126 0.275938 16.9304 0 16.5 0C16.0696 0 15.6874 0.275938 15.5513 0.685033L14.4007 4.14337C14.2016 4.74168 13.733 5.21118 13.1357 5.41062L9.68377 6.5634C9.27543 6.69976 9 7.0826 9 7.51383C9 7.94505 9.27543 8.32789 9.68377 8.46426L13.1357 9.61704C13.733 9.81648 14.2016 10.286 14.4007 10.8843L15.5513 14.3426C15.6874 14.7517 16.0696 15.0277 16.5 15.0277C16.9304 15.0277 17.3126 14.7517 17.4487 14.3426L18.5993 10.8843C18.7984 10.286 19.267 9.81648 19.8643 9.61704L23.3162 8.46426C23.7246 8.32789 24 7.94505 24 7.51383C24 7.0826 23.7246 6.69976 23.3162 6.5634L19.8643 5.41062C19.267 5.21118 18.7984 4.74168 18.5993 4.14337L17.4487 0.685033ZM16.298 4.77699L16.5 4.16995L16.702 4.77699C17.1001 5.97362 18.0374 6.91261 19.2318 7.31148L19.8377 7.51383L19.2318 7.71618C18.0374 8.11505 17.1001 9.05404 16.702 10.2507L16.5 10.8577L16.298 10.2507C15.8999 9.05404 14.9626 8.11505 13.7682 7.71618L13.1623 7.51383L13.7682 7.31148C14.9626 6.91261 15.8999 5.97362 16.298 4.77699Z" fill="#5B7FFF"></path>
																								<path d="M8.06876 10.6552C8.27001 10.1399 8.85009 9.8857 9.3644 10.0873L11.0171 10.7352C12.0561 11.1425 12.878 11.966 13.2845 13.0068L13.9312 14.6626C14.1325 15.1778 13.8787 15.759 13.3644 15.9606C12.8501 16.1622 12.27 15.908 12.0688 15.3927L11.422 13.7369C11.2188 13.2165 10.8078 12.8048 10.2883 12.6012L8.6356 11.9532C8.12129 11.7516 7.86751 11.1705 8.06876 10.6552Z" fill="#5B7FFF"></path>
																							</svg>
																						</i>
																					</div>
																					<div class="tizers-list__item-text-wrapper">
																						<span class="tizers-list__item-name font_14 color_222">
																							{$lang->quality_guarantee|escape}
																						</span>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="catalog-detail__info-tc"></div>
														</div>
														<div class="catalog-detail__main-part catalog-detail__main-part--right sticky-block flex-1 line-block__item grid-list grid-list--items-1 grid-list--gap-8 grid-list--fill-bg">
															<div class="grid-list__item">
																<div class="catalog-detail__buy-block catalog-detail__cell-block outer-rounded-x shadow" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
																	<link itemprop="availability" href="http://schema.org/InStock">
																	{if !empty($product->sale_to)}
																		<meta itemprop="priceValidUntil" content="{$product->sale_to|date:'Y-m-d'}">
																	{/if}
																	<link itemprop="url" href="{$config->root_url}/{$lang_link}products/{$product->url}">
																	<div class="line-block line-block--20 line-block--16-vertical line-block--align-normal flexbox--wrap flexbox--justify-beetwen">
																		<div class="line-block__item catalog-detail__price catalog-detail__info--margined js-popup-price">
																			<div class="price color_222">
																				{if $v->compare_price > $v->price && $v->price > 0}
																					<div class="price-economy">
																						<span class="js-price-economy__val price-economy__val sticker__item--stock font_12">{round((($v->price-$v->compare_price)/$v->compare_price)*100, 0)}%</span>
																					</div>
																				{/if}
																				<div class="line-block line-block--6 line-block--align-baseline line-block--flex-wrap">
																					<div class="line-block__item">
																						<div class="price__new">
																							<span class="price__new-val font_24">
																								<span class="js-price__new-val">{$product->variant->price|convert}</span> {$currency->sign|escape}
																								<meta itemprop="price" content="{$product->variant->price|convert:'':false}">
																								<meta itemprop="priceCurrency" content="{$currency->code|escape}">
																							</span>
																						</div>
																					</div>
																					{if $product->variant->compare_price > 0}
																						<div class="line-block__item">
																							<div class="price__old">
																								<span class="price__old-val font_16 color_999">
																									<span class="js-price__old-val">{$product->variant->compare_price|convert}</span> {$currency->sign|escape}
																								</span>
																							</div>
																						</div>
																					{/if}
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="catalog-detail__cart js-replace-btns js-config-btns">
																		<div class="buy_block btn-actions__inner">
																			<div class="buttons">
																				<div class="line-block line-block--12-vertical line-block--align-normal flexbox--direction-column">
																					<div class="line-block__item counter-block" style="display: none;">
																						<div class="btn btn-default btn-lg btn-wide in_cart">
																							<div class="counter js-ajax">
																								<span class="counter__action counter__action--minus"></span>
																								<div class="counter__count-wrapper">
																									<input type="text" value="1" class="counter__count" maxlength="6">
																								</div>
																								<span class="counter__action counter__action--plus"></span>
																							</div>
																						</div>
																					</div>
																					<div class="line-block__item">
																						<span class="item-action item-action--basket">
																							<button id="add-to-cart" type="submit" data-result-text="{$lang->added_cart|escape}" class="btn btn-default btn-lg btn-wide to_cart animate-load {if !$product->variant->stock}disabled{/if}" data-ratio="1" data-float_ratio="1" data-quantity="1" value="{$lang->add_cart|escape}" title="{$lang->add_cart|escape}" {if !$product->variant->stock}disabled{/if}>{$lang->add_cart|escape}</button>
																						</span>
																					</div>
																					<div class="line-block__item">
																						<button id="fast-order" type="button" class="btn btn-default btn-wide btn-transparent btn-md btn-ocb animate-load {if !$product->variant->stock}disabled{/if}" data-event="jqm" data-name="ocb" data-url="{$lang_link}products/{$product->url}?tpl=fast_order" {if !$product->variant->stock}disabled{/if}>
																							{$lang->buy_one_click|escape}
																						</button>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="grid-list__item">
																<div class="catalog-detail__forms catalog-detail__cell-block grid-list grid-list--items-1 outer-rounded-x shadow font_14">
																	<div class="grid-list__item">
																		<span>
																			{if $product->variant->stock}
																				<span class="catalog-detail__pseudo-link status-container color_222 instock" data-stock="{$lang->not_available|escape}" data-default="{$lang->in_stock|escape}">
																					<span class="icon-container">
																						<i class="svg inline pseudo-link__icon status__svg-icon instock" aria-hidden="true">
																							<svg width="16" height="16">
																								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_status_icons.svg#instock"></use>
																							</svg>
																						</i>
																					</span>
																					<span class="catalog-detail__pseudo-link-text">
																						<span class="js-replace-status status-icon instock">
																							{$lang->in_stock|escape}
																						</span>
																					</span>
																				</span>
																			{else}
																				<span class="catalog-detail__pseudo-link status-container color_222 nostock" data-stock="{$lang->not_available|escape}" data-default="{$lang->in_stock|escape}">
																					<span class="icon-container">
																						<i class="svg inline pseudo-link__icon status__svg-icon nostock" aria-hidden="true">
																							<svg width="16" height="16">
																								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_status_icons.svg#nostock"></use>
																							</svg>
																						</i>
																					</span>
																					<span class="catalog-detail__pseudo-link-text">
																						<span class="js-replace-status status-icon nostock">
																							{$lang->not_available|escape}
																						</span>
																					</span>
																				</span>
																			{/if}
																		</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
										<div class="catalog-detail__bottom-info">
											<div class="detail-block ordered-block tabs-block">
												<div class="tabs tabs-history arrow_scroll">
													<ul class="nav nav-tabs font_14--to-600">
														<li class="active"><a href="#desc" data-toggle="tab">{$lang->description|escape}</a></li>
														<li><a href="#reviews" data-toggle="tab" class="counted">{$lang->comments_global|escape} ({$comments_count})</a></li>
														{if $product->features}<li><a href="#char" data-toggle="tab">{$lang->feature|escape}</a></li>{/if}
														{if $cms_files}<li><a href="#docs" data-toggle="tab">{$lang->files_global|escape}</a></li>{/if}
													</ul>
												</div>
												<div class="tab-content">
													<div class="tab-pane active" id="desc">
														<div class="content content--max-width" itemprop="description">
															{$product->body}
														</div>
													</div>
													<div class="tab-pane EXTENDED" id="reviews">
														<div class="ordered-block__title switcher-title font_24 font_20--to-600">
															{$lang->comments_global|escape}
															{if $comments}
																<span class="element-count-wrapper">
																	<span class="element-count muted font_14">{$comments_count} {$comments_count|plural:$lang->comment_1:$lang->comment_2:$lang->comment_3}</span>
																</span>
															{/if}
														</div>
														<div class="comments-block__wrapper line-block line-block--gap line-block--gap-70">
															<div class="comments-block line-block__item flex-1">
																<div id="soc_comments_div_983" class="tb_soc_comments_div tb_important">
																	<div id="soc_comments_983" class="tb-catalog-tab-section-container">
																		<div class="hidden">
																			<ul class="tb-catalog-tab-list1 nav nav-tabs" style="left: 0;">
																				<li id="soc_comments_983BLOG" class="muted bordered font_upper_md BLOG active">
																					<a href="#soc_comments_983BLOG_cont" data-toggle="tab"></a>
																				</li>
																			</ul>
																		</div>
																		<div class="tb-catalog-tab-body-container catalog_reviews_extended">
																			<div class="tb-catalog-tab-container">
																				<div id="soc_comments_983BLOG_cont">
																					<div id="tb-cat-soc-comments-blg_983">
																						<div id="comp_5bf4bd4d7e11ad27519fcf7f2cfc804d">
																							<div class="comments-block__inner-wrapper">
																								<div id="reviews_sort_continer" class="hidden"></div>
																								<div class="blog-comments" id="blg-comment-748">
																									<a name="comments" class="hidden"></a>
																									<div class="js-form-comment hidden" id="form_comment_" style="display:none;">
																										<div id="form_c_del" style="display:none;">
																											<div class="blog-comment__form">
																												<form enctype="multipart/form-data" method="POST" name="form_comment" id="form_comment">
																													<input type="hidden" id="parent" name="parent_id" value="0">
																													<input type="hidden" id="admin" name="admin" value="{if isset($smarty.session.admin) && $smarty.session.admin == 'admin'}1{else}0{/if}">
																													<div class="form popup blog-comment-fields outer-rounded-x bordered">
																														<div class="form-header">
																															<div class="blog-comment-field blog-comment-field-user">
																																<div class="row form">
																																	<div class="col-md-6 col-sm-6">
																																		<div class="form-group ">
																																			<label for="user_name">{$lang->name|escape}<span class="required-star">*</span></label>
																																			<div class="input">
																																				<input maxlength="255" size="30" class="form-control required" required="" tabindex="3" type="text" name="name" id="user_name" value="{$comment_name|escape}">
																																			</div>
																																		</div>
																																	</div>
																																</div>
																															</div>
																															<div class="row form">
																																<div class="col-md-12">
																																	<div class="form-group">
																																		<label class="rating_label" data-hide="">{$lang->your_rating|escape} <span class="required-star">*</span></label>
																																		<div class="votes_block nstar big with-text" data-hide="">
																																			<div class="ratings">
																																				<div class="inner_rating rating__star-svg">
																																					<div class="item-rating rating__star-svg" data-message="{$lang->very_bad|escape}">
																																						<i class="svg inline" aria-hidden="true">
																																							<svg width="16" height="16">
																																								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																																							</svg>
																																						</i>
																																					</div>
																																					<div class="item-rating rating__star-svg" data-message="{$lang->bad|escape}">
																																						<i class="svg inline" aria-hidden="true">
																																							<svg width="16" height="16">
																																								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																																							</svg>
																																						</i>
																																					</div>
																																					<div class="item-rating rating__star-svg" data-message="{$lang->normal|escape}">
																																						<i class="svg inline" aria-hidden="true">
																																							<svg width="16" height="16">
																																								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																																							</svg>
																																						</i>
																																					</div>
																																					<div class="item-rating rating__star-svg" data-message="{$lang->fine|escape}">
																																						<i class="svg inline" aria-hidden="true">
																																							<svg width="16" height="16">
																																								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																																							</svg>
																																						</i>
																																					</div>
																																					<div class="item-rating rating__star-svg" data-message="{$lang->great|escape}">
																																						<i class="svg inline" aria-hidden="true">
																																							<svg width="16" height="16">
																																								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																																							</svg>
																																						</i>
																																					</div>
																																				</div>
																																			</div>
																																			<div class="rating_message muted" data-message="{$lang->no_rating|escape}">{$lang->no_rating|escape}</div>
																																			<input class="hidden" name="rating" value="0" required="" aria-required="true">
																																		</div>
																																	</div>
																																</div>
																															</div>
																															<div class="row form comment">
																																<div class="col-md-12">
																																	<div class="form-group">
																																		<label for="comment">{$lang->comment|escape}</label>
																																		<div class="input">
																																			<textarea rows="3" class="form-control" tabindex="3" name="text" id="comment" value="">{$comment_text}</textarea>
																																		</div>
																																	</div>
																																</div>
																															</div>
																															{if $settings->captcha_product}
																																<div class="clearfix fill-animate">
																																	<label class="font_14">
																																		<span>{$lang->captcha_label|escape}&nbsp;<span class="required-star">*</span></span>
																																	</label>
																																</div>
																																<div class="row">
																																	<div class="form-group col-sm-6 pb-3">
																																		{get_captcha var="captcha_product"}
																																		<div class="secret-number">{$captcha_product[0]|escape} + ? = {$captcha_product[1]|escape}</div>
																																	</div>
																																	<div class="form-group col-sm-6">
																																		<div class="input">
																																			<input type="text" class="form-control required" name="captcha_code" value="" autocomplete="off" required>
																																		</div>
																																	</div>
																																</div>
																															{/if}
																															<div class="blog-comment-buttons-wrapper font_15">
																																<input tabindex="10" class="btn btn-default" value="{$lang->post_review|escape}" type="submit" name="comment" id="post-button">
																															</div>
																														</div>
																													</div>
																												</form>
																											</div>
																										</div>
																									</div>
																									{if $comments}
																										<div class="reviews_sort">
																											<div class="filter-panel sort_header">
																												<div class="filter-panel__sort">
																													<div class="filter-panel__sort-form__inner flexbox flexbox--row flexbox--wrap">
																														<div class="filter-panel__sort-form__item dropdown-select dropdown-select--with-dropdown">
																															<div class="dropdown-select__title font_14 font_large fill-dark-light bordered rounded-x shadow-hovered shadow-no-border-hovered">
																																<span>
																																	{if $sort=='rate'}
																																		{$lang->popular|escape}
																																	{elseif $sort=='date'}
																																		{$lang->in_order|escape}
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
																																		{if $sort=='rate'}
																																			<span class="dropdown-menu-item color_222 dropdown-menu-item--current">
																																				<span>{$lang->popular|escape}</span>
																																			</span>
																																		{else}
																																			<a href="{url sort=rate page=null}" class="dropdown-menu-item dark_link">
																																				<span>{$lang->popular|escape}</span>
																																			</a>
																																		{/if}
																																	</div>
																																	<div class="dropdown-select__list-item font_15">
																																		{if $sort=='date'}
																																			<span class="dropdown-menu-item color_222 dropdown-menu-item--current">
																																				<span>{$lang->in_order|escape}</span>
																																			</span>
																																		{else}
																																			<a href="{url sort=date page=null}" class="dropdown-menu-item dark_link">
																																				<span>{$lang->in_order|escape}</span>
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
																									{/if}
																									{* Error *}
																									{if $error}
																										<div class="alert alert-danger" role="alert">
																											{if $error=='captcha'}
																												{$lang->captcha_incorrect|escape}
																											{elseif $error=='empty_name'}
																												{$lang->enter_your_name|escape}
																											{elseif $error=='empty_comment'}
																												{$lang->enter_a_comment|escape}
																											{/if}
																										</div>
																									{/if}
																									<div class="js-form-comment" id="form_comment_0" style="display: none;"></div>
																									{if $comments}
																										<div class="js_append blog-comment__container">
																											{function name=comments_tree level=0}
																												{foreach $comments as $comment name=tree}
																													{if $level == 0}
																														<div class="js-infinite blog-comment parent bordered outer-rounded-x">
																														{else}
																															<div class="blog-comment blog-comment--child" style="--blog_comment_padding: 0">
																															{/if}
																															<a name="comment_{$comment->id}"></a>
																															<div id="blg-comment-{$comment->id}" class="blog-comment__content">
																																{if $level == 1}
																																	<div class="blog-comment__icon-answer">
																																		<i class="svg inline stroke-dark-light" aria-hidden="true">
																																			<svg width="12" height="12">
																																				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#comment_answer-12-12"></use>
																																			</svg>
																																		</i>
																																	</div>
																																{/if}
																																<div class="blog-comment-cont table-full-width colored_theme_bg_before">
																																	<div class="blog-comment-cont-white">
																																		<div class="blog-comment-info">
																																			<div class="left_info">
																																				<div class="blog-comment__author color_222 font_16">{$comment->name|escape}</div>
																																				<div class="blog-comment__date color_999 font_14">
																																					{$comment->date|date} {$lang->at|escape} {$comment->date|time}
																																					{if !$comment->approved}
																																						<span class="text-danger">{$lang->awaiting_moderation|escape}</span>
																																					{/if}
																																				</div>
																																			</div>
																																			{if $comment->admin == 0 && $level == 0}
																																				<div class="blog-info__rating">
																																					<div class="votes_block nstar big with-text">
																																						<div class="ratings">
																																							<div class="inner_rating">
																																								{strip}
																																									{section name=rate start=0 loop=5 step=1}
																																										{if $smarty.section.rate.index < $comment->rating}
																																											{if ($smarty.section.rate.index + 1) > $comment->rating}
																																												<div class="item-rating rating__star-svg rating__star-svg--filled">
																																													<i class="svg inline" aria-hidden="true">
																																														<svg width="16" height="16">
																																															<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																																														</svg>
																																													</i>
																																												</div>
																																											{else}
																																												<div class="item-rating rating__star-svg rating__star-svg--filled">
																																													<i class="svg inline" aria-hidden="true">
																																														<svg width="16" height="16">
																																															<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																																														</svg>
																																													</i>
																																												</div>
																																											{/if}
																																										{else}
																																											<div class="item-rating rating__star-svg">
																																												<i class="svg inline" aria-hidden="true">
																																													<svg width="16" height="16">
																																														<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																																													</svg>
																																												</i>
																																											</div>
																																										{/if}
																																									{/section}
																																								{/strip}
																																							</div>
																																						</div>
																																					</div>
																																				</div>
																																			{/if}
																																		</div>
																																		<div class="blog-comment-post">
																																			<div class="blog-comment-post__item comment-text__text VIRTUES font_16">{$comment->text|escape|nl2br}</div>
																																			<div class="blog-comment-post__item blog-comment-meta">
																																				<span class="rating-vote">
																																					<a href="ajax/comment_rate.php?id={$comment->id}&rate=up" class="rating-vote__item rating-vote__item-like stroke-dark-light-block dark_link plus {if $comment->rate > 0}active{/if}" data-action="plus" title="{$lang->like|escape}">
																																						<span class="rating-vote__icon">
																																							<i class="svg inline" aria-hidden="true">
																																								<svg width="20" height="22">
																																									<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#like-20-22"></use>
																																								</svg>
																																							</i>
																																						</span>
																																					</a>
																																					<span class="rating-vote__result {if $comment->rate != 0}active{/if}">{$comment->rate}</span>
																																					<a href="ajax/comment_rate.php?id={$comment->id}&rate=down" class="rating-vote__item rating-vote__item-dislike stroke-dark-light-block dark_link minus {if $comment->rate < 0}active{/if}" data-action="minus" title="{$lang->dislike|escape}">
																																						<span class="rating-vote__icon">
																																							<i class="svg inline" aria-hidden="true">
																																								<svg width="20" height="22">
																																									<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#dislike-20-22"></use>
																																								</svg>
																																							</i>
																																						</span>
																																					</a>
																																				</span>
																																				{if $level == 0}
																																					<span class="blog-comment-answer blog-comment-action color_222">
																																						<a href="javascript:void(0)" class="blog-comment-action__link dotted dark_link font_14" data-id="{$comment->id}">{$lang->add_comment|escape}</a>
																																					</span>
																																				{/if}
																																			</div>
																																		</div>
																																	</div>
																																</div>
																															</div>
																															<div id="form_comment_{$comment->id}" class="js-form-comment blog-comment__form-container" style="display: none"></div>
																															{if isset($children[$comment->id])}
																																{comments_tree comments=$children[$comment->id] level=$level+1}
																															{/if}
																														</div>
																													{/foreach}
																												{/function}
																												{comments_tree comments=$comments}
																											</div>
																											{if $total_pages_num > 1}
																												<div class="wrap_nav bottom_nav_wrapper">
																													<div class="bottom_nav_wrapper nav-compact">
																														<div class="bottom_nav">
																															{if $current_page_num < $total_pages_num}
																																<div class="ajax_load_btn">
																																	<span class="more_text_ajax btn btn-transparent">
																																		{$lang->load_more|escape}
																																	</span>
																																</div>
																															{/if}
																															{* Paginations *}
																															{include file='paginations/pagination.tpl'}
																														</div>
																													</div>
																												</div>
																											{/if}
																										{else}
																											<div class="rounded-x bordered alert-empty">
																												{$lang->help_other_users|escape}
																											</div>
																										{/if}
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
																<div class="comments-block__reviews-info catalog-detail__right-column right_reviews_info line-block__item flex-1">
																	<div class="comments-block__reviews-info-inner catalog-detail__cell-block sticky-block shadow outer-rounded-x">
																		<div class="rating-wrapper flexbox flexbox--row">
																			{if $comments}
																				<div class="votes_block nstar with-text">
																					<div class="item-rating rating__star-svg rating__star-svg--filled">
																						<i class="svg inline" aria-hidden="true">
																							<svg width="28" height="28">
																								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																							</svg>
																						</i>
																					</div>
																				</div>
																			{/if}
																			<div class="rating-value font_24">
																				<span class="count">
																					{if $comments}
																						{if $product->ratings|string_format:'%.1f'|floatval > 0}{$product->ratings|string_format:'%.1f'}{else}{$product->ratings|intval}{/if}
																					{else}
																						{$lang->no_reviews|escape}
																					{/if}
																				</span>
																			</div>
																		</div>
																		<div class="show-comment btn btn-default blog-comment-action__link has-ripple" data-id="0">
																			{$lang->add_review|escape}
																		</div>
																	</div>
																</div>
															</div>
														</div>
														{* Features *}
														{if $product->features}
															<div class="tab-pane" id="char">
																<div class="props_block">
																	<div class="props_block__wrapper">
																		<div class="properties-group properties-group--table js-offers-group-wrap">
																			<div class="properties-group__group" data-group-code="obshchie-kharakteristiki">
																				<div class="properties-group__items js-offers-group__items-wrap font_15">
																					{foreach $product->features as $f}
																						{if !$f->is_color}
																							<div class="properties-group__item" itemprop="additionalProperty" itemscope="" itemtype="http://schema.org/PropertyValue">
																								<div class="properties-group__name-wrap">
																									<span itemprop="name" class="properties-group__name color_666">{$f->name}</span>
																								</div>
																								<div class="properties-group__value-wrap">
																									<div class="properties-group__value color_222" itemprop="value">
																										{foreach $f->values as $v}
																											{if $f->url_in_product && $f->in_filter}
																												<a href="{$lang_link}catalog/{$category->url}/{$f->url}-{$v->translit}" class="dotted">{$v->value|escape}</a>
																											{else}
																												{$v->value|escape}{if !$v@last},{/if}
																											{/if}
																										{/foreach}
																									</div>
																								</div>
																							</div>
																						{/if}
																					{/foreach}
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														{/if}
														{if $cms_files}
															<div class="tab-pane" id="docs">
																<div class="doc-list-inner__list  grid-list grid-list--rounded grid-list--items-2-768 grid-list--no-gap grid-list--gap-column-24">
																	{foreach $cms_files as $file}
																		{assign var="filename" value=$file->filename}
																		{assign var="file_parts" value=$filename|split:'.'}
																		{assign var="extension" value=$file_parts|@array_pop}
																		{assign var="file_path" value=$config->cms_files_dir|cat:$filename}
																		{assign var="file_size" value=$file_path|@filesize}
																		<div class="doc-list-inner__wrapper grid-list__item grid-list__item--rounded colored_theme_hover_bg-block grid-list-border-outer fill-theme-parent-all">
																			<div class="doc-list-inner__item height-100 shadow-hovered shadow-no-border-hovered">
																				<div class="doc-list-inner__icon-wrapper">
																					<a class="file-type doc-list-inner__icon">
																						<i class="file-type__icon file-type__icon--{$extension}"></i>
																					</a>
																				</div>
																				<div class="doc-list-inner__content-wrapper">
																					<div class="doc-list-inner__top">
																						<a href="{$config->cms_files_dir}{$file->filename}" target="_blank" class="doc-list-inner__name dark_link color-theme-target switcher-title" {if $file->name}title="{$file->name}" {/if}>
																							{if $file->name}{$file->name}{else}{$file->filename}{/if}
																						</a>
																						<div class="doc-list-inner__label">{$file_size|format_filesize}</div>
																						<a class="doc-list-inner__icon-preview-image doc-list-inner__link-file  fill-theme-parent" target="_blank" href="{$config->cms_files_dir}{$file->filename}">
																							<i class="svg inline image-preview fill-theme-target fill-dark-light-block" aria-hidden="true">
																								<svg width="18" height="18">
																									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/documents_icons.svg#file-download-18-18"></use>
																								</svg>
																							</i>
																						</a>
																					</div>
																				</div>
																			</div>
																		</div>
																	{/foreach}
																</div>
															</div>
														{/if}
													</div>
												</div>
												{* Recommended Products *}
												{if $recommended_products}
													{include file='products/recommended_products.tpl'}
												{/if}
											</div>
										</div>
									</div>
									{* Nex & Prev *}
									{if $prev_product || $next_product}
										<div class="bottom-links-block">
											{if $prev_product}
												<a class="back-url font_short stroke-dark-light-block dark_link" href="{$lang_link}products/{$prev_product->url}">
													<span class="back-url-icon">
														<i class="svg inline stroke-dark-light arrow-all__item-arrow" aria-hidden="true">
															<svg width="18" height="12">
																<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-18-12"></use>
															</svg>
														</i>
													</span>
													<span class="back-url-text">{$prev_product->name|escape}</span>
												</a>
											{/if}
											{if $next_product}
												<a class="back-url font_short stroke-dark-light-block dark_link" href="{$lang_link}products/{$next_product->url}">
													<span class="next-url-text">{$next_product->name|escape}</span>
													<span class="back-url-icon">
														<i class="svg inline stroke-dark-light arrow-all__item-arrow" aria-hidden="true">
															<svg width="18" height="12">
																<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-18-12"></use>
															</svg>
														</i>
													</span>
												</a>
											{/if}
										</div>
									{/if}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		if (window.location.href.indexOf('#comment_') !== -1) {
			var activeTab = '#reviews';
			$('.nav-tabs a[href="' + activeTab + '"]').tab('show');
			scroll_block($(activeTab));
		}
	});
</script>
{if $error || isset($smarty.get.sort)}
	<script>
		$(document).ready(function() {
			var activeTab = localStorage.getItem('activeTab');
			if (activeTab) {
				$('.nav-tabs a[href="' + activeTab + '"]').tab('show');
				scroll_block($(activeTab));
			}
		});
	</script>
{/if}