{* Langs *}
{if $languages|count > 1}
	<div class="footer__lang footer__part-item">
		<div class="icon-block--with_icon">
			<div class="sites fill-theme-parent-all color-theme-parent-all">
				<div class="sites__dropdown sites__dropdown--top">
					<div class="dropdown dropdown--relative">
						{foreach $languages as $l}
							{if $l->enabled}
								{if $language->id == $l->id name=lang}
									<div class="sites__option {if $smarty.foreach.lang.first}sites__option--first{/if} sites__option--current font_xs">{$l->label|upper|escape}</div>
								{else}
									<a class="dark_link sites__option {if $smarty.foreach.lang.last}sites__option--last{/if} color-theme-hover font_xs" href="{$l->url}">
										{$l->label|upper|escape}
									</a>
								{/if}
							{/if}
						{/foreach}
					</div>
				</div>
				<div class="sites__select light-opacity-hover">
					<span class="icon-block__icon icon-block__only-icon fill-theme-target banner-light-icon-fill menu-light-icon-fill light-opacity-hover">
						<i class="svg inline svg-inline-" aria-hidden="true">
							{assign var="globe" value="design/{$settings->theme|escape}/images/svg/globe.svg"}
							{$globe|svg}
						</i>
					</span>
					<div class="sites__current sites__current--upper color-theme-target icon-block__name font_xs banner-light-text menu-light-text">{$language->label|upper|escape}</div>
					<span class="more-arrow fill-theme-target banner-light-icon-fill menu-light-icon-fill fill-dark-light-block">
						<svg width="7" height="5">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
						</svg>
					</span>
				</div>
			</div>
		</div>
	</div>
{/if}