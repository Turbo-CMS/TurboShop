<div class="bottom-icons-panel swipeignore">
	<div class="bottom-icons-panel__content ">
		<a href="{if $lang_link}{$lang_link}{else}/{/if}" class="bottom-icons-panel__content-link fill-theme-parent bottom-icons-panel__content-link--active bottom-icons-panel__content-link--with-counter" title="{$lang->home}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/panel_icons.svg#main-18-18"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->home}</span>
		</a>
		<a href="{$lang_link}catalog" class="bottom-icons-panel__content-link fill-theme-parent dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->catalog}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="16">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/panel_icons.svg#burger-18-16"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->catalog}</span>
		</a>
		<a href="{$lang_link}cart" class="bottom-icons-panel__content-link fill-theme-parent bottom-icons-panel__content-link--basket dark_link basket bottom-icons-panel__content-link--with-counter" title="{$lang->global_cart}">
			<span id="cart-informer-footer">
				{include file='informers/cart_informer_footer.tpl'}
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->global_cart}</span>
		</a>
		<a href="{$lang_link}wishlist" class="bottom-icons-panel__content-link fill-theme-parent bottom-icons-panel__content-link--favorite dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->wishlist}">
			<span id="wishlist-informer-footer">
				{include file='informers/wishlist_informer_footer.tpl'}
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->wishlist}</span>
		</a>
		<a href="{$lang_link}compare" class="bottom-icons-panel__content-link fill-theme-parent bottom-icons-panel__content-link--compare dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->compare}">
			<span id="compare-informer-footer">
				{include file='informers/compare_informer_footer.tpl'}
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->compare}</span>
		</a>
		<a href="{$lang_link}user" class="bottom-icons-panel__content-link fill-theme-parent bottom-icons-panel__content-link--cabinet dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->account}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#log-out-18-18"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->account}</span>
		</a>
		<a href="{$lang_link}contact" class="bottom-icons-panel__content-link fill-theme-parent dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->contacts}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/panel_icons.svg#contacts-18-18"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->contacts}</span>
		</a>
		<a href="{$lang_link}brands" class="bottom-icons-panel__content-link fill-theme-parent dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->global_brands}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/panel_icons.svg#brands-18-18"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->global_brands}</span>
		</a>
		<a href="{$lang_link}reviews" class="bottom-icons-panel__content-link fill-theme-parent dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->global_reviews}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/panel_icons.svg#reviews-18-18"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->global_reviews}</span>
		</a>
		<span class="bottom-icons-panel__content-link fill-theme-parent bottom-icons-panel__content-link--search dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->search}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#search-18-18"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->search}</span>
		</span>
		<a href="{$lang_link}blog" class="bottom-icons-panel__content-link fill-theme-parent dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->global_blog}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/panel_icons.svg#blog-18-18"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->global_blog}</span>
		</a>
		<a href="{$lang_link}articles" class="bottom-icons-panel__content-link fill-theme-parent dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->global_articles}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/panel_icons.svg#landings-18-18"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->global_articles}</span>
		</a>
		<a href="{$lang_link}sale" class="bottom-icons-panel__content-link fill-theme-parent dark_link bottom-icons-panel__content-link--with-counter" title="{$lang->sale}">
			<span class="icon-block-with-counter__inner fill-theme-hover fill-theme-target bottom-icons-panel__content-picture-wrapper--mb-3">
				<i class="svg inline cat_icons fill-use-svg-888" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/panel_icons.svg#sale-18-20"></use>
					</svg>
				</i>
			</span>
			<span class="bottom-icons-panel__content-text font_10 bottom-icons-panel__content-link--display--block">{$lang->sale}</span>
		</a>
	</div>
</div>