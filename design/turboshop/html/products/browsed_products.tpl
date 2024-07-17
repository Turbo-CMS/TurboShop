{get_browsed_products var=browsed_products limit=10}
{if isset($browsed_products)}
	<div class="catalog-viewed">
		<div class="catalog-viewed__inner">
			<div class="catalog-viewed-list">
				<div class="maxwidth-theme">
					<div class="index-block__title-wrapper index-block__title-wrapper--mb-35">
						<div class="index-block__part--left">
							<h3 class="index-block__title switcher-title">
								<span>{$lang->viewed_products}</span>
							</h3>
						</div>
					</div>
				</div>
				<div class="maxwidth-theme">
					<div class="catalog-viewed-list__slider-wrap swiper-nav-offset">
						<div class="swiper slider-solution appear-block mobile-offset mobile-offset--right" data-plugin-options='{literal}{"preloadImages":false,"lazy":false,"keyboard":true,"init":false,"loop":false,"countSlides":2,"slidesPerView":"auto","freeMode":{"enabled":true,"momentum":true,"sticky":true},"spaceBetween":8,"pagination":false,"watchSlidesProgress":true,"type":"catalog_viewed","breakpoints":{"601":{"slidesPerView":2,"freeMode":false,"spaceBetween":24},"769":{"slidesPerView":3,"freeMode":false,"spaceBetween":24},"1025":{"slidesPerView":4,"freeMode":false,"spaceBetween":24},"1251":{"slidesPerView":6,"freeMode":false,"spaceBetween":24}}}{/literal}'>
							<div class="swiper-wrapper">
								{foreach $browsed_products as $product}
									<div class="catalog-viewed__item grid-list__item hover_blink swiper-slide">
										<div class="catalog-viewed__item-wrap outer-rounded-x bordered color-theme-parent-all">
											<div class="catalog-viewed__item__inner flexbox flexbox--column">
												<div class="catalog-viewed__item__image__wrap">
													<div class="catalog-viewed__item__image">
														<a href="{$lang_link}products/{$product->url}" class="thumb">
															{if isset($product->image) && $product->image}
																<img border="0" src="{$product->image->filename|resize:160:160}" alt="{$product->name|escape}" title="{$product->name|escape}">
															{else}
																<img border="0" style="width: 160px; height: 160px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}" title="{$product->name|escape}">
															{/if}
														</a>
													</div>
													{if $product->variant->compare_price > $product->variant->price && $product->variant->price > 0}
														<div class="catalog-viewed__item-sticker">
															<div class="catalog-viewed__item-sticker-value rounded-x sticker__item sticker__item--sale">{round((($product->variant->price-$product->variant->compare_price)/$product->variant->compare_price)*100, 0)}%</div>
														</div>
													{/if}
												</div>
												<div class="catalog-viewed__item__info item_info">
													<div class="price color_222">
														<div class="price__new">
															<span class="price__new-val font_15">{$product->variant->price|convert} {$currency->sign|escape}</span>
														</div>
													</div>
													<div class="catalog-viewed__item__title font_14 linecamp-2">
														<a class="dark_link switcher-title color-theme-target" href="{$lang_link}products/{$product->url}">
															<span data-product="{$product->id}">{$product->name|escape}</span>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								{/foreach}
							</div>
						</div>
						<div class="slider-nav swiper-button-prev slider-nav--shadow">
							<i class="svg inline stroke-dark-light" aria-hidden="true"><svg width="7" height="12">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
								</svg>
							</i>
						</div>
						<div class="slider-nav swiper-button-next slider-nav--shadow">
							<i class="svg inline stroke-dark-light" aria-hidden="true"><svg width="7" height="12">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
								</svg>
							</i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}