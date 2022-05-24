{if $payment_method->id}
    {$meta_title = $payment_method->name scope=global}
{else}
    {$meta_title = $btr->payment_method_new scope=global}
{/if}

<div class="row">
    <div class="col-lg-7 col-md-7">
        {if !$payment_method->id}
            <div class="heading_page">{$btr->payment_method_add|escape}</div>
        {else}
            <div class="heading_page">{$payment_method->name|escape}</div>
        {/if}
    </div>
    <div class="col-lg-7 col-md-7 text-xs-right float-xs-right"></div>
</div>

{if $message_success}
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="boxed boxed_success">
                <div class="heading_box">
                    {if $message_success == 'added'}
                        {$btr->payment_method_added|escape}
                    {elseif $message_success == 'updated'}
                        {$btr->payment_method_updated|escape}
                    {else}
                        {$message_success|escape}
                    {/if}
                    {if $smarty.get.return}
                        <a class="btn btn_return float-xs-right" href="{$smarty.get.return}">
                            {include file='svg_icon.tpl' svgId='return'}
                            <span>{$btr->general_back|escape}</span>
                        </a>
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/if}

{if $message_error}
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="boxed boxed_warning">
                <div class="heading_box">
                    {if $message_error=='empty_name'}
                        {$btr->general_enter_title|escape}
                    {else}
                        {$message_error|escape}
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/if}

<form method="post" enctype="multipart/form-data" class="fn_fast_button">
    <input type="hidden" name="session_id" value="{$smarty.session.id}">

    <div class="row">
        <div class="col-xs-12">
            <div class="boxed">
                <div class="row d_flex">
                    <div class="col-lg-10 col-md-9 col-sm-12">
                        <div class="heading_label">
                            {$btr->general_name|escape}
                        </div>
                        <div class="form-group">
                            <input class="form-control mb-h" name="name" type="text" value="{$payment_method->name|escape}" />
                            <input name="id" type="hidden" value="{$payment_method->id|escape}" />
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-12">
                        <div class="activity_of_switch">
                            <div class="activity_of_switch_item">
                                <div class="turbo_switch clearfix">
                                    <label class="switch_label">{$btr->general_enable|escape}</label>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" id="enabled_checkbox" name="enabled" value="1" type="checkbox" {if $payment_method->enabled}checked="" {/if}>
                                        <label class="form-check-label" for="enabled_checkbox"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="boxed fn_toggle_wrap min_height_230px">
                <div class="heading_box">
                    {$btr->payment_method_settings|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 toggle_body_wrap on fn_card">
                        <div class="row">
                            <div class="col-lg-6 pr-0">
                                <div class="form-group clearfix">
                                    <div class="heading_label">{$btr->payment_method_type|escape}</div>
                                    <select name="module" class="selectpicker">
                                        <option value='null'>{$btr->payment_method_manual|escape}</option>
                                        {foreach $payment_modules as $payment_module}
                                            <option value="{$payment_module@key|escape}" {if $payment_method->module == $payment_module@key}selected{/if}>{$payment_module->name|escape}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group clearfix">
                                    <div class="heading_label">{$btr->general_currency|escape}</div>
                                    <select name="currency_id" class="selectpicker">
                                        {foreach $currencies as $currency}
                                            <option value="{$currency->id}" {if $currency->id==$payment_method->currency_id}selected{/if}>{$currency->name|escape}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                {foreach $payment_modules as $payment_module}
                                    <div class="row fn_module_settings" {if $payment_module@key!=$payment_method->module}style="display:none;" {/if} module="{$payment_module@key}">
                                        <div class="col-lg-12 col-md-12 heading_box">{$payment_module->name|escape}</div>
                                        {foreach $payment_module->settings as $setting}
                                            {$variable_name = $setting->variable}
                                            {if !empty($setting->options) && $setting->options|@count>1}
                                                <div class="col-lg-6">
                                                    <div class="form-group clearfix">
                                                        <div class="heading_label">{$setting->name|escape}</div>
                                                        <div class="">
                                                            <select name="payment_settings[{$setting->variable}]" class="selectpicker">
                                                                {foreach $setting->options as $option}
                                                                    <option value="{$option->value}" {if $option->value==$payment_settings[$setting->variable]}selected{/if}>{$option->name|escape}</option>
                                                                {/foreach}
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            {elseif !empty($setting->options) && $setting->options|@count==1}
                                                {$option = $setting->options|@first}
                                                <div class="col-lg-6">
                                                    <div class="form-group clearfix">
                                                        <div class="boxes_inline">
                                                            <label class="form-check">
                                                                <input class="form-check-input fn_check_all_single" type="checkbox" name="payment_settings[{$setting->variable}]" value="{$option->value|escape}" {if $option->value==$payment_settings[$setting->variable]}checked{/if} id="{$setting->variable}">
                                                            </label>
                                                        </div>
                                                        <div class="heading_label boxes_inline" for="{$setting->variable}">{$setting->name|escape}</div>
                                                    </div>
                                                </div>
                                            {else}
                                                <div class="col-lg-6">
                                                    <div class="form-group clearfix">
                                                        <div class="heading_label" for="{$setting->variable}">{$setting->name|escape}</div>
                                                        <div class="">
                                                            <input name="payment_settings[{$setting->variable}]" class="form-control" type="text" value="{$payment_settings[$setting->variable]|escape}" id="{$setting->variable}" />
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                        {/foreach}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="boxed fn_toggle_wrap">
                <div class="heading_box">
                    {$btr->payment_method_shipping|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="row wrap_payment_item">
                        {foreach $deliveries as $delivery}
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <div class="payment_item">
                                    <label class="form-check {if in_array($delivery->id, $payment_deliveries)}active_payment{/if}">
                                        <input class="form-check-input" value="{$delivery->id}" type="checkbox" name="payment_deliveries[]" {if in_array($delivery->id, $payment_deliveries)}checked{/if}>
                                        <span class="form-check-label payment_name_wrap">{$delivery->name|escape}</span>
                                    </label>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="boxed match fn_toggle_wrap tabs">
                <div class="heading_box">
                    {$btr->payment_method_description|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="tab_container">
                        <div id="tab1" class="tab">
                            <textarea name="description" class="editor_small">{$payment_method->description|escape}</textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 mt-1">
                        <button type="submit" class="btn btn_small btn-primary float-md-right">
                            {include file='svg_icon.tpl' svgId='checked'}
                            <span>{$btr->general_apply|escape}</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

{* We connect Tiny MCE *}
{include file='tinymce_init_2.tpl'}
{* On document load *}
{literal}
    <script>
        $(function() {
            $('div.fn_module_settings').filter(':hidden').find("input, select, textarea").attr("disabled", true);

            $('select[name=module]').on('change', function() {
                $('div.fn_module_settings').hide().find("input, select, textarea").attr("disabled", true);
                $('div.fn_module_settings[module=' + $(this).val() + ']').show().find("input, select, textarea").attr("disabled", false);
                $('div.fn_module_settings[module=' + $(this).val() + ']').find('select').selectpicker('refresh');
            });
        });
    </script>
{/literal}