{$meta_title=$btr->stats_stats scope=global}

{* Page title *}
<div class="row">
    <div class="col-lg-7 col-md-7">
        <div class="wrap_heading">
            <div class="box_heading heading_page">
                {$btr->stats_stats|escape}
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
                                    <input type="hidden" name="module" value="StatsAdmin">
                                    <input type="hidden" name="date_filter" value="">

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
                            <select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
                                <option {if !$smarty.get.status}selected{/if} value="{url status=null}">{$btr->reportstats_all_statuses|escape}</option>
                                <option value="{url module=StatsAdmin status=1 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==1}selected{/if}>{$btr->general_new_order|escape}</option>
                                <option value="{url module=StatsAdmin status=2 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==2}selected{/if}>{$btr->general_accepted_order|escape}</option>
                                <option value="{url module=StatsAdmin status=3 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==3}selected{/if}>{$btr->general_closed_order|escape}</option>
                                <option value="{url module=StatsAdmin status=4 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==4}selected{/if}>{$btr->general_canceled_order|escape}</option>
                            </select>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12">
                            <select class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
                                <option {if !$label}selected{/if} value="{url label=null}">{$btr->reportstats_all_orders|escape}</option>
                                {foreach $labels as $l}
                                    <option value="{url keyword=null id=null page=null from_date=null to_date=null label={$l->id}}" {if $label->id==$l->id}selected{/if}>{$l->name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm 12">
                            <select onchange="location = this.value;" data-live-search="true" data-size="10" class="selectpicker">
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

    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="nested_boxed fn_toggle_wrap">
                <div class="toggle_body_wrap fn_card on">
                    <div id="containerAmount" class="chart"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 pr-0">
            <div class="nested_boxed fn_toggle_wrap">
                <div class="toggle_body_wrap fn_card on">
                    <div id="containerOrders" class="chart"></div>
                </div>
            </div>
        </div>
    </div>

</div>

{* On document load *}
<link rel="stylesheet" type="text/css" href="design/js/datetimepicker/jquery.datetimepicker.css" />
<script src="design/js/datetimepicker/jquery.datetimepicker.js"></script>
<script src="design/js/loader.js" type="text/javascript"></script>

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

        // Statistics on the amount of orders
        google.setOnLoadCallback(drawChart);

        function drawChart() {
            var serie = [];
            serie.push([{/literal}'{$btr->general_date|escape}', '{$btr->general_new_order|escape}, {$currency->sign|escape}', '{$btr->general_accepted_order|escape}, {$currency->sign|escape}', '{$btr->general_closed_order|escape}, {$currency->sign|escape}', '{$btr->general_canceled_order|escape}, {$currency->sign|escape}'{literal}]); 
        {/literal}
        {foreach $stat as $s}
            serie.push(['{$s.title}', {$s.new}, {$s.confirm}, {$s.complite}, {$s.delete}]);
        {/foreach}
        {literal}
            var options = {
                legend: {position: "bottom", textStyle: {fontName: 'SF Pro Display', color: '#495057'}},
                colors: ['#3b82ec', '#f0ad4e', '#4bbf73', '#d9534f'],
                bar: {groupWidth: '90%'},
                hAxis: {textStyle: {fontName: 'SF Pro Display', color: '#495057'}},
                vAxis: {minValue: 0, textStyle: {fontName: 'SF Pro Display', fontSize: 11, color: '#495057'}}, 
                tooltip: {textStyle: {fontName: 'SF Pro Display', color: '#495057'}},
                backgroundColor: '#fff',
                title: '{/literal}{$btr->stat_orders_amount|escape}{literal}',
                isStacked: true, 
                titleTextStyle: {fontName: 'SF Pro Display', fontSize: '18', bold: true, color: '#495057'}
            };
            var chart = new google.visualization.ColumnChart(document.getElementById('containerAmount'));
            chart.draw(google.visualization.arrayToDataTable(serie), options);
        }

        // Statistics on the number of orders
        google.setOnLoadCallback(drawChartOrders);

        function drawChartOrders() {
            var serie = [];
            serie.push([{/literal}'{$btr->general_date|escape}', '{$btr->general_new_order|escape}', '{$btr->general_accepted_order|escape}', '{$btr->general_closed_order|escape}', '{$btr->general_canceled_order|escape}'{literal}]); 
        {/literal}
        {foreach $stat_orders as $s}
            serie.push(['{$s.title}', {$s.new}, {$s.confirm}, {$s.complite}, {$s.delete}]); 
        {/foreach}
        {literal}
            var options = {
                legend: {position: "bottom", textStyle: {fontName: 'SF Pro Display', color: '#495057'}},
                colors: ['#3b82ec', '#f0ad4e', '#4bbf73', '#d9534f'],
                bar: {groupWidth: '90%'},
                hAxis: {textStyle: {fontName: 'SF Pro Display', color: '#495057'}}, 
                vAxis: {minValue: 0, textStyle: {fontName: 'SF Pro Display', fontSize: 11, color: '#495057'}},
                tooltip: {textStyle: {fontName: 'SF Pro Display', color: '#495057'}},
                backgroundColor: '#fff',
                title: '{/literal}{$btr->stat_orders_number|escape}{literal}',
                isStacked: true,
                titleTextStyle: {fontName: 'SF Pro Display', fontSize: '18', bold: true, color: '#495057'}
            };
            var chart = new google.visualization.ColumnChart(document.getElementById('containerOrders'));
            chart.draw(google.visualization.arrayToDataTable(serie), options);
        }

        $(window).resize(function() {
            drawChartOrders();
            drawChart();
        });
    </script>
{/literal}