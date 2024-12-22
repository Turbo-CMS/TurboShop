{* Page *}

{* Canonical *}
{$canonical="/{$page->url}" scope=global}

{if $page->url=="404"}
	{include file='404.tpl'}
{else}
	<!--title_content-->
	<div class="page-top-info">
		<div class="page-top-wrapper page-top-wrapper--white">
			<section class="page-top maxwidth-theme">
				<div class="cowl">
					{$level = 1}
					<div id="navigation">
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
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}{$page->url}" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$page->header|escape}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						</div>
					</div>
				</div>
				<!--h1_content-->
				<div class="topic">
					<div class="topic__inner">
						<div class="topic__heading">
							<h1 id="pagetitle" class="switcher-title"><span data-page="{$page->id}">{$page->name|escape}</span></h1>
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
						{* Page Body *}
						{if $page}
							{$page->body}
						{/if}
					</div>
					<div class="left_block">
						<div class="sticky-block sticky-block--show-Y">
							<aside class="sidebar">
								<ul class="nav nav-list side-menu">
									{foreach $pages as $p}
										{if $p->menu_id == $page->menu_id}
											{if $p->visible}
												<li class="{if $page && $page->id == $p->id}active{/if} {if $p->subpages}opened child{/if}">
													<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
														<a href="{$lang_link}{$p->url}" class="dark_link top-level-link rounded-x link-with-flag {if $page && $page->id == $p->id}link--active{/if}">
															<span data-page="{$p->id}">{$p->header|escape}</span>
														</a>
													</span>
													{if $p->subpages}
														<div class="submenu-wrapper">
															<ul class="submenu">
																{foreach $p->subpages as $p2}
																	<li class="{if $page && $page->id == $p2->id}active{/if} {if $p2->subpages}opened child{/if}">
																		<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
																			<a href="{$lang_link}{$p2->url}" class="dark_link sublink rounded-x {if $page && $page->id == $p2->id}link--active{/if}">
																				<span data-page="{$p2->id}">{$p2->header|escape}</span>
																			</a>
																		</span>
																		{if $p2->subpages}
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
{/if}