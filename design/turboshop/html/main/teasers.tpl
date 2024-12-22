{get_banner var=teasers group=$theme_settings->teasers_banners_id}
{if $teasers && $teasers->items}
	{if $theme_settings->teasers_type == '1'}
		<div class="drag-block container TIZERS" data-class="tizers_drag" data-order="{$theme_settings->block_6}">
			<div class="index-block index-block--padding-top-{$theme_settings->teasers_padding_top} index-block--padding-bottom-{$theme_settings->teasers_padding_bottom} {if $theme_settings->teasers_delimiter}index-block--delimiter{/if} {if $theme_settings->teasers_background}index-block--fon{/if}">
				<div class="tizers-list outer-rounded-x">
					<div class="maxwidth-theme">
						<div class="tizers-list__items-wrapper grid-list grid-list--items-4 grid-list--items-{$theme_settings->teasers_grid_type}-1200 grid-list--items-3-992 grid-list--items-2-601 mobile-scrolled mobile-offset mobile-scrolled--items-2">
							{foreach $teasers->items as $t}
								<div class="tizers-list__item-wrapper grid-list__item">
									<div class="tizers-list__item color-theme-parent-all {if $theme_settings->teasers_position == '1'}tizers-list__item--images-position-LEFT{else}tizers-list__item--images-position-TOP tizers-list__item--column{/if}">
										<div class="tizers-list__item-image-wrapper {if $theme_settings->teasers_position == '1'}tizers-list__item-image-wrapper--position-LEFT{else}tizers-list__item-image-wrapper--position-TOP{/if}">
											<a class="tizers-list__item-link flexbox" href="{$lang_link}{$t->url|escape}">
												<i class="svg inline svg-inline- fill-theme tizers-list__item-image-icon" aria-hidden="true">
													{if $t->image}
														{assign var="icon" value="{$config->banners_images_dir}{$t->image}"}
														{if $icon|is_svg}
															<i class="svg inline svg-inline- fill-theme sections-list__item-image" aria-hidden="true">
																{$icon|svg}
															</i>
														{else}
															<img style="width: 40px; height: 40px;" src="{$icon}" alt="{$t->name|escape}">
														{/if}
													{else}
														<img style="width: 40px; height: 40px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" class="lazyload" alt="{$t->name|escape}">
													{/if}
												</i>
											</a>
										</div>
										<div class="tizers-list__item-text-wrapper">
											<a class="tizers-list__item-link dark_link tizers-list__item-name font_16 switcher-title color_222 color-theme-target" href="{$lang_link}{$t->url|escape}">
												{$t->name|escape}
											</a>
											<span class="tizers-list__item-descr font_15">{$t->description}</span>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}
	{if $theme_settings->teasers_type == '2'}
		<div class="drag-block container TIZERS" data-class="tizers_drag" data-order="{$theme_settings->block_6}">
			<div class="index-block index-block--padding-top-{$theme_settings->teasers_padding_top} index-block--padding-bottom-{$theme_settings->teasers_padding_bottom} {if $theme_settings->teasers_delimiter}index-block--delimiter{/if} {if $theme_settings->teasers_background}index-block--fon{/if}">
				<div class="tizers-list tizers-list--narrow">
					{if !$theme_settings->teasers_wide}<div class="maxwidth-theme">{elseif $theme_settings->teasers_indented}<div class="maxwidth-theme maxwidth-theme--no-maxwidth">{/if}
						<div class="tizers-list__items-wrapper grid-list {if $theme_settings->teasers_wide}grid-list--items-4-wide{else}grid-list--items-4{/if} grid-list--no-gap  mobile-scrolled mobile-offset mobile-scrolled--items-2">
							{foreach $teasers->items as $t}
								<div class="tizers-list__item-wrapper  grid-list__item bordered tizers-list__item-wrapper-close">
									<div class="tizers-list__item  tizers-list__item--images-ICONS tizers-list__item--with-bg {if $theme_settings->teasers_wide}tizers-list__item--wide-with-bg{else}tizers-list__item--narrow-with-bg{/if} {if $theme_settings->teasers_position == '1'}tizers-list__item--images-position-LEFT{else}tizers-list__item--images-position-TOP tizers-list__item--column{/if}">
										<div class="tizers-list__item-image-wrapper tizers-list__item-image-wrapper--ICONS {if $theme_settings->teasers_position == '1'}tizers-list__item-image-wrapper--position-LEFT{else}tizers-list__item-image-wrapper--position-TOP{/if}">
											<a class="tizers-list__item-link" href="{$lang_link}{$t->url|escape}">
												<i class="svg inline svg-inline- fill-theme tizers-list__item-image-icon" aria-hidden="true">
													{if $t->image}
														{assign var="icon" value="{$config->banners_images_dir}{$t->image}"}
														{if $icon|is_svg}
															<i class="svg inline svg-inline- fill-theme sections-list__item-image" aria-hidden="true">
																{$icon|svg}
															</i>
														{else}
															<img style="width: 40px; height: 40px;" src="{$icon}" alt="{$t->name|escape}">
														{/if}
													{else}
														<img style="width: 40px; height: 40px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" class="lazyload" alt="{$t->name|escape}">
													{/if}
												</i>
											</a>
										</div>
										<div class="tizers-list__item-text-wrapper color_333">
											<a class="tizers-list__item-link dark_link" href="{$lang_link}{$t->url|escape}">
												<span class="tizers-list__item-name font_17 switcher-title">{$t->name|escape}</span>
											</a>
											<span class="tizers-list__item-descr font_14 color_666">{$t->description}</span>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					{if !$theme_settings->teasers_wide}</div>{/if}
				</div>
			</div>
		</div>
	{/if}
{/if}