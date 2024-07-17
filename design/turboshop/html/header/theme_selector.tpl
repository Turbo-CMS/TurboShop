{* Theme Selector *}
<div id="theme-selector--g0" class="theme-selector">
	<div class="theme-selector__inner">
		<div class="theme-selector__items">
			<div onclick="document.cookie='mode=light;path=/';document.location.reload();" class="theme-selector__item theme-selector__item--light {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'light'}current{/if}">
				<div class="theme-selector__item-icon">
					<i class="svg inline light-16-16" aria-hidden="true">
						<svg width="16" height="16">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/icons.svg#light-16-16"></use>
						</svg>
					</i>
				</div>
			</div>
			<div onclick="document.cookie='mode=dark;path=/';document.location.reload();" class="theme-selector__item theme-selector__item--dark {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'dark'}current{/if}">
				<div class="theme-selector__item-icon">
					<i class="svg inline dark-14-14" aria-hidden="true">
						<svg width="14" height="14">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/icons.svg#dark-14-14"></use>
						</svg>
					</i>
				</div>
			</div>
		</div>
	</div>
</div>