<ul class="mobilemenu__menu-list">
	<li class="mobilemenu__menu-item mobilemenu__menu-item--with-icon">
		<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all fill-dark-light-block fill-theme-use-svg-hover">
			{if $compare_products > 0}
				<a class="icon-block icon-block-with-counter dark_link" href="{$lang_link}compare" rel="nofollow" title="{$lang->compare|escape}">
					<span class="icon-block-with-counter__inner mobilemenu__menu-item-svg js-compare-block icon-block-with-counter--count">
						<i class="svg inline compare" aria-hidden="true">
							<svg width="20" height="16">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#compare-20-16"></use>
							</svg>
						</i>
						<span class="icon-count icon-count--compare bg-more-theme count empted">{$compare_products}</span>
					</span>
					<span class="font_15">{$lang->compare|escape}</span>
				</a>
			{else}
				<a class="icon-block icon-block-with-counter dark_link" href="{$lang_link}compare" rel="nofollow" title="{$lang->compare|escape}">
					<span class="icon-block-with-counter__inner mobilemenu__menu-item-svg js-compare-block">
						<i class="svg inline compare" aria-hidden="true">
							<svg width="20" height="16">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#compare-20-16"></use>
							</svg>
						</i>
						<span class="icon-count icon-count--compare bg-more-theme count empted">0</span>
					</span>
					<span class="font_15">{$lang->compare|escape}</span>
				</a>
			{/if}
		</div>
	</li>
</ul>