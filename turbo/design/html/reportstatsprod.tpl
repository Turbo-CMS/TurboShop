{$meta_title = $btr->sales_report scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$product->name}: {$btr->sales_report_small|escape}</h1>
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
						<input type="hidden" name="module" value="ReportStatsProdAdmin">
						<input type="hidden" name="date_filter" value="">
						<input type="hidden" name="id" value="{$product->id}">
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
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3">
							<select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url keyword=null brand_id=null page=null limit=null variant_id=null}" {if !isset($variant_id)}selected{/if}>{$btr->variants_all|escape}</option>
								{foreach $variants as $variant}
									<option value='{url keyword=null brand_id=null page=null variant_id={$variant->id}}' {if isset($variant_id) && $variant_id==$variant->id}selected{/if}>
										{if $variant->color} {$variant->color|escape} / {/if}{$variant->name}
									</option>
								{/foreach}
							</select>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3">
							<select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option {if !isset($smarty.get.status)}selected{/if} value="{url status=null}">{$btr->reportstats_all_statuses|escape}</option>
								<option value="{url status=1}" {if isset($status) && $status==1}selected{/if}>{$btr->global_new_order|escape}</option>
								<option value="{url status=2}" {if isset($status) && $status==2}selected{/if}>{$btr->global_accepted_order|escape}</option>
								<option value="{url status=3}" {if isset($status) && $status==3}selected{/if}>{$btr->global_closed_order|escape}</option>
								<option value="{url status=4}" {if isset($status) && $status==4}selected{/if}>{$btr->global_canceled_order|escape}</option>
							</select>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3">
							<select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option {if !isset($label)}selected{/if} value="{url label=null}">{$btr->reportstats_all_orders|escape}</option>
								{foreach $labels as $l}
									<option value="{url label=$l->id}" {if isset($label) && $label->id==$l->id}selected{/if}>{$l->name}</option>
								{/foreach}
							</select>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 mb-3">
							<select onchange="location = this.value;" data-live-search="true" data-size="10" class="selectpicker">
								<option {if !isset($date_filter)}selected{/if} value="{url date_filter=null date_to=null date_from=null filter_check=null}">{$btr->reportstats_all_orders|escape}</option>
								<option {if isset($date_filter) && $date_filter == today}selected{/if} value="{url date_filter=today date_to=null date_from=null filter_check=null}">{$btr->reportstats_today|escape}</option>
								<option {if isset($date_filter) && $date_filter == this_week}selected{/if} value="{url date_filter=this_week date_to=null date_from=null filter_check=null}">{$btr->reportstats_this_week|escape}</option>
								<option {if isset($date_filter) && $date_filter == this_month}selected{/if} value="{url date_filter=this_month date_to=null date_from=null filter_check=null}">{$btr->reportstats_this_month|escape}</option>
								<option {if isset($date_filter) && $date_filter == this_year}selected{/if} value="{url date_filter=this_year date_to=null date_from=null filter_check=null}">{$btr->reportstats_this_year|escape}</option>
								<option {if isset($date_filter) && $date_filter == yesterday}selected{/if} value="{url date_filter=yesterday date_to=null date_from=null filter_check=null}">{$btr->reportstats_yesterday|escape}</option>
								<option {if isset($date_filter) && $date_filter == last_week}selected{/if} value="{url date_filter=last_week date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_week|escape}</option>
								<option {if isset($date_filter) && $date_filter == last_month}selected{/if} value="{url date_filter=last_month date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_month|escape}</option>
								<option {if isset($date_filter) && $date_filter == last_year}selected{/if} value="{url date_filter=last_year date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_year|escape}</option>
								<option {if isset($date_filter) && $date_filter == last_24hour}selected{/if} value="{url date_filter=last_24hour date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_24|escape}</option>
								<option {if isset($date_filter) && $date_filter == last_7day}selected{/if} value="{url date_filter=last_7day date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_7_days|escape}</option>
								<option {if isset($date_filter) && $date_filter == last_30day}selected{/if} value="{url date_filter=last_30day date_to=null date_from=null filter_check=null}">{$btr->reportstats_last_30_days|escape}</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>

		{assign 'total_summ' 0}
		{assign 'total_amount' 0}
		<div class="turbo-list">
			<div class="turbo-list-head">
				<div class="turbo-list-heading turbo-list-reportstats-categories">{$btr->global_date|escape}</div>
				<div class="turbo-list-heading turbo-list-reportstats-products">{$btr->global_title|escape}</div>
				<div class="turbo-list-heading turbo-list-reportstats-total">{$btr->global_sales_amount|escape}</div>
				<div class="turbo-list-heading turbo-list-reportstats-setting">{$btr->global_qty|escape}</div>
			</div>
			<div class="turbo-list-body">
				{foreach $product_report as $prod_report}
					{assign 'total_summ' $total_summ+$prod_report->price}
					{assign 'total_amount' $total_amount+$prod_report->amount}
					<div class="turbo-list-body-item">
						<div class="turbo-list-row">
							<div class="turbo-list-boding turbo-list-reportstats-categories text-body">
								{$prod_report->date|date}
							</div>
							<div class="turbo-list-boding turbo-list-reportstats-products">
								<a title="{$prod_report->product_name|escape}" href="{url module=ProductAdmin id=$prod_report->product_id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$prod_report->product_name}</a>
								{if $prod_report->variant_color || $prod_report->variant_name}<div class="mb-0"><span class="text-body">{if $prod_report->variant_color}{$prod_report->variant_color|escape} / {/if} {$prod_report->variant_name}</span></div>{/if}
								<div class="d-block d-md-none mt-1">
									<span class="text_dark fw-bold text-body">
										<span class="d-none d-sm-block">{$btr->global_sales_amount|escape}: </span>
										<span class="text-primary">
											{$prod_report->price} {$currency->sign|escape}
										</span>
									</span>
								</div>
							</div>
							<div class="turbo-list-boding turbo-list-reportstats-total text-body">
								{$prod_report->price} {$currency->sign|escape}
							</div>
							<div class="turbo-list-reportstats-setting text-body">
								{$prod_report->amount} {if isset($prod_report->units)}{$prod_report->units|escape}{else}{$settings->units}{/if}
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
		<div class="row">
			<div class="col-12">
				<div id="chart_cont" class="chart chart-xl"></div>
			</div>
		</div>
	</div>
</div>

{* Loader *}
{js id="loader" priority=99 include=["turbo/design/js/loader.js"]}{/js}
{javascript minify=true}

{literal}
	<script>
		$(window).on("load", function() {
			// Flatpickr
			flatpickr(".flatpickr", {
				dateFormat: "d.m.Y",
				locale: "{/literal}{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}{literal}"
			});
		});
	</script>
{/literal}

{if $settings->admin_theme == "dark"}
	{literal}
		<script>
			google.load("visualization", "1", {packages:["corechart"]});
			google.setOnLoadCallback(drawChart);

			function drawChart() {
				var data = google.visualization.arrayToDataTable([
				{/literal}
				['{$btr->global_date|escape}', '{$btr->global_sum|escape} {$currency->sign|escape}', '{$btr->global_qty|escape}'],
				{foreach $product_report_stat as $prod_report}      
					['{$prod_report->date|date}', {$prod_report->price}, {$prod_report->amount}],
				{/foreach}
				{literal}
				]);

				var options = {
					legend: {textStyle: {fontName: 'Inter', color: '#a7abb1'}},
					colors: ['#3b7ddd', '#dc3545'],
					pieHole: 0.2,
					hAxis: {textStyle: {fontName: 'Inter', color: '#a7abb1'}},
					vAxis: {minValue: 0, textStyle: {fontName: 'Inter', fontSize: 11, color: '#a7abb1'}, gridlines: {color: '#19222d'}, baselineColor:'#19222d'},
					tooltip: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					backgroundColor: '#222e3c'
				};

				var chart = new google.visualization.AreaChart(document.getElementById('chart_cont'));
				chart.draw(data, options);
			}

			$(window).resize(function() {
				drawChart();
			});
		</script>
	{/literal}
{else}
	{literal}
		<script>
			google.load("visualization", "1", {packages:["corechart"]});
			google.setOnLoadCallback(drawChart);

			function drawChart() {
				var data = google.visualization.arrayToDataTable([
				{/literal}
				['{$btr->global_date|escape}', '{$btr->global_sum|escape} {$currency->sign|escape}', '{$btr->global_qty|escape}'],
				{foreach $product_report_stat as $prod_report}      
					['{$prod_report->date|date}', {$prod_report->price}, {$prod_report->amount}],
				{/foreach}
				{literal}
				]);

				var options = {
					legend: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					colors: ['#3b7ddd', '#dc3545'],
					pieHole: 0.2,
					hAxis: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					vAxis: {minValue: 0, textStyle: {fontName: 'Inter', fontSize: 11, color: '#6c757d'}},
					tooltip: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					backgroundColor: '#fff'
				};

				var chart = new google.visualization.AreaChart(document.getElementById('chart_cont'));
				chart.draw(data, options);
			}

			$(window).resize(function() {
				drawChart();
			});
		</script>
	{/literal}
{/if}