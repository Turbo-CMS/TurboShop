{* Blog *}

{* Canonical *}
{if $keyword}
	{$canonical="/blog/?keyword={$keyword|escape}" scope=global}
{else}
	{$canonical="/blog" scope=global}
{/if}

{* Ajax Modal *}
{if isset($smarty.server.HTTP_X_REQUESTED_WITH) && $smarty.server.HTTP_X_REQUESTED_WITH == 'XMLHttpRequest'}
	{$wrapper='modals/subscribe.tpl' scope=global}
{/if}

<!--title_content-->
<div class="page-top-info">
	<div class="page-top-wrapper page-top-wrapper--white">
		<section class="page-top maxwidth-theme">
			<div class="cowl">
				{$level = 1}
				<div id="navigation">
					<div class="breadcrumbs swipeignore" itemscope="" itemtype="http://schema.org/BreadcrumbList">
						<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a class="breadcrumbs__link" href="{if $lang_link}{$lang_link}{else}/{/if}" title="{$lang->home}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->home}</span>
								<meta itemprop="position" content="{$level++}">
							</a>
						</div>
						<span class="breadcrumbs__separator">
							<i class="svg inline muted-use fill-dark-light" aria-hidden="true">
								<svg width="7" height="5">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
								</svg>
							</i>
						</span>
						{if isset($keyword)}
							<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<a class="breadcrumbs__link" href="{$lang_link}blog" title="{$lang->global_blog}" itemprop="item">
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->global_blog}</span>
									<meta itemprop="position" content="{$level++}">
								</a>
							</div>
							<span class="breadcrumbs__separator">
								<i class="svg inline muted-use fill-dark-light" aria-hidden="true">
									<svg width="7" height="5">
										<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
									</svg>
								</i>
							</span>
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}blog?keyword={$keyword|escape}" itemprop="item"><span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->search}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{else}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}blog" itemprop="item"><span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->global_blog}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{/if}
					</div>
				</div>
			</div>
			<!--h1_content-->
			<div class="topic">
				<div class="topic__inner">
					<div class="topic__heading">
						{if isset($keyword)}
							<h1 id="pagetitle" class="switcher-title">{$keyword|escape}</h1>
						{else}
							<h1 id="pagetitle" class="switcher-title" data-page="{$page->id}">{$page->name|escape}</h1>
						{/if}
					</div>
				</div>
			</div>
			<!--/h1_content-->
		</section>
	</div>
</div>
<!--end-title_content-->

<div class="container">
	<div class="row">
		<div class="maxwidth-theme">
			<div class="col-md-12 col-sm-12 col-xs-12 content-md">
				<div class="right_block narrow_Y">
					<div class="blog-list blog-list--items-offset blog-list-template">
						{if $posts}
							<div class="js_append grid-list grid-list--items-{$theme_settings->blog_grid_type}-1200 grid-list--items-2-992 grid-list--items-2-768 grid-list--items-1-601 grid-list--gap-row-40 grid-list--normal">
								{foreach $posts as $post}
									<div class="js-infinite blog-list__wrapper grid-list__item">
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
							</div>
							{if $total_pages_num > 1}
								<div class="bottom_nav_wrapper nav-compact">
									<div class="bottom_nav">
										{if $current_page_num < $total_pages_num}
											<div class="ajax_load_btn">
												<span class="more_text_ajax btn btn-transparent">
													{$lang->load_more}
												</span>
											</div>
										{/if}
										{* Paginations *}
										{include file='components/pagination.tpl'}
									</div>
								</div>
							{/if}
						{else}
							<div class="col-md-12">
								<div class="alert alert-info">
									{$lang->no_post_found}
								</div>
							</div>
						{/if}
					</div>
				</div>
				<div class="left_block">
					<div class="sticky-block sticky-block--show-Y">
						<div class="sidearea">
							{if $all_tags}
								<noindex>
									<div class="search-tags-cloud">
										<div class="tags">
											<div class="line-block line-block--6 line-block--6-vertical line-block--flex-wrap">
												{foreach $all_tags as $tag}
													<div class="line-block__item">
														<a href="{$lang_link}blog/?keyword={$tag}" rel="nofollow" class="bordered chip chip--transparent {if $keyword == $tag}selected{/if}">
															<span class="chip__label font_14">{$tag}</span>
														</a>
													</div>
												{/foreach}
											</div>
										</div>
									</div>
								</noindex>
							{/if}
							<div class="subscribe-edit">
								<div class="subscribe-side-block bordered outer-rounded-x">
									<div class="subscribe-side-block__text font_weight--500 color_dark font_normal switcher-title">
										<span>{$lang->subscribe_to_newsletter}</span>
									</div>
									<div class="subscribe-side-block__button">
										<div class="btn btn-default btn-wide" data-event="jqm" data-param-type="subscribe" data-url="{$lang_link}blog?tpl=subscribe" data-name="subscribe">{$lang->subscribe}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>