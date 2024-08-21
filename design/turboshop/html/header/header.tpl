{* Header Type 1 *}
{if $theme_settings->header_type == '1'}
	<div class="title-v1 index" data-ajax-block="HEADER">
		<header class="header_1 header header--narrow">
			<div class="header__inner {if !$theme_settings->header_padding_top}header__inner--no-pt{/if} {if !$theme_settings->content_width}header__inner--paddings{/if}">
				<div class="header__top-part">
					{if $theme_settings->content_width}<div class="maxwidth-theme">{/if}
						<div class="header__top-inner">
							<div class="header__main-item">
								<div class="line-block line-block--40">
									<div class="logo line-block__item no-shrinked">
										<a class="menu-light-icon-fill banner-light-icon-fill" href="{if $lang_link}{$lang_link}{else}/{/if}">
											{* Logo *}
											{include file='components/logo.tpl'}
										</a>
									</div>
								</div>
							</div>
							<div class="header__top-item header-menu header-menu--long dotted-flex-1 hide-dotted">
								{* Menu *}
								{include file='header/menu.tpl'}
							</div>
							<div class="header__top-item no-shrinked">
								{* Langs - Currencies *}
								{include file='header/lang_curr.tpl'}
							</div>
							<div class="header__top-item no-shrinked">
								{* Phones *}
								{include file='header/phones.tpl'}
							</div>
							{if $theme_settings->theme_color == 'theme_default'}
								<div class="header__top-item">
									{* Theme Selector *}
									{include file='header/theme_selector.tpl'}
								</div>
							{/if}
						</div>
					{if $theme_settings->content_width}</div>{/if}
				</div>
				<div class="header__main-part header__main-part--long part-with-search">
					{if $theme_settings->content_width}<div class="maxwidth-theme">{/if}
						<div class="header__main-inner relative part-with-search__inner">
							<div class="header__main-item header__burger menu-dropdown-offset">
								{* Categories *}
								{include file='header/categories.tpl'}
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
										<div id="compare-informer">
											{include file='informers/compare_informer.tpl'}
										</div>
									</div>
									<div class="line-block__item">
										{* Wishlist Informer *}
										<div id="wishlist-informer">
											{include file='informers/wishlist_informer.tpl'}
										</div>
									</div>
									<div class="line-block__item">
										{* Cart Informer *}
										<div id="cart-informer" class="header-cart">
											{include file='informers/cart_informer.tpl'}
										</div>
									</div>
								</div>
							</div>
						</div>
					{if $theme_settings->content_width}</div>{/if}
				</div>
				{if $theme_settings->landing_pages_header}
					<div class="header__bottom-part">
						{if $theme_settings->content_width}<div class="maxwidth-theme">{/if}
							<div class="header__bottom-inner relative">
								<div class="header__bottom-item header__top-sections flex-1">
									<div class="drag-scroll header__top-sections-inner scroll-header-tags">
										<div class="drag-scroll__content-wrap">
											<div class="drag-scroll__content line-block line-block--gap line-block--gap-32">
												{foreach $pages as $p}
													{if $p->menu_id == $theme_settings->landing_pages_header_id}
														{if $p->visible}
															<a class="line-block__item banner-light-text light-opacity-hover dark_link no-shrinked" href="{$lang_link}{$p->url}" draggable="false">
																<span class="font_15" data-page="{$p->id}">{$p->header}</span>
															</a>
														{/if}
													{/if}
												{/foreach}
											</div>
										</div>
									</div>
								</div>
							</div>
						{if $theme_settings->content_width}</div>{/if}
					</div>
				{/if}
			</div>
		</header>
		<script data-skip-moving="true">
			if (typeof topMenuAction !== 'undefined') topMenuAction()
		</script>
	</div>
{/if}

{* Header Type 2 *}
{if $theme_settings->header_type == '2'}
	<div class="title-v1 index" data-ajax-block="HEADER">
		<header class="header_2 header_2 header header--narrow">
			<div class="header__inner {if !$theme_settings->header_padding_top}header__inner--no-pt{/if} {if !$theme_settings->content_width}header__inner--paddings{/if}">
				<div class="header__top-part">
					{if $theme_settings->content_width}<div class="maxwidth-theme">{/if}
						<div class="header__top-inner">
							<div class="header__top-item header-menu header-menu--long dotted-flex-1 hide-dotted">
								{* Menu *}
								{include file='header/menu.tpl'}
							</div>
							<div class="header__top-item no-shrinked">
								{* Langs - Currencies *}
								{include file='header/lang_curr.tpl'}
							</div>
							<div class="header__top-item no-shrinked">
								{* Phones *}
								{include file='header/phones.tpl'}
							</div>
							{if $theme_settings->theme_color == 'theme_default'}
								<div class="header__top-item">
									{* Theme Selector *}
									{include file='header/theme_selector.tpl'}
								</div>
							{/if}
						</div>
					{if $theme_settings->content_width}</div>{/if}
				</div>
				<div class="header__main-part header__main-part--long part-with-search">
					{if $theme_settings->content_width}<div class="maxwidth-theme">{/if}
						<div class="header__main-inner relative part-with-search__inner">
							<div class="header__main-item">
								<div class="line-block line-block--40">
									<div class="logo line-block__item no-shrinked">
										<a class="menu-light-icon-fill banner-light-icon-fill" href="{if $lang_link}{$lang_link}{else}/{/if}">
											{* Logo *}
											{include file='components/logo.tpl'}
										</a>
									</div>
								</div>
							</div>
							<div class="header__main-item header__burger menu-dropdown-offset">
								{* Categories *}
								{include file='header/categories.tpl'}
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
										<div id="compare-informer">
											{include file='informers/compare_informer.tpl'}
										</div>
									</div>
									<div class="line-block__item">
										{* Wishlist Informer *}
										<div id="wishlist-informer">
											{include file='informers/wishlist_informer.tpl'}
										</div>
									</div>
									<div class="line-block__item">
										{* Cart Informer *}
										<div id="cart-informer" class="header-cart">
											{include file='informers/cart_informer.tpl'}
										</div>
									</div>
								</div>
							</div>
						</div>
					{if $theme_settings->content_width}</div>{/if}
				</div>
				{if $theme_settings->landing_pages_header}
					<div class="header__bottom-part">
						{if $theme_settings->content_width}<div class="maxwidth-theme">{/if}
							<div class="header__bottom-inner relative">
								<div class="header__bottom-item header__top-sections flex-1">
									<div class="drag-scroll header__top-sections-inner scroll-header-tags">
										<div class="drag-scroll__content-wrap">
											<div class="drag-scroll__content line-block line-block--gap line-block--gap-32">
												{foreach $pages as $p}
													{if $p->menu_id == $theme_settings->landing_pages_header_id}
														{if $p->visible}
															<a class="line-block__item banner-light-text light-opacity-hover dark_link no-shrinked" href="{$lang_link}{$p->url}" draggable="false">
																<span class="font_15" data-page="{$p->id}">{$p->header}</span>
															</a>
														{/if}
													{/if}
												{/foreach}
											</div>
										</div>
									</div>
								</div>
							</div>
						{if $theme_settings->content_width}</div>{/if}
					</div>
				{/if}
			</div>
		</header>
		<script data-skip-moving="true">
			if (typeof topMenuAction !== 'undefined') topMenuAction()
		</script>
	</div>
{/if}