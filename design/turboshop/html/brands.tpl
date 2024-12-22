{* Brands *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->global_brands scope=global}

	{* Canonical *}
	{$canonical="/brands" scope=global}
{/if}

<!--title_content-->
<div class="page-top-info">
	<div class="page-top-wrapper page-top-wrapper--white">
		<section class="page-top maxwidth-theme">
			<div class="cowl">
				<div id="navigation">
					{$level = 1}
					<div class="breadcrumbs swipeignore" itemscope="" itemtype="http://schema.org/BreadcrumbList">
						<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a class="breadcrumbs__link" href="{if $lang_link}{$lang_link}{else}/{/if}" title="{$lang->home|escape}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->home|escape}</span>
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
						{if $page}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}{$page->url}" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$page->header|escape}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{else}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}brands" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->global_brands|escape}</span>
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
						<h1 id="pagetitle" class="switcher-title">
							{if $page}
								<span data-page="{$page->id}">{$page->name|escape}</span>
							{else}
								{$lang->global_brands|escape}
							{/if}
						</h1>
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
				<div class="right_block narrow_N">
					{* Page Body *}
					{if $page && $page->body}
						<div class="text_before_items">
							{$page->body}
						</div>
					{/if}
					{if $theme_settings->brands_type == '1'}
						{if $brands}
							<div class="brand-list-inner brand-list-inner--view-only-logo">
								<div class="js_append brand-list-inner__list grid-list grid-list--items-{$theme_settings->brands_grid_column}">
									{foreach $brands as $b}
										<div class="js-infinite brand-list-inner__wrapper grid-list__item stroke-theme-parent-all colored_theme_hover_bg-block animate-arrow-hover grid-list-border-outer">
											<div class="brand-list-inner__item height-100 shadow-hovered shadow-no-border-hovered outer-rounded-x">
												<div class="brand-list-inner__image-wrapper rounded-x">
													<a class="brand-list-inner__image" title="{$b->name}" href="{$lang_link}brands/{$b->url}">
														{if $b->image}
															<span class="brand-list-inner__image-bg lazyload" style="background-image: url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==);" data-bg="{$b->image|resize_brands:150:50}"></span>
														{else}
															<span class="brand-list-inner__image-bg lazyload" style="width: 120px; height: 50px;" style="background-image: url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==);" data-bg="design/{$settings->theme|escape}/images/no-photo.svg"></span>
														{/if}
													</a>
												</div>
												<div class="brand-list-inner__content-wrapper">
													<div class="brand-list-inner__top">
														<a class="brand-list-inner__name dark_link color-theme-target" title="{$b->name}" href="{$lang_link}brands/{$b->url}" data-brand="{$b->id}">
															{$b->name}
														</a>
													</div>
												</div>
											</div>
										</div>
									{/foreach}
								</div>
								{if $total_pages_num > 1}
									<div class="wrap_nav bottom_nav_wrapper">
										<div class="bottom_nav_wrapper nav-compact">
											<div class="bottom_nav">
												{if $current_page_num < $total_pages_num}
													<div class="ajax_load_btn">
														<span class="more_text_ajax btn btn-transparent">
															{$lang->load_more|escape}
														</span>
													</div>
												{/if}
												{* Paginations *}
												{include file='paginations/pagination.tpl'}
											</div>
										</div>
									</div>
								{/if}
							</div>
						{else}
							<div class="col-md-12">
								<div class="alert alert-info">
									{$lang->no_brands_found|escape}
								</div>
							</div>
						{/if}
					{/if}
					{if $theme_settings->brands_type == '2'}
						{get_brands var=all_brands}
						{if $all_brands}
							<div class="brands-list brands-list--narrow">
								<div class="brands-list__items-wrapper grid-list--fill-bg1 grid-list grid-list--items-{$theme_settings->brands_grid_column}-1400 grid-list--items-5-1200 grid-list--items-3-768 grid-list--items-2-601 mobile-scrolled mobile-scrolled--items-3 mobile-offset">
									{foreach $all_brands as $b}
										<div class="grid-list__item">
											<div class="brands-list__item rounded-x shadow-hovered shadow-no-border-hovered bordered brands-list__item--bg-white">
												<a class="brands-list__item-link item-link-absolute" data-brand="{$b->id}" href="{$lang_link}brands/{$b->url}"></a>
												<div class="brands-list__image-wrapper">
													{if $b->image}
														<img class="brands-list__image lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$b->image|resize_brands:100:40}" alt="{$b->name|escape}" title="{$b->name|escape}">
													{else}
														<img class="brands-list__image lazyload" style="width: 100px; height: 100px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$b->name|escape}" title="{$b->name|escape}">
													{/if}
												</div>
											</div>
										</div>
									{/foreach}
								</div>
							</div>
							<div class="filter-letters">
								<div class="line-block line-block--flex-wrap line-block--column line-block--align-normal line-block--gap line-block--gap-8 mobile-offset mobile-scrolled">
									<div class="line-block line-block--flex-wrap line-block--gap line-block--gap-8 font_14 font_short">
										<div class="line-block__item">
											<div class="chip filter-link bg-theme-active color-theme-hover-no-active active" data-letter="all">
												<div class="chip__label">
													{$lang->all|escape}
												</div>
											</div>
										</div>
										{foreach name=brands item=b from=$all_brands}
											{assign var=firstletter value=$b->name|upper|mb_substr:0:1}
											{if $firstletter != $letter}
												{assign var=letter value=$firstletter}
												<div class="line-block__item">
													<div class="chip filter-link bg-theme-active color-theme-hover-no-active" data-letter="{$letter}">
														<div class="chip__label">
															{$letter}
														</div>
													</div>
												</div>
											{/if}
										{/foreach}
									</div>
								</div>
							</div>
							<div id="js-observer-block" class="js-brands loading_block_content">
								<div class="brands-group-wrapper">
									{foreach $all_brands as $brand}
										{assign var=first_letter value=$brand->name|upper|mb_substr:0:1}
										{if !isset($grouped_brands[$first_letter])}
											{$grouped_brands[$first_letter] = []}
										{/if}
										{$grouped_brands[$first_letter][] = $brand}
									{/foreach}

									{foreach $grouped_brands as $letter => $brands}
										<div class="brand__wrapper bordered">
											<div class="brand__item">
												<div class="line-block line-block--flex-wrap line-block--align-normal line-block--gap line-block--gap-8">
													<div class="line-block__item brand__item-letter">
														{$letter}
													</div>
													<div class="line-block__item flex-1">
														<div class="brand__list">
															{foreach $brands as $b}
																<div class="brand__list-item">
																	<a href="{$lang_link}brands/{$b->url}" class="dark_link" data-brand="{$b->id}">{$b->name}</a>
																</div>
															{/foreach}
														</div>
													</div>
												</div>
											</div>
										</div>
									{/foreach}
								</div>
							</div>
							<script>
								$(document).ready(function() {
									$('.filter-link').click(function() {
										var letter = $(this).data('letter').toString();

										$('.brand__wrapper').each(function() {
											var firstLetter = $(this).find('.line-block__item.brand__item-letter').text().trim().toUpperCase();
											if (letter === 'all' || firstLetter === letter.toUpperCase()) {
												$(this).show();
											} else {
												$(this).hide();
											}
										});

										$('.filter-link').removeClass('active');
										$(this).addClass('active');
									});
								});
							</script>
						{else}
							<div class="col-md-12">
								<div class="alert alert-info">
									{$lang->no_brands_found|escape}
								</div>
							</div>
						{/if}
					{/if}
				</div>
			</div>
		</div>
	</div>
</div>