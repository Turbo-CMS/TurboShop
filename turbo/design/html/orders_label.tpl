{if $label->id}
    {$meta_title = $label->name scope=global}
{else}
    {$meta_title =$btr->orders_new_label scope=global}
{/if}

<div class="row">
    <div class="col-lg-6 col-md-6">
        <div class="heading_page">
            {if $label->id}
                {$btr->orders_label|escape}: {$label->name|escape}
            {else}
                {$btr->orders_new_label|escape}
            {/if}
        </div>
    </div>
    <div class="col-lg-4 col-md-3 text-xs-right float-xs-right"></div>
</div>

{if $message_success}
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="boxed boxed_success">
                <div class="heading_box">
                    {if $message_success == 'added'}
                        {$btr->orders_added_label|escape}
                    {elseif $message_success == 'updated'}
                        {$btr->orders_updated_label|escape}
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

<div class="boxed fn_toggle_wrap">
    <div class="toggle_body_wrap on fn_card">
        <form class="fn_form_list" enctype="multipart/form-data" method="post">
            <input type="hidden" name="session_id" value="{$smarty.session.id}">
            <div class="row">
                <div class="col-xs-12">
                    <div class="row d_flex">
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="heading_label">
                                {$btr->general_name|escape}
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="name" type="text" value="{$label->name|escape}" />
                                <input name="id" type="hidden" value="{$label->id|escape}" />
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <div class="heading_label">
                                {$btr->general_color|escape}
                            </div>
                            <div class="form-group">
                                <div id="cp" class="input-group colorpicker-component">
                                    <input type="text" name="color" value="{$label->color|escape}" class="form-control" />
                                    <span class="input-group-addon"><i></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 mt-1">
                    <button type="submit" value="labels" class="btn btn_small btn-primary float-md-right">
                        {include file='svg_icon.tpl' svgId='checked'}
                        <span>{$btr->general_apply|escape}</span>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
{* On document load *}
{literal}
    <link rel="stylesheet" media="screen" type="text/css" href="design/js/colorpicker/css/bootstrap-colorpicker.min.css" />
    <script type="text/javascript" src="design/js/colorpicker/js/bootstrap-colorpicker.min.js"></script>
    <script>
        $(function() {
            $('#cp').colorpicker();
        });
    </script>
{/literal}