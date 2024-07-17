<div class="header-cabinet">
	{if $user}
		<a class="header-cabinet__link fill-theme-hover fill-dark-light-block light-opacity-hover dark_link avt fill-dark-light-block color-theme-hover banner-light-icon-fill banner-light-text flexbox flexbox--direction-column flexbox--align-center" title="{$user->name}" href="{$lang_link}user" onclick="document.cookie='user=personal;path=/';document.location.reload();">
			<i class="svg inline header__icon banner-light-icon-fill menu-light-icon-fill fill-dark-light-block" aria-hidden="true">
				<svg width="22" height="20">
					<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#log-in-22-20"></use>
				</svg>
			</i>
			<span class="header-cabinet__name header__icon-name menu-light-text banner-light-text">{$lang->account}</span>
		</a>
		<div class="cabinet-dropdown dropdown-menu-wrapper dropdown-menu-wrapper--visible dropdown-menu-wrapper--woffset dropdown-menu-wrapper--toright">
			<div class=" dropdown-menu-inner rounded-x">
				<div class="cabinet-dropdown__item {if !isset($smarty.cookies.user) || isset($smarty.cookies.user) && $smarty.cookies.user == 'personal' && $module=='UserView'}dropdown-menu-item--current{/if}">
					<a class="font_15 dark_link dropdown-menu-item" href="{$lang_link}user" onclick="document.cookie='user=personal;path=/';document.location.reload();">
						{$lang->my_account}
					</a>
				</div>
				<div class="cabinet-dropdown__item {if isset($smarty.cookies.user) && $smarty.cookies.user == 'private' && $module=='UserView'}dropdown-menu-item--current{/if}">
					<a class="font_15 dark_link dropdown-menu-item" href="{$lang_link}user" onclick="document.cookie='user=private;path=/';document.location.reload();">
						{$lang->personal_data}
					</a>
				</div>
				<div class="cabinet-dropdown__item {if isset($smarty.cookies.user) && $smarty.cookies.user == 'orders' && $module=='UserView'}dropdown-menu-item--current{/if}">
					<a class="font_15 dark_link dropdown-menu-item" href="{$lang_link}user" onclick="document.cookie='user=orders;path=/';document.location.reload();">
						{$lang->orders_global}
					</a>
				</div>
				<div class="cabinet-dropdown__item {if $page->url == 'wishlist'}dropdown-menu-item--current{/if}">
					<a class="font_15 dark_link dropdown-menu-item" href="{$lang_link}wishlist" onclick="document.cookie='user=;path=/';document.location.reload();">
						{$lang->wishlist_products}
					</a>
				</div>
				<div class="cabinet-dropdown__item {if $page->url == 'faq'}dropdown-menu-item--current{/if}">
					<a class="font_15 dark_link dropdown-menu-item" href="{$lang_link}faq" onclick="document.cookie='user=;path=/';document.location.reload();">
						{$lang->help}
					</a>
				</div>
				<div class="cabinet-dropdown__item  stroke-theme-hover stroke-dark-light-block">
					<a class="font_15 dark_link dropdown-menu-item" href="{$lang_link}user/logout">
						{$lang->logout}
						<i class="svg inline" aria-hidden="true">
							<svg width="11" height="9">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#logout-11-9"></use>
							</svg>
						</i>
					</a>
				</div>
			</div>
		</div>
	{else}
		<a class="header-cabinet__link fill-theme-hover fill-dark-light-block light-opacity-hover dark_link animate-load fill-dark-light-block color-theme-hover banner-light-icon-fill banner-light-text flexbox flexbox--direction-column flexbox--align-center" data-event="jqm" title="{$lang->login}" data-url="{$lang_link}user/login/?tpl=auth" data-name="auth" href="{$lang_link}user/login">
			<i class="svg inline header__icon banner-light-icon-fill menu-light-icon-fill" aria-hidden="true">
				<svg width="18" height="18">
					<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#log-out-18-18"></use>
				</svg>
			</i>
			<span class="header-cabinet__name header__icon-name menu-light-text banner-light-text">{$lang->login}</span>
		</a>
	{/if}
</div>