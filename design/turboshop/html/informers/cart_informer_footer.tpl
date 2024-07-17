{if $cart->total_products > 0}
	<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3 icon-block-with-counter--count">
		<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
			<svg width="21" height="18">
				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#cart-21-18"></use>
			</svg>
		</i>
		<span class="header-cart__count bg-more-theme count empted">{$cart->total_products}</span>
	</span>
{else}
	<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3 header-cart__inner--empty">
		<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
			<svg width="21" height="18">
				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#cart-21-18"></use>
			</svg>
		</i>
		<span class="header-cart__count bg-more-theme count empted">0</span>
	</span>
{/if}