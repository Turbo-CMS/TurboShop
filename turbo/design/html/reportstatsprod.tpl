{$meta_title = $btr->sales_report_title scope=global}

{* Page title *}
<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{$product->name}: {$btr->sales_report|escape}
			</div>
		</div>
	</div>
</div>

{* Main page form *}
<div class="boxed fn_toggle_wrap">
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="fn_toggle_wrap">
				<div class="heading_box visible_md">
					{$btr->general_filter|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="boxed_sorting toggle_body_wrap off fn_card">
					<div class="row">
						<div class="col-md-11 col-lg-11 col-xl-7 col-sm-12 mb-1">
							{* Filter block *}
							<div class="date">
								<form class="date_filter row" method="get">
									<input type="hidden" name="module" value="ReportStatsProdAdmin">
									<input type="hidden" name="date_filter" value="">
									<input type="hidden" name="id" value="{$product->id}">

									<div class="col-md-5 col-lg-5 pr-0 pl-0">
										<div class="input-group mobile_input-group">
											<span class="input-group-addon-date">{$btr->general_from|escape}</span>
											<input type="text" class="fn_from_date form-control" name="date_from" value="{$date_from}" autocomplete="off">
											<div class="input-group-addon">
												{include file='svg_icon.tpl' svgId='calendar'}
											</div>
										</div>
									</div>
									<div class="col-md-5 col-lg-5 pr-0 pl-0">
										<div class="input-group mobile_input-group">
											<span class=" input-group-addon-date">{$btr->general_to|escape}</span>
											<input type="text" class="fn_to_date form-control" name="date_to" value="{$date_to}" autocomplete="off">
											<div class="input-group-addon">
												{include file='svg_icon.tpl' svgId='calendar'}
											</div>
										</div>
									</div>
									<div class="col-md-2 col-lg-2 pr-0 mobile_text_right">
										<button class="btn btn-primary" type="submit">{$btr->general_apply|escape}</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 col-lg-3 col-sm-12">
							<select class="selectpicker form-control" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url keyword=null brand_id=null page=null limit=null variant_id=null}" {if !$variant_id}selected{/if}>{$btr->all_variants|escape}</option>
								{foreach $variants as $variant}
									<option value='{url keyword=null brand_id=null page=null variant_id={$variant->id}}' {if $variant_id==$variant->id}selected{/if}>
										{if $variant->color} {$variant->color|escape} / {/if}{$variant->name}
									</option>
								{/foreach}
							</select>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-12">
							<select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option {if !$smarty.get.status}selected{/if} value="{url status=null}">{$btr->reportstats_all_statuses|escape}</option>
								<option value="{url status=1}" {if $status==1}selected{/if}>{$btr->general_new_order|escape}</option>
								<option value="{url status=2}" {if $status==2}selected{/if}>{$btr->general_accepted_order|escape}</option>
								<option value="{url status=3}" {if $status==3}selected{/if}>{$btr->general_closed_order|escape}</option>
								<option value="{url status=4}" {if $status==4}selected{/if}>{$btr->general_canceled_order|escape}</option>
							</select>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-12">
							<select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option {if !$label}selected{/if} value="{url label=null}">{$btr->reportstats_all_orders|escape}</option>
								{foreach $labels as $l}
									<option value="{url label=$l->id}" {if $label->id==$l->id}selected{/if}>{$l->name}</option>
								{/foreach}
							</select>
						</div>
						<div class="col-lg-3 col-md-3 col-sm 12">
							<select onchange="location = this.value;" data-live-search="true" data-size="10" class="selectpicker">
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

					</div>
				</div>
			</div>
		</div>
	</div>

	{assign 'total_summ' 0}
	{assign 'total_amount' 0}
	<div class="turbo_list products_list fn_sort_list">
		{* Table head *}
		<div class="turbo_list_head">
			<div class="turbo_list_heading turbo_list_reportstats_categories">{$btr->general_date|escape}</div>
			<div class="turbo_list_heading turbo_list_reportstats_products">{$btr->general_name|escape}</div>
			<div class="turbo_list_heading turbo_list_reportstats_total">{$btr->general_sales_amount|escape}</div>
			<div class="turbo_list_heading turbo_list_reportstats_setting">{$btr->general_amount|escape}</div>
		</div>

		{* Item parameters *}
		<div class="turbo_list_body">
			{foreach $product_report as $prod_report}
				{assign 'total_summ' $total_summ+$prod_report->price}
				{assign 'total_amount' $total_amount+$prod_report->amount}
				<div class="turbo_list_body_item">
					<div class="turbo_list_row">
						<div class="turbo_list_boding turbo_list_reportstats_categories text_spacing">
							{$prod_report->date|date}
						</div>
						<div class="turbo_list_boding turbo_list_reportstats_products">
							<a title="{$prod_report->product_name|escape}" href="{url module=ProductAdmin id=$prod_report->product_id return=$smarty.server.REQUEST_URI}">{$prod_report->product_name}</a>
							{if $prod_report->variant_color || $prod_report->variant_name}<span class="text_spacing">{if $prod_report->variant_color}{$prod_report->variant_color|escape} / {/if} {$prod_report->variant_name}</span>{/if}
							<div class="hidden-md-up mt-q">
								<span class="text_dark text_600 text_spacing">
									<span class="hidden-xs-down">{$btr->general_sales_amount|escape}: </span>
									<span class="text_primary">
										{$prod_report->price} {$currency->sign|escape}
									</span>
								</span>
							</div>
						</div>

						<div class="turbo_list_boding turbo_list_reportstats_total text_spacing">
							{$prod_report->price} {$currency->sign|escape}
						</div>

						<div class="turbo_list_reportstats_setting text_spacing">
							{$prod_report->amount} {if $prod_report->units}{$prod_report->units|escape}{else}{$settings->units}{/if}
						</div>
					</div>
				</div>
			{/foreach}
		</div>
	</div>
	<div class="row mt-1">
		<div class="col-lg-12 col-md-12">
			<div class="text_dark text_500 text-xs-right mr-1 mt-h">
				<div class="h5">{$btr->general_total|escape} {$total_summ|string_format:'%.2f'} {$currency->sign|escape} <span class="text_grey">({$total_amount} {$btr->reportstats_units})</span></div>
			</div>
		</div>
	</div>
	<div class="col-lg-12 col-md-12 col-sm 12 txt_center">
		{include file='pagination.tpl'}
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="nested_boxed fn_toggle_wrap">
				<div class="toggle_body_wrap fn_card on">
					<div id="chart_cont" class="chart"></div>
				</div>
			</div>
		</div>
	</div>
</div>

{* On document load *}

{* Datetimepicker *}
{css id="datetimepicker" include=[
"turbo/design/js/datetimepicker/jquery.datetimepicker.css"
]}{/css}
{stylesheet minify=true}

{js id="datetimepicker" priority=99 include=[
"turbo/design/js/datetimepicker/jquery.datetimepicker.js"
]}{/js}
{javascript minify=true}

{* Loader *}
{js id="loader" priority=99 include=[
"turbo/design/js/loader.js"
]}{/js}
{javascript minify=true}

{literal}
	<script>
		$('.fn_from_date, .fn_to_date').datetimepicker({
			lang: '{/literal}{$settings->lang}{literal}',
			timepicker: false,
			format: 'd.m.Y'
		});
	</script>
{/literal}

{literal}
	<script>
		google.load("visualization", "1", {packages:["corechart"]});
		google.setOnLoadCallback(drawChart);

		function drawChart() {
			var data = google.visualization.arrayToDataTable([
			{/literal}
			['{$btr->general_date|escape}', '{$btr->general_sum|escape} {$currency->sign|escape}', '{$btr->general_amount|escape}'],
			{foreach $product_report_stat as $prod_report}      
				['{$prod_report->date|date}', {$prod_report->price}, {$prod_report->amount}],
			{/foreach}
			{literal}
			]);

			var options = {
				legend: {textStyle: {fontName: 'SF Pro Display', color: '#495057'}},
				colors: ['#4186ed', '#d9534f'],
				pieHole: 0.2,
				hAxis: {textStyle: {fontName: 'SF Pro Display', color: '#495057'}}, 
				vAxis: {minValue: 0, textStyle: {fontName: 'SF Pro Display', fontSize: 11, color: '#495057'}},
				tooltip: {textStyle: {fontName: 'SF Pro Display', color: '#495057'}},
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