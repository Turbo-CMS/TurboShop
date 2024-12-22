<span class="jqmClose top-close fill-theme-hover fill-use-svg-999" title="{$lang->close|escape}">
	<i class="svg inline" aria-hidden="true">
		<svg width="14" height="14">
			<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-14-14"></use>
		</svg>
	</i>
</span>

{literal}
	<script data-skip-moving="true">
		initCountdown();
		InitFancyBox();
		InitFancyBoxVideo();

		if (typeof initSwiperSlider === 'function') {
			initSwiperSlider()
		}

		$('#fast_view_item .animate-load').click(function() {
			$(this).parent().addClass('loadings');
		});

		$(document).on('click', '.jqmClose', function(e) {
			e.preventDefault();
			$(this).closest('.jqmWindow').jqmHide();
		});
	</script>
{/literal}

<div id="fast_view_item" class="scrollbar">
	<div class="product-container detail clearfix1 product" itemscope="" itemtype="http://schema.org/Product">
		<div class="catalog-detail js-popup-block">
			<div class="flex-1">
				<div class="catalog-detail__top-info flexbox flexbox--direction-row flexbox--wrap-nowrap">
					<meta itemprop="name" content="{$product->name|escape}">
					<link itemprop="url" href="{$product->url}">
					<meta itemprop="category" content="{$category->name|escape}">
					<meta itemprop="description" content="{$product->annotation|escape}">
					<meta itemprop="sku" content="{$product->variant->sku}">
					<div class="detail-gallery-big swipeignore image-list__link">
						<div class="detail-gallery-big-inner">
							<div class="detail-gallery-big-wrapper">
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
								{if $product->image}
									<link id="main-product-image" href="{$product->image->filename|resize:700:700}" itemprop="image" />
								{/if}
								<div class="detail-gallery-big-slider big js-detail-img swiper slider-solution" data-slide-class-list="detail-gallery-big__item detail-gallery-big__item--big swiper-slide" data-plugin-options="{literal}{&quot;direction&quot;:&quot;horizontal&quot;,&quot;init&quot;:false,&quot;keyboard&quot;:{&quot;enabled&quot;:true},&quot;pagination&quot;:{&quot;enabled&quot;:true,&quot;el&quot;:&quot;#fast_view_item .swiper-pagination&quot;},&quot;slidesPerView&quot;:1,&quot;type&quot;:&quot;detail_gallery_main&quot;}{/literal}">
									<div class="detail-gallery-big-slider__wrapper swiper-wrapper image">
										{if $product->image}
											{foreach $product->images as $i=>$image name=img}
												<div id="big-photo-{$smarty.foreach.img.index}" class="detail-gallery-big__item detail-gallery-big__item--big swiper-slide">
													<a href="{$image->filename|resize:700:700:$theme_settings->watermark}" data-fancybox="gallery_fast_view" class="detail-gallery-big__link popup_link fancy fancy-thumbs" title="{$product->name|escape}">
														<img class="detail-gallery-big__picture ls-is-cached lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$image->filename|resize:700:700:$theme_settings->watermark}" alt="{$product->name|escape}" title="{$product->name|escape}">
													</a>
												</div>
											{/foreach}
										{else}
											<div id="big-photo-0" class="detail-gallery-big__item detail-gallery-big__item--big swiper-slide">
												<a href="design/{$settings->theme|escape}/images/no-photo.svg" data-fancybox="gallery" class="detail-gallery-big__link popup_link fancy fancy-thumbs" title="{$product->name|escape}">
													<img style="width: 250px; height: 250px;" class="detail-gallery-big__picture ls-is-cached lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}" title="{$product->name|escape}" />
												</a>
											</div>
										{/if}
									</div>
									<div class="slider-nav swiper-button-prev" style="display: none">
										<i class="svg inline stroke-dark-light" aria-hidden="true">
											<svg width="7" height="12">
												<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
											</svg>
										</i>
									</div>
									<div class="slider-nav swiper-button-next" style="display: none">
										<i class="svg inline stroke-dark-light" aria-hidden="true">
											<svg width="7" height="12">
												<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
											</svg>
										</i>
									</div>
									<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
								</div>
								<div class="swiper-pagination swiper-pagination--bottom"></div>
							</div>
							<div class="btn-wrapper">
								<a href="{$lang_link}products/{$product->url}" class="btn btn-default btn-sm btn-transparent-border btn-wide js-replace-more" title="{$lang->more_details_product|escape}">
									<span>{$lang->more_details_product|escape}</span>
								</a>
							</div>
						</div>
					</div>
					<div class="catalog-detail__main scrollbar">
						<div class="catalog-detail__main-wrapper">
							<div class="catalog-detail__buy-block" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
								<div class="sticker sticker--upper sticker--static">
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
								<a href="{$lang_link}products/{$product->url}" class="dark_link">
									<h1 class="catalog-detail__title js-popup-title switcher-title font_24">
										<span data-product="{$product->id}">{$product->name|escape}</span>
									</h1>
								</a>
								<div class="catalog-detail__info-tech">
									<div class="line-block line-block--20 line-block--align-normal flexbox--justify-beetwen flexbox--wrap">
										<div class="line-block__item">
											<div class="catalog-detail__info-tech">
												<div class="line-block line-block--20 flexbox--wrap js-popup-info">
													<div class="line-block__item font_14 color_222">
														<div class="rating" title="{if $product->ratings|string_format:'%.1f'|floatval > 0}{$lang->rating|escape} {$product->ratings|string_format:'%.1f'} {$lang->out_of|escape} 5{else}{$lang->no_ratings|escape}{/if}" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
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
																	<a href="{$lang_link}products/{$product->url}" class="choise dotted font_14 color_222 rating__static-block pointer">
																		{$comments_count} {$comments_count|plural:$lang->comment_1:$lang->comment_2:$lang->comment_3}
																	</a>
																</div>
															</div>
														</div>
													</div>
													{* SKU *}
													{if $product->variant->sku}
														<div class="line-block__item font_13 color_999">
															<span class="article">
																{$lang->sku|escape}&nbsp;<span class="js-replace-article" data-value="{$product->variant->sku}">{$product->variant->sku}</span>
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
													{if isset($smarty.session.compared_products) && in_array($product->url, $smarty.session.compared_products)}
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
											</div>
										</div>
									</div>
								</div>
								<form class="variants" action="{$lang_link}cart">
									{if $product->variants|count > 1 || $product->related_products}
										<div class="catalog-block__offers1">
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
																			<label class="sku-props__value sku-props__value--pict js-sku-props__value--pict {if $product->id == $related_product->id}sku-props__value--active{/if} {if $related_product->variant->color_code == '#ffffff'}white{/if}" data-title="{$related_product->variant->color}" title="{$related_product->variant->color}" style="background: {$related_product->variant->color_code}" data-url="{$lang_link}products/{$related_product->url}?tpl=quickview">
																				{$related_product->variant->color}
																			</label>
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
																<div id="variants-quickview" class="line-block line-block--flex-wrap line-block--4 sku-props__values">
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
									<div class="line-block line-block--20 line-block--16-vertical line-block--align-normal flexbox--wrap flexbox--justify-beetwen">
										<div class="line-block__item catalog-detail__price js-popup-price">
											<div class="price color_222">
												{if $v->compare_price > $v->price && $v->price > 0}
													<div class="price-economy">
														<span class="js-price-economy__val price-economy__val sticker__item--stock font_12">{round((($product->variant->price-$product->variant->compare_price)/$product->variant->compare_price)*100, 0)}%</span>
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
																<span class="price__old-val font_16 color_999"><span class="js-price__old-val">{$product->variant->compare_price|convert}</span> {$currency->sign|escape}</span>
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
								</form>
								<div class="catalog-detail__forms grid-list grid-list--items-1 font_14">
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
							{if $product->features}
								<div class="char-side">
									<div class="char-side__title font_15 color_222">{$lang->feature|escape}</div>
									<div class="properties list font_14">
										<div class="properties__container properties js-offers-prop">
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
								</div>
							{/if}
							{if $product->annotation}
								<div class="catalog-detail__previewtext" itemprop="description">
									<div class="text-block font_14 color_666">
										{$product->annotation}
									</div>
								</div>
							{/if}
							{* Brand *}
							{if $brand}
								<div class="brand-detail flexbox line-block--gap line-block--gap-12">
									{if $brand->image}
										<div class="brand-detail-info" itemprop="brand" itemtype="https://schema.org/Brand" itemscope="">
											<meta itemprop="name" content="{$brand->name|escape}">
											<div class="brand-detail-info__image rounded-x">
												<a href="{$lang_link}brands/{$brand->url}">
													<img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$brand->image|resize_brands:150:25}" alt="{$brand->name|escape}" title="{$brand->name|escape}" itemprop="image">
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
							{/if}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>