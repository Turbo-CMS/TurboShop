{* Blog *}
{get_posts var=last_posts limit=5}
{if isset($last_posts)}
	<div class="drag-block container BLOG" data-class="blog_drag" data-order="{$theme_settings->block_10}">
		<div class="index-block index-block--padding-top-{$theme_settings->blog_main_padding_top} index-block--padding-bottom-{$theme_settings->blog_main_padding_bottom} {if $theme_settings->blog_main_delimiter}index-block--delimiter{/if} {if $theme_settings->blog_main_background}index-block--fon{/if}">
			<div class="blog-list blog-list--items-offset blog-list-template">
				{if $theme_settings->blog_main_title}
					<div class="maxwidth-theme">
						<div class="index-block__title-wrapper index-block__title-wrapper--mb-35">
							<div class="index-block__part--left">
								<h3 class="index-block__title switcher-title">
									<a class="index-block__link-wrapper dark_link stroke-theme-hover" href="{$lang_link}blog" title="{$lang->see_all}">
										<span>{$lang->global_blog}</span>
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
					<div class="grid-list grid-list--items-{$theme_settings->blog_main_grid_type}-1200 grid-list--items-4-992 grid-list--items-4-768 grid-list--items-3-601 grid-list--gap-row-40 mobile-scrolled mobile-scrolled--items-2 mobile-offset">
						{foreach $last_posts as $post}
							<div class="blog-list__wrapper grid-list__item">
								<div class="blog-list__item height-100 flexbox color-theme-parent-all">
									<div class="blog-list__item-image-wrapper">
										<a class="blog-list__item-link" href="{$lang_link}blog/{$post->url}">
											{if isset($post->image) && $post->image}
												<span class="lazyload blog-list__item-image outer-rounded-x" style="background-image:url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==);" data-bg="{$post->image|resize_posts:700:464}"></span>
											{else}
												<span style="display: flex; justify-content: center; align-items: center;" class="blog-list__item-image outer-rounded-x">
													<img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$post->name|escape}" style="max-width: 100%; max-height: 100%;">
												</span>
											{/if}
										</a>
									</div>
									<div class="blog-list__item-text-wrapper flex-grow-1 flexbox">
										<div class="blog-list__item-text-top-part flexbox">
											<div class="blog-list__item-title switcher-title font_weight--500 font_16">
												<a class="dark_link color-theme-target" href="{$lang_link}blog/{$post->url}">
													<span data-post="{$post->id}">{$post->name|escape}</span>
												</a>
											</div>
											<div class="blog-list__item-text-bottom-part">
												<div class="blog-list__item-period font_14">
													<span class="blog-list__item-period-date">{$post->date|date}</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						{/foreach}
						<div class="bottom_nav mobile_slider hidden-nav" data-parent=".blog-list" data-append=".grid-list"></div>
					</div>
					<div class="bottom_nav_wrapper nav-compact">
						<div class="bottom_nav hide-600" data-parent=".blog-list" data-append=".grid-list"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}