{* Sitemap *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->sitemap scope=global}

	{* Canonical *}
	{$canonical="/sitemap" scope=global}
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
								<link href="{$lang_link}sitemap" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->sitemap|escape}</span>
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
						{if $page}
							<h1 id="pagetitle" class="switcher-title"><span data-page="{$page->id}">{$page->name|escape}</span></h1>
						{else}
							<h1 id="pagetitle" class="switcher-title">{$lang->sitemap|escape}</h1>
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
		<div class="maxwidth-theme wide-">
			<div class="col-md-12 col-sm-12 col-xs-12 content-md">
				<div class="right_block narrow_N ">
					<div class="site_map_wrapper">
						<table class="map-columns main">
							<tbody>
								<tr class="row wrap-map">
									<td class="col-md-6 col-sm-4 col-xs-6 mobile-column">
										<ul class="map-level-0">
											<li class="item item-level-0">
												<div class="map-columns__link-wrapper">
													<a class="dark_link title-block font_18" href="{$lang_link}shop">{$lang->online_store|escape}</a>
												</div>
												<ul class="map-columns__dropdown map-level-1">
													{foreach $pages as $p1}
														{if $p1->menu_id == $theme_settings->id_menu_sitemap_1}
															{if $p1->visible}
																<li class="item item-level-1">
																	<div class="map-columns__link-wrapper">
																		<a class="dark_link" href="{$lang_link}{$p1->url}">{$p1->header}</a>
																		{if $p1->subpages}
																			<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																				<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																					<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																				</svg>
																			</i>
																		{/if}
																	</div>
																	{if $p1->subpages}
																		<ul class="map-columns__dropdown map-level-2 hidden-block">
																			{foreach $p1->subpages as $p1_2}
																				{if $p1_2->visible}
																					<li class="item item-level-2">
																						<div class="map-columns__link-wrapper">
																							<a class="dark_link" href="{$lang_link}{$p1_2->url}">{$p1_2->header}</a>
																							{if $p1_2->subpages}
																								<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																									<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																										<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																									</svg>
																								</i>
																							{/if}
																						</div>
																						{if $p1_2->subpages}
																							<ul class="map-columns__dropdown map-level-3 hidden-block">
																								{foreach $p1_2->subpages as $p1_3}
																									{if $p1_3->visible}
																										<li class="item item-level-3">
																											<div class="map-columns__link-wrapper">
																												<a class="dark_link" href="{$lang_link}{$p1_3->url}">{$p1_3->header}</a>
																											</div>
																										</li>
																									{/if}
																								{/foreach}
																							</ul>
																						{/if}
																					</li>
																				{/if}
																			{/foreach}
																		</ul>
																	{/if}
																</li>
															{/if}
														{/if}
													{/foreach}
												</ul>
											</li>
											<li class="item item-level-0">
												<div class="map-columns__link-wrapper">
													<a class="dark_link title-block font_18" href="{$lang_link}catalog">{$lang->catalog|escape}</a>
												</div>
												<ul class="map-columns__dropdown map-level-1">
													{foreach $pages as $p2}
														{if $p2->menu_id == $theme_settings->id_menu_sitemap_2}
															{if $p2->visible}
																<li class="item item-level-1">
																	<div class="map-columns__link-wrapper">
																		<a class="dark_link" href="{$lang_link}{$p2->url}">{$p2->header}</a>
																		{if $p2->subpages}
																			<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																				<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																					<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																				</svg>
																			</i>
																		{/if}
																	</div>
																	{if $p2->subpages}
																		<ul class="map-columns__dropdown map-level-2 hidden-block">
																			{foreach $p2->subpages as $p2_2}
																				{if $p2_2->visible}
																					<li class="item item-level-2">
																						<div class="map-columns__link-wrapper">
																							<a class="dark_link" href="{$lang_link}{$p2_2->url}">{$p2_2->header}</a>
																							{if $p2_2->subpages}
																								<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																									<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																										<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																									</svg>
																								</i>
																							{/if}
																						</div>
																						{if $p2_2->subpages}
																							<ul class="map-columns__dropdown map-level-3 hidden-block">
																								{foreach $p2_2->subpages as $p2_3}
																									{if $p2_3->visible}
																										<li class="item item-level-3">
																											<div class="map-columns__link-wrapper">
																												<a class="dark_link" href="{$lang_link}{$p2_3->url}">{$p2_3->header}</a>
																											</div>
																										</li>
																									{/if}
																								{/foreach}
																							</ul>
																						{/if}
																					</li>
																				{/if}
																			{/foreach}
																		</ul>
																	{/if}
																</li>
															{/if}
														{/if}
													{/foreach}
												</ul>
											</li>
											<li class="item item-level-0">
												<div class="map-columns__link-wrapper">
													<a class="dark_link title-block font_18" href="{$lang_link}info">{$lang->information|escape}</a>
												</div>
												<ul class="map-columns__dropdown map-level-1">
													{foreach $pages as $p3}
														{if $p3->menu_id == $theme_settings->id_menu_sitemap_3}
															{if $p3->visible}
																<li class="item item-level-1">
																	<div class="map-columns__link-wrapper">
																		<a class="dark_link" href="{$lang_link}{$p3->url}">{$p3->header}</a>
																		{if $p3->subpages}
																			<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																				<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																					<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																				</svg>
																			</i>
																		{/if}
																	</div>
																	{if $p3->subpages}
																		<ul class="map-columns__dropdown map-level-2 hidden-block">
																			{foreach $p3->subpages as $p3_2}
																				{if $p3_2->visible}
																					<li class="item item-level-2">
																						<div class="map-columns__link-wrapper">
																							<a class="dark_link" href="{$lang_link}{$p3_2->url}">{$p3_2->header}</a>
																							{if $p3_2->subpages}
																								<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																									<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																										<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																									</svg>
																								</i>
																							{/if}
																						</div>
																						{if $p3_2->subpages}
																							<ul class="map-columns__dropdown map-level-3 hidden-block">
																								{foreach $p3_2->subpages as $p3_3}
																									{if $p3_3->visible}
																										<li class="item item-level-3">
																											<div class="map-columns__link-wrapper">
																												<a class="dark_link" href="{$lang_link}{$p3_3->url}">{$p3_3->header}</a>
																											</div>
																										</li>
																									{/if}
																								{/foreach}
																							</ul>
																						{/if}
																					</li>
																				{/if}
																			{/foreach}
																		</ul>
																	{/if}
																</li>
															{/if}
														{/if}
													{/foreach}
												</ul>
											</li>
											<li class="item item-level-0">
												<div class="map-columns__link-wrapper">
													<a class="dark_link title-block font_18" href="{$lang_link}help">{$lang->help|escape}</a>
												</div>
												<ul class="map-columns__dropdown map-level-1">
													{foreach $pages as $p4}
														{if $p4->menu_id == $theme_settings->id_menu_sitemap_4}
															{if $p4->visible}
																<li class="item item-level-1">
																	<div class="map-columns__link-wrapper">
																		<a class="dark_link" href="{$lang_link}{$p4->url}">{$p4->header}</a>
																		{if $p4->subpages}
																			<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																				<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																					<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																				</svg>
																			</i>
																		{/if}
																	</div>
																	{if $p4->subpages}
																		<ul class="map-columns__dropdown map-level-2 hidden-block">
																			{foreach $p4->subpages as $p4_2}
																				{if $p4_2->visible}
																					<li class="item item-level-2">
																						<div class="map-columns__link-wrapper">
																							<a class="dark_link" href="{$lang_link}{$p4_2->url}">{$p4_2->header}</a>
																							{if $p4_2->subpages}
																								<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																									<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																										<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																									</svg>
																								</i>
																							{/if}
																						</div>
																						{if $p4_2->subpages}
																							<ul class="map-columns__dropdown map-level-3 hidden-block">
																								{foreach $p4_2->subpages as $p4_3}
																									{if $p4_3->visible}
																										<li class="item item-level-3">
																											<div class="map-columns__link-wrapper">
																												<a class="dark_link" href="{$lang_link}{$p4_3->url}">{$p4_3->header}</a>
																											</div>
																										</li>
																									{/if}
																								{/foreach}
																							</ul>
																						{/if}
																					</li>
																				{/if}
																			{/foreach}
																		</ul>
																	{/if}
																</li>
															{/if}
														{/if}
													{/foreach}
												</ul>
											</li>
											{* Blog *}
											{if $posts}
												<li class="item item-level-0">
													<div class="map-columns__link-wrapper">
														<a class="dark_link title-block font_18" href="{$lang_link}blog">{$lang->global_blog|escape}</a>
													</div>
													<ul class="map-columns__dropdown map-level-1">
														<li class="item item-level-1">
															<div class="map-columns__link-wrapper">
																<a class="dark_link" href="{$lang_link}blog">{$lang->news|escape}</a>
																<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																	<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																		<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																	</svg>
																</i>
															</div>
															<ul class="map-columns__dropdown map-level-2 hidden-block">
																{foreach $posts as $p}
																	{if $p->visible}
																		<li class="item item-level-2">
																			<div class="map-columns__link-wrapper">
																				<a class="dark_link font_14" href="{$lang_link}blog/{$p->url}">{$p->name}</a>
																			</div>
																		</li>
																	{/if}
																{/foreach}
															</ul>
														</li>
													</ul>
												</li>
											{/if}
										</ul>
									</td>
									<td class="col-md-6 col-sm-4 col-xs-6 mobile-column">
										<ul class="map-level-0">
											{* Articles *}
											{if $articles_cats}
												<li class="item item-level-0">
													<div class="map-columns__link-wrapper">
														<a class="dark_link title-block font_18" href="{$lang_link}articles">{$lang->global_articles|escape}</a>
													</div>
													<ul class="map-columns__dropdown map-level-1">
														{foreach $articles_cats as $cat}
															{if $cat->visible}
																<li class="item item-level-1">
																	<div class="map-columns__link-wrapper">
																		<a class="dark_link" href="{$lang_link}articles/{$cat->url}">{$cat->name}</a>
																		{if $cat->subcategories || $cat->articles}
																			<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																				<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																					<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																				</svg>
																			</i>
																		{/if}
																	</div>
																	{if $cat->subcategories || $cat->articles}
																		<ul class="map-columns__dropdown map-level-2 hidden-block">
																			{foreach $cat->subcategories as $subcat}
																				{if $subcat->visible}
																					<li class="item item-level-2">
																						<div class="map-columns__link-wrapper">
																							<a class="dark_link" href="{$lang_link}articles/{$subcat->url}">{$subcat->name}</a>
																							{if $subcat->subcategories || $subcat->articles}
																								<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																									<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																										<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																									</svg>
																								</i>
																							{/if}
																						</div>
																						{if $subcat->subcategories || $subcat->articles}
																							<ul class="map-columns__dropdown map-level-3 hidden-block">
																								{foreach $subcat->subcategories as $subcat3}
																									{if $subcat3->visible}
																										<li class="item item-level-3">
																											<div class="map-columns__link-wrapper">
																												<a class="dark_link" href="{$lang_link}articles/{$subcat3->url}">{$subcat3->name}</a>
																												{if $subcat3->articles}
																													<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																														<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																															<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																														</svg>
																													</i>
																												{/if}
																											</div>
																											{if $subcat3->articles}
																												<ul class="map-columns__dropdown map-level-3 hidden-block">
																													{if $subcat3->articles}
																														{foreach $subcat3->articles as $article}
																															{if $article->visible}
																																<li class="item item-level-3">
																																	<div class="map-columns__link-wrapper">
																																		<a class="dark_link font_14" href="{$lang_link}article/{$article->url}">{$article->name}</a>
																																	</div>
																																</li>
																															{/if}
																														{/foreach}
																													{/if}
																												</ul>
																											{/if}
																										</li>
																									{/if}
																								{/foreach}
																								{if $subcat->articles}
																									{foreach $subcat->articles as $article}
																										{if $article->visible}
																											<li class="item item-level-3">
																												<div class="map-columns__link-wrapper">
																													<a class="dark_link font_14" href="{$lang_link}article/{$article->url}">{$article->name}</a>
																												</div>
																											</li>
																										{/if}
																									{/foreach}
																								{/if}
																							</ul>
																						{/if}
																					</li>
																				{/if}
																			{/foreach}
																			{if $cat->articles}
																				{foreach $cat->articles as $article}
																					{if $article->visible}
																						<li class="item item-level-2">
																							<div class="map-columns__link-wrapper">
																								<a class="dark_link font_14" href="{$lang_link}article/{$article->url}">{$article->name}</a>
																							</div>
																						</li>
																					{/if}
																				{/foreach}
																			{/if}
																		</ul>
																	{/if}
																</li>
															{/if}
														{/foreach}
													</ul>
												</li>
											{/if}
											{* Products *}
											{if $cats}
												<li class="item item-level-0">
													<div class="map-columns__link-wrapper">
														<a class="dark_link title-block font_18" href="{$lang_link}all-products">{$lang->global_products|escape}</a>
													</div>
													<ul class="map-columns__dropdown map-level-1">
														{foreach $cats as $cat}
															{if $cat->visible}
																<li class="item item-level-1">
																	<div class="map-columns__link-wrapper">
																		<a class="dark_link" href="{$lang_link}catalog/{$cat->url}">{$cat->name}</a>
																		{if $cat->subcategories || $cat->products}
																			<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																				<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																					<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																				</svg>
																			</i>
																		{/if}
																	</div>
																	{if $cat->subcategories || $cat->products}
																		<ul class="map-columns__dropdown map-level-2 hidden-block">
																			{foreach $cat->subcategories as $subcat}
																				{if $subcat->visible}
																					<li class="item item-level-2">
																						<div class="map-columns__link-wrapper">
																							<a class="dark_link" href="{$lang_link}catalog/{$subcat->url}">{$subcat->name}</a>
																							{if $subcat->subcategories || $subcat->products}
																								<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																									<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																										<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																									</svg>
																								</i>
																							{/if}
																						</div>
																						{if $subcat->subcategories || $subcat->products}
																							<ul class="map-columns__dropdown map-level-3 hidden-block">
																								{foreach $subcat->subcategories as $subcat3}
																									{if $subcat3->visible}
																										<li class="item item-level-3">
																											<div class="map-columns__link-wrapper">
																												<a class="dark_link" href="{$lang_link}catalog/{$subcat3->url}">{$subcat3->name}</a>
																												{if $subcat3->products}
																													<i class="svg inline svg-inline- map-columns__dropdown-right-arrow bg-theme-hover fill-dark-light-block" aria-hidden="true">
																														<svg width="3" height="5" viewBox="0 0 3 5" fill="none" xmlns="http://www.w3.org/2000/svg">
																															<path d="M3 2.5L0 5L0 0L3 2.5Z" fill="#333333"></path>
																														</svg>
																													</i>
																												{/if}
																											</div>
																											{if $subcat3->products}
																												<ul class="map-columns__dropdown map-level-3 hidden-block">
																													{if $subcat3->products}
																														{foreach $subcat3->products as $product}
																															{if $product->visible}
																																<li class="item item-level-3">
																																	<div class="map-columns__link-wrapper">
																																		<a class="dark_link font_14" href="{$lang_link}products/{$product->url}">{$product->name}</a>
																																	</div>
																																</li>
																															{/if}
																														{/foreach}
																													{/if}
																												</ul>
																											{/if}
																										</li>
																									{/if}
																								{/foreach}
																								{if $subcat->products}
																									{foreach $subcat->products as $product}
																										{if $product->visible}
																											<li class="item item-level-3">
																												<div class="map-columns__link-wrapper">
																													<a class="dark_link font_14" href="{$lang_link}products/{$product->url}">{$product->name}</a>
																												</div>
																											</li>
																										{/if}
																									{/foreach}
																								{/if}
																							</ul>
																						{/if}
																					</li>
																				{/if}
																			{/foreach}
																			{if $cat->products}
																				{foreach $cat->products as $product}
																					{if $product->visible}
																						<li class="item item-level-2">
																							<div class="map-columns__link-wrapper">
																								<a class="dark_link font_14" href="{$lang_link}products/{$product->url}">{$product->name}</a>
																							</div>
																						</li>
																					{/if}
																				{/foreach}
																			{/if}
																		</ul>
																	{/if}
																</li>
															{/if}
														{/foreach}
													</ul>
												</li>
											{/if}
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>