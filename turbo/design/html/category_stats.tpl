{$meta_title=$btr->category_stats_sales scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{$btr->category_stats_sales|escape}
		{if isset($category->name)}
			{$category->name|escape}
		{/if}
		{if isset($brand->name)}
			{$brand->name|escape}
		{/if}
	</h1>
</div>

<div class="card">
	<div class="card-header d-block d-lg-none"> 
		<div class="card-actions float-end">
			<div class="position-relative collapse-icon">
				<a href="javascript:;" class="collapse-chevron">
					<i class="align-middle" data-feather="chevron-down"></i>
				</a>
			</div>
		</div>
		<h5 class="card-title mb-0">{$btr->global_filter|escape}</h5>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-12">
				<div class="collapse-card boxed-sorting">
					<form method="get">
						<input type="hidden" name="module" value="CategoryStatsAdmin">
						<div class="row">
							<div class="col-sm-12 col-md-4 col-lg-4">
								<div class="input-group mb-3">
									<span class="input-group-text">{$btr->global_from|escape}</span>
									<input type="text" class="flatpickr form-control" name="date_from" value="{if isset($date_from)}{$date_from}{/if}" autocomplete="off">
									<span class="input-group-text"><i class="align-middle" data-feather="calendar"></i></span>
								</div>
							</div>
							<div class="col-sm-12 col-md-4 col-lg-4">
								<div class="input-group mb-3">
									<span class="input-group-text">{$btr->global_to|escape}</span>
									<input type="text" class="flatpickr form-control" name="date_to" value="{if isset($date_to)}{$date_to}{/if}" autocomplete="off">
									<span class="input-group-text"><i class="align-middle" data-feather="calendar"></i></span>
								</div>
							</div>
							<div class="col-sm-12 col-md-4 col-lg-4 mb-3">
								<button class="btn btn-primary" type="submit"><i class="align-middle" data-feather="check"></i> {$btr->global_apply|escape}</button>
							</div>
						</div>
					</form>
					<div class="row">
						<div class="col-md-4 col-lg-4 col-sm-12 mb-3">
							<select id="id_categories" name="categories_filter" title="{$btr->global_category_filter|escape}" class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url brand=null category=null}" {if !isset($category)}selected{/if}>{$btr->global_all_categories|escape}</option>
								{function name=category_select level=0}
									{foreach $categories as $c}
										<option value='{url brand=null category=$c->id}' {if isset($smarty.get.category) && $smarty.get.category == $c->id}selected{/if}>
											{section sp $level}--{/section} {$c->name|escape}
										</option>
										{if isset($c->subcategories)}
											{category_select categories=$c->subcategories level=$level+1}
										{/if}
									{/foreach}
								{/function}
								{category_select categories=$categories}
							</select>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 mb-3">
							<select onchange="location = this.value;" class="selectpicker">
								<option value="{url brand=null}" {if !isset($brand)}selected{/if}>{$btr->global_all_brands|escape}</option>
								{foreach $brands as $b}
									<option value="{url brand=$b->id}" {if isset($brand) && $brand->id == $b->id}selected{/if}>{$b->name|escape}</option>
								{/foreach}
							</select>
						</div>

						<div class="col-lg-4 col-md-4 col-sm-12 mb-3">
							<button id="js-start" type="submit" class="btn btn-primary float-md-end">
								<i class="align-middle" data-feather="download"></i>
								{$btr->global_export|escape}
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<form method="post" class="js-form-list">
			<input type="hidden" name="session_id" value="{$smarty.session.id}">
			<div class="turbo-list ">
				<div class="turbo-list-head">
					<div class="turbo-list-heading turbo-list-categorystats-categories">{$btr->global_category|escape}</div>
					<div class="turbo-list-heading turbo-list-categorystats-total">{$btr->global_sales_amount|escape}</div>
					<div class="turbo-list-heading turbo-list-categorystats-setting">{$btr->global_qty|escape}</div>
				</div>
				<div class="turbo-list-body">
					{function name=categories_list_tree level=0}
						{foreach $categories as $category}
							{if $categories}
								<div class="turbo-list-body-item">
									<div class="turbo-list-row">
										<div class="turbo-list-boding turbo-list-categorystats-categories">
											<span class="text-body">{$category->name|escape}</span>
											<div class="d-block d-md-none mt-1">
												<span class="fw-bold text-body">
													<span class="d-none d-sm-block">{$btr->global_sales_amount|escape}:</span>
													<span class="{if $category->price}text-primary{else}text-body{/if}">
														{$category->price|number_format:2:".":""} {$currency->sign}
													</span>
												</span>
											</div>
										</div>
										<div class="turbo-list-boding turbo-list-categorystats-total text-body">
											{$category->price|number_format:2:".":""} {$currency->sign}
										</div>
										<div class="turbo-list-boding turbo-list-categorystats-setting text-body">
											{$category->amount} {$btr->reportstats_units}
										</div>
									</div>
								</div>
							{/if}
							{if isset($category->subcategories)}
								{categories_list_tree categories=$category->subcategories level=$level+1}
							{/if}
						{/foreach}
					{/function}
					{categories_list_tree categories=$categories_list}
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="text-dark fw-bold text-end mt-3">
						<div class="h3">{$btr->global_total|escape} {$total_price} {$currency->sign|escape} <span class="text-secondary">({$total_amount} {$btr->reportstats_units|escape})</span></div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	{if isset($category)}
		var category = {$category->id};
	{/if}
	{if isset($brand)}
		var brand = {$brand->id};
	{/if}
	{if isset($date_from)}
		var date_from = '{$date_from}';
	{/if}
	{if isset($date_to)}
		var date_to = '{$date_to}';
	{/if}
</script>

{literal}
	<script>
		$(window).on("load", function() {

			flatpickr(".flatpickr", {
				dateFormat: "d.m.Y",
				locale: "{/literal}{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}{literal}"
			});

			$('button#js-start').click(function() {
				do_export();
			});

			function do_export(page) {
				page = typeof(page) != 'undefined' ? page : 1;
				category = typeof(category) != 'undefined' ? category : 0;
				brand = typeof(brand) != 'undefined' ? brand : 0;
				date_from = typeof(date_from) != 'undefined' ? date_from : 0;
				date_to = typeof(date_to) != 'undefined' ? date_to : 0;
				$.ajax({
					url: "ajax/export_stat_categories.php",
					data: {
						page: page,
						category: category,
						brand: brand,
						date_from: date_from,
						date_to: date_to
					},
					dataType: 'json',
					success: function() {
						window.location.href = 'files/export/export_stat_categories.csv';
					},
					error: function(xhr, status, errorThrown) {
						alert(errorThrown + '\n' + xhr.responseText + 'asdasd');
					}
				});
			}
		});
	</script>
{/literal}