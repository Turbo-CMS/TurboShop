{* Featured Categories *}
{get_featured_categories var=featured_categories}
{if $featured_categories}
	{* Catalog Sections Type 1 *}
	{if $theme_settings->catalog_main_sections_type == '1'}
		<div class="drag-block container CATALOG_SECTIONS" data-class="catalog_sections_drag" data-order="{$theme_settings->block_2}">
			<div class="index-block index-block--padding-top-{$theme_settings->catalog_main_padding_top} index-block--padding-bottom-{$theme_settings->catalog_main_padding_bottom} {if $theme_settings->catalog_main_delimiter}index-block--delimiter{/if} {if $theme_settings->catalog_main_background}index-block--fon{/if}">
				<div class="sections-list default-template">
					{if $theme_settings->catalog_main_title}
						<div class="maxwidth-theme">
							<div class="index-block__title-wrapper index-block__title-wrapper--mb-35">
								<div class="index-block__part--left">
									<h3 class="index-block__title switcher-title">
										<a class="index-block__link-wrapper dark_link stroke-theme-hover" href="{$lang_link}catalog" title="{$lang->catalog|escape}">
											<span>{$lang->popular_categories|escape}</span>
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
					<div class="maxwidth-theme">
						<div class="line-block line-block--align-normal line-block--flex-wrap line-block--gap line-block--gap-12">
							{foreach $categories as $c}
								{if $c->featured}
									{if $c->visible}
										<div class="sections-list__wrapper line-block__item stroke-theme-parent-all colored_theme_hover_bg-block animate-arrow-hover">
											<div class="sections-list__item height-100 outer-rounded-x shadow-hovered shadow-no-border-hovered color-theme-parent-all {if $theme_settings->catalog_main_bordered}bordered{/if}">
												<a class="sections-list__item-link dark_link height-100" href="{$lang_link}catalog/{$c->url}">
													<span class="sections-list__item-inner flexbox flexbox--direction-row flexbox--align-center height-100">
														{if $theme_settings->catalog_main_images_type == '2'}
															<span class="sections-list__item-image-wrapper sections-list__item-image-wrapper--ICONS">
																{if $c->icon}
																	{assign var="icon" value="{$config->categories_images_dir}{$c->icon}"}
																	{if $icon|is_svg}
																		<i class="svg inline svg-inline- fill-theme sections-list__item-image" aria-hidden="true">
																			{$icon|svg}
																		</i>
																	{else}
																		<img style="max-width: 40px; max-height: 40px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$icon}" class="lazyload sections-list__item-image" alt="{$c->name|escape}">
																	{/if}
																{else}
																	<img style="width: 40px; height: 40px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" class="lazyload sections-list__item-image" alt="{$c->name|escape}">
																{/if}
															</span>
														{else}
															<span class="sections-list__item-image-wrapper sections-list__item-image-wrapper--PICTURES">
																{if $c->image}
																	<img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$c->image|resize_catalog:40:40}" class="lazyload sections-list__item-image" alt="{$c->name|escape}">
																{else}
																	<img style="width: 40px; height: 40px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" class="lazyload sections-list__item-image" alt="{$c->name|escape}">
																{/if}
															</span>
														{/if}
														<span class="sections-list__item-text color-theme-target font_short" data-category="{$c->id}">{$c->name|escape}</span>
													</span>
												</a>
											</div>
										</div>
									{/if}
								{/if}
							{/foreach}
							<div class="sections-list__wrapper line-block__item stroke-theme-parent-all colored_theme_hover_bg-block animate-arrow-hover">
								<div class="sections-list__item height-100 outer-rounded-x shadow-hovered shadow-no-border-hovered color-theme-parent-all {if $theme_settings->catalog_main_bordered}bordered{/if}">
									<a class="sections-list__item-link dark_link bg-theme-parent-hover" href="{$lang_link}catalog">
										<span class="sections-list__item-inner flexbox flexbox--direction-row flexbox--align-center">
											<span class="sections-list__item-image-wrapper sections-list__item-image-wrapper--PICTURES sections-list__item-image-wrapper--LINK rounded-x bg-theme-target">
												<i class="svg inline arrow stroke-dark-light" aria-hidden="true">
													<svg width="7" height="12">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
													</svg>
												</i>
											</span>
											<span class="sections-list__item-text color-theme-target font_short linecamp-12">{$lang->whole_catalog|escape}</span>
										</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}

	{* Catalog Sections Type 2 *}
	{if $theme_settings->catalog_main_sections_type == '2'}
		<div class="drag-block container CATALOG_SECTIONS" data-class="catalog_sections_drag" data-order="{$theme_settings->block_2}">
			<div class="index-block index-block--padding-top-{$theme_settings->catalog_main_padding_top} index-block--padding-bottom-{$theme_settings->catalog_main_padding_bottom} {if $theme_settings->catalog_main_delimiter}index-block--delimiter{/if} {if $theme_settings->catalog_main_background}index-block--fon{/if}">
				<div class="sections-block main-template">
					{if $theme_settings->catalog_main_title}
						<div class="maxwidth-theme">
							<div class="index-block__title-wrapper index-block__title-wrapper--mb-35">
								<div class="index-block__part--left">
									<h3 class="index-block__title switcher-title">
										<a class="index-block__link-wrapper dark_link stroke-theme-hover" href="{$lang_link}catalog" title="{$lang->catalog|escape}">
											<span>{$lang->popular_categories|escape}</span>
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
					<div class="maxwidth-theme">
						<div class="grid-list grid-list--fill-bg mobile-scrolled mobile-offset mobile-scrolled--items-3 grid-list--items-{$theme_settings->catalog_main_grid_column}-1400 grid-list--items-7-1300 grid-list--items-6-1200 grid-list--items-5-1100 grid-list--items-4-992 grid-list--items-3-768 grid-list--items-2-601">
							{foreach $categories as $c}
								{if $c->featured}
									{if $c->visible}
										<div class="sections-block__wrapper grid-list__item stroke-theme-parent-all colored_theme_hover_bg-block animate-arrow-hover items-{$theme_settings->catalog_main_grid_column}">
											<div class="sections-block__item height-100 outer-rounded-x color-theme-parent-all shadow-hovered shadow-no-border-hovered {if $theme_settings->catalog_main_bordered}bordered{/if}">
												<a class="sections-block__item-link dark_link height-100" href="{$lang_link}catalog/{$c->url}">
													<span class="sections-block__item-inner height-100">
														{if $theme_settings->catalog_main_images_type == '2'}
															<span class="sections-block__item-image-wrapper sections-block__item-image-wrapper--ICONS">
																{if $c->icon}
																	{assign var="icon" value="{$config->categories_images_dir}{$c->icon}"}
																	{if $icon|is_svg}
																		<i class="svg inline svg-inline- fill-theme sections-block__item-image" aria-hidden="true">
																			{$icon|svg}
																		</i>
																	{else}
																		<img style="max-width: 80px; max-height: 80px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$icon}" class="lazyload sections-block__item-image" alt="{$c->name|escape}">
																	{/if}
																{else}
																	<img style="width: 80px; height: 80px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" class="lazyload sections-block__item-image" alt="{$c->name|escape}">
																{/if}
															</span>
														{else}
															<span class="sections-block__item-image-wrapper sections-block__item-image-wrapper--PICTURES">
																{if $c->image}
																	<img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$c->image|resize_catalog:120:120}" class="lazyload sections-block__item-image" alt="{$c->name|escape}">
																{else}
																	<img style="width: 120px; height: 120px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" class="lazyload sections-block__item-image" alt="{$c->name|escape}">
																{/if}
															</span>
														{/if}
														<span class="sections-block__item-text color-theme-target font_14 font_short" data-category="{$c->id}">{$c->name|escape}</span>
													</span>
												</a>
											</div>
										</div>
									{/if}
								{/if}
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}
{/if}

{* Catalog Sections Type 3*}
{if $theme_settings->catalog_main_sections_type == '3'}
	<div class="drag-block container CATALOG_SECTIONS" data-class="catalog_sections_drag" data-order="{$theme_settings->block_2}">
		<div class="index-block index-block--padding-top-{$theme_settings->catalog_main_padding_top} index-block--padding-bottom-{$theme_settings->catalog_main_padding_bottom} {if $theme_settings->catalog_main_delimiter}index-block--delimiter{/if} {if $theme_settings->catalog_main_background}index-block--fon{/if}">
			<div class="sections-slider slider-template">
				{if $theme_settings->catalog_main_title}
					<div class="maxwidth-theme">
						<div class="index-block__title-wrapper index-block__title-wrapper--mb-35">
							<div class="index-block__part--left">
								<h3 class="index-block__title switcher-title">
									<a class="index-block__link-wrapper dark_link stroke-theme-hover" href="{$lang_link}catalog" title="{$lang->catalog|escape}">
										<span>{$lang->popular_categories|escape}</span>
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
				<div class="maxwidth-theme">
					<div class="swiper-nav-offset relative">
						<div class="swiper slider-solution slider-solution--static-dots appear-block mobile-offset mobile-offset--right" data-plugin-options='{literal}{"preloadImages":false,"lazy":false,"keyboard":true,"init":false,"countSlides":{/literal}{$featured_categories|count}{literal},"rewind":true,"freeMode":{"enabled":true,"momentum":true},"slidesPerView":"auto","spaceBetween":8,"pagination":false,"type":"main_sections","breakpoints":{"601":{"spaceBetween":24}}}{/literal}'>
							<div class="swiper-wrapper">
								{foreach $categories as $c}
									{if $c->featured}
										{if $c->visible}
											<div class="sections-slider__wrapper swiper-slide">
												<div class="sections-slider__item height-100 color-theme-parent-all">
													<a class="sections-slider__item-link dark_link height-100" href="{$lang_link}catalog/{$c->url}">
														<span class="sections-slider__item-inner height-100">
															{if $theme_settings->catalog_main_images_type == '2'}
																<span class="sections-slider__item-image-wrapper outer-rounded-x sections-slider__item-image-wrapper--ICONS {if $theme_settings->catalog_main_images_bg}sections-slider__item-image-wrapper--fon-Y{else}sections-slider__item-image-wrapper--fon-N{/if}">
																	{if $c->icon}
																		{assign var="icon" value="{$config->categories_images_dir}{$c->icon}"}
																		{if $icon|is_svg}
																			<i class="svg inline svg-inline- fill-theme sections-slider__item-image" aria-hidden="true">
																				{$icon|svg}
																			</i>
																		{else}
																			<img style="max-width: 40px; max-height: 40px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$icon}" class="lazyload sections-slider__item-image" alt="{$c->name|escape}">
																		{/if}
																	{else}
																		<img style="width: 40px; height: 40px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" class="lazyload sections-slider__item-image" alt="{$c->name|escape}">
																	{/if}
																</span>
															{else}
																<span class="sections-slider__item-image-wrapper outer-rounded-x sections-slider__item-image-wrapper--PICTURES {if $theme_settings->catalog_main_images_bg}sections-slider__item-image-wrapper--fon-Y{else}sections-slider__item-image-wrapper--fon-N{/if}">
																	{if $c->image}
																		<img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$c->image|resize_catalog:120:120}" class="lazyload sections-slider__item-image" alt="{$c->name|escape}">
																	{else}
																		<img style="width: 80px; height: 80px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" class="lazyload sections-slider__item-image" alt="{$c->name|escape}">
																	{/if}
																</span>
															{/if}
															<span class="sections-slider__item-text color-theme-target font_14 font_short" data-category="{$c->id}">{$c->name|escape}</span>
														</span>
													</a>
												</div>
											</div>
										{/if}
									{/if}
								{/foreach}
							</div>
						</div>
						<div class="slider-nav swiper-button-prev slider-nav--shadow">
							<i class="svg inline stroke-dark-light" aria-hidden="true">
								<svg width="7" height="12">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
								</svg>
							</i>
						</div>
						<div class="slider-nav swiper-button-next slider-nav--shadow">
							<i class="svg inline stroke-dark-light" aria-hidden="true">
								<svg width="7" height="12">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
								</svg>
							</i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}