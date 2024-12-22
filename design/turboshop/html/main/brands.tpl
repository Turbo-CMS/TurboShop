{get_brands var=all_brands}
{if $all_brands}
	{* Brands Main Type 1 *}
	{if $theme_settings->brands_main_type == '1'}
		<div class="drag-block container BRANDS" data-class="brands_drag" data-order="{$theme_settings->block_4}">
			<div class="index-block index-block--padding-top-{$theme_settings->brands_main_padding_top} index-block--padding-bottom-{$theme_settings->brands_main_padding_bottom} {if $theme_settings->brands_main_delimiter}index-block--delimiter{/if} {if $theme_settings->brands_main_background}index-block--fon{/if}">
				<div class="brands-list brands-list--narrow">
					{if $theme_settings->brands_main_title}
						<div class="maxwidth-theme">
							<div class="index-block__title-wrapper index-block__title-wrapper--mb-35">
								<div class="index-block__part--left">
									<h3 class="index-block__title switcher-title">
										<a class="index-block__link-wrapper dark_link stroke-theme-hover" href="{$lang_link}brands" title="{$lang->all_brands|escape}">
											<span>{$lang->global_brands|escape}</span>
											<span class="index-block__link">
												<span class="index-block__arrow">
													<i class="svg inline" aria-hidden="true">
														<svg width="7" height="12">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
														</svg>
													</i>
												</span>
											</span>
										</a>
									</h3>
								</div>
							</div>
						</div>
					{/if}
					<div class="maxwidth-theme">
						<div class="brands-list__items-wrapper grid-list--fill-bg1 grid-list grid-list--items-6-1400 grid-list--items-5-1200 grid-list--items-3-768 grid-list--items-2-601 mobile-scrolled mobile-scrolled--items-3 mobile-offset">
							{foreach $all_brands|@array_slice:0:$theme_settings->brands_main_limit as $b}
								<div class="grid-list__item">
									<div class="brands-list__item rounded-x shadow-hovered shadow-no-border-hovered brands-list__item--bg-white {if $theme_settings->brands_main_bordered}bordered{/if}">
										<a class="brands-list__item-link item-link-absolute" href="{$lang_link}brands/{$b->url}"></a>
										<div class="brands-list__image-wrapper" data-brand="{$b->id}">
											{if $b->image}
												<img class="brands-list__image ls-is-cached lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$b->image|resize_brands:150:50}" alt="{$b->name|escape}" title="{$b->name|escape}">
											{else}
												<img style="width: 100px; height: 100px;" class="brands-list__image ls-is-cached lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$b->name|escape}" title="{$b->name|escape}">
											{/if}
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}

	{* Brands Main Type 2 *}
	{if $theme_settings->brands_main_type == '2'}
		<div class="drag-block container BRANDS" data-class="brands_drag" data-order="{$theme_settings->block_4}">
			<div class="index-block index-block--padding-top-{$theme_settings->brands_main_padding_top} index-block--padding-bottom-{$theme_settings->brands_main_padding_bottom} {if $theme_settings->brands_main_delimiter}index-block--delimiter{/if} {if $theme_settings->brands_main_background}index-block--fon{/if}">
				<div class="brands-list brands-list--narrow">
					{if $theme_settings->brands_main_title}
						<div class="maxwidth-theme">
							<div class="index-block__title-wrapper index-block__title-wrapper--mb-35">
								<div class="index-block__part--left">
									<h3 class="index-block__title switcher-title">
										<a class="index-block__link-wrapper dark_link stroke-theme-hover" href="{$lang_link}brands" title="{$lang->all_brands|escape}">
											<span>{$lang->global_brands|escape}</span>
											<span class="index-block__link">
												<span class="index-block__arrow">
													<i class="svg inline" aria-hidden="true">
														<svg width="7" height="12">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
														</svg>
													</i>
												</span>
											</span>
										</a>
									</h3>
								</div>
							</div>
						</div>
					{/if}
					<div class="maxwidth-theme">
						<div class="brands-list__slider-wrap swiper-nav-offset">
							<div class="swiper slider-solution slider-solution--static-dots mobile-offset mobile-offset--right appear-block brands-list__items-wrapper" data-plugin-options='{literal}{"preloadImages":false,"lazy":false,"keyboard":true,"init":false,"countSlides":{/literal}{$all_brands|count}{literal},"rewind":true,"freeMode":{"enabled":true,"momentum":true},"slidesPerView":"auto","spaceBetween":12,"pagination":false,"autoplay":{"delay":5000},"type":"main_brands"}{/literal}'>
								<div class="swiper-wrapper">
									{foreach $all_brands|@array_slice:0:$theme_settings->brands_main_count as $b}
										<div class="grid-list__item hover_blink swiper-slide">
											<div class="brands-list__item rounded-x shine {if $theme_settings->brands_main_bordered}bordered brands-list__item--bg-white{/if}">
												<a class="brands-list__item-link item-link-absolute" href="{$lang_link}brands/{$b->url}" data-brand="{$b->id}"></a>
												<div data-brand="{$b->id}" class="brands-list__image-wrapper">
													{if $b->image}
														<img class="brands-list__image" src="{$b->image|resize_brands:150:50}" data-src="" alt="{$b->name|escape}" title="{$b->name|escape}">
													{else}
														<img style="width: 100px; height: 100px;" class="brands-list__image" src="design/{$settings->theme|escape}/images/no-photo.svg" data-src="" alt="{$b->name|escape}" title="{$b->name|escape}">
													{/if}
												</div>
											</div>
										</div>
									{/foreach}
								</div>
							</div>
							<div class="slider-nav swiper-button-prev slider-nav--shadow">
								<i class="svg inline stroke-dark-light" aria-hidden="true">
									<svg width="7" height="12">
										<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
									</svg>
								</i>
							</div>
							<div class="slider-nav swiper-button-next slider-nav--shadow">
								<i class="svg inline stroke-dark-light" aria-hidden="true">
									<svg width="7" height="12">
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
{/if}