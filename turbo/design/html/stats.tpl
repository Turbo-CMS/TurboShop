{$meta_title=$btr->global_stats scope=global}

<h1 class="mb-3">
	{$btr->global_stats|escape}
</h1>

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
	<div class="collapse-card boxed-sorting">
		<div class="card-body">
			<div class="row">
				<div class="col-12">
					<form method="get">
						<input type="hidden" name="module" value="StatsAdmin">
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
							<div class="col-sm-12 col-md-4 col-lg-4 mb-3">
								<button class="btn btn-primary" type="submit"><i class="align-middle" data-feather="check"></i> {$btr->global_apply|escape}</button>
							</div>
						</div>
					</form>
					<div class="row">
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3 mb-md-0">
							<select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option {if !$smarty.get.status}selected{/if} value="{url status=null}">{$btr->reportstats_all_statuses|escape}</option>
								<option value="{url module=StatsAdmin status=1 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==1}selected{/if}>{$btr->global_new_order|escape}</option>
								<option value="{url module=StatsAdmin status=2 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==2}selected{/if}>{$btr->global_accepted_order|escape}</option>
								<option value="{url module=StatsAdmin status=3 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==3}selected{/if}>{$btr->global_closed_order|escape}</option>
								<option value="{url module=StatsAdmin status=4 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==4}selected{/if}>{$btr->global_canceled_order|escape}</option>
							</select>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3 mb-md-0">
							<select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option {if !$label}selected{/if} value="{url label=null}">{$btr->reportstats_all_orders|escape}</option>
								{foreach $labels as $l}
									<option value="{url keyword=null id=null page=null from_date=null to_date=null label={$l->id}}" {if $label->id==$l->id}selected{/if}>{$l->name}</option>
								{/foreach}
							</select>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 mb-3 mb-md-0">
							<select onchange="location = this.value;" data-live-search="true" data-size="15" class="selectpicker">
								<option {if $date_filter == all}selected{/if} value="{url date_filter=all date_to=null date_from=null filter_check=null}">{$btr->reportstats_all_orders|escape}</option>
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
</div>
<div class="row gx-2">
	<div class="col-12 col-lg-6">
		<div class="card">
			<div class="card-header">
				<div class="card-actions float-end">
					<div class="d-block d-lg-none position-relative collapse-icon">
						<a href="javascript:;" class="collapse-chevron">
							<i class="align-middle" data-feather="chevron-up"></i>
						</a>
					</div>
				</div>
				<h5 class="card-title mb-0">{$btr->stat_orders_amount|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<div id="containerAmount" class="chart chart-xl"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-lg-6">
		<div class="card">
			<div class="card-header">
				<div class="card-actions float-end">
					<div class="d-block d-lg-none position-relative collapse-icon">
						<a href="javascript:;" class="collapse-chevron">
							<i class="align-middle" data-feather="chevron-up"></i>
						</a>
					</div>
				</div>
				<h5 class="card-title mb-0">{$btr->stat_orders_number|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<div id="containerOrders" class="chart chart-xl"></div>
				</div>
			</div>
		</div>
	</div>
</div>

{* Loader *}
{js id="loader" priority=99 include=[
	"turbo/design/js/loader.js"
	]}{/js}
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

			// Statistics on the amount of orders
			google.setOnLoadCallback(drawChart);

			function drawChart() {
				var serie = [];
				serie.push([{/literal}'{$btr->global_date|escape}', '{$btr->global_new_order|escape}, {$currency->sign|escape}', '{$btr->global_accepted_order|escape}, {$currency->sign|escape}', '{$btr->global_closed_order|escape}, {$currency->sign|escape}', '{$btr->global_canceled_order|escape}, {$currency->sign|escape}'{literal}]); 
			{/literal}
			{foreach $stat as $s}
				serie.push(['{$s.title}', {$s.new}, {$s.confirm}, {$s.complite}, {$s.delete}]);
			{/foreach}
			{literal}
				var options = {
					legend: {position: "bottom", textStyle: {fontName: 'Inter', color: '#a7abb1'}},
					bar: {groupWidth: '90%'},
					colors: ['#3b7ddd', '#fcb92c', '#1cbb8c', '#dc3545'],
					hAxis: {textStyle: {fontName: 'Inter', color: '#a7abb1'}},
					vAxis: {minValue: 0, textStyle: {fontName: 'Inter', fontSize: 11, color: '#a7abb1'}, gridlines: {color: '#19222d'}, baselineColor:'#19222d'},
					tooltip: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					backgroundColor: '#222e3c',
					isStacked: true
				};
				var chart = new google.visualization.ColumnChart(document.getElementById('containerAmount'));
				chart.draw(google.visualization.arrayToDataTable(serie), options);
			}

			// Statistics on the number of orders
			google.setOnLoadCallback(drawChartOrders);

			function drawChartOrders() {
				var serie = [];
				serie.push([{/literal}'{$btr->global_date|escape}', '{$btr->global_new_order|escape}', '{$btr->global_accepted_order|escape}', '{$btr->global_closed_order|escape}', '{$btr->global_canceled_order|escape}'{literal}]); 
			{/literal}
			{foreach $stat_orders as $s}
				serie.push(['{$s.title}', {$s.new}, {$s.confirm}, {$s.complite}, {$s.delete}]); 
			{/foreach}
			{literal}
				var options = {
					legend: {position: "bottom", textStyle: {fontName: 'Inter', color: '#a7abb1'}},
					bar: {groupWidth: '90%'},
					colors: ['#3b7ddd', '#fcb92c', '#1cbb8c', '#dc3545'],
					hAxis: {textStyle: {fontName: 'Inter', color: '#a7abb1'}},
					vAxis: {minValue: 0, textStyle: {fontName: 'Inter', fontSize: 11, color: '#a7abb1'}, gridlines: {color: '#19222d'}, baselineColor:'#19222d'},
					tooltip: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					backgroundColor: '#222e3c',
					isStacked: true
				};
				var chart = new google.visualization.ColumnChart(document.getElementById('containerOrders'));
				chart.draw(google.visualization.arrayToDataTable(serie), options);
			}
		</script>
	{/literal}
{else}
	{literal}
		<script>
			google.load("visualization", "1", {packages:["corechart"]});

			// Statistics on the amount of orders
			google.setOnLoadCallback(drawChart);

			function drawChart() {
				var serie = [];
				serie.push([{/literal}'{$btr->global_date|escape}', '{$btr->global_new_order|escape}, {$currency->sign|escape}', '{$btr->global_accepted_order|escape}, {$currency->sign|escape}', '{$btr->global_closed_order|escape}, {$currency->sign|escape}', '{$btr->global_canceled_order|escape}, {$currency->sign|escape}'{literal}]); 
			{/literal}
			{foreach $stat as $s}
				serie.push(['{$s.title}', {$s.new}, {$s.confirm}, {$s.complite}, {$s.delete}]);
			{/foreach}
			{literal}
				var options = {
					legend: { position: "bottom", textStyle: {fontName: 'Inter', color: '#6c757d'}},
					bar: {groupWidth: '90%'},
					colors: ['#3b7ddd', '#fcb92c', '#1cbb8c', '#dc3545'],
					hAxis: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					vAxis: {minValue: 0, textStyle: {fontName: 'Inter', fontSize: 11, color: '#6c757d'}},
					tooltip: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					backgroundColor: '#fff',
					isStacked: true
				};
				var chart = new google.visualization.ColumnChart(document.getElementById('containerAmount'));
				chart.draw(google.visualization.arrayToDataTable(serie), options);
			}

			// Statistics on the number of orders
			google.setOnLoadCallback(drawChartOrders);

			function drawChartOrders() {
				var serie = [];
				serie.push([{/literal}'{$btr->global_date|escape}', '{$btr->global_new_order|escape}', '{$btr->global_accepted_order|escape}', '{$btr->global_closed_order|escape}', '{$btr->global_canceled_order|escape}'{literal}]); 
			{/literal}
			{foreach $stat_orders as $s}
				serie.push(['{$s.title}', {$s.new}, {$s.confirm}, {$s.complite}, {$s.delete}]); 
			{/foreach}
			{literal}
				var options = {
					legend: { position: "bottom", textStyle: {fontName: 'Inter', color: '#6c757d'}},
					bar: {groupWidth: '90%'},
					colors: ['#3b7ddd', '#fcb92c', '#1cbb8c', '#dc3545'],
					hAxis: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					vAxis: {minValue: 0, textStyle: {fontName: 'Inter', fontSize: 11, color: '#6c757d'}},
					tooltip: {textStyle: {fontName: 'Inter', color: '#6c757d'}},
					backgroundColor: '#fff',
					isStacked: true
				};
				var chart = new google.visualization.ColumnChart(document.getElementById('containerOrders'));
				chart.draw(google.visualization.arrayToDataTable(serie), options);
			}
		</script>
	{/literal}
{/if}