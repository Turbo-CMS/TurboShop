<ul class="mobilemenu__menu-list">
	<li class="mobilemenu__menu-item mobilemenu__menu-item--with-icon">
		<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all fill-dark-light-block fill-theme-use-svg-hover basket">
			{if $cart->total_products > 0}
				<a class="dark_link icon-block" href="{$lang_link}cart" rel="nofollow" title="{$lang->index_cart|escape}">
					<span class="header-cart__inner mobilemenu__menu-item-svg icon-block-with-counter--count">
						<i class="svg inline basket fill-theme-target mobilemenu__menu-item-svg" aria-hidden="true">
							<svg width="21" height="18">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#cart-21-18"></use>
							</svg>
						</i>
						<span class="header-cart__count bg-more-theme count">{$cart->total_products}</span>
					</span>
					<span class="font_15">{$lang->index_cart|escape}</span>
				</a>
			{else}
				<a class="dark_link icon-block" href="{$lang_link}cart" rel="nofollow" title="{$lang->index_cart|escape}">
					<span class="header-cart__inner mobilemenu__menu-item-svg header-cart__inner--empty">
						<i class="svg inline basket fill-theme-target mobilemenu__menu-item-svg" aria-hidden="true">
							<svg width="21" height="18">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#cart-21-18"></use>
							</svg>
						</i>
						<span class="header-cart__count bg-more-theme count empted">0</span>
					</span>
					<span class="font_15">{$lang->index_cart|escape}</span>
				</a>
			{/if}
		</div>
	</li>
</ul>