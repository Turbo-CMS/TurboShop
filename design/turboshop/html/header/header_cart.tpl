{* Header Cart *}
<div class="title-v1" data-ajax-block="HEADER">
	<header class="header header_simple header_simple_1">
		<div class="header__inner {if !$theme_settings->header_padding_top}header__inner--no-pt{/if} {if !$theme_settings->content_width}header__inner--paddings{/if}">
			<div class="header__main-part">
				{if $theme_settings->content_width}<div class="maxwidth-theme">{/if}
					<div class="header__main-inner relative">
						<div class="header__main-item icon-block--with_icon">
							{* Langs - Currencies *}
							{include file='header/lang_curr.tpl'}
						</div>
						<div class="header__main-item header__main-item--centered">
							<div class="line-block line-block--40">
								<div class="logo line-block__item no-shrinked">
									<a class="menu-light-icon-fill banner-light-icon-fill" href="{if $lang_link}{$lang_link}{else}/{/if}">
										{* Logo *}
										{include file='includes/logo.tpl'}
									</a>
								</div>
							</div>
						</div>
						<div class="header__main-item no-shrinked">
							{* Phones *}
							{include file='header/phones.tpl'}
						</div>
					</div>
					{if $theme_settings->content_width}
				</div>{/if}
			</div>
		</div>
	</header>
	<script data-skip-moving="true">
		if (typeof topMenuAction !== 'undefined') topMenuAction()
	</script>
</div>
<div id="headerfixed"></div>