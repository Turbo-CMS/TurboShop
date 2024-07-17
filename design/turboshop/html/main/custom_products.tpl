{* Custom Products *}
{get_products var=cat_products category_id=$theme_settings->custom_products_category_id limit=$theme_settings->custom_products_products_limit sort=$theme_settings->custom_products_sort visible=1}
{if $cat_products}
	<div class="drag-block container CUSTOM_PRODUCTS" data-class="custom_products_drag" data-order="{$theme_settings->block_8}">
		<div class="index-block index-block--padding-top-{$theme_settings->custom_products_padding_top} index-block--padding-bottom-{$theme_settings->custom_products_padding_bottom} {if $theme_settings->custom_products_delimiter}index-block--delimiter{/if} {if $theme_settings->custom_products_background}index-block--fon{/if}">
			<div class="element-list .default-template" data-block_key=".default_3">
				{if $theme_settings->custom_products_title}
					<div class="maxwidth-theme">
						<div class="index-block__title-wrapper index-block__title-wrapper--mb-35">
							<div class="index-block__part--left">
								<h3 class="index-block__title switcher-title">
									{get_categories category=$theme_settings->custom_products_category_id var="category"}
									<a class="index-block__link-wrapper dark_link stroke-theme-hover" href="{$lang_link}catalog/{$category->url}" title="{$category->name|escape}">
										<span>{$category->name|escape}</span>
										<span class="index-block__link"><span class="index-block__arrow">
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
				<div class="maxwidth-theme">
					<div class="line-block line-block--align-flex-stretch line-block--block">
						<div class="wrapper_tabs line-block__item flex-1">
							<div class="js-tabs-ajax">
								<div class="tab-content-block active">
									<!-- items-container -->
									<div class="catalog-items catalog_block_template" data-i-appeared="true">
										<div class="catalog-block">
											<div class="js_append ajax_load block grid-list grid-list--fill-bg mobile-scrolled mobile-scrolled--items-3 mobile-offset grid-list--items-{$theme_settings->custom_products_grid_column}-1200 grid-list--items-4-992 grid-list--items-3-768 grid-list--items-2-601">
												{foreach $cat_products as $product}
													{include file='products/grid_custom.tpl'}
												{/foreach}
											</div>
											<div class="bottom_nav_wrapper nav-compact">
												<div class="bottom_nav hide-600" data-count="" data-parent=".catalog-block" data-append=".grid-list">
												</div>
											</div>
										</div>
									</div>
									<!-- items-container --> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}