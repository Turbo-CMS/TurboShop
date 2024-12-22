{* Menu *}
<nav class="mega-menu sliced">
	<div class="catalog_icons_">
		<div class="header-menu__wrapper">
			{foreach $pages as $p}
				{if $p->menu_id == $theme_settings->menu_header_id}
					{if $p->visible}
						<div class="header-menu__item unvisible {if $p@first}header-menu__item--first{/if} {if $p->subpages}header-menu__item--dropdown{/if} {if $page && ($page->id == $p->id || in_array($page->id, $p->children))}active{/if}">
							<a class="header-menu__link header-menu__link--top-level light-opacity-hover fill-theme-hover banner-light-text dark_link" data-page="{$p->id}" href="{$lang_link}{$p->url}">
								<span class="header-menu__title font_14">
									{$p->header}
								</span>
								{if $p->subpages}
									<i class="svg inline  header-menu__wide-submenu-right-arrow fill-dark-light-block banner-light-icon-fill" aria-hidden="true">
										<svg width="7" height="5">
											<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
										</svg>
									</i>
								{/if}
							</a>
							{if $p->subpages}
								<div class="header-menu__dropdown-menu dropdown-menu-wrapper dropdown-menu-wrapper--visible dropdown-menu-wrapper--woffset">
									<div class="dropdown-menu-inner rounded-x">
										<ul class="header-menu__dropdown-menu-inner ">
											{foreach $p->subpages as $p2}
												<li class="header-menu__dropdown-item header-menu__dropdown-item--with-dropdown count_ {if $page && $page->id == $p2->id}active{/if}">
													<a class="font_15 {if $page && ($page->id == $p2->id || in_array($page->id, $p2->children))}dropdown-menu-item--current{/if} dropdown-menu-item dark_link fill-dark-light-block" data-page="{$p2->id}" href="{$lang_link}{$p2->url}">
														{$p2->header}
														{if $p2->subpages}
															<i class="svg inline header-menu__dropdown-right-arrow fill-dark-light-block" aria-hidden="true">
																<svg width="7" height="5">
																	<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
																</svg>
															</i>
														{/if}
													</a>
													{if $p2->subpages}
														<div class="header-menu__dropdown-menu header-menu__dropdown-menu--submenu dropdown-menu-wrapper dropdown-menu-wrapper--visible dropdown-menu-wrapper--woffset">
															<ul class="dropdown-menu-inner rounded-x">
																{foreach $p2->subpages as $p3}
																	<li class=" header-menu__dropdown-item {if $page && $page->id == $p3->id}active{/if}">
																		<a class="font_15 {if $page && $page->id == $p3->id}dropdown-menu-item--current{/if} fill-dark-light-block dropdown-menu-item dark_link" data-page="{$p3->id}" href="{$lang_link}{$p3->url}">
																			{$p3->header}
																		</a>
																	</li>
																{/foreach}
															</ul>
														</div>
													{/if}
												</li>
											{/foreach}
										</ul>
									</div>
								</div>
							{/if}
						</div>
					{/if}
				{/if}
			{/foreach}
			<div class="header-menu__item header-menu__item--more-items unvisible">
				<div class="header-menu__link banner-light-icon-fill fill-dark-light-block light-opacity-hover">
					<i class="svg inline" aria-hidden="true">
						<svg width="15" height="3">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#dots-15-3"></use>
						</svg>
					</i>
				</div>
				<div class="header-menu__dropdown-menu dropdown-menu-wrapper dropdown-menu-wrapper--visible dropdown-menu-wrapper--woffset">
					<ul class="header-menu__more-items-list dropdown-menu-inner rounded-x"></ul>
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