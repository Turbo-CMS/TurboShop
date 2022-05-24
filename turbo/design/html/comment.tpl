{* Title *}
{$meta_title=$btr->general_comment scope=global}

<div class="row">
    <div class="col-lg-12 col-md-12">
        <div class="wrap_heading">
            <div class="box_heading heading_page">
                {$btr->edit_comment|escape}
            </div>
        </div>
    </div>
    <div class="col-md-12 col-lg-12 col-sm-12 float-xs-right"></div>
</div>

{if $message_success}
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="boxed boxed_success">
                <div class="heading_box">
                    {if $message_success == 'updated'}
                        {$btr->comment_updated|escape}
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
                    {$message_error|escape}
                </div>
            </div>
        </div>
    </div>
{/if}

<form method=post enctype="multipart/form-data" class="fn_fast_button">
    <input type="hidden" name="session_id" value="{$smarty.session.id}" />

    <div class="row">
        <div class="col-xs-12 ">
            <div class="boxed match_matchHeight_true">
                <div class="row d_flex">
                    <div class="col-lg-10 col-md-9 col-sm-12">
                        <div class="heading_label">
                            {$btr->index_name|escape}
                        </div>
                        <div class="form-group">
                            <input class="form-control" name="name" type="text" value="{$comment->name|escape}" />
                            <input name=id type="hidden" value="{$comment->id|escape}" />
                            <input name="type" type="hidden" value="{$comment->type}" />
                            <input name=object_id type="hidden" value="{$comment->object_id|escape}" />
                            <input name=parent_id type="hidden" value="{$comment->parent_id|escape}" />
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-12">
                        <div class="activity_of_switch">
                            <div class="activity_of_switch_item">
                                <div class="turbo_switch clearfix">
                                    <label class="switch_label">{$btr->email_comments_approved|escape}</label>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" id="approved_checkbox" name="approved" value="1" type="checkbox" {if $comment->approved}checked="" {/if}>
                                        <label class="form-check-label" for="approved_checkbox"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="activity_of_switch_item">
                                <div class="turbo_switch clearfix">
                                    <label class="switch_label">{$btr->comment_from_admin|escape}</label>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" id="admin_checkbox" name="admin" value="1" type="checkbox" {if $comment->admin}checked="" {/if}>
                                        <label class="form-check-label" for="admin_checkbox"></label>
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
        <div class="col-lg-12 col-md-12 pr-0">
            <div class="boxed fn_toggle_wrap">
                <div class="heading_box">
                    {$btr->settings_general_options|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 toggle_body_wrap on fn_card">
                        <div class="row">
                            <div class="col-md-4">
                                <div>
                                    <div class="heading_label">{$btr->general_date|escape}</div>
                                    <div class="">
                                        <input name="date" class="form-control" type="text" value="{$comment->date|date}" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div>
                                    <div class="heading_label">{$btr->support_time|escape}</div>
                                    <div class="">
                                        <input name="time" class="form-control" type="text" value="{$comment->date|time}" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div>
                                    <div class="heading_label">IP</div>
                                    <div class="">
                                        <input name="ip" class="form-control" type="text" value="{$comment->ip}" />
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
            <div class="boxed match fn_toggle_wrap tabs min_height_210px">
                <div class="heading_box">
                    {$btr->general_comment|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="tab_container">
                        <div id="tab1" class="tab">
                            <textarea name="text" class="form-control comment_textarea">{$comment->text|escape}</textarea>
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
<!-- Main form (The End) -->

{* On document load *}
<link rel="stylesheet" type="text/css" href="design/js/datetimepicker/jquery.datetimepicker.css" />
<script src="design/js/datetimepicker/jquery.datetimepicker.js"></script>
{literal}
    <script>
        $(window).on("load", function() {
            $('input[name="date"]').datetimepicker({
                lang: '{/literal}{$settings->lang}{literal}',
                timepicker: false,
                format: 'd.m.Y'
            });
        });
    </script>
{/literal}