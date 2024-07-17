<div class="basket top">
	{if $cart->total_products>0}
		<a rel="nofollow" title="{$lang->index_cart}" href="{$lang_link}cart/" class="fill-theme-hover light-opacity-hover dark_link flexbox flexbox--direction-column flexbox--align-center fill-dark-light-block no-shrinked">
			<span class="js-basket-block header-cart__inner icon-block-with-counter--count">
				<i class="svg inline basket header__icon banner-light-icon-fill menu-light-icon-fill" aria-hidden="true">
					<svg width="21" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#cart-21-18"></use>
					</svg>
				</i>
				<span class="header-cart__count bg-more-theme count">{$cart->total_products}</span>
			</span>
			<span class="header__icon-name header-cart__name menu-light-text banner-light-text">{$lang->index_cart}</span>
		</a>
		<div class="basket-dropdown basket_hover_block loading_block loading_block_content loaded">
			<div class="wrap_cont dropdown-product-wrap">
				<ul class="tabs_content basket">
					<li class="min-price">
						<div class="basket_wrap">
							<div class="items_wrap cart dropdown dropdown--relative dropdown-product">
								<div class="items scrollbar dropdown-product__items">
									{foreach $cart->purchases as $purchase}
										<div class="dropdown-product__item">
											<div class="line-block line-block--20 line-block--align-normal">
												<div class="line-block__item">
													<div class="dropdown-product__item-image">
														<a href="{$lang_link}products/{$purchase->product->url}" class="thumb">
															{if isset($purchase->product->images)}
																{$image = $purchase->product->images|first}
																<img src="{$image->filename|resize:72:72}" alt="{$purchase->product->name|escape}" title="{$purchase->product->name|escape}">
															{else}
																<img style="width: 72px; height: 72px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$purchase->product->name|escape}" title="{$purchase->product->name|escape}">
															{/if}
														</a>
													</div>
												</div>
												<div class="line-block__item flex-1">
													<div class="dropdown-product__item-info">
														<div class="dropdown-product__item-prices">
															<div class="dropdown-product__item-cost">
																<span class="price font_weight--500">{($purchase->variant->price)|convert} {$currency->sign}</span>
																<span class="muted font_14"> x {$purchase->amount} {$settings->units}</span>
															</div>
														</div>
														<div class="font_14 dropdown-product__item-title">
															<a class="dark_link" href="{$lang_link}products/{$purchase->product->url}">{$purchase->product->name|escape}</a>
														</div>
														<span class="muted font_14">{$purchase->variant->color|escape} {if $purchase->variant->color && $purchase->variant->name}/{/if} {$purchase->variant->name|escape}</span>
														<a class="product-remove dropdown-product__item-remove remove fill-dark-light-block fill-theme-use-svg-hover" href="{$lang_link}cart/remove/{$purchase->variant->id}" title="{$lang->delete}">
															<i class="svg inline remove" aria-hidden="true">
																<svg width="16" height="16">
																	<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#remove-16-16"></use>
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
							<div class="foot dropdown dropdown--relative dropdown-product-foot">
								<div class="line-block line-block--24 flexbox--justify-beetwen cart-total">
									<div class="line-block__item cart-total__text font_14">
										{$lang->total}
									</div>
									<div class="line-block__item cart-total__value">
										<span class="font_16 font_weight--500">{$cart->total_price|convert}&nbsp;{$currency->sign}</span>
									</div>
								</div>
								<div class="buttons">
									<div class="wrap_button">
										<a href="{$lang_link}cart" class="btn btn-default btn-wide"><span>{$lang->go_to_cart}</span></a>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	{else}
		<a rel="nofollow" title="{$lang->index_cart}" href="{$lang_link}cart/" class="fill-theme-hover light-opacity-hover dark_link flexbox flexbox--direction-column flexbox--align-center fill-dark-light-block no-shrinked">
			<span class="js-basket-block header-cart__inner header-cart__inner--empty">
				<i class="svg inline basket header__icon banner-light-icon-fill menu-light-icon-fill" aria-hidden="true">
					<svg width="21" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#cart-21-18"></use>
					</svg>
				</i>
				<span class="header-cart__count bg-more-theme count empted">0</span>
			</span>
			<span class="header__icon-name header-cart__name menu-light-text banner-light-text">{$lang->index_cart}</span>
		</a>
	{/if}
</div>