{* Search *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->search scope=global}

	{* Canonical *}
	{$canonical="/search" scope=global}
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
								<link href="{$lang_link}search" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->search}</span>
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
							<h1 id="pagetitle" class="switcher-title"><span data-page="{$page->id}">{$page->name|escape}</span></h1>
						{else}
							<h1 id="pagetitle" class="switcher-title">{$lang->search}</h1>
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
				<div class="right_block narrow_N catalog_page search_page">
					<div class="search-page">
						{if isset($keyword)}
							{if $pages_search}
								<hr>
								{foreach $pages_search as $page}
									{if $page->url!="404"}
										{if $page->visible}
											<a href="{$lang_link}{$page->url}">{$page->name|escape}</a>
											<ul class="path">
												<li>
													<span class="muted">{$config->root_url}/{$lang_link}{$page->url}</span>
												</li>
											</ul>
											{if $page->body}
												<div class="text">
													{$page->body|strip_tags|truncate:250}
												</div>
											{/if}
											<hr>
										{/if}
									{/if}
								{/foreach}
							{else}
								<div class="main-wrapper flexbox flexbox--direction-row">
									<div class="section-content-wrapper flex-1">
										<div class="alert alert-info">{$lang->nothing_found}</div>
									</div>
								</div>
							{/if}
						{else}
							<div class="main-wrapper flexbox flexbox--direction-row">
								<div class="section-content-wrapper flex-1">
									<div class="alert alert-info">{$lang->search_text}</div>
								</div>
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>