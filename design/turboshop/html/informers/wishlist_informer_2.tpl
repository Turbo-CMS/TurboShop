<div class="header-favorite js-favorite-block-wrapper">
	{if $wishlist_products > 0}
		<a rel="nofollow" title="{$lang->wishlist|escape}" href="{$lang_link}wishlist/" class="header-icon dark_link light-opacity-hover color-theme-hover fill-theme-hover fill-dark-light-block color-theme-hover banner-light-icon-fill banner-light-text flexbox flexbox--direction-column flexbox--align-center no-shrinked">
			<span class="favorite-block icon-block-with-counter menu-light-icon-fill fill-use-888 fill-theme-use-svg-hover">
				<span class="js-favorite-block icon-block-with-counter--count">
					<span class="icon-count icon-count--favorite bg-more-theme count empted">{$wishlist_products|count}</span>
				</span>
				<i class="svg inline header__icon banner-light-icon-fill" aria-hidden="true">
					<svg width="18" height="16">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
					</svg>
				</i>
			</span>
			<span class="header__icon-name">{$lang->wishlist|escape}</span>
		</a>
	{else}
		<a rel="nofollow" title="{$lang->wishlist|escape}" href="{$lang_link}wishlist/" class="header-icon dark_link light-opacity-hover color-theme-hover fill-theme-hover fill-dark-light-block color-theme-hover banner-light-icon-fill banner-light-text flexbox flexbox--direction-column flexbox--align-center no-shrinked">
			<span class="favorite-block icon-block-with-counter menu-light-icon-fill fill-use-888 fill-theme-use-svg-hover">
				<span class="js-favorite-block">
					<span class="icon-count icon-count--favorite bg-more-theme count empted">0</span>
				</span>
				<i class="svg inline header__icon banner-light-icon-fill" aria-hidden="true">
					<svg width="18" height="16">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
					</svg>
				</i>
			</span>
			<span class="header__icon-name">{$lang->wishlist|escape}</span>
		</a>
	{/if}
</div>