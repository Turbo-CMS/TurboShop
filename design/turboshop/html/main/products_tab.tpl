{get_products is_hit=1 var=hit_products limit=$theme_settings->products_tab_products_limit}
{get_products is_new=1 var=new_products limit=$theme_settings->products_tab_products_limit}
{get_products featured=1 var=featured_products limit=$theme_settings->products_tab_products_limit}
{get_products discounted=1 var=discounted_products limit=$theme_settings->products_tab_products_limit}
{if $featured_products || $discounted_products || $hit_products || $new_products}
	<div class="drag-block container PRODUCTS_TAB" data-class="products_tab_drag" data-order="{$theme_settings->block_3}">
		<div class="index-block index-block--padding-top-{$theme_settings->products_tab_padding_top} index-block--padding-bottom-{$theme_settings->products_tab_padding_bottom} {if $theme_settings->products_tab_delimiter}index-block--delimiter{/if} {if $theme_settings->products_tab_background}index-block--fon{/if}">
			<div class="element-list .default-template" data-block_key=".default_1">
				{if $theme_settings->products_tab_title}
					<div class="maxwidth-theme">
						<div class="index-block__title-wrapper index-block__title-wrapper--with-center-block index-block__title-wrapper--mb-35">
							<div class="index-block__part--left">
								<h3 class="index-block__title switcher-title">
									<a class="index-block__link-wrapper dark_link stroke-theme-hover" href="{$lang_link}featured" title="{$lang->best_products}">
										<span>{$lang->best_products}</span>
										<span class="index-block__link">
											<span class="index-block__arrow">
												<i class="svg inline " aria-hidden="true">
													<svg width="7" height="12">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
													</svg>
												</i>
											</span>
										</span>
									</a>
								</h3>
							</div>
							<div class="index-block__part--right">
								<div class="tab-nav-wrapper">
									<div class="tab-nav font_14 line-block line-block--8 relative" data-template="catalog_block">
										{if $hit_products}
											<div class="line-block__item">
												<div class="chip tab-nav__item bg-theme-active color-theme-hover-no-active active clicked" data-action="/{$lang_link}catalog/?tpl=hit" data-code="HIT">
													<span class="chip__label">{$lang->badge_hit}</span>
												</div>
											</div>
										{/if}
										{if $featured_products}
											<div class="line-block__item">
												<div class="chip tab-nav__item bg-theme-active color-theme-hover-no-active {if !$hit_products}active clicked{/if}" data-action="/{$lang_link}catalog/?tpl=recommend" data-code="RECOMMEND">
													<span class="chip__label">{$lang->badge_featured}</span>
												</div>
											</div>
										{/if}
										{if $new_products}
											<div class="line-block__item">
												<div class="chip tab-nav__item bg-theme-active color-theme-hover-no-active {if !$featured_products && !$hit_products}active clicked{/if}" data-action="/{$lang_link}catalog/?tpl=new" data-code="NEW">
													<span class="chip__label">{$lang->badge_new}</span>
												</div>
											</div>
										{/if}
										{if $discounted_products}
											<div class="line-block__item">
												<div class="chip tab-nav__item bg-theme-active color-theme-hover-no-active {if !$new_products && !$featured_products && !$hit_products}active clicked{/if}" data-action="/{$lang_link}catalog/?tpl=stock" data-code="STOCK">
													<span class="chip__label">{$lang->badge_sale}</span>
												</div>
											</div>
										{/if}
									</div>
								</div>
							</div>
						</div>
					</div>
				{/if}
				<div class="maxwidth-theme">
					<div class="line-block line-block--align-flex-stretch line-block--block">
						<div class="wrapper_tabs line-block__item flex-1">
							<div class="js-tabs-ajax">
								{if $hit_products}
									<div class="tab-content-block active" data-code="HIT">{include file='loading/hit.tpl'}</div>
								{/if}
								{if !$hit_products}
									<div class="tab-content-block active" data-code="RECOMMEND">{include file='loading/recommend.tpl'}</div>
								{else}
									<div class="tab-content-block loading-state" data-code="RECOMMEND"></div>
								{/if}
								{if !$featured_products && !$hit_products}
									<div class="tab-content-block active" data-code="NEW">{include file='loading/new.tpl'}</div>
								{else}
									<div class="tab-content-block loading-state" data-code="NEW"></div>
								{/if}
								{if !$new_products && !$featured_products && !$hit_products}
									<div class="tab-content-block active" data-code="STOCK">{include file='loading/stock.tpl'}</div>
								{else}
									<div class="tab-content-block loading-state" data-code="STOCK"></div>
								{/if}				
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}