{* Header Fixed *}
<div id="headerfixed">
	<div class="header header--fixed-1 header--narrow">
		<div class="header__inner header__inner--shadow-fixed {if !$theme_settings->content_width}header__inner--paddings{/if}">
			<div class="header__main-part">
				{if $theme_settings->content_width}<div class="maxwidth-theme">{/if}
					<div class="header__main-inner relative">
						<div class="header__main-item">
							<div class="line-block line-block--40">
								<div class="logo line-block__item no-shrinked">
									<a class="menu-light-icon-fill banner-light-icon-fill" href="{if $lang_link}{$lang_link}{else}/{/if}">
										{include file='includes/logo.tpl'}
									</a>
								</div>
							</div>
						</div>
						<div class="header__main-item header__burger menu-dropdown-offset">
							<nav class="mega-menu">
								<div class="catalog_icons_">
									<div class="header-menu__wrapper">
										<div class="header-menu__item unvisible header-menu__item--first header-menu__item--last  header-menu__item--wide">
											<a class="header-menu__link--only-catalog fill-use-fff btn btn-default btn--no-rippple btn-lg" href="{$lang_link}catalog">
												<i class="svg inline" aria-hidden="true">
													<svg width="16" height="16">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#burger-16-16"></use>
													</svg>
												</i>
												<span class="header-menu__title font_14">{$lang->catalog|escape}</span>
											</a>
											<div data-nlo="menu-fixed"></div>
										</div>
									</div>
								</div>
								<script data-skip-moving="true">
									if (typeof topMenuAction !== 'function') {
										function topMenuAction() {
											//CheckTopMenuPadding();
											//CheckTopMenuOncePadding();
											if (typeof CheckTopMenuDotted !== 'function') {
												let timerID = setInterval(function() {
													if (typeof CheckTopMenuDotted === 'function') {
														CheckTopMenuDotted();
														clearInterval(timerID);
													}
												}, 100);
											} else {
												CheckTopMenuDotted();
											}
										}
									}
								</script>
							</nav>
						</div>
						<div class="header__main-item flex-1 header__search">
							{* Search *}
							{include file='header/search.tpl'}
						</div>
						<div class="header__main-item">
							<div class="line-block line-block--40">
								<div class="line-block__item">
									{* Cabinet *}
									{include file='header/cabinet.tpl'}
								</div>
								<div class="line-block__item">
									{* Compare Informer *}
									<div id="compare-informer-2">
										{include file='informers/compare_informer_2.tpl'}
									</div>
								</div>
								<div class="line-block__item">
									{* Wishlist Informer *}
									<div id="wishlist-informer-2">
										{include file='informers/wishlist_informer_2.tpl'}
									</div>
								</div>
								<div class="line-block__item">
									{* Cart Informer *}
									<div id="cart-informer-2" class="header-cart">
										{include file='informers/cart_informer_2.tpl'}
									</div>
								</div>
							</div>
						</div>
					</div>
					{if $theme_settings->content_width}
				</div>{/if}
			</div>
		</div>
	</div>
</div>