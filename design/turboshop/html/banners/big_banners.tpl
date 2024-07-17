{get_banner var=banner_2 group='2'}
{if $banner_2->items}
	{* Big Banner Type 1 *}
	{if $theme_settings->big_banners_type == '1'}
		<div class="drag-block container BIG_BANNER_INDEX" data-class="big_banner_index_drag" data-order="{$theme_settings->block_1}">
			<div class="index-block">
				<div class="banners-big front swipeignore {if $theme_settings->banners_height == '1'}banners-big--high{/if} {if $theme_settings->banners_height == '2'}banners-big--nothigh banners-big--normal{/if} {if $theme_settings->banners_height == '3'}banners-big--nothigh banners-big--low{/if} banners-big--adaptive-{$theme_settings->banners_adaptive_type|escape}">
					<div class="maxwidth-banner">
						<div class="banners-big__wrapper">
							<div class="swiper slider-solution main-slider banners-big__depend-height banners-big__depend-padding owl-carousel--button-bottom-right owl-carousel--light" data-plugin-options='{literal}{"preloadImages":false,"lazy":{"loadPrevNext":true},"keyboard":true,"init":false,"countSlides":{/literal}{$banner_2->items|count}{literal},"type":"main_banner","loop":true,"spaceBetween":24,"slidesPerView":"auto","pagination":{"el":".swiper-pagination","type":"bullets"}}{/literal}'>
								<div class="swiper-wrapper main-slider__wrapper">
									{foreach $banner_2->items as $s name=banner}
										<div class="lazyload swiper-slide main-slider__item box" style="background-image: url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==) !important;" data-slide_index="{$smarty.foreach.banner.index}" data-color="{$s->style}" data-background="{$s->background|resize_banners:1920:660}" data-bg="{$s->background|resize_banners:1920:660}">
											<div class="wurl banners-big__item banners-big__depend-height banners-big__depend-padding {if $s->style == "light"}banners-big__item--light{/if}">
												<a class="target" href="{$lang_link}{$s->url|escape}"></a>
												<div id="tb_{$s->id}" class="lazyload maxwidth-theme banners-big__inner-wrap pos-static" {if $theme_settings->banners_adaptive_type == '2'}style="background-image:url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==);" data-bg="{$s->background|resize_banners:1920:660}" {/if}>
													<div class="banners-big__inner">
														<div class="banners-big__text banners-big__depend-height {if $theme_settings->wide_text}banners-big__text--wide{/if}">
															<a href="{$lang_link}{$s->url|escape}" class="banners-big__title-link">
																<div class="banners-big__title switcher-title {if $theme_settings->banners_height == '1'}font_70{elseif $theme_settings->banners_height == '2'}font_56{elseif $theme_settings->banners_height == '3'}font_50{/if} font_large">
																	{$s->name}
																</div>
															</a>
															<div class="banners-big__text-wrapper banners-big__text-wrapper--row">
																<div class="banners-big__text-block">
																	{$s->description}
																</div>
															</div>
															<div class="banners-big__buttons">
																<div class="banners-big__buttons-item">
																	<a href="{$lang_link}{$s->url|escape}" class="btn btn-lg {if $s->code}{$s->code}{else}btn-default{/if}">{$s->button|escape}</a>
																</div>
															</div>
														</div>
														<link href="{$s->background|resize_banners:1920:660}" rel="preload" as="image" />
														<div class="banners-big__img-wrapper banners-big__depend-height banners-big__img-wrapper--back-right">
															<a href="{$lang_link}{$s->url|escape}" class="image">
																<img class="lazyload plaxy banners-big__img" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$s->image|resize_banners:1080:1080}" alt="{$s->alt|escape}" title="{$s->title|escape}" />
															</a>
														</div>
													</div>
												</div>
												{if $theme_settings->banners_adaptive_type == '2'}
													<div class="banners-big__adaptive-block">
														<a href="{$lang_link}{$s->url|escape}" class="banners-big__title-link">
															<div class="banners-big__title switcher-title font_42 font_large">{$s->name}</div>
														</a>
														<div class="banners-big__text-wrapper">
															<div class="banners-big__text-block">
																{$s->description}
															</div>
														</div>
														<div class="banners-big__buttons">
															<div class="banners-big__buttons-item">
																<a href="{$lang_link}{$s->url|escape}" class="btn btn-lg {if $s->code}{$s->code}{else}btn-default{/if}">
																	{$s->button|escape}
																</a>
															</div>
														</div>
													</div>
												{/if}
											</div>
										</div>
									{/foreach}
								</div>
								<div class="maxwidth-theme banners-big__nav-wrap">
									<div class="swiper-pagination swiper-pagination--flex"></div>
									<div class="slider-nav-wrap">
										<div class="slider-nav slider-nav--static swiper-button-prev">
											<i class="svg inline stroke-dark-light" aria-hidden="true">
												<svg width="7" height="12">
													<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
												</svg>
											</i>
										</div>
										<div class="slider-nav slider-nav--static swiper-button-next">
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
				</div>
			</div>
		</div>
	{/if}

	{* Big Banner Type 2 *}
	{if $theme_settings->big_banners_type == '2'}
		<div class="drag-block container BIG_BANNER_INDEX" data-class="big_banner_index_drag" data-order="{$theme_settings->block_1}">
			<div class="index-block">
				<div class="banners-big front swipeignore banners-big--nothigh banners-big--narrow banners-big--paddings banners-no-header-opacity {if $theme_settings->banners_height == '1'}banners-big--high{/if} {if $theme_settings->banners_height == '2'}banners-big--normal{/if} {if $theme_settings->banners_height == '3'}banners-big--low{/if} banners-big--adaptive-{$theme_settings->banners_adaptive_type|escape}">
					<div class="maxwidth-banner maxwidth-theme">
						<div class="banners-big__wrapper">
							<div class="swiper slider-solution main-slider banners-big__depend-height owl-carousel--button-bottom-right owl-carousel--light" data-plugin-options='{literal}{"preloadImages":false,"lazy":{"loadPrevNext":true},"keyboard":true,"init":false,"countSlides":{/literal}{$banner_2->items|count}{literal},"type":"main_banner","loop":true,"spaceBetween":24,"slidesPerView":"auto","pagination":{"el":".swiper-pagination","type":"bullets"}}{/literal}'>
								<div class="swiper-wrapper main-slider__wrapper">
									{foreach $banner_2->items as $s name=banner}
										<div class="lazyload swiper-slide main-slider__item box rounded-x" style="background-image: url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==) !important;" data-slide_index="{$smarty.foreach.banner.index}" data-color="{$s->style}" data-background="{$s->background|resize_banners:1920:660}" data-bg="{$s->background|resize_banners:1920:660}">
											<div class="wurl banners-big__item banners-big__depend-height {if $s->style == "light"}banners-big__item--light{/if}">
												<a class="target" href="{$lang_link}{$s->url|escape}"></a>
												<div id="tb_{$s->id}" class="lazyload maxwidth-theme banners-big__inner-wrap pos-static" {if $theme_settings->banners_adaptive_type == '2'}style="background-image:url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==);" data-bg="{$s->background|resize_banners:1920:660}" {/if}>
													<div class="banners-big__inner banners-big__inner--padding-left-narrow">
														<div class="banners-big__text banners-big__depend-height {if $theme_settings->wide_text}banners-big__text--wide{/if}">
															<a href="{$lang_link}{$s->url|escape}" class="banners-big__title-link">
																<div class="banners-big__title switcher-title {if $theme_settings->banners_height == '1'}font_56{elseif $theme_settings->banners_height == '2'}font_48{elseif $theme_settings->banners_height == '3'}font_42{/if} font_large">
																	{$s->name}
																</div>
															</a>
															<div class="banners-big__text-wrapper">
																<div class="banners-big__text-block">
																	{$s->description}
																</div>
															</div>
															<div class="banners-big__buttons">
																<div class="banners-big__buttons-item">
																	<a href="{$lang_link}{$s->url|escape}" class="btn btn-lg btn-default">{$s->button|escape}</a>
																</div>
															</div>
														</div>
														<link href="{$s->background|resize_banners:1920:660}" rel="preload" as="image" />
														<div class="banners-big__img-wrapper banners-big__depend-height">
															<a href="{$lang_link}{$s->url|escape}" class="image">
																<img class="lazyload plaxy banners-big__img" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$s->image|resize_banners:1080:1080}" alt="{$s->alt|escape}" title="{$s->title|escape}" />
															</a>
														</div>
													</div>
												</div>
												{if $theme_settings->banners_adaptive_type == '2'}
													<div class="banners-big__adaptive-block">
														<a href="{$lang_link}{$s->url|escape}" class="banners-big__title-link">
															<div class="banners-big__title switcher-title font_42 font_large">{$s->name}</div>
														</a>
														<div class="banners-big__text-wrapper">
															<div class="banners-big__text-block">
																{$s->description}
															</div>
														</div>
														<div class="banners-big__buttons">
															<div class="banners-big__buttons-item">
																<a href="{$lang_link}{$s->url|escape}" class="btn btn-lg btn-default">
																	{$s->button|escape}
																</a>
															</div>
														</div>
													</div>
												{/if}
											</div>
										</div>
									{/foreach}
								</div>
								<div class="maxwidth-theme banners-big__nav-wrap">
									<div class="swiper-pagination swiper-pagination--flex"></div>
									<div class="slider-nav-wrap">
										<div class="slider-nav slider-nav--static swiper-button-prev">
											<i class="svg inline stroke-dark-light" aria-hidden="true">
												<svg width="7" height="12">
													<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
												</svg>
											</i>
										</div>
										<div class="slider-nav slider-nav--static swiper-button-next">
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
				</div>
			</div>
		</div>
	{/if}
{/if}