<ul class="mobilemenu__menu-list">
	<li class="mobilemenu__menu-item mobilemenu__menu-item--with-icon">
		<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all fill-dark-light-block fill-theme-use-svg-hover">
			{if $wishlist_products > 0}
				<a class="icon-block icon-block-with-counter dark_link" href="{$lang_link}wishlist" rel="nofollow" title="{$lang->wishlist|escape}">
					<span class="icon-block-with-counter__inner mobilemenu__menu-item-svg js-favorite-block icon-block-with-counter--count">
						<i class="svg inline favorite" aria-hidden="true">
							<svg width="18" height="16">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
							</svg>
						</i>
						<span class="icon-count icon-count--favorite bg-more-theme count">{$wishlist_products|count}</span>
					</span>
					<span class="font_15">{$lang->wishlist|escape}</span>
				</a>
			{else}
				<a class="icon-block icon-block-with-counter dark_link" href="{$lang_link}wishlist" rel="nofollow" title="{$lang->wishlist|escape}">
					<span class="icon-block-with-counter__inner mobilemenu__menu-item-svg js-favorite-block">
						<i class="svg inline favorite" aria-hidden="true">
							<svg width="18" height="16">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
							</svg>
						</i>
						<span class="icon-count icon-count--favorite bg-more-theme count empted">0</span>
					</span>
					<span class="font_15">{$lang->wishlist|escape}</span>
				</a>
			{/if}
		</div>
	</li>
</ul>