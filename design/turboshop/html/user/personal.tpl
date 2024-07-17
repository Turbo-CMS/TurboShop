{get_banner var=banner_6 group='6'}
{if isset($banner_6->items)}
	<div class="personal__main-block personal__main-block--banners">
		<div class="swiper slider-solution banners-slider outer-rounded-x hidden" data-plugin-options='{literal}{"preloadImages":false,"lazy":{"loadPrevNext":true},"init":false,"keyboard":{"enabled":true},"loop":false,"rewind":true,"pagination":{"enabled":true,"el":".swiper-pagination"},"slidesPerView":1}{/literal}'>
			<div class="swiper-wrapper">
				{foreach $banner_6->items as $b}
					<div class="swiper-slide banners-slider__item">
						<a href="{$lang_link}catalog" target="_blank">
							<span class="banners-slider__image swiper-lazy" title="{$b->name}" data-background="{$b->image|resize_banners:1919:180}"></span>
						</a>
					</div>
				{/foreach}
			</div>
			<div class="slider-nav swiper-button-prev">
				<i class="svg inline stroke-dark-light" aria-hidden="true">
					<svg width="7" height="12">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
					</svg>
				</i>
			</div>
			<div class="slider-nav swiper-button-next">
				<i class="svg inline stroke-dark-light" aria-hidden="true">
					<svg width="7" height="12">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
					</svg>
				</i>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
{/if}
<div class="personal__main-block personal__main-block--private">
	<div class="grid-list grid-list--fill-bg grid-list--personal">
		<div class="personal__main-private__wrapper grid-list__item grid-list-border-outer">
			<div class="personal__main-private bordered outer-rounded-x shadow-hovered shadow-hovered-f600 shadow-no-border-hovered color-theme-parent-all stroke-theme-parent-all">
				<a class="item-link-absolute" href="javascript:void(0)" onclick="document.cookie='user=private;path=/';document.location.reload();" title="{$lang->personal_data}"></a>
				<div class="personal__main-private__inner">
					<div class="personal__main-private__top">
						<span class="main-block__link main-block__link--big stroke-theme-hover stroke-theme-target">
							<span class="main-block__arrow">
								<i class="svg inline" aria-hidden="true">
									<svg width="7" height="12">
										<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
									</svg>
								</i>
							</span>
						</span>
						<div class="personal__main-private__title font_clamp--16-14 color-theme-target">{$lang->personal_data}</div>
						<div class="personal__main-private__value">{$name|escape}</div>
					</div>
					<div class="personal__main-private__bottom font_clamp--16-14">
						<div class="personal__main-private__bottom-left">
							<div class="personal__main-private__email">{$email|escape}</div>
							{if $phone|escape}
								<div class="personal__main-private__phone">
									<span>{$phone|escape}</span>
								</div>
							{/if}
						</div>
						<a class="personal__main-private__change-password" href="javascript:void(0)" onclick="document.cookie='user=private;path=/';document.location.reload();">{$lang->change_password}</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="personal__main-block personal__main-block--links">
	<div class="grid-list grid-list--items-5-1200 grid-list--items-4-992 grid-list--items-4-768 grid-list--items-3-601 mobile-scrolled mobile-scrolled--items-2 mobile-offset">
		<div class="personal__main-link__wrapper grid-list__item">
			<div class="personal__main-link bordered outer-rounded-x shadow-hovered shadow-hovered-f600 shadow-no-border-hovered color-theme-parent-all">
				<a class="personal__main-link__link item-link-absolute" href="{$lang_link}wishlist"></a>
				<div class="personal__main-link__image">
					<i class="svg inline favorite fill-theme svg-inline-more_icon" aria-hidden="true">
						<svg width="32" height="32">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/main_links.svg#favorite-32-32"></use>
						</svg>
					</i>
				</div>
				<div class="personal__main-link__text">
					<div class="personal__main-link__title switcher-title font_clamp--16-14 color-theme-target font_weight--500">{$lang->wishlist}</div>
					<div class="personal__main-link__dsc switcher-title font_weight--400 font_13 color_999">{if $wishlist_products > 0}{$wishlist_products|count} {$wishlist_products|count|plural:$lang->products_1:$lang->products_2:$lang->products_3}{else}{$lang->no_products}{/if}</div>
				</div>
			</div>
		</div>
		<div class="personal__main-link__wrapper grid-list__item">
			<div class="personal__main-link bordered outer-rounded-x shadow-hovered shadow-hovered-f600 shadow-no-border-hovered color-theme-parent-all">
				<a class="personal__main-link__link item-link-absolute" href="javascript:void(0)" onclick="document.cookie='user=orders;path=/';document.location.reload();"></a>
				<div class="personal__main-link__image">
					<i class="svg inline orders fill-theme svg-inline-more_icon" aria-hidden="true">
						<svg width="32" height="32">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/main_links.svg#orders-32-32"></use>
						</svg>
					</i>
				</div>
				<div class="personal__main-link__text">
					<div class="personal__main-link__title switcher-title font_clamp--16-14 color-theme-target font_weight--500">{$lang->orders_global}</div>
					<div class="personal__main-link__dsc switcher-title font_weight--400 font_13 color_999">{$orders|count} {$orders|count|plural:$lang->orders_1:$lang->orders_2:$lang->orders_3}</div>
				</div>
			</div>
		</div>
		<div class="personal__main-link__wrapper grid-list__item">
			<div class="personal__main-link bordered outer-rounded-x shadow-hovered shadow-hovered-f600 shadow-no-border-hovered color-theme-parent-all">
				<a class="personal__main-link__link item-link-absolute" href="javascript:void(0)" data-event="jqm" data-param-type="subscribe" data-url="{$lang_link}blog?tpl=subscribe" data-name="subscribe"></a>
				<div class="personal__main-link__image">
					<i class="svg inline subscribe fill-theme svg-inline-more_icon" aria-hidden="true">
						<svg width="32" height="32">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/main_links.svg#subscribe-32-32"></use>
						</svg>
					</i>
				</div>
				<div class="personal__main-link__text">
					<div class="personal__main-link__title switcher-title font_clamp--16-14 color-theme-target font_weight--500">{$lang->subscriptions}</div>
					<div class="personal__main-link__dsc switcher-title font_weight--400 font_13 color_999">{$lang->newsletters_products}</div>
				</div>
			</div>
		</div>
		<div class="personal__main-link__wrapper grid-list__item">
			<div class="personal__main-link bordered outer-rounded-x shadow-hovered shadow-hovered-f600 shadow-no-border-hovered color-theme-parent-all">
				<a class="personal__main-link__link item-link-absolute" href="javascript:void(0)" onclick="document.cookie='user=private;path=/';document.location.reload();"></a>
				<div class="personal__main-link__image">
					<i class="svg inline profile fill-theme svg-inline-more_icon" aria-hidden="true">
						<svg width="32" height="32">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/main_links.svg#profile-32-32"></use>
						</svg>
					</i>
				</div>
				<div class="personal__main-link__text">
					<div class="personal__main-link__title switcher-title font_clamp--16-14 color-theme-target font_weight--500">{$lang->profile}</div>
					<div class="personal__main-link__dsc switcher-title font_weight--400 font_13 color_999">{$lang->personal_data}</div>
				</div>
			</div>
		</div>
		<div class="personal__main-link__wrapper grid-list__item">
			<div class="personal__main-link bordered outer-rounded-x shadow-hovered shadow-hovered-f600 shadow-no-border-hovered color-theme-parent-all">
				<a class="personal__main-link__link item-link-absolute" href="{$lang_link}faq"></a>
				<div class="personal__main-link__image">
					<i class="svg inline help fill-theme svg-inline-more_icon" aria-hidden="true">
						<svg width="32" height="32">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/main_links.svg#help-32-32"></use>
						</svg>
					</i>
				</div>
				<div class="personal__main-link__text">
					<div class="personal__main-link__title switcher-title font_clamp--16-14 color-theme-target font_weight--500">{$lang->help}</div>
					<div class="personal__main-link__dsc switcher-title font_weight--400 font_13 color_999">{$lang->ask_a_question}</div>
				</div>
			</div>
		</div>
	</div>
</div>
{if $orders}
	<div class="personal__main-block personal__main-block--orders">
		<div class="main-block__title-wrapper">
			<h3 class="main-block__title switcher-title">
				<div class="main-block__title-inner">
					<span>{$lang->new_orders}</span>
					{$new_orders_count = 0}
					{foreach $orders as $order}
						{if $order->status == 0}
							{$new_orders_count = $new_orders_count + 1}
						{/if}
					{/foreach}
					<span class="main-block__title-count">{$new_orders_count}</span>
					<a href="javascript:void(0)" onclick="document.cookie='user=orders;path=/';document.location.reload();" class="main-block__link main-block__link stroke-theme-hover stroke-theme-target" title="{$lang->all_orders}">
						<span class="main-block__arrow">
							<i class="svg inline " aria-hidden="true">
								<svg width="7" height="12">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
								</svg>
							</i>
						</span>
					</a>
				</div>
			</h3>
		</div>
		<div class="orders--slider__wrap swiper-nav-offset">
			<div class="swiper slider-solution mobile-offset mobile-offset--right orders--slider outer-rounded-x" data-plugin-options='{literal}{"preloadImages":false,"lazy":false,"keyboard":true,"init":false,"loop":false,"countSlides":4,"slidesPerView":"auto","freeMode":{"enabled":true,"momentum":true,"sticky":true},"spaceBetween":12,"pagination":false,"watchSlidesProgress":true,"breakpoints":{"601":{"slidesPerView":2,"spaceBetween":24}}}{/literal}'>
				<div class="swiper-wrapper grid-list--fill-bg">
					{foreach $orders as $order}
						{if $order->status == 0}
							<div class="swiper-slide orders__order__wrapper grid-list__item">
								<div class="orders__order outer-rounded-x bordered shadow-hovered shadow-hovered-f600 shadow-no-border-hovered color-theme-parent-all">
									<a class="item-link-absolute" href="{$lang_link}order/{$order->url}" title="{$lang->order_from} {$order->date|date}"></a>
									<div class="orders__order__inner flexbox flexbox--direction-column">
										<div class="orders__order__tds">
											<div class="orders__order__title">
												<a href="{$lang_link}order/{$order->url}" class="dark_link color-theme-target">{$lang->order_from} {$order->date|date}</a>
											</div>
										</div>
										<div class="orders__order__body">
											<div class="orders__order__body-left">
												<div class="orders__order__nps">
													<div class="orders__order__number">
														№{$order->id}
													</div>
													{if $order->paid == 1}
														<div class="order__pay-status personal-color--green">
															{$lang->paid}
														</div>
													{/if}
													{if $order->status == 0}
														<div class="order__pay-status personal-color--red">
															{$lang->waiting_processing}
														</div>
													{elseif $order->status == 1}
														<div class="order__pay-status personal-color--red">
															{$lang->in_processing}
														</div>
													{elseif $order->status == 2}
														<div class="order__pay-status personal-color--red">
															{$lang->completed}
														</div>
													{/if}
												</div>
												<div class="orders__order__sp">
													<div class="order__status order__status--simple xpopover-toggle" data-xpopover="{literal}{&quot;trigger&quot;:[&quot;hover&quot;,&quot;click&quot;],&quot;offset&quot;:&quot;-15px,-5px&quot;}{/literal}">
														<div class="order__status__text flexbox flexbox--row flexbox--align-center">
															<div class="order__status__icon">
																<i class="svg inline status fill-theme" aria-hidden="true">
																	<svg width="16" height="16">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/status.svg#simple-16-16"></use>
																	</svg>
																</i>
															</div>
															<span class="order__status__value dark_link dotted">
																{if $order->status == 0}{$lang->accepted_name}{elseif $order->status == 1}{$lang->in_processing_name}{elseif $order->status == 2}{$lang->completed_name}{/if}{if $order->paid == 1}, {$lang->paid}{else}, {$lang->payment_awaited}{/if}
															</span>
														</div>
														<div class="order__status__steps">
															<div class="order__status__step {if $order->status == 0}mark{/if}"></div>
															<div class="order__status__step {if $order->status == 1}mark{/if}"></div>
															<div class="order__status__step {if $order->status == 2}mark{/if}"></div>
														</div>
														<template class="xpopover-template">
															<div class="scrollbar">
																<div class="xpopover-content">
																	<div class="xpopover--order-status xpopover--order-status--simple">
																		<div class="xpopover--order-status__steps">
																			<div class="xpopover--order-status__step {if $order->status == 0}mark{/if}">
																				<div class="xpopover--order-status__step-progress">
																					<div class="xpopover--order-status__step-progress__dot">
																						<i class="svg inline status-dot" aria-hidden="true">
																							<svg width="16" height="16">
																								<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/status.svg#dot-16-16"></use>
																							</svg>
																						</i>
																					</div>
																					<div class="xpopover--order-status__step-progress__line"></div>
																				</div>
																				<div class="xpopover--order-status__step-info">
																					<div class="xpopover--order-status__step-name">{$lang->accepted_name}{if $order->paid == 1}, {$lang->paid}{else}, {$lang->payment_awaited}{/if}</div>
																					<div class="xpopover--order-status__step-dsc font_14 color_999">{$lang->accepted_text}</div>
																				</div>
																			</div>
																			<div class="xpopover--order-status__step {if $order->status == 1}mark{/if}">
																				<div class="xpopover--order-status__step-progress">
																					<div class="xpopover--order-status__step-progress__dot">
																						<i class="svg inline status-dot" aria-hidden="true">
																							<svg width="16" height="16">
																								<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/status.svg#dot-16-16"></use>
																							</svg>
																						</i>
																					</div>
																					<div class="xpopover--order-status__step-progress__line"></div>
																				</div>
																				<div class="xpopover--order-status__step-info">
																					<div class="xpopover--order-status__step-name">{$lang->in_processing_name}</div>
																					<div class="xpopover--order-status__step-dsc font_14 color_999">{$lang->in_processing_text}</div>
																				</div>
																			</div>
																			<div class="xpopover--order-status__step {if $order->status == 2}mark{/if}">
																				<div class="xpopover--order-status__step-progress">
																					<div class="xpopover--order-status__step-progress__dot">
																						<i class="svg inline status-dot" aria-hidden="true">
																							<svg width="16" height="16">
																								<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/status.svg#dot-16-16"></use>
																							</svg>
																						</i>
																					</div>
																					<div class="xpopover--order-status__step-progress__line"></div>
																				</div>
																				<div class="xpopover--order-status__step-info">
																					<div class="xpopover--order-status__step-name">{$lang->completed_name}</div>
																					<div class="xpopover--order-status__step-dsc font_14 color_999">{$lang->completed_text}</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</template>
													</div>
												</div>
											</div>
											<div class="orders__order__body-right">
												<div class="orders__order__products">
													{foreach $order->purchases|@array_slice:0:3 as $purchase}
														<div class="orders__order__product">
															<a href="{$lang_link}products/{$purchase->product->url}" target="_blank">
																{if isset($purchase->product->images)}
																	{$image = $purchase->product->images|first}
																	<img class="img-responsive lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$image->filename|resize:56:56}" alt="{$purchase->product->name|escape}" title="{$purchase->product->name|escape}" />
																{else}
																	<img class="img-responsive lazyload" style="width: 56px; height: 56px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$purchase->product->name|escape}" title="{$purchase->product->name|escape}" />
																{/if}
															</a>
														</div>
													{/foreach}
													{if $order->purchases|count > 3}
														<div class="orders__order__cnt-more-products">+{$order->purchases|count - 3}</div>
													{/if}
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						{/if}
					{/foreach}
				</div>
			</div>
			<div class="slider-nav swiper-button-prev">
				<i class="svg inline stroke-dark-light" aria-hidden="true">
					<svg width="7" height="12">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
					</svg>
				</i>
			</div>
			<div class="slider-nav swiper-button-next">
				<i class="svg inline stroke-dark-light" aria-hidden="true">
					<svg width="7" height="12">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
					</svg>
				</i>
			</div>
		</div>
	</div>
{/if}