{* Recommended Products Type 1 *}
{if $theme_settings->view_recommended_products == '1'}
	<div class="detail-block ordered-block associated">
		<h3 class="switcher-title">{$lang->you_may_also_like}</h3>
		<div class="ajax-pagination-wrapper" data-class="associated-list-inner">
			<!-- items-container -->
			<div class="catalog-items catalog_block_template">
				<div class="catalog-block relative swiper-nav-offset">
					<div class="js_append ajax_load appear-block swiper slider-solution slider-solution--hide-before-loaded mobile-offset mobile-offset--right" data-plugin-options='{literal}{"loop":false,"autoplay":false,"spaceBetween":8,"slidesPerView":"auto","freeMode":true,"breakpoints":{"601":{"freeMode":false,"slidesPerView":2,"spaceBetween":20},"768":{"freeMode":false,"slidesPerView":3,"spaceBetween":20},"992":{"freeMode":false,"slidesPerView":4,"spaceBetween":20},"1200":{"freeMode":false,"slidesPerView":5,"spaceBetween":20}}}{/literal}'>
						<div class=" swiper-wrapper mobile-scrolled--items-3">
							{foreach $recommended_products as $product}
								{include file='products/grid.tpl'}
							{/foreach}
						</div>
					</div>
					<div class="slider-nav slider-nav--no-auto-hide swiper-button-prev hide-600">
						<i class="svg inline stroke-dark-light" aria-hidden="true">
							<svg width="7" height="12">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
							</svg>
						</i>
					</div>
					<div class="slider-nav slider-nav--no-auto-hide swiper-button-next hide-600">
						<i class="svg inline stroke-dark-light" aria-hidden="true">
							<svg width="7" height="12">
								<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
							</svg>
						</i>
					</div>
					<div class="bottom_nav_wrapper nav-compact">
						<div class="bottom_nav" data-count="" data-parent=".catalog-block" data-append=".grid-list"></div>
					</div>
				</div>
			</div>
			<!-- items-container -->
		</div>
	</div>
{/if}

{* Recommended Products Type 2 *}
{if $theme_settings->view_recommended_products == '2'}
	<div class="detail-block ordered-block associated">
		<h3 class="switcher-title">{$lang->you_may_also_like}</h3>
		<div class="ajax-pagination-wrapper" data-class="associated-list-inner">
			<!-- items-container -->
			<div class="catalog-items catalog_block_template">
				<div class="catalog-block">
					<div class="js_append ajax_load block grid-list grid-list--fill-bg grid-list--compact grid-list--items-{$theme_settings->recommended_products_grid_type}-1200 grid-list--items-4-992 grid-list--items-3-768 grid-list--items-2-601">
						{foreach $recommended_products as $product}
							{include file='products/grid.tpl'}
						{/foreach}
					</div>
					<div class="bottom_nav_wrapper nav-compact">
						<div class="bottom_nav" data-count="" data-parent=".catalog-block" data-append=".grid-list">
						</div>
					</div>
				</div>
			</div>
			<!-- items-container -->
		</div>
	</div>
{/if}