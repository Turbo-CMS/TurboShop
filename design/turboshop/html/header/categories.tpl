{* Categories Type 1 *}
{if $theme_settings->categories_header_type == '1'}
	<nav class="mega-menu">
		<div class="catalog_icons_">
			<div class="header-menu__wrapper">
				<div class="header-menu__item unvisible header-menu__item--first header-menu__item--last header-menu__item--dropdown header-menu__item--wide">
					<a class="header-menu__link--only-catalog fill-use-fff btn btn-default btn--no-rippple btn-lg" href="{$lang_link}catalog">
						<i class="svg inline" aria-hidden="true">
							<svg width="16" height="16">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#burger-16-16"></use>
							</svg>
						</i>
						<span class="header-menu__title font_14">
							{$lang->catalog}
						</span>
					</a>
					<div class="header-menu__dropdown-menu dropdown-menu-wrapper dropdown-menu-wrapper--visible">
						<div class="dropdown-menu-inner rounded-x">
							<div class="header-menu__wide-limiter scrollbar">
								{get_banner var=banner_5 group='5'}
								{if isset($banner_5->items)}
									{foreach $banner_5->items as $b}
										<div class="header-menu__wide-right-part">
											<div class="side_banners">
												<div class="side_banners__item">
													<a class="dark_link" href="{$lang_link}{$b->url|escape}">
														<div class="lazyload side_banners__item-img rounded-x" style="background: url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==) no-repeat center;" data-bg="{$b->image|resize_banners:240:310}"></div>
													</a>
												</div>
											</div>
										</div>
									{/foreach}
								{/if}
								<ul class="header-menu__dropdown-menu-inner header-menu__dropdown-menu--grids">
									{foreach $categories as $c}
										<li class="header-menu__dropdown-item count_ header-menu__dropdown-item--with-dropdown has_img {if $theme_settings->categories_header_position == '1'}header-menu__dropdown-item--img-LEFT{else}header-menu__dropdown-item--img-TOP{/if}">
											{if $theme_settings->categories_header_images_type != '3'}
												<div class="header-menu__dropdown-item-img {if $theme_settings->categories_header_position == '1'}header-menu__dropdown-item-img--LEFT{else}header-menu__dropdown-item-img--TOP{/if}">
													<div class="header-menu__dropdown-item-img-inner">
														<a href="{$lang_link}catalog/{$c->url}">
															{if $theme_settings->categories_header_images_type == '2'}
																{if $c->icon}
																	{assign var="icon" value="{$config->categories_images_dir}{$c->icon}"}
																	{if $icon|is_svg}
																		<i class="svg inline svg-inline- fill-theme" aria-hidden="true">
																			{$icon|svg}
																		</i>
																	{else}
																		<img class="lazyload" style="max-width: 56px; max-height: 56px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$icon}" alt="{$c->name|escape}" title="{$c->name|escape}">
																	{/if}
																{else}
																	<img class="lazyload" style="width: 56px; height: 56px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$c->name|escape}" title="{$c->name|escape}">
																{/if}
															{else}
																{if $c->image}
																	<img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$c->image|resize_catalog:56:56}" alt="{$c->name|escape}" title="{$c->name|escape}">
																{else}
																	<img class="lazyload" style="width: 56px; height: 56px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$c->name|escape}" title="{$c->name|escape}">
																{/if}
															{/if}
														</a>
													</div>
												</div>
											{/if}
											<div class="header-menu__wide-item-wrapper">
												<a class="font_16 font_weight--500 dark_link switcher-title header-menu__wide-child-link fill-theme-hover" href="{$lang_link}catalog/{$c->url}">
													<span data-category="{$c->id}">{$c->name|escape}</span>
													<i class="svg inline  header-menu__wide-submenu-right-arrow fill-dark-light-block only_more_items" aria-hidden="true">
														<svg width="7" height="5">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
														</svg>
													</i>
												</a>
												{if isset($c->subcategories)}
													<ul class="header-menu__wide-submenu">
														{foreach $c->subcategories as $cat name=collapsed}
															{if $cat->visible}
																<li class="header-menu__wide-submenu-item {if $smarty.foreach.collapsed.iteration > 3}collapsed{/if} {if isset($cat->subcategories)}header-menu__wide-submenu-item--with-dropdown{/if} {if $cat@last}header-menu__wide-submenu-item--last{/if}" {if $smarty.foreach.collapsed.iteration > 3}style="display: none;" {/if}>
																	<span class="header-menu__wide-submenu-item-inner">
																		<a class="font_15 dark_link fill-theme-hover fill-dark-light-block header-menu__wide-child-link" href="{$lang_link}catalog/{$cat->url}">
																			<span class="header-menu__wide-submenu-item-name" data-category="{$cat->id}">{$cat->name|escape}</span>
																			{if isset($cat->subcategories)}
																				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																				<span class="toggle_block">
																					<i class="svg inline down header-menu__wide-submenu-right-arrow menu-arrow bg-opacity-theme-target fill-theme-target" aria-hidden="true">
																						<svg width="7" height="5">
																							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																						</svg>
																					</i>
																				</span>
																				<i class="svg inline  header-menu__wide-submenu-right-arrow fill-dark-light-block only_more_items" aria-hidden="true">
																					<svg width="7" height="5">
																						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																					</svg>
																				</i>
																			{/if}
																		</a>
																		{if isset($cat->subcategories)}
																			<div class="submenu-wrapper" style="display:none">
																				<ul class="header-menu__wide-submenu">
																					{foreach $cat->subcategories as $cat3}
																						{if $cat3->visible}
																							<li class="header-menu__wide-submenu-item">
																								<span class="header-menu__wide-submenu-item-inner">
																									<a class="font_14 dark_link header-menu__wide-child-link" href="{$lang_link}catalog/{$cat3->url}">
																										<span class="header-menu__wide-submenu-item-name" data-category="{$cat3->id}">{$cat3->name|escape}</span>
																									</a>
																								</span>
																							</li>
																						{/if}
																					{/foreach}
																				</ul>
																			</div>
																		{/if}
																	</span>
																</li>
																{if $smarty.foreach.collapsed.iteration > 3}
																	<li class="header-menu__wide-submenu-item--more_items">
																		<span class="dark_link with_dropdown font_15 fill-dark-light-block svg">
																			{$lang->more}
																			<i class="svg inline  menu-arrow" aria-hidden="true">
																				<svg width="7" height="5">
																					<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																				</svg>
																			</i>
																		</span>
																	</li>
																{/if}
															{/if}
														{/foreach}
													</ul>
												{/if}
											</div>
										</li>
									{/foreach}
								</ul>
							</div>
						</div>
					</div>
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
{/if}

{* Categories Type 2 *}
{if $theme_settings->categories_header_type == '2'}
	<nav class="mega-menu">
		<div class="catalog_icons_">
			<div class="header-menu__wrapper">
				<div class="header-menu__item unvisible header-menu__item--first header-menu__item--last header-menu__item--dropdown header-menu__item--wide">
					<a class="header-menu__link--only-catalog fill-use-fff btn btn-default btn--no-rippple btn-lg" href="{$lang_link}catalog">
						<i class="svg inline" aria-hidden="true">
							<svg width="16" height="16">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#burger-16-16"></use>
							</svg>
						</i>
						<span class="header-menu__title font_14">
							{$lang->catalog}
						</span>
					</a>
					<div class="header-menu__dropdown-menu dropdown-menu-wrapper dropdown-menu-wrapper--visible">
						<div class="dropdown-menu-inner rounded-x long-menu-items">
							<div class="menu-navigation">
								<div class="menu-navigation__sections-wrapper">
									<div class="menu-navigation__scroll scrollbar">
										<div class="menu-navigation__sections">
											{foreach $categories as $c}
												<div class="menu-navigation__sections-item">
													<a href="{$lang_link}catalog/{$c->url}" class="font_15 font_weight--500 color_dark rounded-x menu-navigation__sections-item-link menu-navigation__sections-item-dropdown">
														<span class="name" data-category="{$c->id}">{$c->name|escape}</span>
														<i class="svg inline header-menu__dropdown-right-arrow fill-dark-light-block" aria-hidden="true">
															<svg width="7" height="5">
																<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
															</svg>
														</i>
													</a>
												</div>
											{/foreach}
										</div>
									</div>
								</div>
								<div class="menu-navigation__content">
									<div class="header-menu__wide-limiter scrollbar">
										<ul class="header-menu__dropdown-menu-inner">
											{foreach $categories as $c}
												{if $c->visible}
													<li class="parent-items">
														<div class="parent-items__item-title">
															<a href="{$lang_link}catalog/{$c->url}" class="dark_link stroke-theme-hover">
																<span class="parent-items__item-name font_weight--500 font_20 font_large">{$c->name|escape}</span>
																<span class="parent-items__item-arrow rounded-x">
																	<i class="svg inline" aria-hidden="true">
																		<svg width="7" height="12">
																			<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
																		</svg>
																	</i>
																</span>
															</a>
														</div>
														{if isset($c->subcategories)}
															<div class="parent-items__info">
																<div class="header-menu__many-items">
																	<ul class="header-menu__dropdown-menu-inner header-menu__dropdown-menu--grids">
																		{foreach $c->subcategories as $cat}
																			{if $cat->visible}
																				<li class="header-menu__dropdown-item count_ header-menu__dropdown-item--with-dropdown has_img {if $theme_settings->categories_header_position == '1'}header-menu__dropdown-item--img-LEFT{else}header-menu__dropdown-item--img-TOP{/if}">
																					{if $theme_settings->categories_header_images_type != '3'}
																						<div class="header-menu__dropdown-item-img {if $theme_settings->categories_header_position == '1'}header-menu__dropdown-item-img--LEFT{else}header-menu__dropdown-item-img--TOP{/if}">
																							<div class="header-menu__dropdown-item-img-inner">
																								<a href="{$lang_link}catalog/{$cat->url}">
																									{if $theme_settings->categories_header_images_type == '2'}
																										{if $cat->icon}
																											{assign var="icon" value="{$config->categories_images_dir}{$cat->icon}"}
																											{if $icon|is_svg}
																												<i class="svg inline svg-inline- fill-theme" aria-hidden="true">
																													{$icon|svg}
																												</i>
																											{else}
																												<img class="lazyload" style="max-width: 56px; max-height: 56px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$icon}" alt="{$cat->name|escape}" title="{$cat->name|escape}">
																											{/if}
																										{else}
																											<img class="lazyload" style="width: 56px; height: 56px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$cat->name|escape}" title="{$cat->name|escape}">
																										{/if}
																									{else}
																										{if $cat->image}
																											<img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$cat->image|resize_catalog:56:56}" alt="{$cat->name|escape}" title="{$cat->name|escape}">
																										{else}
																											<img class="lazyload" style="width: 56px; height: 56px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$c->name|escape}" title="{$cat->name|escape}">
																										{/if}
																									{/if}
																								</a>
																							</div>
																						</div>
																					{/if}
																					<div class="header-menu__wide-item-wrapper">
																						<a class="font_16 font_weight--500 dark_link switcher-title header-menu__wide-child-link fill-theme-hover" href="{$lang_link}catalog/{$cat->url}">
																							<span data-category="{$cat->id}">{$cat->name|escape}</span>
																							<i class="svg inline  header-menu__wide-submenu-right-arrow fill-dark-light-block only_more_items" aria-hidden="true">
																								<svg width="7" height="5">
																									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																								</svg>
																							</i>
																						</a>
																						{if isset($cat->subcategories)}
																							<ul class="header-menu__wide-submenu">
																								{foreach $cat->subcategories as $cat3 name=collapsed}
																									{if $cat3->visible}
																										<li class="header-menu__wide-submenu-item {if $smarty.foreach.collapsed.iteration > 4}collapsed{/if} {if $cat3@last}header-menu__wide-submenu-item--last{/if}" {if $smarty.foreach.collapsed.iteration > 4}style="display: none;" {/if}>
																											<span class="header-menu__wide-submenu-item-inner">
																												<a class="font_15 dark_link fill-theme-hover fill-dark-light-block header-menu__wide-child-link" href="{$lang_link}catalog/{$cat3->url}">
																													<span class="header-menu__wide-submenu-item-name" data-category="{$cat3->id}">{$cat3->name|escape}</span>
																												</a>
																											</span>
																										</li>
																									{/if}
																								{/foreach}
																								{if $smarty.foreach.collapsed.iteration > 4}
																									<li class="header-menu__wide-submenu-item--more_items">
																										<span class="dark_link with_dropdown font_15 fill-dark-light-block svg">
																											{$lang->more}
																											<i class="svg inline menu-arrow" aria-hidden="true">
																												<svg width="7" height="5">
																													<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																												</svg>
																											</i>
																										</span>
																									</li>
																								{/if}
																							</ul>
																						{/if}
																					</div>
																				</li>
																			{/if}
																		{/foreach}
																	</ul>
																</div>
															</div>
														{/if}
													</li>
												{/if}
											{/foreach}
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
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
{/if}