{get_banner var=banner_4 group='4'}
{if isset($banner_4->items)}
	<div class="drag-block container TIZERS" data-class="tizers_drag" data-order="{$theme_settings->block_6}">
		<div class="index-block index-block--padding-top-{$theme_settings->teasers_padding_top} index-block--padding-bottom-{$theme_settings->teasers_padding_bottom} {if $theme_settings->teasers_delimiter}index-block--delimiter{/if} {if $theme_settings->teasers_background}index-block--fon{/if}">
			<div class="tizers-list outer-rounded-x">
				<div class="maxwidth-theme">
					<div class="tizers-list__items-wrapper grid-list grid-list--items-4 grid-list--items-{$theme_settings->teasers_grid_type}-1200 grid-list--items-3-992 grid-list--items-2-601 mobile-scrolled mobile-offset mobile-scrolled--items-2">
						{foreach $banner_4->items as $t}
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