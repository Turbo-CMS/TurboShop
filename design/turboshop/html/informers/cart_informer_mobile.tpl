{if $cart->total_products > 0}
	<a rel="nofollow" title="{$lang->index_cart|escape}" href="{$lang_link}cart/" class="fill-theme-hover light-opacity-hover dark_link fill-dark-light-block">
		<span class="js-basket-block header-cart__inner icon-block-with-counter--count">
			<i class="svg inline basket header__icon banner-light-icon-fill menu-light-icon-fill" aria-hidden="true">
				<svg width="21" height="18">
					<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#cart-21-18"></use>
				</svg>
			</i>
			<span class="header-cart__count bg-more-theme count">{$cart->total_products}</span>
		</span>
	</a>
{else}
	<a rel="nofollow" title="{$lang->index_cart|escape}" href="{$lang_link}cart/" class="fill-theme-hover light-opacity-hover dark_link fill-dark-light-block">
		<span class="js-basket-block header-cart__inner header-cart__inner--empty">
			<i class="svg inline basket header__icon banner-light-icon-fill menu-light-icon-fill" aria-hidden="true">
				<svg width="21" height="18">
					<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#cart-21-18"></use>
				</svg>
			</i>
			<span class="header-cart__count bg-more-theme count empted">0</span>
		</span>
	</a>
	<div class="basket-dropdown basket_hover_block loading_block loading_block_content"></div>
{/if}