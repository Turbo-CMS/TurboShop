{$meta_title=$btr->yml_import_global scope=global}

{*Название страницы*}
<div class="row">
    <div class="col-lg-7 col-md-7">
        <div class="heading_page">
            {$btr->yml_import_global|escape}
        </div>
    </div>
</div>

<div id="import_error" class="boxed boxed_warning" style="display: none;"></div>

{*Вывод ошибок*}
{if $message_error}
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="boxed boxed_warning">
                <div class="">
                    {if $message_error == 'no_permission'}
                        {$btr->general_permissions|escape} {$import_files_dir|escape}
                    {elseif $message_error == 'convert_error'}
                        {$btr->import_utf|escape}
                    {elseif $message_error == 'locale_error'}
                        {$btr->import_locale|escape} {$locale|escape} {$btr->import_not_correctly|escape}
                    {elseif $message_error == 'upload_error'}
                        {$btr->upload_error|escape}
                    {elseif $message_error == 'download_error'}
                        {$btr->general_error|escape}
                    {else}
                        {$message_error|escape}
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/if}

{if $message_error != 'no_permission'}
    {if $filename_yml}
        {if $filename_csv}
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="boxed fn_toggle_wrap ">
                        <div class="heading_box boxes_inline">
                            {if $filename_csv}{$btr->import_file|escape} {$filename_csv|escape}{/if} {if $filename_csv_size}({$filename_csv_size|escape}){/if}
                        </div>
                        <div class="mt-1">
                            <div id='progressbar'></div>
                        </div>
                        <ul id='import_result'></ul>
                    </div>
                </div>
            </div>
        {/if}
        {if $yml_params}
            <div class="boxed fn_toggle_wrap">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <form method="post" enctype="multipart/form-data">
                            <input type="hidden" name="session_id" value="{$smarty.session.id}">
                            <input type="hidden" name="start_import_yml" value="1">
                            <div class="heading_box">
                                {if $filename_yml}{$btr->import_file|escape} {$filename_yml|escape}{/if} {if $filename_yml_size}({$filename_yml_size|escape}){/if}
                                <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                                    <a class="btn-minimize" href="javascript:;"><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                                </div>
                            </div>
                            <div class="toggle_body_wrap on fn_card">
                                <div class="turbo_list mt-1">
                                    <div class="turbo_list_head">
                                        <div class="col-lg-6 col-md-6"><b>{$btr->import_yml_columns|escape}</b></div>
                                        <div class="col-lg-6 col-md-6">
                                            <div class="hidden-xs-down hidden-md-down">
                                                <a href="javascript:;" class="btn btn_small btn-info fn_skip_all">{$btr->import_skip_all}</a>
                                                <a href="javascript:;" class="btn btn_small btn-info fn_new_all">{$btr->import_new_all}</a>
                                            </div>
                                        </div>
                                    </div>
                                    {foreach $yml_params as $pkey=>$pvalue}
                                        <div class="row mt-2">
                                            <div class="col-lg-6 col-md-6 mb-h">
                                                <div class="push-lg-4 col-lg-6 text-xs-left col-sm-12">
                                                    {$pkey|replace:'param_':''|replace:'#':''}
                                                </div>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-12">
                                                <div class="push-lg-4 col-lg-6 text-xs-left col-sm-12">
                                                    <select class="selectpicker fn_select" data-live-search="true" name="yml_params[{$pkey}]">
                                                        <optgroup label="{$btr->import_additional}">
                                                            <option id="import_skip" data-content="<span class='text_warning'>{$btr->import_skip}</span>" value="">{$btr->import_skip}</option>
                                                            <option id="import_new_feature" data-content="<span class='text_green'>{$btr->import_new_feature}</span>" value="{$pkey}">{$btr->import_new_feature}</option>
                                                        </optgroup>
                                                        <optgroup label="{$btr->import_main_fields}">
                                                            {foreach $columns as $k=>$f}
                                                                <option value="{$k}" {if $columns_compared[$pkey] == $k} selected{/if}>{$btr->get_translation('import_field_'|cat:$f)}</option>
                                                            {/foreach}
                                                        </optgroup>
                                                        <optgroup label="{$btr->import_shop_features}">
                                                            {foreach $features as $f}
                                                                <option value="{$f}" {if $pkey == $f}selected{elseif $pkey == "param_`$f`"}selected{/if}>{$f}</option>
                                                            {/foreach}
                                                        </optgroup>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                    <div class="import_list_footer"></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-lg-4 col-sm-12 mt-2 mb-1">
                                        <select class="selectpicker" name="convert_only">
                                            <option value="0">{$btr->import_do_import|escape} YML</option>
                                            <option value="1">{$btr->convert_yml_file_to_csv|escape}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4 col-lg-4 col-sm-12 mt-2 mb-1">
                                        <select class="selectpicker" name="yml_import_currency">
                                            {foreach $yml_currencies as $k=>$c}
                                                <option value="{$c['id']}">{$c['id']} ({$c['rate']})</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="col-md-4 col-lg-4 col-sm-12 mt-2 mb-1 mobile_text_right">
                                        <button type="submit" class="btn btn_small btn_green float-md-right">
                                            <i class="fa fa-upload"></i>
                                            <span>{$btr->import_do_import}</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        {/if}
    {/if}
    {if !$filename_yml_size}
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="boxed fn_toggle_wrap">
                    <div class="heading_box">
                        {$btr->import_download|escape}
                        <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                            <a class="btn-minimize" href="javascript:;"><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                        </div>
                    </div>
                    <div class="toggle_body_wrap on fn_card">
                        <form method="post" id="product" enctype="multipart/form-data">
                            <input type="hidden" name="session_id" value="{$smarty.session.id}">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="text_warning">
                                        <div class="heading_normal text_warning">
                                            <span class="text_warning">{$btr->import_backup|escape}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="text_primary">
                                        <div class="heading_normal text_primary">
                                            <span class="text_primary">
                                                {$btr->supported_formats|escape}: xml, xml.gz.
                                                {$btr->import_maxsize|escape}
                                                {if $config->max_upload_filesize>1024*1024}
                                                    {$config->max_upload_filesize/1024/1024|round:'2'} {$btr->general_mb|escape}
                                                {else}
                                                    {$config->max_upload_filesize/1024|round:'2'} {$btr->general_kb|escape}
                                                {/if}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
								<div class="col-lg-5 col-md-6 col-sm-12 my-h">
									<div class="heading_label">{$btr->download_local_computer|escape}</div>
									<div class="input_file_container">
										<input name="file" class="file_upload input_file" id="my-file" type="file">
										<label tabindex="0" for="my-file" class="input_file_trigger">
											<svg width="20" height="17" viewBox="0 0 20 17"><path fill="currentcolor" d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
											<span>{$btr->general_select_file|escape}</span>
										</label>
									</div>
									<p class="input_file_return"></p>
								</div>
                            </div>
                            <div class="row">
                                <div class="col-md-7 col-lg-7 col-sm-12 mb-h">
                                    <div class="heading_label">{$btr->link_to_yml|escape}</div>
                                    <input name="file_url" class="form-control" type="text" value="" />
                                </div>
                                <div class="col-md-3 col-sm-3 col-lg-3 col-sm-12 float-sm-right mt-2">
                                    <button type="submit" class="btn btn_small btn_green float-md-right"><i class="fa fa-upload"></i>&nbsp;{$btr->import_to_download|escape}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    {elseif $filename_yml_size && !$filename_csv_size && !$yml_params}
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="boxed fn_toggle_wrap">
                    <div class="heading_box">
                        {if $filename_yml}{$btr->import_file|escape} {$filename_yml|escape}{/if} {if $filename_yml_size}({$filename_yml_size|escape}){/if}
                        {if $filename_csv}{$btr->import_file|escape} {$filename_csv|escape}{/if} {if $filename_csv_size}({$filename_csv_size|escape}){/if}
                        <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                            <a class="btn-minimize" href="javascript:;"><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                        </div>
                    </div>
                    <div class="toggle_body_wrap on fn_card">
                        <form method="post" enctype="multipart/form-data">
                            <input type="hidden" name="session_id" value="{$smarty.session.id}">
                            <input type="hidden" name="file_fields" value="{$filename_yml}" />
                            <button type="submit" class="btn btn_small btn-info">{$btr->read_field_names|escape}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    {/if}
{/if}

<script src="{$config->root_url}/turbo/design/js/piecon/piecon.js"></script>
<script>
    {if $filename_csv && !$convert_only}
        {literal}
            var in_process = false;
            var count = 1;
            // On document load
            $(function() {
                Piecon.setOptions({fallback: 'force'});
                Piecon.setProgress(0);
                $("#progressbar").progressbar({ value: 1 });
                in_process = true;
                do_import();
            });

            function do_import(from) {
                from = typeof(from) != 'undefined' ? from : 0;
                $.ajax({
                    url: "ajax/import_yml.php",
                    data: {from:from},
                    dataType: 'json',
                    success: function(data) {
                        Piecon.setProgress(Math.round(100 * data.from / data.totalsize * 100) / 100);
                        $("#progressbar").progressbar({ value: 100 * data.from / data.totalsize });
                        $("ul#import_result").text('{/literal}{$btr->progress_global|escape}{literal}: ' + Math.round(data.from / 1024) + ' {/literal}{$btr->of_global|escape}{literal} ' + Math.round(data.totalsize / 1024) + ' {/literal}{$btr->general_kb|escape}{literal}.');
                        if (data != false && !data.end) {
                            do_import(data.from);
                        } else {
                            Piecon.setProgress(100);
                            $("#progressbar").hide('fast');
                            $("ul#import_result").append(' <span class="text_success">{/literal}{$btr->general_success|escape}{literal}!</span>');
                            in_process = false;
                        }
                    },
                    error: function(xhr, status, errorThrown) {
                        alert(errorThrown + '\n' + xhr.responseText);
                    }
                });
            }
        {/literal}
    {/if}
    {literal}
        $('.fn_skip_all').click(function() {
            $('.fn_select #import_skip').prop('selected', true);
            $('.fn_select').selectpicker('refresh');
        });
        $('.fn_new_all').click(function() {
            $('.fn_select').find('#import_skip').remove();
            $('.fn_select #import_new_feature').after('<option id="import_skip" data-content="<span class=&quot;text_warning&quot;>{/literal}{$btr->import_skip}{literal}</span>" value="">{/literal}{$btr->import_skip}{literal}</option>');
            $('.fn_select').selectpicker('refresh');
        });
    {/literal}
</script>
{literal}
    <style>
        .ui-progressbar-value {
            background-color: #b4defc;
            background-image: url(design/images/progress.gif);
            background-position: left;
        }

        #progressbar {
            clear: both;
            height: 18px;
        }

        #result {
            clear: both;
            width: 100%;
        }

        .ui-progressbar .ui-progressbar-value {margin: 0px; height: 100%;}
		.ui-widget.ui-widget-content {background: #eef2f4; border: none;}
    </style>
{/literal}