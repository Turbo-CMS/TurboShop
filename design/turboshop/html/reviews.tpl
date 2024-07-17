{* Reviews *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->reviews_global scope=global}

	{* Canonical *}
	{$canonical="/reviews" scope=global}
{/if}

<!--title_content-->
<div class="page-top-info">
	<div class="page-top-wrapper page-top-wrapper--white">
		<section class="page-top maxwidth-theme">
			<div class="cowl">
				{$level = 1}
				<div id="navigation">
					<div class="breadcrumbs swipeignore" itemscope="" itemtype="http://schema.org/BreadcrumbList">
						<div class="breadcrumbs__item" id="tb_breadcrumb_0" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
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
						{if isset($page)}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}{$page->url}" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$page->header|escape}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{else}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}reviews" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->reviews_global}</span>
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
						{* Page Title *}
						{if isset($page->name)}
							<h1 id="pagetitle" class="switcher-title">
								<span data-page="{$page->id}">{$page->name|escape}</span>
							</h1>
						{else}
							<h1 id="pagetitle" class="switcher-title">{$lang->reviews_global}</h1>
						{/if}
					</div>
				</div>
			</div>
			<!--/h1_content-->
		</section>
	</div>
</div>
<!--end-title_content-->

<div class="container  ">
	<div class="row">
		<div class="maxwidth-theme">
			<div class="col-md-12 col-sm-12 col-xs-12 content-md">
				<div class="right_block narrow_Y">
					<div class="reviews-info bordered rounded-x">
						<div class="reviews-info__top">
							<div class="reviews-info__line">
								<div class="reviews-info__col">
									<div class="rating-container">
										<div class="rating-wrapper flexbox flexbox--row">
											<div class="votes_block nstar with-text">
												<div class="item-rating rating__star-svg rating__star-svg--filled">
													<i class="svg inline" aria-hidden="true">
														<svg width="28" height="28">
															<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
														</svg>
													</i>
												</div>
											</div>
											<div class="rating-value font_24">
												<span class="count">
													{if $ratings|string_format:'%.1f'|floatval > 0}{$ratings|string_format:'%.1f'}{else}{$ratings|intval}{/if}
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="reviews-info__col">
									<div class="reviews-info__text">
										{* Page Body *}
										{if isset($page->body)}
											{$page->body}
										{/if}
									</div>
								</div>
								<div class="reviews-info__col">
									<div class="reviews-info__btn-wrapper order-info-btns">
										<div>
											<div class="btn btn-default btn-lg min_width--300 blog-comment-action__link" data-id="0">
												{$lang->add_review}
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="js-form-comment hidden" id="form_comment_" style="display:none;">
						<div id="form_c_del" style="display:none;">
							<div class="blog-comment__form">
								<form enctype="multipart/form-data" method="POST" name="form_comment" id="form_comment">
									<input type="hidden" id="parent" name="parent_id" value="0">
									<input type="hidden" id="admin" name="admin" value="{if isset($smarty.session.admin) && $smarty.session.admin == 'admin'}1{else}0{/if}">
									<div class="form popup blog-comment-fields outer-rounded-x bordered">
										<div class="form-header">
											<div class="blog-comment-field blog-comment-field-user">
												<div class="row form">
													<div class="col-md-6 col-sm-6">
														<div class="form-group ">
															<label for="user_name">{$lang->name}<span class="required-star">*</span></label>
															<div class="input">
																<input maxlength="255" size="30" class="form-control required" required="" tabindex="3" type="text" name="name" id="user_name" value="{if isset($comment_text)}{$comment_name|escape}{/if}">
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row form">
												<div class="col-md-12">
													<div class="form-group">
														<label class="rating_label" data-hide="">{$lang->your_rating} <span class="required-star">*</span></label>
														<div class="votes_block nstar big with-text" data-hide="">
															<div class="ratings">
																<div class="inner_rating rating__star-svg">
																	<div class="item-rating rating__star-svg" data-message="{$lang->very_bad}">
																		<i class="svg inline" aria-hidden="true">
																			<svg width="16" height="16">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																			</svg>
																		</i>
																	</div>
																	<div class="item-rating rating__star-svg" data-message="{$lang->bad}">
																		<i class="svg inline" aria-hidden="true">
																			<svg width="16" height="16">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																			</svg>
																		</i>
																	</div>
																	<div class="item-rating rating__star-svg" data-message="{$lang->normal}">
																		<i class="svg inline" aria-hidden="true">
																			<svg width="16" height="16">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																			</svg>
																		</i>
																	</div>
																	<div class="item-rating rating__star-svg" data-message="{$lang->fine}">
																		<i class="svg inline" aria-hidden="true">
																			<svg width="16" height="16">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																			</svg>
																		</i>
																	</div>
																	<div class="item-rating rating__star-svg" data-message="{$lang->great}">
																		<i class="svg inline" aria-hidden="true">
																			<svg width="16" height="16">
																				<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
																			</svg>
																		</i>
																	</div>
																</div>
															</div>
															<div class="rating_message muted" data-message="{$lang->no_rating}">{$lang->no_rating}</div>
															<input class="hidden" name="rating" value="0" required="" aria-required="true">
														</div>
													</div>
												</div>
											</div>
											<div class="row form comment">
												<div class="col-md-12">
													<div class="form-group">
														<label for="comment">{$lang->comment}</label>
														<div class="input">
															<textarea rows="3" class="form-control" tabindex="3" name="text" id="comment" value="">{if isset($comment_text)}{$comment_text}{/if}</textarea>
														</div>
													</div>
												</div>
											</div>
											{if $settings->captcha_review}
												<div class="clearfix fill-animate">
													<label class="font_14">
														<span>{$lang->captcha_label}&nbsp;<span class="required-star">*</span></span>
													</label>
												</div>
												<div class="row">
													<div class="form-group col-sm-6 pb-3">
														{get_captcha var="captcha_review"}
														<div class="secret-number">{$captcha_review[0]|escape} + ? = {$captcha_review[1]|escape}</div>
													</div>
													<div class="form-group col-sm-6">
														<div class="input">
															<input type="text" class="form-control required" name="captcha_code" value="" autocomplete="off" required>
														</div>
													</div>
												</div>
											{/if}
											<div class="blog-comment-buttons-wrapper font_15">
												<input tabindex="10" class="btn btn-default" value="{$lang->post_review}" type="submit" name="comment" id="post-button">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="review-list-inner review-list-inner--view-list">
						<div class="js_append review-list-inner__list grid-list grid-list--items-1">
							<div class="js-form-comment" id="form_comment_0" style="display: none;"></div>
							{if $comments}
								{foreach $comments as $comment}
									<div class="js-infinite review-list-inner__wrapper grid-list__item stroke-theme-parent-all colored_theme_hover_bg-block animate-arrow-hover grid-list-border-outer">
										<div class="review-list-inner__item  height-100 shadow-hovered shadow-no-border-hovered rounded-x bordered">
											<div class="review-list-inner__row">
												<div class="review-list-inner__top">
													<div class="review-list-inner__line review-list-inner__line--between">
														<div class="review-list-inner__line">
															<div class="review-list-inner__name-wrapper">
																<div class="review-list-inner__label">
																	<span class="review-list-inner__date-active font_14 color_999">{$comment->date|date} {$lang->at} {$comment->date|time}</span>
																</div>
																<div class="review-list-inner__name switcher-title">
																	{$comment->name|escape}
																</div>
															</div>
														</div>
														<div class="review-list-inner__rating-wrapper">
															<div class="rating eview-list-inner__rating">
																{strip}
																	{section name=rate start=0 loop=5 step=1}
																		{if $smarty.section.rate.index < $comment->rating}
																			{if ($smarty.section.rate.index + 1) > $comment->rating}
																				<div class="rating__star">
																					<i class="svg inline svg-inline- rating__star-svg rating__star-svg--filled" aria-hidden="true"><svg width="18" height="17" viewBox="0 0 18 17" fill="none" xmlns="http://www.w3.org/2000/svg">
																							<path d="M8.52447 0.562646C8.67415 0.101991 9.32585 0.101991 9.47553 0.562646L11.1329 5.66346C11.1998 5.86947 11.3918 6.00895 11.6084 6.00895H16.9717C17.4561 6.00895 17.6575 6.62876 17.2656 6.91346L12.9266 10.0659C12.7514 10.1933 12.678 10.4189 12.745 10.625L14.4023 15.7258C14.552 16.1864 14.0248 16.5695 13.6329 16.2848L9.29389 13.1323C9.11865 13.005 8.88135 13.005 8.70611 13.1323L4.3671 16.2848C3.97524 16.5695 3.448 16.1864 3.59768 15.7258L5.25503 10.625C5.32197 10.4189 5.24864 10.1933 5.07339 10.0659L0.734384 6.91346C0.342527 6.62876 0.543915 6.00895 1.02828 6.00895H6.39159C6.6082 6.00895 6.80018 5.86947 6.86712 5.66346L8.52447 0.562646Z" fill="#CCC"></path>
																						</svg>
																					</i>
																				</div>
																			{else}
																				<div class="rating__star">
																					<i class="svg inline svg-inline- rating__star-svg rating__star-svg--filled" aria-hidden="true"><svg width="18" height="17" viewBox="0 0 18 17" fill="none" xmlns="http://www.w3.org/2000/svg">
																							<path d="M8.52447 0.562646C8.67415 0.101991 9.32585 0.101991 9.47553 0.562646L11.1329 5.66346C11.1998 5.86947 11.3918 6.00895 11.6084 6.00895H16.9717C17.4561 6.00895 17.6575 6.62876 17.2656 6.91346L12.9266 10.0659C12.7514 10.1933 12.678 10.4189 12.745 10.625L14.4023 15.7258C14.552 16.1864 14.0248 16.5695 13.6329 16.2848L9.29389 13.1323C9.11865 13.005 8.88135 13.005 8.70611 13.1323L4.3671 16.2848C3.97524 16.5695 3.448 16.1864 3.59768 15.7258L5.25503 10.625C5.32197 10.4189 5.24864 10.1933 5.07339 10.0659L0.734384 6.91346C0.342527 6.62876 0.543915 6.00895 1.02828 6.00895H6.39159C6.6082 6.00895 6.80018 5.86947 6.86712 5.66346L8.52447 0.562646Z" fill="#CCC"></path>
																						</svg>
																					</i>
																				</div>
																			{/if}
																		{else}
																			<div class="rating__star">
																				<i class="svg inline svg-inline- rating__star-svg" aria-hidden="true"><svg width="18" height="17" viewBox="0 0 18 17" fill="none" xmlns="http://www.w3.org/2000/svg">
																						<path d="M8.52447 0.562646C8.67415 0.101991 9.32585 0.101991 9.47553 0.562646L11.1329 5.66346C11.1998 5.86947 11.3918 6.00895 11.6084 6.00895H16.9717C17.4561 6.00895 17.6575 6.62876 17.2656 6.91346L12.9266 10.0659C12.7514 10.1933 12.678 10.4189 12.745 10.625L14.4023 15.7258C14.552 16.1864 14.0248 16.5695 13.6329 16.2848L9.29389 13.1323C9.11865 13.005 8.88135 13.005 8.70611 13.1323L4.3671 16.2848C3.97524 16.5695 3.448 16.1864 3.59768 15.7258L5.25503 10.625C5.32197 10.4189 5.24864 10.1933 5.07339 10.0659L0.734384 6.91346C0.342527 6.62876 0.543915 6.00895 1.02828 6.00895H6.39159C6.6082 6.00895 6.80018 5.86947 6.86712 5.66346L8.52447 0.562646Z" fill="#CCC"></path>
																					</svg>
																				</i>
																			</div>
																		{/if}
																	{/section}
																{/strip}
															</div>
														</div>
													</div>
												</div>
												<div class="review-list-inner__middle">
													<div class="review-list-inner__text">
														<p>{$comment->text|escape|nl2br}</p>
													</div>
												</div>
											</div>
											{if isset($children[$comment->id])}
												{foreach $children[$comment->id] as $child}
													<div class="review-list-inner__row review-list-inner__row--answer">
														<div class="review-list-inner__line review-list-inner__line--answer">
															<div class="review-list-inner__answer">
																<div class="review-list-inner__label-answer color_999 font_13">{$child->name|escape}</div>
																<div class="review-list-inner__text font_15">{$child->text|escape|nl2br}</div>
															</div>
														</div>
													</div>
												{/foreach}
											{/if}
										</div>
									</div>
								{/foreach}
							{else}
								<div class="rounded-x bordered alert-empty">
									{$lang->no_comments}
								</div>
							{/if}
						</div>
						{if $total_pages_num > 1}
							<div class="wrap_nav bottom_nav_wrapper">
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
							</div>
						{/if}
					</div>
				</div>
				<div class="left_block">
					<div class="sticky-block sticky-block--show-Y">
						<aside class="sidebar">
							<ul class="nav nav-list side-menu">
								{foreach $pages as $p}
									{if $p->menu_id == $page->menu_id}
										{if $p->visible}
											<li class="{if $page && $page->id == $p->id}active{/if} {if isset($p->subpages)}opened child{/if}">
												<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
													<a href="{$lang_link}{$p->url}" class="dark_link top-level-link rounded-x link-with-flag {if $page && $page->id == $p->id}link--active{/if}">
														<span data-page="{$p->id}">{$p->header|escape}</span>
													</a>
												</span>
												{if isset($p->subpages)}
													<div class="submenu-wrapper">
														<ul class="submenu">
															{foreach $p->subpages as $p2}
																<li class="{if $page && $page->id == $p2->id}active{/if} {if isset($p2->subpages)}opened child{/if}">
																	<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
																		<a href="{$lang_link}{$p2->url}" class="dark_link sublink rounded-x {if $page && $page->id == $p2->id}link--active{/if}">
																			<span data-page="{$p2->id}">{$p2->header|escape}</span>
																		</a>
																	</span>
																	{if isset($p2->subpages)}
																		<div class="submenu-wrapper">
																			<ul class="submenu">
																				{foreach $p2->subpages as $p3}
																					<li class="{if $page && $page->id == $p3->id}active{/if}">
																						<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
																							<a href="{$lang_link}{$p3->url}" class="dark_link sublink rounded-x {if $page && $page->id == $p3->id}link--active{/if}">
																								<span data-page="{$p3->id}">{$p3->header|escape}</span>
																							</a>
																						</span>
																					</li>
																				{/foreach}
																			</ul>
																		</div>
																	{/if}
																</li>
															{/foreach}
														</ul>
													</div>
												{/if}
											</li>
										{/if}
									{/if}
								{/foreach}
							</ul>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>