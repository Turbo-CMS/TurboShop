{$meta_title = $btr->reportstats_orders scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->reportstats_orders|escape}</h1>
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
						<input type="hidden" name="module" value="ReportStatsAdmin">
						<input type="hidden" name="date_filter" value="">
						<div class="row">
							<div class="col-sm-12 col-md-4 col-lg-4">
								<div class="input-group mb-3">
									<span class="input-group-text">{$btr->global_from|escape}</span>
									<input type="text" class="flatpickr form-control" name="date_from" value="{$date_from}" autocomplete="off">
									<span class="input-group-text"><i class="align-middle" data-feather="calendar"></i></span>
								</div>
							</div>
							<div class="col-sm-12 col-md-4 col-lg-4">
								<div class="input-group mb-3">
									<span class="input-group-text">{$btr->global_to|escape}</span>
									<input type="text" class="flatpickr form-control" name="date_to" value="{$date_to}" autocomplete="off">
									<span class="input-group-text"><i class="align-middle" data-feather="calendar"></i></span>
								</div>
							</div>
							<div class="col-sm-12 col-md-4 col-lg-4 mb-3 d-grid d-sm-block">
								<button class="btn btn-primary" type="submit"><i class="align-middle" data-feather="check"></i> {$btr->global_apply|escape}</button>
							</div>
						</div>
					</form>
					<div class="row">
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3">
							<select id="id_categories" name="categories_filter" title="{$btr->global_category_filter|escape}" class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url keyword=null brand_id=null page=null limit=null category_id=null}" {if !$category}selected{/if}>{$btr->global_all_categories|escape}</option>
								{function name=category_select level=0}
									{foreach $categories as $c}
										<option value='{url keyword=null brand_id=null page=null category_id={$c->id}}' {if $smarty.get.category_id == $c->id}selected{/if}>
											{section sp $level}--{/section} {$c->name|escape}
										</option>
										{category_select categories=$c->subcategories level=$level+1}
									{/foreach}
								{/function}
								{category_select categories=$categories}
							</select>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3">
							<select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option {if !$smarty.get.status}selected{/if} value="{url status=null}">{$btr->reportstats_all_statuses|escape}</option>
								<option value="{url module=ReportStatsAdmin status=1 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==1}selected{/if}>{$btr->global_new_order|escape}</option>
								<option value="{url module=ReportStatsAdmin status=2 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==2}selected{/if}>{$btr->global_accepted_order|escape}</option>
								<option value="{url module=ReportStatsAdmin status=3 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==3}selected{/if}>{$btr->global_closed_order|escape}</option>
								<option value="{url module=ReportStatsAdmin status=4 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==4}selected{/if}>{$btr->global_canceled_order|escape}</option>
							</select>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 mb-3">
							<select onchange="location = this.value;" data-live-search="true" data-size="15" class="selectpicker">
								<option {if !$date_filter}selected{/if} value="{url date_filter=null date_to=null date_from=null filter_check=null}">{$btr->reportstats_all_orders|escape}</option>
								<option {if $date_filter == today}selected{/if} value="{url date_filter=today date_to=null date_from=null filter_check=null}">{$btr->reportstats_today|escape}</option>
								<option {if $date_filter == this_week}selected{/if} value="{url date_filter=this_week date_to=null date_from=null filter_check=null}">{$btr->reportstats_this_week|escape}</option>
								<option {if $date_filter == this_month}selected{/if} value="{url date_filter=this_month date_to=null date_from=null filter_check=null}">{$btr->reportstats_this_month|escape}</option>
								<option {if $date_filter == this_year}selected{/if} value="{url date_filter=this_year date_to=null date_from=null filter_check=null}">{$btr->reportstats_this_year|escape}</option>
								<option {if $date_filter == yesterday}selected{/if} value="{url date_filter=yesterday date_to=null date_from=null filter_check=null}">{$btr->reportstats_yesterday|escape}</option>
								<option {if $date_filter == last_week}selected{/if} value="{url date_filter=last_week date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_week|escape}</option>
								<option {if $date_filter == last_month}selected{/if} value="{url date_filter=last_month date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_month|escape}</option>
								<option {if $date_filter == last_year}selected{/if} value="{url date_filter=last_year date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_year|escape}</option>
								<option {if $date_filter == last_24hour}selected{/if} value="{url date_filter=last_24hour date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_24|escape}</option>
								<option {if $date_filter == last_7day}selected{/if} value="{url date_filter=last_7day date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_7_days|escape}</option>
								<option {if $date_filter == last_30day}selected{/if} value="{url date_filter=last_30day date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_30_days|escape}</option>
							</select>
						</div>

						<div class="col-lg-3 col-md-3 col-sm-12 mb-3 d-grid d-sm-block">
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
			{assign 'total_summ' 0}
			{assign 'total_amount' 0}
			<div class="turbo-list">
				<div class="turbo-list-head">
					<div class="turbo-list-heading turbo-list-reportstats-categories">{$btr->global_category|escape}</div>
					<div class="turbo-list-heading turbo-list-reportstats-products">{$btr->global_title|escape}</div>
					<div class="turbo-list-heading turbo-list-reportstats-total">
						{if $sort_prod=='price'}
							{$sort = 'price-in'}
						{else}
							{$sort = 'price'}
						{/if}
						<span>{$btr->global_sales_amount|escape}</span>
						<a href="{if $sort_prod=='price'}{url sort_prod=price_in}{else}{url sort_prod=price}{/if}" {if $sort_prod=='price' || $sort_prod=='price_in'}class="{$sort} selected" {/if}>{include file='svg_icon.tpl' svgId='sorts'}</a>
					</div>
					<div class="turbo-list-heading turbo-list-reportstats-setting">
						{if $sort_prod=='amount'}
							{$sort = 'amount-in'}
						{else}
							{$sort = 'amount'}
						{/if}
						<span>{$btr->global_qty|escape}</span>
						<a href="{if $sort_prod=='amount'}{url sort_prod=amount_in}{else}{url sort_prod=amount}{/if}" {if $sort_prod=='amount' || $sort_prod=='amount_in'}class="{$sort} selected" {/if}>{include file='svg_icon.tpl' svgId='sorts'}</a>
					</div>
				</div>

				<div class="turbo-list-body">
					{foreach $report_stat_purchases as $purchase}
						{assign var='total_summ'  value=$total_summ+$purchase->sum_price}
						{assign var='total_amount' value=$total_amount+$purchase->amount}
						<div class="turbo-list-body-item">
							<div class="turbo-list-row">
								<div class="turbo-list-boding turbo-list-reportstats-categories text-body">
									{foreach $purchase->category->path as $c}
										{$c->name}/
									{/foreach}
								</div>
								<div class="turbo-list-boding turbo-list-reportstats-products">
									<a title="{$purchase->product_name|escape}" href="{url module=ReportStatsProdAdmin id=$purchase->product_id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$purchase->product_name}</a>
									{if $purchase->variant_color || $purchase->variant_name}<div class="mb-0"><span class="text-body">{if $purchase->variant_color}{$purchase->variant_color|escape} / {/if} {$purchase->variant_name}</span></div>{/if}
									<div class="d-block d-md-none mt-1">
										<span class="fw-bold text-body">
											<span class="d-none d-sm-block">{$btr->global_sales_amount|escape}:</span>
											<span class="text-primary">
												{$purchase->sum_price} {$currency->sign|escape}
											</span>
										</span>
									</div>
								</div>

								<div class="turbo-list-boding turbo-list-reportstats-total text-body">
									{$purchase->sum_price} {$currency->sign|escape}
								</div>

								<div class="turbo-list-reportstats-setting text-body">
									{$purchase->amount} {if $purchase->units}{$purchase->units|escape}{else}{$settings->units}{/if}
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="text-dark fw-bold text-end mt-3">
						<div class="h3">{$btr->global_total|escape} {$total_summ|string_format:'%.2f'} {$currency->sign|escape} <span class="text-secondary">({$total_amount} {$btr->reportstats_units})</span></div>
					</div>
				</div>
			</div>
		</form>
		<div class="col-12">
			{include file='pagination.tpl'}
		</div>
	</div>
</div>

<script>
	{if $date_filter}
		var date_filter = '{$date_filter}';
	{/if}
	{if $date_from}
		var date_from = '{$date_from}';
	{/if}
	{if $date_to}
		var date_to = '{$date_to}';
	{/if}
	{if $status}
		var status = '{$status}';
	{/if}
	{if $sort_prod}
		var sort_prod = '{$sort_prod}';
	{/if}
	{if $page}
		var page = '{$page}';
	{/if}
	{if $category}
		var category = '{$category}';
	{/if}
</script>

{literal}
	<script>
		$(window).on("load", function() {
			// Flatpickr
			flatpickr(".flatpickr", {
				dateFormat: "d.m.Y",
				locale: "{/literal}{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}{literal}"
			});

			$('#js-start').click(function() {
				do_export();
			});

			function do_export(page) {
				page = typeof(page) != 'undefined' ? page : 1;
				category = typeof(category) != 'undefined' ? category : 0;
				date_filter = typeof(date_filter) != 'undefined' ? date_filter : 0;
				date_from = typeof(date_from) != 'undefined' ? date_from : 0;
				date_to = typeof(date_to) != 'undefined' ? date_to : 0;
				status = typeof(status) != 'undefined' ? status : 0;
				sort_prod = typeof(sort_prod) != 'undefined' ? sort_prod : 0;
				$.ajax({
					url: "ajax/export_stat_products.php",
					data: {
						page: page,
						category: category,
						date_filter: date_filter,
						date_from: date_from,
						date_to: date_to,
						status: status,
						sort_prod: sort_prod
					},
					dataType: 'json',
					success: function() {
						window.location.href = 'files/export/export_stat_products.csv';
					},
					error: function(xhr, status, errorThrown) {
						alert(errorThrown + '\n' + xhr.responseText);
					}
				});
			}
		});
	</script>
{/literal}