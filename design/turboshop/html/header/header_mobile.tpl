{* Header Mobile *}
<div id="mobileheader" class="visible-991">
	<div class="mobileheader mobileheader_1 mobileheader--color-white">
		<div class="mobileheader__inner">
			<div class="mobileheader__item">
				<div class="line-block">
					<div class="line-block__item mobileheader__burger">
						<div class="burger light-opacity-hover fill-theme-hover banner-light-icon-fill menu-light-icon-fill fill-dark-light-block">
							<i class="svg inline" aria-hidden="true">
								<svg width="16" height="12">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#burger-16-12"></use>
								</svg>
							</i>
						</div>
					</div>
					<div class="logo no-shrinked line-block__item">
						<a class="menu-light-icon-fill banner-light-icon-fill" href="{if $lang_link}{$lang_link}{else}/{/if}">
							{include file='components/logo.tpl'}
						</a>
					</div>
				</div>
			</div>
			<div class="mobileheader__item mobileheader__item--right-icons">
				<div class="line-block line-block--flex-wrap">
					<div class="line-block__item no-shrinked hide-600">
						<div class="icon-block--with_icon icon-block--only_icon">
							<div class="phones">
								<div class="phones__phones-wrapper">
									<div class="phones__inner phones__inner--with_dropdown fill-theme-parent">
										<span class="icon-block__only-icon fill-theme-hover menu-light-icon-fill fill-dark-light-block fill-theme-target">
											<i class="svg inline header__icon" aria-hidden="true">
												<svg width="14" height="18">
													<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#phone-14-18"></use>
												</svg>
											</i>
										</span>
										<div id="mobilephones" class="phones__dropdown">
											<div class="mobilephones__menu-dropdown dropdown dropdown--relative">
												<span class="mobilephones__close fill-dark-light fill-theme-hover" title="{$lang->close}">
													<i class="svg inline" aria-hidden="true">
														<svg width="16" height="16">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-16-16"></use>
														</svg>
													</i>
												</span>
												<div class="mobilephones__menu-item mobilephones__menu-item--title">
													<span class="color_222 font_18 font_bold">{$lang->phone}</span>
												</div>
												<div class="mobilephones__menu-item">
													<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
														<a class="dark_link phone" href="tel:{$theme_settings->phone_1|regex_replace:'/[\s()-]/':''}" rel="nofollow">
															<span class="font_18">{$theme_settings->phone_1|escape}</span>
															<span class="font_12 color_999 phones__phone-descript">{$lang->sales_department}</span>
														</a>
													</div>
												</div>
												<div class="mobilephones__menu-item">
													<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
														<a class="dark_link phone" href="tel:{$theme_settings->phone_2|regex_replace:'/[\s()-]/':''}" rel="nofollow">
															<span class="font_18">{$theme_settings->phone_2|escape}</span>
															<span class="font_12 color_999 phones__phone-descript">{$lang->accounting}</span>
														</a>
													</div>
												</div>
												<div class="mobilephones__menu-item">
													<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
														<a class="dark_link phone" href="tel:{$theme_settings->phone_3|regex_replace:'/[\s()-]/':''}" rel="nofollow">
															<span class="font_18">{$theme_settings->phone_3|escape}</span>
															<span class="font_12 color_999 phones__phone-descript">{$lang->director}</span>
														</a>
													</div>
												</div>
												<div class="mobilephones__menu-item mobilephones__menu-item--callback">
													<div class="animate-load btn btn-default btn-transparent-border btn-wide" data-event="jqm" data-url="{$lang_link}contact/?tpl=callback" data-name="callback">
														{$lang->callback}
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					{if $module != 'CartView' && $module != 'OrderView'}
						<div class="line-block__item icon-block--only_icon">
							<div class="header-search__mobile banner-light-icon-fill fill-dark-light-block fill-theme-hover color-theme-hover menu-light-icon-fill light-opacity-hover" title="{$lang->search}">
								<i class="svg inline header__icon header-search__icon" aria-hidden="true">
									<svg width="18" height="18">
										<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#search-18-18"></use>
									</svg>
								</i>
							</div>
						</div>
					{/if}
					<div class="line-block__item">
						<div class="header-cabinet">
							{if $user}
								<a class="header-cabinet__link fill-theme-hover fill-dark-light-block light-opacity-hover dark_link avt" title="{$user->name}" href="{$lang_link}user" onclick="document.cookie='user=personal;path=/';document.location.reload();">
									<i class="svg inline header__icon banner-light-icon-fill menu-light-icon-fill fill-dark-light-block" aria-hidden="true">
										<svg width="22" height="20">
											<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#log-in-22-20"></use>
										</svg>
									</i>
								</a>
							{else}
								<a class="header-cabinet__link fill-theme-hover fill-dark-light-block light-opacity-hover dark_link animate-load" data-event="jqm" title="{$lang->login}" data-url="{$lang_link}user/login/?tpl=auth" data-name="auth" href="{$lang_link}user/login">
									<i class="svg inline header__icon banner-light-icon-fill menu-light-icon-fill" aria-hidden="true">
										<svg width="18" height="18">
											<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#log-out-18-18"></use>
										</svg>
									</i>
								</a>
							{/if}
						</div>
					</div>
					<div class="line-block__item hide-600">
						{* Compare Informer *}
						<div id="compare-informer-mobile" class="header-compare">
							{include file='informers/compare_informer_mobile.tpl'}
						</div>
					</div>
					<div class="line-block__item hide-600">
						{* Wishlist Informer *}
						<div id="wishlist-informer-mobile" class="header-favorite">
							{include file='informers/wishlist_informer_mobile.tpl'}
						</div>
					</div>
					<div class="line-block__item">
						{* Cart Informer *}
						<div id="cart-informer-mobile" class="basket top">
							{include file='informers/cart_informer_mobile.tpl'}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="mobilemenu" class="mobile-scroll scrollbar">
		<div class="mobilemenu mobilemenu_1">
			<span class="mobilemenu__close fill-dark-light fill-theme-hover" title="{$lang->close}">
				<i class="svg inline" aria-hidden="true">
					<svg width="16" height="16">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-16-16"></use>
					</svg>
				</i>
			</span>
			<div class="mobilemenu__inner">
				<div class="mobilemenu__item">
					<div class="logo no-shrinked">
						<a class="menu-light-icon-fill banner-light-icon-fill" href="{if $lang_link}{$lang_link}{else}/{/if}">
							{include file='components/logo.tpl'}
						</a>
					</div>
				</div>
				<div class="mobilemenu__item">
					{if $languages|count > 1}
						<div class="mobilemenu__menu">
							<ul class="mobilemenu__menu-list">
								<li class="mobilemenu__menu-item mobilemenu__menu-item--with-icon mobilemenu__menu-item--parent">
									<div class="link-wrapper">
										<a class="icon-block dark_link bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all fill-dark-light-block fill-theme-use-svg-hover" href="#" title="{$language->label|upper|escape}">
											<i class="svg inline region mobilemenu__menu-item-svg fill-theme-target flag-icon flag-icon-{$language->label}"></i>
											<span class="icon-block__content">
												<span class="font_15">{$language->label|upper|escape}</span>
												<i class="svg inline down menu-arrow fill-theme-target fill-dark-light-block" aria-hidden="true">
													<svg width="7" height="5">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
													</svg>
												</i>
											</span>
											<span class="toggle_block"></span>
										</a>
									</div>
									<ul class="mobilemenu__menu-dropdown dropdown">
										<li class="mobilemenu__menu-item mobilemenu__menu-item--back">
											<div class="link-wrapper stroke-theme-parent-all colored_theme_hover_bg-block color-theme-parent-all">
												<a class="dark_link arrow-all stroke-theme-target" href="#" rel="nofollow">
													<i class="svg inline arrow-all__item-arrow" aria-hidden="true">
														<svg width="7" height="12">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
														</svg>
													</i>
													{$lang->previous}
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item mobilemenu__menu-item--title">
											<div class="link-wrapper">
												<a class="dark_link" href="">
													<span class="font_18 font_bold">{$lang->global_languages}</span>
												</a>
											</div>
										</li>
										{foreach $languages as $l}
											{if $l->enabled}
												<li class="mobilemenu__menu-item mobilemenu__menu-item--selected {if $language->id == $l->id}active{/if}">
													<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
														<a class="dark_link" rel="nofollow" href="{$l->url}">
															<i class="dropdown-select__icon-left flag-icon flag-icon-{$l->label}"></i>
															<span class="font_15">{$l->name|escape}</span>
														</a>
													</div>
												</li>
											{/if}
										{/foreach}
									</ul>
								</li>
							</ul>
						</div>
					{/if}
					{if $currencies|count > 1}
						<div class="mobilemenu__menu">
							<ul class="mobilemenu__menu-list">
								<li class="mobilemenu__menu-item mobilemenu__menu-item--with-icon mobilemenu__menu-item--parent">
									<div class="link-wrapper">
										<a class="icon-block dark_link bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all fill-dark-light-block fill-theme-use-svg-hover" href="#" title="{$language->label|upper|escape}">
											<i class="svg inline cabinet mobilemenu__menu-item-svg fill-theme-target" aria-hidden="true">
												<svg width="18" height="18">
													<use xlink:href="design/{$settings->theme|escape}/images/svg/dollar.svg#dollar-18-18"></use>
												</svg>
											</i>
											<span class="icon-block__content">
												<span class="font_15">{$currency->name|escape}</span>
												<i class="svg inline down menu-arrow fill-theme-target fill-dark-light-block" aria-hidden="true">
													<svg width="7" height="5">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
													</svg>
												</i>
											</span>
											<span class="toggle_block"></span>
										</a>
									</div>
									<ul class="mobilemenu__menu-dropdown dropdown">
										<li class="mobilemenu__menu-item mobilemenu__menu-item--back">
											<div class="link-wrapper stroke-theme-parent-all colored_theme_hover_bg-block color-theme-parent-all">
												<a class="dark_link arrow-all stroke-theme-target" href="" rel="nofollow">
													<i class="svg inline arrow-all__item-arrow" aria-hidden="true">
														<svg width="7" height="12">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
														</svg>
													</i>
													{$lang->previous}
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item mobilemenu__menu-item--title">
											<div class="link-wrapper">
												<a class="dark_link" href="">
													<span class="font_18 font_bold">{$lang->currency}</span>
												</a>
											</div>
										</li>
										{foreach $currencies as $c}
											{if $c->enabled}
												<li class="mobilemenu__menu-item mobilemenu__menu-item--selected {if $c->id==$currency->id}active{/if}">
													<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
														<a class="dark_link" rel="nofollow" href="{url currency_id=$c->id}">
															<strong>{$c->sign}</strong> <span class="font_15">{$c->name|escape}</span>
														</a>
													</div>
												</li>
											{/if}
										{/foreach}
									</ul>
								</li>
							</ul>
						</div>
					{/if}
					<div class="mobilemenu__menu mobilemenu__menu--cabinet">
						<ul class="mobilemenu__menu-list">
							<li class="mobilemenu__menu-item mobilemenu__menu-item--with-icon mobilemenu__menu-item--parent">
								<div class="link-wrapper">
									{if $user}
										<a class="icon-block dark_link bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all fill-dark-light-block fill-theme-use-svg-hover" href="{$lang_link}user" title="{$user->name}">
											<i class="svg inline cabinet mobilemenu__menu-item-svg fill-theme-target" aria-hidden="true">
												<svg width="22" height="20">
													<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#log-in-22-20"></use>
												</svg>
											</i>
											<span class="icon-block__content">
												<span class="font_15">{$lang->account}</span>
												<i class="svg inline down menu-arrow fill-theme-target fill-dark-light-block" aria-hidden="true">
													<svg width="7" height="5">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
													</svg>
												</i>
											</span>
											<span class="toggle_block"></span>
										</a>
									{else}
										<a class="icon-block dark_link bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all fill-dark-light-block fill-theme-use-svg-hover" href="{$lang_link}user/login" title="{$lang->account}">
											<i class="svg inline cabinet mobilemenu__menu-item-svg fill-theme-target" aria-hidden="true">
												<svg width="18" height="18">
													<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#log-out-18-18"></use>
												</svg>
											</i>
											<span class="icon-block__content">
												<span class="font_15">{$lang->account}</span>
											</span>
										</a>
									{/if}
								</div>
								{if $user}
									<ul class="mobilemenu__menu-dropdown dropdown">
										<li class="mobilemenu__menu-item mobilemenu__menu-item--back">
											<div class="link-wrapper stroke-theme-parent-all colored_theme_hover_bg-block color-theme-parent-all">
												<a class="dark_link arrow-all stroke-theme-target" href="" rel="nofollow">
													<i class="svg inline arrow-all__item-arrow" aria-hidden="true">
														<svg width="7" height="12">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
														</svg>
													</i>
													{$lang->account}
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item mobilemenu__menu-item--title">
											<div class="link-wrapper">
												<a class="dark_link" href="{$lang_link}user" onclick="document.cookie='user=personal;path=/';document.location.reload();">
													<span class="font_18 font_bold">{$lang->account}</span>
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item">
											<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
												<a class="dark_link" href="{$lang_link}user" onclick="document.cookie='user=personal;path=/';document.location.reload();" title="{$lang->my_account}">
													<span class="font_15">{$lang->my_account}</span>
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item">
											<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
												<a class="dark_link" href="{$lang_link}user" onclick="document.cookie='user=private;path=/';document.location.reload();" title="{$lang->personal_data}">
													<span class="font_15">{$lang->personal_data}</span>
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item">
											<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
												<a class="dark_link" href="{$lang_link}user" onclick="document.cookie='user=orders;path=/';document.location.reload();" title="{$lang->orders_global}">
													<span class="font_15">{$lang->orders_global}</span>
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item">
											<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
												<a class="dark_link" href="{$lang_link}wishlist" onclick="document.cookie='user=;path=/';document.location.reload();" title="{$lang->wishlist_products}">
													<span class="font_15">{$lang->wishlist_products}</span>
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item">
											<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
												<a class="dark_link" href="{$lang_link}faq" onclick="document.cookie='user=;path=/';document.location.reload();" title="{$lang->help}">
													<span class="font_15">{$lang->help}</span>
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item">
											<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
												<a class="dark_link" href="{$lang_link}user/logout" title="{$lang->logout}">
													<span class="font_15">{$lang->logout}</span>
												</a>
											</div>
										</li>
									</ul>
								{/if}
							</li>
						</ul>
					</div>
				</div>
				<div class="mobilemenu__separator"></div>
				<div class="mobilemenu__item">
					<div class="mobilemenu__menu mobilemenu__menu--top">
						<ul class="mobilemenu__menu-list">
							{if $categories}
								<li class="mobilemenu__menu-item mobilemenu__menu-item--parent">
									<div class="link-wrapper fill-theme-parent-all">
										<a class="dark_link" href="{$lang_link}catalog" title="{$lang->catalog}">
											<span class="font_18">{$lang->catalog}</span>
											<i class="svg inline down menu-arrow bg-opacity-theme-target fill-theme-target fill-dark-light-block" aria-hidden="true">
												<svg width="7" height="5">
													<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
												</svg>
											</i>
											<span class="toggle_block"></span>
										</a>
									</div>
									<ul class="mobilemenu__menu-dropdown dropdown">
										<li class="mobilemenu__menu-item mobilemenu__menu-item--back">
											<div class="link-wrapper stroke-theme-parent-all colored_theme_hover_bg-block color-theme-parent-all">
												<a class="dark_link arrow-all stroke-theme-target" href="" rel="nofollow">
													<i class="svg inline arrow-all__item-arrow" aria-hidden="true">
														<svg width="7" height="12">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
														</svg>
													</i>
													{$lang->previous}
												</a>
											</div>
										</li>
										<li class="mobilemenu__menu-item mobilemenu__menu-item--title">
											<div class="link-wrapper">
												<a class="dark_link stroke-theme-hover stroke-dark-light mobilemenu__menu-parent-link" href="{$lang_link}catalog">
													<span class="font_18 font_bold">{$lang->catalog}</span>
													<i class="svg inline arrow-parent__item-arrow" aria-hidden="true">
														<svg width="7" height="12">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
														</svg>
													</i>
												</a>
											</div>
										</li>
										{foreach $categories as $c}
											{if $c->visible}
												<li class="mobilemenu__menu-item {if isset($c->subcategories)}mobilemenu__menu-item--parent{/if}">
													<div class="link-wrapper fill-theme-parent-all">
														<a class="dark_link" href="{$lang_link}catalog/{$c->url}" title="{$c->name|escape}">
															<span class="font_15">{$c->name|escape}</span>
															{if isset($c->subcategories)}
																<i class="svg inline down menu-arrow bg-opacity-theme-target fill-theme-target fill-dark-light-block" aria-hidden="true">
																	<svg width="7" height="5">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
																	</svg>
																</i>
																<span class="toggle_block"></span>
															{/if}
														</a>
													</div>
													{if isset($c->subcategories)}
														<ul class="mobilemenu__menu-dropdown dropdown">
															<li class="mobilemenu__menu-item mobilemenu__menu-item--back">
																<div class="link-wrapper stroke-theme-parent-all colored_theme_hover_bg-block color-theme-parent-all">
																	<a class="dark_link arrow-all stroke-theme-target" href="" rel="nofollow">
																		<i class="svg inline arrow-all__item-arrow" aria-hidden="true">
																			<svg width="7" height="12">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
																			</svg>
																		</i>
																		{$lang->previous}
																	</a>
																</div>
															</li>
															<li class="mobilemenu__menu-item mobilemenu__menu-item--title">
																<div class="link-wrapper">
																	<a class="dark_link stroke-theme-hover stroke-dark-light mobilemenu__menu-parent-link" href="{$lang_link}catalog/{$c->url}">
																		<span class="font_18 font_bold">{$c->name|escape}</span>
																		<i class="svg inline arrow-parent__item-arrow" aria-hidden="true">
																			<svg width="7" height="12">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
																			</svg>
																		</i>
																	</a>
																</div>
															</li>
															{foreach $c->subcategories as $cat}
																{if $cat->visible}
																	<li class="mobilemenu__menu-item {if isset($cat->subcategories)}mobilemenu__menu-item--parent{/if}">
																		<div class="link-wrapper fill-theme-parent-all">
																			<a class="dark_link" href="{$lang_link}catalog/{$cat->url}" title="{$cat->name|escape}">
																				<span class="font_15">{$cat->name|escape}</span>
																				{if isset($cat->subcategories)}
																					<i class="svg inline down menu-arrow bg-opacity-theme-target fill-theme-target fill-dark-light-block" aria-hidden="true">
																						<svg width="7" height="5">
																							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
																						</svg>
																					</i>
																					<span class="toggle_block"></span>
																				{/if}
																			</a>
																		</div>
																		{if isset($cat->subcategories)}
																			<ul class="mobilemenu__menu-dropdown dropdown">
																				<li class="mobilemenu__menu-item mobilemenu__menu-item--back">
																					<div class="link-wrapper stroke-theme-parent-all colored_theme_hover_bg-block color-theme-parent-all">
																						<a class="dark_link arrow-all stroke-theme-target" href="" rel="nofollow">
																							<i class="svg inline arrow-all__item-arrow" aria-hidden="true">
																								<svg width="7" height="12">
																									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
																								</svg>
																							</i>
																							{$lang->previous}
																						</a>
																					</div>
																				</li>
																				<li class="mobilemenu__menu-item mobilemenu__menu-item--title">
																					<div class="link-wrapper">
																						<a class="dark_link stroke-theme-hover stroke-dark-light mobilemenu__menu-parent-link" href="{$lang_link}catalog/{$cat->url}">
																							<span class="font_18 font_bold">{$cat->name|escape}</span>
																							<i class="svg inline arrow-parent__item-arrow" aria-hidden="true">
																								<svg width="7" height="12">
																									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
																								</svg>
																							</i>
																						</a>
																					</div>
																				</li>
																				{foreach $cat->subcategories as $cat3}
																					{if $cat3->visible}
																						<li class="mobilemenu__menu-item bg-opacity-theme-parent-hover fill-theme-parent-all">
																							<div class="link-wrapper fill-theme-parent-all">
																								<a class="dark_link" href="{$lang_link}catalog/{$cat3->url}" title="{$cat3->name|escape}">
																									<span class="font_15">{$cat3->name|escape}</span>
																								</a>
																							</div>
																						</li>
																					{/if}
																				{/foreach}
																			</ul>
																		{/if}
																	</li>
																{/if}
															{/foreach}
														</ul>
													{/if}
												</li>
											{/if}
										{/foreach}
									</ul>
								</li>
							{/if}
							{foreach $pages as $p}
								{if $p->menu_id == 1}
									{if $p->visible}
										<li class="mobilemenu__menu-item {if isset($p->subpages)}mobilemenu__menu-item--parent{/if}">
											<div class="link-wrapper fill-theme-parent-all">
												<a class="dark_link" href="{$lang_link}{$p->url}" title="{$p->header}">
													<span class="font_18">{$p->header}</span>
													{if isset($p->subpages)}
														<i class="svg inline down menu-arrow bg-opacity-theme-target fill-theme-target fill-dark-light-block" aria-hidden="true">
															<svg width="7" height="5">
																<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
															</svg>
														</i>
														<span class="toggle_block"></span>
													{/if}
												</a>
											</div>
											{if isset($p->subpages)}
												<ul class="mobilemenu__menu-dropdown dropdown">
													<li class="mobilemenu__menu-item mobilemenu__menu-item--back">
														<div class="link-wrapper stroke-theme-parent-all colored_theme_hover_bg-block color-theme-parent-all">
															<a class="dark_link arrow-all stroke-theme-target" href="" rel="nofollow">
																<i class="svg inline arrow-all__item-arrow" aria-hidden="true">
																	<svg width="7" height="12">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
																	</svg>
																</i>
																{$lang->previous}
															</a>
														</div>
													</li>
													<li class="mobilemenu__menu-item mobilemenu__menu-item--title">
														<div class="link-wrapper">
															<a class="dark_link stroke-theme-hover stroke-dark-light mobilemenu__menu-parent-link" href="{$lang_link}{$p->url}">
																<span class="font_18 font_bold">{$p->header}</span>
																<i class="svg inline arrow-parent__item-arrow" aria-hidden="true">
																	<svg width="7" height="12">
																		<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
																	</svg>
																</i>
															</a>
														</div>
													</li>
													{foreach $p->subpages as $p2}
														{if $p2->visible}
															<li class="mobilemenu__menu-item {if isset($p2->subpages)}mobilemenu__menu-item--parent{/if}">
																<div class="link-wrapper fill-theme-parent-all">
																	<a class="dark_link" href="{$lang_link}{$p2->url}" title="{$p2->header}">
																		<span class="font_15">{$p2->header}</span>
																		{if isset($p2->subpages)}
																			<i class="svg inline down menu-arrow bg-opacity-theme-target fill-theme-target fill-dark-light-block" aria-hidden="true">
																				<svg width="7" height="5">
																					<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
																				</svg>
																			</i>
																			<span class="toggle_block"></span>
																		{/if}
																	</a>
																</div>
																{if isset($p2->subpages)}
																	<ul class="mobilemenu__menu-dropdown dropdown">
																		<li class="mobilemenu__menu-item mobilemenu__menu-item--back">
																			<div class="link-wrapper stroke-theme-parent-all colored_theme_hover_bg-block color-theme-parent-all">
																				<a class="dark_link arrow-all stroke-theme-target" href="" rel="nofollow">
																					<i class="svg inline arrow-all__item-arrow" aria-hidden="true">
																						<svg width="7" height="12">
																							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
																						</svg>
																					</i>
																					{$lang->previous}
																				</a>
																			</div>
																		</li>
																		<li class="mobilemenu__menu-item mobilemenu__menu-item--title">
																			<div class="link-wrapper">
																				<a class="dark_link stroke-theme-hover stroke-dark-light mobilemenu__menu-parent-link" href="{$lang_link}{$p2->url}">
																					<span class="font_18 font_bold">{$p2->header}</span>
																					<i class="svg inline arrow-parent__item-arrow" aria-hidden="true">
																						<svg width="7" height="12">
																							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
																						</svg>
																					</i>
																				</a>
																			</div>
																		</li>
																		{foreach $p2->subpages as $p3}
																			{if $p3->visible}
																				<li class="mobilemenu__menu-item">
																					<div class="link-wrapper fill-theme-parent-all">
																						<a class="dark_link" href="{$lang_link}{$p3->url}" title="{$p3->header}">
																							<span class="font_15">{$p3->header}</span>
																						</a>
																					</div>
																				</li>
																			{/if}
																		{/foreach}
																	</ul>
																{/if}
															</li>
														{/if}
													{/foreach}
												</ul>
											{/if}
										</li>
									{/if}
								{/if}
							{/foreach}
						</ul>
					</div>
				</div>
				<div class="mobilemenu__separator"></div>
				<div class="mobilemenu__item">
					{* Compare Informer *}
					<div id="compare-informer-sidebar" class="mobilemenu__menu mobilemenu__menu--compare">
						{include file='informers/compare_informer_sidebar.tpl'}
					</div>
					{* Wishlist Informer *}
					<div id="wishlist-informer-sidebar" class="mobilemenu__menu mobilemenu__menu--favorite">
						{include file='informers/wishlist_informer_sidebar.tpl'}
					</div>
					{* Cart Informer *}
					<div id="cart-informer-sidebar" class="mobilemenu__menu mobilemenu__menu--cart">
						{include file='informers/cart_informer_sidebar.tpl'}
					</div>
				</div>
				<div class="mobilemenu__separator"></div>
				<div class="mobilemenu__item mobilemenu__footer">
					<div class="mobilemenu__menu mobilemenu__menu--contacts">
						<ul class="mobilemenu__menu-list">
							<li class="mobilemenu__menu-item mobilemenu__menu-item--parent">
								<div class="link-wrapper fill-theme-parent-all color-theme-parent-all">
									<a class="dark_link icon-block" href="tel:{$theme_settings->phone_1|regex_replace:'/[\s()-]/':''}" rel="nofollow">
										<span class="icon-block__content">
											<span class="font_18">{$theme_settings->phone_1|escape}</span>
											<span class="font_12 color_999 phones__phone-descript">{$lang->sales_department}</span>
											<i class="svg inline down menu-arrow bg-opacity-theme-target fill-theme-target fill-dark-light-block" aria-hidden="true">
												<svg width="7" height="5">
													<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
												</svg>
											</i>
										</span>
										<span class="toggle_block"></span>
									</a>
								</div>
								<ul class="mobilemenu__menu-dropdown dropdown">
									<li class="mobilemenu__menu-item mobilemenu__menu-item--back">
										<div class="link-wrapper stroke-theme-parent-all colored_theme_hover_bg-block color-theme-parent-all">
											<a class="dark_link arrow-all stroke-theme-target" href="" rel="nofollow">
												<i class="svg inline arrow-all__item-arrow" aria-hidden="true">
													<svg width="7" height="12">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
													</svg>
												</i>
												{$lang->previous}
											</a>
										</div>
									</li>
									<li class="mobilemenu__menu-item mobilemenu__menu-item--title">
										<div class="link-wrapper">
											<a class="dark_link" href="">
												<span class="font_18 font_bold">{$lang->phones}</span>
											</a>
										</div>
									</li>
									<li class="mobilemenu__menu-item">
										<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
											<a class="dark_link phone" href="tel:{$theme_settings->phone_1|regex_replace:'/[\s()-]/':''}" rel="nofollow">
												<span class="font_18">{$theme_settings->phone_1|escape}</span>
												<span class="font_12 color_999 phones__phone-descript">{$lang->sales_department}</span>
											</a>
										</div>
									</li>
									<li class="mobilemenu__menu-item">
										<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
											<a class="dark_link phone" href="tel:{$theme_settings->phone_2|regex_replace:'/[\s()-]/':''}" rel="nofollow">
												<span class="font_18">{$theme_settings->phone_2|escape}</span>
												<span class="font_12 color_999 phones__phone-descript">{$lang->accounting}</span>
											</a>
										</div>
									</li>
									<li class="mobilemenu__menu-item">
										<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all">
											<a class="dark_link phone" href="tel:{$theme_settings->phone_3|regex_replace:'/[\s()-]/':''}" rel="nofollow">
												<span class="font_18">{$theme_settings->phone_3|escape}</span>
												<span class="font_12 color_999 phones__phone-descript">{$lang->director}</span>
											</a>
										</div>
									</li>
									<li class="mobilemenu__menu-item mobilemenu__menu-item--callback">
										<div class="animate-load btn btn-default btn-transparent-border btn-wide" data-event="jqm" data-url="{$lang_link}contact/?tpl=callback" data-name="callback">
											{$lang->callback}
										</div>
									</li>
								</ul>
							</li>
							<li class="mobilemenu__menu-item">
								<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all">
									<div>
										<div>
											<a class="icon-block__content dark_link" href="mailto:{$theme_settings->email|escape}">{$theme_settings->email|escape}</a>
										</div>
									</div>
								</div>
							</li>
							<li class="mobilemenu__menu-item">
								<div class="mobilemenu__menu-item-content">
									<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all">
										<div class="address__text font_short">
											{$lang->office}
										</div>
									</div>
								</div>
							</li>
							<li class="mobilemenu__menu-item">
								<div class="mobilemenu__menu-item-content">
									<div class="link-wrapper bg-opacity-theme-parent-hover fill-theme-parent-all color-theme-parent-all">
										<div class="schedule__text">
											{$lang->operating_mode_text}
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div>
						{include file='components/social.tpl'}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>