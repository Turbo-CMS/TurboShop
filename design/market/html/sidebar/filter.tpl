<div class="col-lg-3 d-none d-lg-block">
	<div class="sticky-filter">
		<div style="max-height: 50rem;" data-simplebar data-simplebar-auto-hide="false">
			<div class="accordion filter" id="filterAccordion">
				{* Filter Brands *}
				{if !$brand}
					{if $category->brands}
						<div class="widget-filter accordion-item border-0 border-bottom">
							<h2 class="accordion-header" id="headingBrands">
								<button class="accordion-button d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapseBrands" aria-expanded="true" aria-controls="collapseBrands">
									{$lang->global_brands|escape}
								</button>
							</h2>
							<div id="collapseBrands" class="accordion-collapse collapse show" aria-labelledby="headingBrands">
								<div class="widget-filter-list accordion-body">
									{if $category->brands|count > 7}
										<input type="text" class="widget-filter-search form-control form-control-sm mb-3" placeholder="{$lang->global_search|escape}">
									{/if}
									<div style="max-height: 10rem;" data-simplebar data-simplebar-auto-hide="false">
										{foreach $category->brands as $b}
											<label role="button" class="widget-filter-item form-check">
												<input role="button" type="checkbox" class="form-check-input" onclick="location.href = '{furl params=[brand=>$b->url, page=>null]}'" value="" {if isset($smarty.get.b) && in_array($b->id, $smarty.get.b)}checked{/if}>
												<span class="widget-filter-item-text form-check-label">
													{$b->name|escape}
												</span>
											</label>
										{/foreach}
									</div>
								</div>
							</div>
						</div>
					{/if}
				{/if}

				{* Filter Price *}
				{if ($minprice != 0 && $maxprice != 0) && ($minprice != $maxprice)}
					<div class="accordion-item border-0 border-bottom">
						<h2 class="accordion-header" id="headingPrice">
							<button class="accordion-button d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePrice" aria-expanded="true" aria-controls="collapsePrice">
								{$lang->global_price|escape}
							</button>
						</h2>
						<div id="collapsePrice" class="accordion-collapse collapse show" aria-labelledby="headingPrice">
							<div class="accordion-body">
								<div class="range-slider" data-start-min="{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" data-start-max="{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" data-min="{$minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" data-max="{$maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" data-step="1">
									<form method="post">
										<input type="hidden" name="rate_from" id="rate_from" value="{$currency->rate_from}">
										<input type="hidden" name="rate_to" id="rate_to" value="{$currency->rate_to}">
										<div class="d-flex">
											<div class="w-50 pe-2 me-2">
												<input class="form-control form-control-sm range-slider-value-min" type="text" name="min_price">
											</div>
											<div class="w-50 ps-2 me-2 pe-2">
												<input class="form-control form-control-sm range-slider-value-max" type="text" name="max_price">
											</div>
											<button type="submit" class="btn btn-sm btn-gray ms-auto">OK</button>
										</div>
									</form>
									<div class="range-slider-ui my-4"></div>
								</div>
							</div>
						</div>
					</div>
				{/if}

				{* Filter Features *}
				{if $features}
					{foreach $features as $f}
						{if $f->is_color}
							<div class="color-filter accordion-item border-0 border-bottom rounded-bottom-0">
								<h2 class="accordion-header" id="heading{$f->id}">
									<button class="accordion-button d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{$f->id}" aria-expanded="true" aria-controls="collapse{$f->id}">
										{$f->name|escape}
									</button>
								</h2>
								<div id="collapse{$f->id}" class="accordion-collapse collapse show" aria-labelledby="heading{$f->id}">
									<div class="accordion-body">
										{foreach $f->options as $k=>$o}
											<a href="{furl params=[$f->url=>$o->translit, page=>null]}" style="background-color:{$o->value|escape}" class="btn btn-sm rounded-circle mt-1 me-1 {if $o->value == '#ffffff'}white{/if} {if isset($smarty.get.{$f@key}) && in_array($o->translit, $smarty.get.{$f@key})}active{/if}">
												<span class="fa fa-check"></span>
											</a>
										{/foreach}
									</div>
								</div>
							</div>
						{elseif $f->is_size}
							<div class="size-filter accordion-item border-0 border-bottom rounded-bottom-0">
								<h2 class="accordion-header" id="heading{$f->id}">
									<button class="accordion-button d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{$f->id}" aria-expanded="true" aria-controls="collapse{$f->id}">
										{$f->name|escape}
									</button>
								</h2>
								<div id="collapse{$f->id}" class="accordion-collapse collapse show" aria-labelledby="heading{$f->id}">
									<div class="accordion-body">
										{foreach $f->options as $k=>$o}
											<a href="{furl params=[$f->url=>$o->translit, page=>null]}" class="btn btn-sm mt-1 {if isset($smarty.get.{$f@key}) && in_array($o->translit, $smarty.get.{$f@key})}active{/if}">
												{$o->value|escape}
											</a>
										{/foreach}
									</div>
								</div>
							</div>
						{else}
							<div class="accordion-item border-0 border-bottom rounded-bottom-0">
								<h2 class="accordion-header" id="heading{$f->id}">
									<button class="accordion-button d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{$f->id}" aria-expanded="true" aria-controls="collapse{$f->id}">
										{$f->name|escape}
									</button>
								</h2>
								<div id="collapse{$f->id}" class="accordion-collapse collapse show" aria-labelledby="heading{$f->id}">
									<div class="accordion-body">
										{foreach $f->options as $k=>$o}
											<label role="button" class="form-check">
												<input role="button" class="form-check-input" type="checkbox" onclick="location.href = '{furl params=[$f->url=>$o->translit, page=>null]}'" value="" {if isset($smarty.get.{$f@key}) && in_array($o->translit, $smarty.get.{$f@key})}checked{/if}>
												<span class="form-check-label">
													{$o->value|escape}
												</span>
											</label>
										{/foreach}
									</div>
								</div>
							</div>
						{/if}
					{/foreach}
				{/if}
			</div>
		</div>
	</div>
</div>

{* Mobile Filter *}
<div class="offcanvas offcanvas-start p-0 d-lg-none" tabindex="-1" id="mainFilterMobile" aria-labelledby="mainFilterMobileLabel">
	<div class="offcanvas-header border-bottom">
		<button class="offcanvas-title btn btn-link link-body-emphasis text-decoration-none p-0 fs-5 lh-1" id="mainFilterMobileLabel" type="button" data-bs-dismiss="offcanvas">
			<i class="far fa-angle-left"></i>
			{$lang->global_filters|escape}
		</button>
		{if $is_filter || $current_minprice != $minprice || $current_maxprice != $maxprice}
			<a href="{$lang_link}catalog/{$category->url}" class="btn btn-sm btn-outline-reset rounded-pill ms-auto lh-1">{$lang->reset|escape}</a>
		{/if}
	</div>
	<div class="offcanvas-body p-0">
		<div class="d-flex flex-align-end flex-column h-100">
			<div class="h-100 mb-auto overflow-y-auto p-0">
				<ul class="nav">
					{* Filter Brands *}
					{if !$brand}
						{if $category->brands}
							<li class="nav-item border-bottom w-100">
								<a href="javascript:void(0);" class="nav-link nav-link d-flex align-items-center justify-content-between px-3" data-bs-toggle="offcanvas" data-bs-target="#brands" aria-controls="brands">
									<span class="d-flex align-items-center">
										<span class="ms-2">{$lang->global_brands|escape}</span>
									</span>
									<i class="far fa-angle-right"></i>
								</a>
							</li>
						{/if}
					{/if}
					{* Filter Price *}
					{if ($minprice != 0 && $maxprice != 0) && ($minprice != $maxprice)}
						<li class="nav-item border-bottom w-100">
							<a href="javascript:void(0);" class="nav-link nav-link d-flex align-items-center justify-content-between px-3" data-bs-toggle="offcanvas" data-bs-target="#price" aria-controls="price">
								<span class="d-flex align-items-center">
									<span class="ms-2">{$lang->global_price|escape}</span>
								</span>
								<i class="far fa-angle-right"></i>
							</a>
						</li>
					{/if}
					{* Filter Features *}
					{if $features}
						{foreach $features as $f}
							<li class="nav-item border-bottom w-100">
								<a href="javascript:void(0);" class="nav-link nav-link d-flex align-items-center justify-content-between px-3" data-bs-toggle="offcanvas" data-bs-target="#options{$f->id}" aria-controls="options{$f->id}">
									<span class="d-flex align-items-center">
										<span class="ms-2">{$f->name|escape}</span>
									</span>
									<i class="far fa-angle-right"></i>
								</a>
							</li>
						{/foreach}
					{/if}
				</ul>
			</div>
			<div class="d-flex justify-content-center border-top">
				<div class="align-self-center pb-3 pt-2 text-center w-100">
					{if $noindex_filter || $current_minprice != $minprice || $current_maxprice != $maxprice}
						<small class="text-muted">{$lang->found|escape} {$products|count} {$products|count|plural:$lang->global_product_1:$lang->global_product_2:$lang->global_product_3}</small>
						<div class="d-flex justify-content-center mt-3 px-3">
							<button type="button" class="btn btn-primary w-100" data-bs-dismiss="offcanvas" aria-label="mainFilterMobile">{$lang->global_show|escape}</button>
						</div>
					{else}
						<div class="d-flex justify-content-center mt-2 px-3">
							<button type="button" class="btn btn-gray w-100" data-bs-dismiss="offcanvas" aria-controls="mainFilterMobile">{$lang->previous|escape}</button>
						</div>
					{/if}
				</div>
			</div>
		</div>
	</div>
</div>

{* Filter Price *}
{if ($minprice != 0 && $maxprice != 0) && ($minprice != $maxprice)}
	<div class="offcanvas offcanvas-start p-0 d-lg-none" tabindex="-1" id="price" aria-labelledby="priceLabel">
		<div class="offcanvas-header border-bottom">
			<button class="offcanvas-title btn btn-link link-body-emphasis text-decoration-none p-0 fs-5 lh-1" id="priceLabel" type="button" data-bs-toggle="offcanvas" data-bs-target="#mainFilterMobile" aria-controls="mainFilterMobile">
				<i class="fal fa-angle-left"></i>
				{$lang->global_price|escape}
			</button>
			{if $noindex_filter || $current_minprice != $minprice || $current_maxprice != $maxprice}
				<a href="{$lang_link}catalog/{$category->url}" class="btn btn-sm btn-outline-reset rounded-pill ms-auto lh-1">{$lang->reset|escape}</a>
			{/if}
		</div>
		<div class="offcanvas-body p-0">
			<div class="d-flex flex-align-end flex-column h-100">
				<div class="h-100 mb-auto overflow-y-auto p-3">
					<div class="range-slider px-3" data-start-min="{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" data-start-max="{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" data-min="{$minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" data-max="{$maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" data-step="1">
						<form method="post">
							<input type="hidden" name="rate_from" id="rate_from" value="{$currency->rate_from}">
							<input type="hidden" name="rate_to" id="rate_to" value="{$currency->rate_to}">
							<div class="d-flex">
								<div class="w-50 pe-2 me-2">
									<input class="form-control form-control-sm range-slider-value-min" type="text" name="min_price">
								</div>
								<div class="w-50 ps-2 me-2 pe-2">
									<input class="form-control form-control-sm range-slider-value-max" type="text" name="max_price">
								</div>
								<button type="submit" class="btn btn-sm btn-gray ms-auto">OK</button>
							</div>
						</form>
						<div class="range-slider-ui my-4"></div>
					</div>
				</div>
				<div class="d-flex justify-content-center border-top">
					<div class="align-self-center pb-3 pt-2 text-center w-100">
						<small class="text-muted">{$lang->found|escape} {$products|count} {$products|count|plural:$lang->global_product_1:$lang->global_product_2:$lang->global_product_3}</small>
						<div class="d-flex justify-content-between gap-2 mt-3 px-3">
							<button type="button" class="btn btn-gray w-100" data-bs-toggle="offcanvas" data-bs-target="#mainFilterMobile" aria-controls="mainFilterMobile">{$lang->previous|escape}</button>
							<button type="button" class="btn btn-primary w-100" data-bs-dismiss="offcanvas" aria-label="Close">{$lang->global_show|escape}</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}

{* Filter Brands *}
{if !$brand}
	{if $category->brands}
		<div class="widget-filter offcanvas offcanvas-start p-0 d-lg-none" tabindex="-1" id="brands" aria-labelledby="brandsLabel">
			<div class="offcanvas-header border-bottom">
				<button class="offcanvas-title btn btn-link link-body-emphasis text-decoration-none p-0 fs-5 lh-1" id="brandsLabel" type="button" data-bs-toggle="offcanvas" data-bs-target="#mainFilterMobile" aria-controls="mainFilterMobile">
					<i class="fal fa-angle-left"></i>
					{$lang->global_brands|escape}
				</button>
				{if $noindex_filter || $current_minprice != $minprice || $current_maxprice != $maxprice}
					<a href="{$lang_link}catalog/{$category->url}" class="btn btn-sm btn-outline-reset rounded-pill ms-auto lh-1">{$lang->reset|escape}</a>
				{/if}
			</div>
			<div class="widget-filter-list offcanvas-body p-0">
				<div class="d-flex flex-align-end flex-column h-100">
					<div class="h-100 mb-auto overflow-y-auto p-3">
						<input type="text" class="widget-filter-search form-control form-control-sm mb-3" placeholder="{$lang->global_search|escape}">
						{foreach $category->brands as $b}
							<label role="button" class="widget-filter-item form-check fs-4 lh-sm">
								<input role="button" type="checkbox" class="form-check-input" onclick="location.href = '{furl params=[brand=>$b->url, page=>null]}'" value="" {if isset($smarty.get.b) && in_array($b->id, $smarty.get.b)}
								checked{/if}>
								<span class="widget-filter-item-text form-check-label fs-6">
									{$b->name|escape}
								</span>
							</label>
						{/foreach}
					</div>
					<div class="d-flex justify-content-center border-top">
						<div class="align-self-center pb-3 pt-2 text-center w-100">
							<small class="text-muted">{$lang->found|escape} {$products|count} {$products|count|plural:$lang->global_product_1:$lang->global_product_2:$lang->global_product_3}</small>
							<div class="d-flex justify-content-between gap-2 mt-3 px-3">
								<button type="button" class="btn btn-gray w-100" data-bs-toggle="offcanvas" data-bs-target="#mainFilterMobile" aria-controls="mainFilterMobile">{$lang->previous|escape}</button>
								<button type="button" class="btn btn-primary w-100" data-bs-dismiss="offcanvas" aria-label="Close">{$lang->global_show|escape}</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}
{/if}

{* Filter Features *}
{if $features}
	{foreach $features as $f}
		<div class="offcanvas offcanvas-start p-0 d-lg-none" tabindex="-1" id="options{$f->id}" aria-labelledby="options{$f->id}Label">
			<div class="offcanvas-header border-bottom">
				<button class="offcanvas-title btn btn-link link-body-emphasis text-decoration-none p-0 fs-5 lh-1" id="options{$f->id}Label" type="button" data-bs-toggle="offcanvas" data-bs-target="#mainFilterMobile" aria-controls="mainFilterMobile">
					<i class="fal fa-angle-left"></i>
					{$f->name|escape}
				</button>
				{if $noindex_filter || $current_minprice != $minprice || $current_maxprice != $maxprice}
					<a href="{$lang_link}catalog/{$category->url}" class="btn btn-sm btn-outline-reset rounded-pill ms-auto lh-1">{$lang->reset|escape}</a>
				{/if}
			</div>
			<div class="offcanvas-body p-0">
				<div class="d-flex flex-align-end flex-column h-100">
					<div class="h-100 mb-auto overflow-y-auto p-3">
						{if $f->is_color}
							<div class="color-filter">
								{foreach $f->options as $k=>$o}
									<a href="{furl params=[$f->url=>$o->translit, page=>null]}" style="background-color:{$o->value|escape}" class="btn btn-sm rounded-circle mt-1 {if $o->value == '#ffffff'}white{/if} {if isset($smarty.get.{$f@key}) && in_array($o->translit, $smarty.get.{$f@key})}active{/if}">
										<span class="fa fa-check"></span>
									</a>
								{/foreach}
							</div>
						{elseif $f->is_size}
							<div class="size-filter">
								{foreach $f->options as $k=>$o}
									<a href="{furl params=[$f->url=>$o->translit, page=>null]}" class="btn btn-sm mt-1 {if isset($smarty.get.{$f@key}) && in_array($o->translit, $smarty.get.{$f@key})}active{/if}">
										{$o->value|escape}
									</a>
								{/foreach}
							</div>
						{else}
							{foreach $f->options as $k=>$o}
								<label role="button" class="form-check fs-4 lh-sm">
									<input role="button" class="form-check-input" type="checkbox" onclick="location.href = '{furl params=[$f->url=>$o->translit, page=>null]}'" value="" {if isset($smarty.get.{$f@key}) && in_array($o->translit, $smarty.get.{$f@key})}checked{/if}>
									<span class="form-check-label fs-6">
										{$o->value|escape}
									</span>
								</label>
							{/foreach}
						{/if}
					</div>
					<div class="d-flex justify-content-center border-top">
						<div class="align-self-center pb-3 pt-2 text-center w-100">
							<small class="text-muted">{$lang->found|escape} {$products|count} {$products|count|plural:$lang->global_product_1:$lang->global_product_2:$lang->global_product_3}</small>
							<div class="d-flex justify-content-between gap-2 mt-3 px-3">
								<button type="button" class="btn btn-gray w-100" data-bs-toggle="offcanvas" data-bs-target="#mainFilterMobile" aria-controls="mainFilterMobile">{$lang->previous|escape}</button>
								<button type="button" class="btn btn-primary w-100" data-bs-dismiss="offcanvas" aria-label="Close">{$lang->global_show|escape}</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/foreach}
{/if}