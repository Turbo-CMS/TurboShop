{* List Products *}

{* Canonical *}
{if $page}
	{$canonical="/{$page->url}" scope=global}
{elseif $category && $brand}
	{$canonical="/catalog/{$category->url}/{$brand->url}" scope=global}
{elseif $category}
	{$canonical="/catalog/{$category->url}" scope=global}
{elseif $brand}
	{$canonical="/brands/{$brand->url}" scope=global}
{elseif $keyword}
	{$canonical="/all-products?keyword={$keyword|escape}" scope=global}
{else}
	{$canonical="/all-products" scope=global}
{/if}

{* Page Title *}
{if $keyword}
	<h1 class="my-3">{$lang->search|escape} {$keyword|escape}</h1>
{elseif $page}
	<h1 class="my-3"><span data-page="{$page->id}">{$page->name|escape}</span></h1>
{else}
	<h1 class="my-3">
		{if $category && $category->name_h1}
			<span data-category="{$category->id}">{$category->name_h1|escape}</span>
		{elseif $category && $category->name}
			<span data-category="{$category->id}">{$category->name|escape}</span>
		{/if}

		{if $brand && $brand->name_h1}
			<span data-brand="{$brand->id}">{$brand->name_h1|escape}</span>
		{elseif $brand && $brand->name}
			<span data-brand="{$brand->id}">{$brand->name|escape}</span>
		{/if}
	</h1>
{/if}

{* Catalog *}
{if $page && $page->url=='catalog'}
	{include file='catalog.tpl'}
{else}
	{* Products List *}
	{if $category && $category->brands || $features || $brand || $keyword || $page}
		<div class="sticky-sort bg-body pt-3 border-bottom">
			<div class="btn-toolbar justify-content-between mb-3" role="toolbar" aria-label="toolbarSort">
				<div class="d-none d-lg-flex align-items-center">
					{$lang->found|escape} {$products|count} {$products|count|plural:$lang->global_product_1:$lang->global_product_2:$lang->global_product_3}
					{if $is_filter || $current_minprice != $minprice || $current_maxprice != $maxprice}
						<a href="{$lang_link}catalog/{$category->url}" class="btn btn-sm btn-outline-reset rounded-pill ms-2"><span class="mt-n">{$lang->reset|escape}</span></a>
					{/if}
					{if isset($smarty.get.b) && $smarty.get.b}
						{foreach $category->brands as $b}
							{if $b->id|in_array:$smarty.get.b}
								<a href="{furl params=[brand=>$b->url, page=>null]}" class="btn btn-sm btn-outline-default rounded-pill d-flex align-items-center ms-2">
									<span class="ms-1 mt-n">{$b->name|escape}</span>
									<span class="btn btn-sm rounded-circle circle-close p-0 ms-2 d-flex align-items-center justify-content-center">
										<i class="far fa-xmark"></i>
									</span>
								</a>
							{/if}
						{/foreach}
					{/if}
					{if $features}
						{foreach $features as $key=>$f}
							{if $f->is_color}
								{if isset($smarty.get.{$f@key}) && $smarty.get.{$f@key}}
									{foreach $f->options as $k=>$o}
										{if in_array($o->translit,$smarty.get.{$f@key},true)}
											<a href="{furl params=[$f->url=>$o->translit, page=>null]}" style="background-color:{$o->value|escape}; width: 32px; height: 32px;" class="btn btn-sm rounded-circle ms-2 p-0 d-flex align-items-center justify-content-center {if $o->value == '#ffffff'}text-dark border{else}text-white{/if}"><i class="fa fa-xmark"></i></a>
										{/if}
									{/foreach}
								{/if}
							{else}
								{if isset($smarty.get.{$f@key}) && $smarty.get.{$f@key}}
									{foreach $f->options as $k=>$o}
										{if in_array($o->translit,$smarty.get.{$f@key},true)}
											<a href="{furl params=[$f->url=>$o->translit, page=>null]}" class="btn btn-sm btn-outline-default rounded-pill d-flex align-items-center ms-2">
												<span class="ms-1 mt-n">{$o->value|escape}</span>
												<span class="btn btn-sm rounded-circle circle-close p-0 ms-2 d-flex align-items-center justify-content-center">
													<i class="far fa-xmark"></i>
												</span>
											</a>
										{/if}
									{/foreach}
								{/if}
							{/if}
						{/foreach}
					{/if}

					{if $current_minprice != $minprice || $current_maxprice != $maxprice}
						<a href="{furl}" class="btn btn-sm btn-outline-default rounded-pill d-flex align-items-center ms-2">
							<span class="ms-1 mt-n">{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor} - {$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil} {$currency->sign|escape}</span>
							<span class="btn btn-sm rounded-circle circle-close p-0 ms-2 d-flex align-items-center justify-content-center">
								<i class="far fa-xmark"></i>
							</span>
						</a>
					{/if}
				</div>

				{if $category && $category->brands || $features}
					<div class="d-flex d-lg-none align-items-center">
						<button type="button" class="btn btn-sm btn-primary" data-bs-toggle="offcanvas" href="#mainFilterMobile" role="button" aria-controls="mainFilterMobile">
							<i class="fal fa-filter"></i>
							{$lang->global_filters|escape}
						</button>
					</div>
				{/if}

				{if $products}
					<div class="d-flex align-items-center ms-auto">
						<div class="me-2">
							{include file='products/sort.tpl'}
						</div>

						<div class="btn-group d-none d-md-flex" role="group" aria-label="viewButton">
							<button onclick="document.cookie='view=big;path=/';document.location.reload();" type="button" class="btn btn-sm btn-outline-primary {if !isset($smarty.cookies.view) || $smarty.cookies.view == 'big'}active{/if}">
								<i class="fa fa-grid-round"></i>
							</button>
							<button onclick="document.cookie='view=grid;path=/';document.location.reload();" type="button" class="btn btn-sm btn-outline-primary {if !isset($smarty.cookies.view) || $smarty.cookies.view == 'grid' || $smarty.cookies.view != 'big'}active{/if}">
								<i class="fa fa-grid-round-4"></i>
							</button>
						</div>
					</div>
				{/if}
			</div>
		</div>

		<div class="row position-relative gx-0">
			{if $category && $category->brands || $features}
				{* Filter *}
				{include file='sidebar/filter.tpl'}
			{/if}

			{* Products *}
			<div class="{if $category && $category->brands || $features}col-lg-9{else}col-lg-12{/if}">
				{if $products}
					<div class="row g-0 border-start infinite">
						{if isset($smarty.cookies.view) && $smarty.cookies.view == 'big'}
							{* Products Grid Big *}
							{foreach $products as $product}
								<div class="col-6 col-sm-6 col-md-6 col-lg-6 {if $category && $category->brands || $features}col-xl-6 col-xxl-4{else}col-xl-5 col-xxl-3{/if} infinite-item">
									{include file='products/grid_big.tpl'}
								</div>
							{/foreach}
						{else}
							{* Products Grid *}
							{foreach $products as $product}
								<div class="col-6 col-sm-6 col-md-4 col-lg-4 {if $category && $category->brands || $features}col-xl-4 col-xxl-3{else}col-xl-3 col-xxl-2{/if} infinite-item">
									{include file='products/grid.tpl'}
								</div>
							{/foreach}
						{/if}
					</div>
					{if $total_pages_num > 1}
						<div class="infinite-btn text-center my-3">
							<a class="icon-link text-decoration-none fs-5" href="javascript:void(0);">
								<i class="far fa-arrow-rotate-right me-1"></i>
								{$lang->show_more|escape}
							</a>
						</div>
						{include file='paginations/chpu_pagination.tpl'}
					{/if}
				{else}
					<div class="alert alert-primary mt-3" role="alert">
						{$lang->no_products_found|escape}
					</div>
				{/if}
			</div>
		</div>
	{else}
		<div class="alert alert-primary mt-3" role="alert">
			{$lang->no_products_found|escape}
		</div>
	{/if}
{/if}

{if $current_page_num == 1}
	<div class="row">
		<div class="col-md-12 mt-5">
			{if $page}
				{* Page Body *}
				{$page->body}
			{elseif !$is_filter && !isset($smarty.get.page) && !isset($smarty.get.sort)}
				{if $category && $category->description}
					{* Category Description *}
					{$category->description}
				{/if}

				{if $brand && $brand->description}
					{* Brand Description *}
					{$brand->description}
				{/if}
			{/if}
		</div>
	</div>
{/if}