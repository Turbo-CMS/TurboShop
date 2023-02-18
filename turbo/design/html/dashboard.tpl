{$meta_title=$btr->global_dashboard scope=global}

<h1 class="mb-3">{$btr->global_dashboard|escape}</h3>

<div class="row gx-2">
	<div class="col-12 col-md-6 col-xxl d-flex">
		<div class="card flex-fill">
			<div class="card-body">
				<div class="row">
					<div class="col mt-0">
						<h5 class="card-title">{$btr->global_orders|escape}</h5>
					</div>
					<div class="col-auto">
						<div class="stat text-primary">
							<i class="align-middle" data-feather="shopping-cart"></i>
						</div>
					</div>
				</div>
				<h2 class="mt-0 mb-1">{$new_orders_counter}</h2>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-xxl d-flex">
		<div class="card flex-fill">
			<div class="card-body">
				<div class="row">
					<div class="col mt-0">
						<h5 class="card-title">{$btr->global_comments|escape}</h5>
					</div>
					<div class="col-auto">
						<div class="stat text-primary">
							<i class="align-middle" data-feather="message-square"></i>
						</div>
					</div>
				</div>
				<h2 class="mt-0 mb-1">{$new_comments_counter}</h2>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-xxl d-flex">
		<div class="card flex-fill">
			<div class="card-body">
				<div class="row">
					<div class="col mt-0">
						<h5 class="card-title">{$btr->global_feedback|escape}</h5>
					</div>
					<div class="col-auto">
						<div class="stat text-primary">
							<i class="align-middle" data-feather="mail"></i>
						</div>
					</div>
				</div>
				<h2 class="mt-0 mb-1">{$new_feedbacks_counter}</h2>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-xxl d-flex">
		<div class="card flex-fill">
			<div class="card-body">
				<div class="row">
					<div class="col mt-0">
						<h5 class="card-title">{$btr->global_subscribes|escape}</h5>
					</div>
					<div class="col-auto">
						<div class="stat text-primary">
							<i class="align-middle" data-feather="at-sign"></i>
						</div>
					</div>
				</div>
				<h2 class="mt-0 mb-1">{$new_subscribes_counter}</h2>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-xxl d-flex d-none d-xxl-flex">
		<div class="card flex-fill">
			<div class="card-body">
				<div class="row">
					<div class="col mt-0">
						<h5 class="card-title">{$btr->global_callback|escape}</h5>
					</div>
					<div class="col-auto">
						<div class="stat text-primary">
							<i class="align-middle" data-feather="phone"></i>
						</div>
					</div>
				</div>
				<h2 class="mt-0 mb-1">{$new_callbacks_counter}</h2>
			</div>
		</div>
	</div>
</div>

<div class="row gx-2">
	<div class="col-12 col-lg-6 d-flex">
		<div class="card flex-fill w-100">
			<div class="card-header">
				<div class="card-actions float-end">
					<div class="d-block d-lg-none position-relative collapse-icon">
						<a href="javascript:;" class="collapse-chevron">
							<i class="align-middle" data-feather="chevron-down"></i>
						</a>
					</div>
				</div>
				<h5 class="card-title mb-0">{$btr->stats_orders|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<div id="containerStat"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-lg-6 d-flex">
		<div class="card flex-fill w-100">
			<div class="card-header">
				<div class="card-actions float-end">
					<div class="d-block d-lg-none position-relative collapse-icon">
						<a href="javascript:;" class="collapse-chevron">
							<i class="align-middle" data-feather="chevron-down"></i>
						</a>
					</div>
				</div>
				<h5 class="card-title mb-0">{$btr->sales_statistics|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<div id="containerSales"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row gx-2">
	<div class="col-12 col-lg-6 d-flex">
		<div class="card flex-fill w-100">
			<div class="card-header">
				<div class="card-actions float-end">
					<div class="d-block d-lg-none position-relative collapse-icon">
						<a href="javascript:;" class="collapse-chevron">
							<i class="align-middle" data-feather="chevron-down"></i>
						</a>
					</div>
				</div>
				<h5 class="card-title mb-0">{$btr->stat_orders_number|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<div id="containerOrders" class="chart mb-3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-lg-6 d-flex">
		<div class="card flex-fill w-100">
			<div class="card-header">
				<div class="card-actions float-end">
					<div class="d-block d-lg-none position-relative collapse-icon">
						<a href="javascript:;" class="collapse-chevron">
							<i class="align-middle" data-feather="chevron-down"></i>
						</a>
					</div>
				</div>
				<h5 class="card-title mb-0">{$btr->stat_orders_amount|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<div id="containerAmount" class="chart mb-3"></div>
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

{* Highcharts *}
{js id="highcharts" priority=99 include=[
	"turbo/design/js/highcharts/highcharts.js"
]}{/js}
{javascript minify=true}

{if $settings->admin_theme == "dark"}
	{literal}
		<script>
			var chart;

			// Orders statistics
			$(function() {
				var options = {
					exporting: {
						chartOptions: { // specific options for the exported image
							plotOptions: {
								series: {
									dataLabels: {
										enabled: true
									}
								}
							}
						},
						fallbackToExportServer: false
					},
					chart: {
						zoomType: 'x',
						renderTo: 'containerStat',
						defaultSeriesType: 'area',
						type: "line"
					},
					title: {
						text: ''
					},
					xAxis: {
						type: 'datetime',
						minRange: 7 * 24 * 3600000,
						maxZoom: 7 * 24 * 3600000,
						gridLineWidth: 1,
						gridLineColor: '#19222d',
						tickColor: '#19222d',
						ordinal: true,
						showEmpty: false
					},
					yAxis: {
						title: {
							text: '{/literal}{$currency->name}{literal}'
						},
						gridLineColor: '#19222d'
					},
					plotOptions: {
						line: {
							dataLabels: {
								enabled: true
							},
							enableMouseTracking: true,
							connectNulls: false
						},
						area: {
							marker: {
								enabled: false
							},
						},
						series: {
							dataLabels: {
								color: '#fff',
							},
						}
					},
					series: []
				};
				$.get('ajax/stat/stat.php', function(data) {
					var series = {
						data: []
					};
					var minDate = Date.UTC(data[0].year, data[0].month - 1, data[0].day),
						maxDate = Date.UTC(data[data.length - 1].year, data[data.length - 1].month - 1, data[data.length - 1].day);
					var newDates = [],
						currentDate = minDate,
						d;
					while (currentDate <= maxDate) {
						d = new Date(currentDate);
						newDates.push((d.getMonth() + 1) + '/' + d.getDate() + '/' + d.getFullYear());
						currentDate += (24 * 60 * 60 * 1000); // add one day
					}
					series.name = '{/literal}{$btr->stats_orders_amount|escape}{literal}' + '{/literal}{$currency->sign}{literal}';
					// Iterate over the lines and add categories or series
					$.each(data, function(lineNo, line) {
						series.data.push([Date.UTC(line.year, line.month - 1, line.day), parseInt(line.y)]);
					});
					//
					options.series.push(series);
					// Create the chart
					var chart = new Highcharts.Chart(options);
				});
			});

			// Sales statistics
			$(function() {
				var options = {
					chart: {
						renderTo: 'containerSales',
						defaultSeriesType: 'column',
						zoomType: 'x'
					},
					title: {
						text: ''
					},
					subtitle: {
						text: ''
					},
					xAxis: {
						type: 'datetime'
					},
					yAxis: {
						title: {
							text: '{/literal}{$currency->name}{literal}'
						}
					},
					yAxis: {
						gridLineColor: '#19222d'
					},
					plotOptions: {
						column: {
							borderWidth: 0,
							enableMouseTracking: true
						}
					},
					series: []
				};
				$.get('ajax/stat/stat_sales.php', function(data) {
					var series = { data: [] };
					var series0 = { data: [] };
					var series1 = { data: [] };
					series.name = '{/literal}{$btr->sum_of_all_orders|escape}, {$currency->sign}{literal}';
					series0.name = '{/literal}{$btr->amount_unpaid|escape}, {$currency->sign}{literal}';
					series1.name = '{/literal}{$btr->amount_paid|escape}, {$currency->sign}{literal}';
					d = new Date();
					for (i = 0; i < 31; i++) {
						series.data.push([Date.UTC(1900 + d.getYear(), d.getMonth(), d.getDate()), 0]);
						series0.data.push([Date.UTC(1900 + d.getYear(), d.getMonth(), d.getDate()), 0]);
						series1.data.push([Date.UTC(1900 + d.getYear(), d.getMonth(), d.getDate()), 0]);
					}
					// Iterate over the lines and add categories or series
					$.each(data, function(lineNo, line) {
						series.data.push([Date.UTC(line.year, line.month - 1, line.day), parseInt(line.x)]);
						series0.data.push([Date.UTC(line.year, line.month - 1, line.day), parseInt(line.y)]);
						series1.data.push([Date.UTC(line.year, line.month - 1, line.day), parseInt(line.z)]);
					});
					options.series.push(series);
					options.series.push(series0);
					options.series.push(series1);
					console.log(options.series);
					// Create the chart
					var chart = new Highcharts.Chart(options);
				});
			});

			Highcharts.theme = {
				colors: ['#3b7ddd', '#fcb92c', '#1cbb8c', '#7798BF', '#aaeeee', '#ff0066', '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
				chart: {
					backgroundColor: null,
					style: {
						fontFamily: 'Inter'
					}
				},

				tooltip: {
					shadow: false
				},
				legend: {
					itemStyle: {
						fontWeight: 'normal',
						fontSize: '13px',
						color: '#a7abb1'
					},
					itemHoverStyle: {
						color: '#a7abb1'
					},
					itemHiddenStyle: {
						color: '#5d6670'
					}
				},
				xAxis: {
					gridLineWidth: 1,
					gridLineColor: '#19222d',
					tickColor: '#19222d',
					lineColor: '#19222d',
					labels: {
						style: {
							fontSize: '12px',
							color: '#a7abb1',
						}
					}
				},
				yAxis: {
					labels: {
						style: {
							color: "#a7abb1"
						}
					},
					title: {
						style: {
							fontSize: '12px',
							textTransform: 'none',
							color: '#a7abb1'
						}
					}

				},
				plotOptions: {
					candlestick: {
						lineColor: '#404048'
					}
				},
				// General
				background2: '#f0f0ea'
			};
			// Apply the theme
			var highchartsOptions = Highcharts.setOptions(Highcharts.theme);

			google.load("visualization", "1", {packages:["corechart"]});

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
					legend: { position: "bottom", textStyle: {fontName: 'Inter', color: '#a7abb1'}},
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
					legend: { position: "bottom", textStyle: {fontName: 'Inter', color: '#a7abb1'}},
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
		</script>
	{/literal}
{else}
	{literal}
		<script>
			var chart;

			// Orders statistics
			$(function() {
				var options = {
					exporting: {
						chartOptions: { // specific options for the exported image
							plotOptions: {
								series: {
									dataLabels: {
										enabled: true
									}
								}
							}
						},
						fallbackToExportServer: false
					},
					chart: {
						zoomType: 'x',
						renderTo: 'containerStat',
						defaultSeriesType: 'area',
						type: "line"
					},
					title: {
						text: ''
					},
					xAxis: {
						type: 'datetime',
						minRange: 7 * 24 * 3600000,
						maxZoom: 7 * 24 * 3600000,
						gridLineWidth: 1,
						ordinal: true,
						showEmpty: false
					},
					yAxis: {
						title: {
							text: '{/literal}{$currency->name}{literal}'
						}
					},
					plotOptions: {
						line: {
							dataLabels: {
								enabled: true
							},
							enableMouseTracking: true,
							connectNulls: false
						},
						area: {
							marker: {
								enabled: false
							},
						}
					},
					series: []
				};
				$.get('ajax/stat/stat.php', function(data) {
					var series = {
						data: []
					};
					var minDate = Date.UTC(data[0].year, data[0].month - 1, data[0].day),
						maxDate = Date.UTC(data[data.length - 1].year, data[data.length - 1].month - 1, data[data.length - 1].day);
					var newDates = [],
						currentDate = minDate,
						d;
					while (currentDate <= maxDate) {
						d = new Date(currentDate);
						newDates.push((d.getMonth() + 1) + '/' + d.getDate() + '/' + d.getFullYear());
						currentDate += (24 * 60 * 60 * 1000); // add one day
					}
					series.name = '{/literal}{$btr->stats_orders_amount|escape}{literal}' + '{/literal}{$currency->sign}{literal}';
					// Iterate over the lines and add categories or series
					$.each(data, function(lineNo, line) {
						series.data.push([Date.UTC(line.year, line.month - 1, line.day), parseInt(line.y)]);
					});
					//
					options.series.push(series);
					// Create the chart
					var chart = new Highcharts.Chart(options);
				});
			});

			// Sales statistics
			$(function() {
				var options = {
					chart: {
						renderTo: 'containerSales',
						defaultSeriesType: 'column',
						zoomType: 'x'
					},
					title: {
						text: ''
					},
					subtitle: {
						text: ''
					},
					xAxis: {
						type: 'datetime'
					},
					yAxis: {
						title: {
							text: '{/literal}{$currency->name}{literal}'
						}
					},
					plotOptions: {
						column: {
							borderWidth: 0,
							enableMouseTracking: true
						}
					},
					series: []
				};
				$.get('ajax/stat/stat_sales.php', function(data) {
					var series = { data: [] };
					var series0 = { data: [] };
					var series1 = { data: [] };
					series.name = '{/literal}{$btr->sum_of_all_orders|escape}, {$currency->sign}{literal}';
					series0.name = '{/literal}{$btr->amount_unpaid|escape}, {$currency->sign}{literal}';
					series1.name = '{/literal}{$btr->amount_paid|escape}, {$currency->sign}{literal}';
					d = new Date();
					for (i = 0; i < 31; i++) {
						series.data.push([Date.UTC(1900 + d.getYear(), d.getMonth(), d.getDate()), 0]);
						series0.data.push([Date.UTC(1900 + d.getYear(), d.getMonth(), d.getDate()), 0]);
						series1.data.push([Date.UTC(1900 + d.getYear(), d.getMonth(), d.getDate()), 0]);
					}
					// Iterate over the lines and add categories or series
					$.each(data, function(lineNo, line) {
						series.data.push([Date.UTC(line.year, line.month - 1, line.day), parseInt(line.x)]);
						series0.data.push([Date.UTC(line.year, line.month - 1, line.day), parseInt(line.y)]);
						series1.data.push([Date.UTC(line.year, line.month - 1, line.day), parseInt(line.z)]);
					});
					options.series.push(series);
					options.series.push(series0);
					options.series.push(series1);
					console.log(options.series);
					// Create the chart
					var chart = new Highcharts.Chart(options);
				});
			});

			Highcharts.theme = {
				colors: ['#3b7ddd', '#fcb92c', '#1cbb8c', '#7798BF', '#aaeeee', '#ff0066', '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
				chart: {
					backgroundColor: null,
					style: {
						fontFamily: 'Inter'
					}
				},
				tooltip: {
					shadow: false
				},
				legend: {
					itemStyle: {
						fontWeight: 'normal',
						fontSize: '13px',
						color: '#6c757d'
					},
					itemHoverStyle: {
						color: '#6c757d'
					},
				},
				xAxis: {
					gridLineWidth: 1,
					labels: {
						style: {
							fontSize: '12px',
							color: '#6c757d'
						}
					}
				},
				yAxis: {
					labels: {
						style: {
							color: "#6c757d"
						}
					},
					title: {
						style: {
							fontSize: '12px',
							textTransform: 'none',
							color: '#6c757d'
						}
					}
				},
				plotOptions: {
					candlestick: {
						lineColor: '#404048'
					}
				},
				// General
				background2: '#f0f0ea'
			};
			// Apply the theme
			var highchartsOptions = Highcharts.setOptions(Highcharts.theme);

			google.load("visualization", "1", {packages:["corechart"]});

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
		</script>
	{/literal}
{/if}