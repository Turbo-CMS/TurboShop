{if $wishlist_products > 0}
	<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
		<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
			<svg width="18" height="16">
				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
			</svg>
		</i>
		<span class="icon-block-with-counter--count">
			<span class="icon-count bg-more-theme count icon-count--favorite">{$wishlist_products|count}</span>
		</span>
	</span>
{else}
	<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
		<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
			<svg width="18" height="16">
				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
			</svg>
		</i>
		<span class="icon-count bg-more-theme count icon-count--favorite">0</span>
	</span>
{/if}
