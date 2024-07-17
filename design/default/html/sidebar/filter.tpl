{if isset($category->brands) || isset($features)}
	<div class="card card-filter mt-4">
		{if ($minprice != 0 && $maxprice != 0) && ($minprice != $maxprice)}
			<div class="card-header fw-bold text-body">
				<a class="text-decoration-none" aria-expanded="true" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePrice">
					<i class="icon-action fa fa-chevron-down"></i>
					{$lang->general_price}
				</a>
			</div>
			<div class="filter-content collapse show" id="collapsePrice">
				<div class="card-body">
					<div class="sidebar-block filter-price">
						<input type="hidden" value="{$minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" id="f_minPrice">
						<input type="hidden" value="{$maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" id="f_maxPrice">
						<input type="hidden" value="{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" id="f_currentMinPrice">
						<input type="hidden" value="{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" id="f_currentMaxPrice">
						<input type="hidden" value="10{if $currency->code == 'UAH'}0{/if}" id="f_priceStep">
						<input type="hidden" value=" {$currency->sign}" id="f_postfix">
						<span type="text" id="price-slider"></span>
						<form class="mcf_form" method="post">
							<input type="hidden" name="rate_from" id="rate_from" value="{$currency->rate_from}">
							<input type="hidden" name="rate_to" id="rate_to" value="{$currency->rate_to}">
							<input type="hidden" name="min_price" id="min_price" value="{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}">
							<input type="hidden" name="max_price" id="max_price" value="{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}">
							<div class="d-grid gap-2 mt-2">
								<button type="submit" class="btn btn-outline-primary">{$lang->apply}</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		{/if}
		{if !isset($brand)}
			{if isset($category->brands) && $category->brands}
				<div class="card-header border-bottom-0 fw-bold text-body">
					<a href="#" class="text-decoration-none" data-bs-toggle="collapse" data-bs-target="#collapseBrands">
						<i class="icon-action fa fa-chevron-down"></i>
						{$lang->global_brands}
					</a>
				</div>
				<div class="filter-content collapse show" id="collapseBrands">
					<div class="card-body">
						{foreach $category->brands as $b}
							<label role="button" class="form-check">
								<input role="button" type="checkbox" class="form-check-input" onclick="location.href = '{furl params=[brand=>$b->url, page=>null]}'" value="" {if isset($brand->id) == $b->id || isset($smarty.get.b) && in_array($b->id,$smarty.get.b)}checked{/if}>
								<span class="form-check-label">
									{$b->name|escape}
								</span>
							</label>
						{/foreach}
					</div>
				</div>
			{/if}
		{/if}
		{if $features}
			{foreach $features as $f}
				{if $f->is_color}
					<div class="color-filter">
						<div class="card-header border-bottom-0 fw-bold text-body">
							<a href="#" class="text-decoration-none" data-bs-toggle="collapse" data-bs-target="#collapse{$f->id}">
								<i class="icon-action fa fa-chevron-down"></i>
								{$f->name}
							</a>
						</div>
						<div class="filter-content collapse show" id="collapse{$f->id}">
							<div class="card-body">
								{foreach $f->options as $k=>$o}
									<a href="{furl params=[$f->url=>$o->translit, page=>null]}" style="background-color:{$o->value|escape}" class="btn btn-sm rounded-circle mt-1 {if $o->value == '#ffffff'}white{/if} {if isset($smarty.get.{$f@key}) && in_array($o->translit,$smarty.get.{$f@key})}active{/if}">
										<span class="fa fa-check"></span>
									</a>
								{/foreach}
							</div>
						</div>
					</div>
				{elseif $f->is_size}
					<div class="size-filter">
						<div class="card-header border-bottom-0 fw-bold text-body">
							<a href="#" class="text-decoration-none" data-bs-toggle="collapse" data-bs-target="#collapse{$f->id}">
								<i class="icon-action fa fa-chevron-down"></i>
								{$f->name}
							</a>
						</div>
						<div class="filter-content collapse show" id="collapse{$f->id}">
							<div class="card-body">
								{foreach $f->options as $k=>$o}
									<a href="{furl params=[$f->url=>$o->translit, page=>null]}" class="btn btn-sm mt-1 {if isset($smarty.get.{$f@key}) && in_array($o->translit,$smarty.get.{$f@key})}active{/if}">
										{$o->value|escape}
									</a>
								{/foreach}
							</div>
						</div>
					</div>
				{else}
					<div class="card-group-item">
						<div class="card-header border-bottom-0 fw-bold text-body">
							<a href="#" class="text-decoration-none" data-bs-toggle="collapse" data-bs-target="#collapse{$f->id}">
								<i class="icon-action fa fa-chevron-down"></i>
								{$f->name}
							</a>
						</div>
						<div class="filter-content collapse show" id="collapse{$f->id}">
							<div class="card-body">
								{foreach $f->options as $k=>$o}
									<label role="button" class="form-check">
										<input role="button" class="form-check-input" type="checkbox" onclick="location.href = '{furl params=[$f->url=>$o->translit, page=>null]}'" value="" {if isset($smarty.get.{$f@key}) && in_array($o->translit,$smarty.get.{$f@key})}checked{/if}>
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
	<div class="d-grid gap-2 card-body my-1">
		<a class="btn btn-outline-secondary" href="{$lang_link}catalog/{$category->url}">{$lang->reset}</a>
	</div>
{/if}