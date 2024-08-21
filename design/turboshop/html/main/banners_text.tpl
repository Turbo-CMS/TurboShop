{get_banner var=banners_text group=$theme_settings->banners_text_id} 
{if isset($banners_text->items)}
	<div class="drag-block container MIDDLE_ADV" data-class="middle_adv_drag" data-order="{$theme_settings->block_5}">
		<div class="index-block index-block--padding-top-{$theme_settings->banners_text_padding_top} index-block--padding-bottom-{$theme_settings->banners_text_padding_bottom} {if $theme_settings->banners_text_delimiter}index-block--delimiter{/if} {if $theme_settings->banners_text_background}index-block--fon{/if}">
			<div class="banners-img-with-text-list banners-with-text-template">
				{if $theme_settings->banners_text_title}
					<div class="maxwidth-theme">
						<div class="index-block__title-wrapper index-block__title-wrapper--mb-35">
							<div class="index-block__part--left">
								<h3 class="index-block__title switcher-title">
									<a class="index-block__link-wrapper dark_link stroke-theme-hover" href="{$lang_link}" title="{$lang->global_banners}">
										<span>{$lang->global_banners}</span>
										<span class="index-block__link">
											<span class="index-block__arrow">
												<i class="svg inline" aria-hidden="true">
													<svg width="7" height="12">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
													</svg>
												</i>
											</span>
										</span>
									</a>
								</h3>
							</div>
						</div>
					</div>
				{/if}
				<div class="maxwidth-theme {if $theme_settings->banners_text_wide}maxwidth-theme--no-maxwidth{/if}">
					<div class="grid-list grid-items-3 grid-list--items-{$theme_settings->banners_text_grid_type}-1200 grid-list--items-2-992 grid-list--items-2-601 mobile-scrolled mobile-scrolled--items-2 mobile-offset">
						{foreach $banners_text->items as $b}
							<div class="banners-img-with-text-list__wrapper grid-list__item">
								<div class="banners-img-with-text-list__item hover_zoom shadow-hovered shadow-no-border-hovered outer-rounded-x">
									<span class="lazyload banners-img-with-text-list__item-image shine" style="background-image:url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==)" data-bg="{$b->image|resize_banners:694:463}"></span>
									<a class="banners-img-with-text-list__item-link item-link-absolute" href="{$lang_link}{$b->url|escape}"></a>
									<div class="banners-img-with-text-list__item-text banners-img-with-text-list__item-text--absolute dark-block-after {if $theme_settings->banners_text_position == '2'}banners-img-with-text-list__item-text--centered{/if}">
										<div class="banners-img-with-text-list__item-text-scrollbar-wrapper scrollbar">
											<div class="banners-img-with-text-list__item-top-text font_13">{$b->description}</div>
											<div class="banners-img-with-text-list__item-title switcher-title font_20">
												<a href="{$lang_link}{$b->url|escape}" class="banners-img-with-text-list__item-link-hover-none" title="{$b->title|escape}">
													{$b->name|escape}
												</a>
											</div>
											<a class="banners-img-with-text-list__item-link item-link-absolute" href="{$lang_link}{$b->url|escape}"></a>
										</div>
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