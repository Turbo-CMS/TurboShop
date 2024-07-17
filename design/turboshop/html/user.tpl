{* User *}

{* Meta Title *}
{$meta_title = $lang->personal_area scope=global}

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
						<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<link href="{$lang_link}user" itemprop="item">
							<span>
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->personal_area}</span>
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
						<h1 id="pagetitle" class="switcher-title">{$lang->personal_area}</h1>
					</div>
				</div>
			</div>
			<!--/h1_content-->
		</section>
	</div>
</div>
<!--end-title_content-->

<div class="container cabinte-page">
	<div class="row">
		<div class="maxwidth-theme">
			<div class="col-md-12 col-sm-12 col-xs-12 content-md">
				<div class="right_block narrow_Y">
					<div class="personal__wrapper">
						{if isset($smarty.cookies.user) && $smarty.cookies.user == 'private'}
							{include file='user/private.tpl'}
						{elseif isset($smarty.cookies.user) && $smarty.cookies.user == 'orders'}
							{include file='user/user_orders.tpl'}
						{else}
							{include file='user/personal.tpl'}
						{/if}
					</div>
				</div>
				<div class="left_block">
					<div class="sticky-block sticky-block--show-Y">
						<aside class="sidebar">
							<ul class="nav nav-list side-menu">
								<li {if !isset($smarty.cookies.user) || isset($smarty.cookies.user) && $smarty.cookies.user == 'personal'}class="active opened"{/if}>
									<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
										<a href="{$lang_link}user" onclick="document.cookie='user=personal;path=/';document.location.reload();" class="dark_link top-level-link rounded-x link--active link-with-flag">{$lang->my_account}</a>
									</span>
								</li>
								<li {if isset($smarty.cookies.user) && $smarty.cookies.user == 'private'}class="active opened"{/if}>
									<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
										<a href="javascript:void(0)" onclick="document.cookie='user=private;path=/';document.location.reload();" class="dark_link top-level-link rounded-x link--active link-with-flag">{$lang->personal_data}</a>
									</span>
								</li>
								<li {if isset($smarty.cookies.user) && $smarty.cookies.user == 'orders'}class="active opened"{/if}>
									<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
										<a href="javascript:void(0)" onclick="document.cookie='user=orders;path=/';document.location.reload();" class="dark_link top-level-link rounded-x link--active link-with-flag">{$lang->orders_global}</a>
									</span>
								</li>
								<li>
									<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
										<a href="{$lang_link}wishlist" onclick="document.cookie='user=;path=/';document.location.reload();" class="dark_link top-level-link rounded-x link-with-flag">{$lang->wishlist_products}</a>
									</span>
								</li>
								<li>
									<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
										<a href="{$lang_link}faq" onclick="document.cookie='user=;path=/';document.location.reload();" class="dark_link top-level-link rounded-x link-with-flag">{$lang->help}</a>
									</span>
								</li>
								<li>
									<span class="bg-opacity-theme-parent-hover link-wrapper font_short fill-theme-parent-all fill-dark-light">
										<a href="{$lang_link}user/logout" class="dark_link top-level-link rounded-x link-with-flag">{$lang->logout}</a>
									</span>
								</li>
							</ul>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>