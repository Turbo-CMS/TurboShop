{* Langs - Currencies *}
<div class="catalog_icons_">
	<div class="header-menu__wrapper">
		{if $languages|count > 1}
			<div class="header-menu__item unvisible header-menu__item--first header-menu__item--dropdown">
				<div class="header-menu__link header-menu__link--top-level light-opacity-hover fill-theme-hover banner-light-text dark_link cursor-pointer">
					<i class="dropdown-select__icon-left flag-icon flag-icon-{$language->label}"></i>
					<span class="header-menu__title font_14">
						{$language->label|upper|escape}
					</span>
					<i class="svg inline header-menu__wide-submenu-right-arrow fill-dark-light-block banner-light-icon-fill" aria-hidden="true">
						<svg width="7" height="5">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
						</svg>
					</i>
				</div>
				<div class="header-menu__dropdown-menu dropdown-menu-wrapper dropdown-menu-wrapper--visible dropdown-menu-wrapper--woffset">
					<div class="dropdown-menu-inner rounded-x">
						<ul class="header-menu__dropdown-menu-inner">
							{foreach $languages as $l}
								{if $l->enabled}
									<li class="header-menu__dropdown-item header-menu__dropdown-item--with-dropdown {if $language->id == $l->id}active{/if}">
										<a class="font_15 {if $language->id == $l->id}dropdown-menu-item--current{/if} dropdown-menu-item dark_link fill-dark-light-block" href="{$l->url}">
											<i class="dropdown-select__icon-left flag-icon flag-icon-{$l->label}"></i>{$l->name|escape}
										</a>
									</li>
								{/if}
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
		{/if}
		{if $currencies|count > 1}
			<div class="header-menu__item unvisible header-menu__item--first header-menu__item--dropdown">
				<div class="header-menu__link header-menu__link--top-level light-opacity-hover fill-theme-hover banner-light-text dark_link cursor-pointer">
					<strong class="dropdown-select__icon-left font_15">{$currency->sign}</strong>
					<span class="header-menu__title font_14">
						{$currency->name|escape}
					</span>
					<i class="svg inline header-menu__wide-submenu-right-arrow fill-dark-light-block banner-light-icon-fill" aria-hidden="true">
						<svg width="7" height="5">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
						</svg>
					</i>
				</div>
				<div class="header-menu__dropdown-menu dropdown-menu-wrapper dropdown-menu-wrapper--visible dropdown-menu-wrapper--woffset">
					<div class="dropdown-menu-inner rounded-x">
						<ul class="header-menu__dropdown-menu-inner">
							{foreach $currencies as $c}
								{if $c->enabled}
									<li class="header-menu__dropdown-item header-menu__dropdown-item--with-dropdown {if $c->id==$currency->id}active{/if}">
										<a class="font_15 {if $c->id==$currency->id}dropdown-menu-item--current{/if} dropdown-menu-item dark_link fill-dark-light-block" href="{url currency_id=$c->id}">
											<strong>{$c->sign}</strong> {$c->name|escape}
										</a>
									</li>
								{/if}
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
		{/if}
	</div>
</div>