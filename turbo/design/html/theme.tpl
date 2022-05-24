{if $theme->name}
    {$meta_title = "`$btr->general_theme` {$theme->name}" scope=global}
{/if}

<div class="row">
    <div class="col-lg-10 col-md-10">
        <div class="wrap_heading">
            <div class="box_heading heading_page">
                {$btr->theme_current|escape} &mdash; {$theme->name}
            </div>
            <div class="box_btn_heading">
                <a class="fn_clone_theme btn btn_small btn-primary" href="/">
                    {include file='svg_icon.tpl' svgId='plus'}
                    <span>{$btr->theme_copy|escape} {$settings->theme}</span>
                </a>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-lg-2 col-sm-12 float-xs-right"></div>
</div>

{if $theme->locked}
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="boxed boxed_warning">
                <div class="">
                    {$btr->theme_close|escape}
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
                    {if $message_error == 'permissions'}
                        {$btr->general_permissionse|escape} {$themes_dir}
                    {elseif $message_error == 'name_exists'}
                        {$btr->theme_exists|escape}
                    {else}
                        {$message_error|escape}
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/if}

<div class="boxed fn_toggle_wrap">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <form method="post" enctype="multipart/form-data">
                <input type="hidden" name="session_id" value="{$smarty.session.id}">
                <input type="hidden" name="action">
                <input type="hidden" name="theme">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="heading_box">
                            {$btr->theme_themes|escape}
                            <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                                <a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
                            </div>
                        </div>
                        <div class="toggle_body_wrap fn_card on">
                            <div class="row">
                                {foreach $themes as $t}
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <div class="banner_card">
                                            <div class="banner_card_header img_bnr_c_head">
                                                <input type="text" class="hidden" name="old_name[]" value="{$t->name|escape}">
                                                <div class="form-group col-lg-9 col-md-8 px-0 fn_rename_value hidden mb-0">
                                                    <input type="text" class="form-control" name="new_name[]" value="{$t->name|escape}">
                                                </div>
                                                <span class="theme_active_span font-weight-bold">{$t->name|escape|truncate:20:'...'} {if  $t->name == $theme->name}<span class="text_success">- {$btr->theme_current_item|escape}</span>{/if}</span>
                                                {if  !$t->locked}
                                                    <i class="pencil-icon fn_rename_theme rename_theme p-h" data-old_name="{$t->name|escape}"></i>
                                                    <button data-theme_name="{$t->name|escape}" type="button" class="btn_close float-xs-right fn_remove_theme" data-toggle="modal" data-target="#fn_delete_theme">
                                                        {include file='svg_icon.tpl' svgId='delete'}
                                                    </button>
                                                {else}
                                                    <button type="button" class="btn_close float-xs-right fn_remove_theme locked">
                                                        {include file='svg_icon.tpl' svgId='lock'}
                                                    </button>
                                                {/if}
                                            </div>
                                            <div class="banner_card_block">
                                                <div class="theme_block_image" style="position:relative;">
                                                    <img class="{if $theme->name != $t->name}gray_filter{/if}" width="" src='{$root_dir}../design/{$t->name}/preview.png'>
                                                    {if $theme->name != $t->name}
                                                        <button style="position:absolute; bottom:0px; right:0px;" class="fn_set_theme btn btn_small btn-primary" data-set_name="{$t->name|escape}">
                                                            {include file='svg_icon.tpl' svgId='checked'}
                                                            <span>{$btr->general_select|escape}</span>
                                                        </button>
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <button type="submit" name="save" class="btn btn_small btn-primary fn_chek_all float-md-right ">
                            {include file='svg_icon.tpl' svgId='checked'}
                            <span>{$btr->general_apply|escape}</span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="fn_delete_theme" class="modal fade show" role="document">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="card-header">
                <div class="heading_modal">{$btr->index_confirm|escape}</div>
            </div>
            <div class="modal-body">
                <button type="submit" class="btn btn_small btn-success fn_submit_delete mx-h">
                    {include file='svg_icon.tpl' svgId='checked'}
                    <span>{$btr->index_yes|escape}</span>
                </button>
                <button type="button" class="btn btn_small btn-danger fn_dismiss_delete mx-h" data-dismiss="modal">
                    {include file='svg_icon.tpl' svgId='close'}
                    <span>{$btr->index_no|escape}</span>
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    {literal}
        $(function() {

            $('.fn_rename_theme').on('click', function() {
                $(this).parent().find('.fn_rename_value').toggleClass('hidden');
                $(this).prev().toggleClass('hidden');
                $(this).parent().find('.fn_set_theme').toggleClass('opacity_toggle');
                $(this).parent().find('.fn_rename_value > input').val($(this).data('old_name'))
            });

            $('.fn_set_theme').on('click', function() {
                $("input[name=action]").val('set_main_theme');
                $("input[name=theme]").val($(this).data('set_name'));
                $("form").submit();
            });

            // Clone the current theme
            $('.fn_clone_theme').on('click', function(e) {
                e.preventDefault();
                $("input[name=action]").val('clone_theme');
                $("form").submit();
            });

            $(".fn_remove_theme").on("click", function() {
                action = "delete_theme";
                theme_name = $(this).data("theme_name");
            });

            $(".fn_submit_delete").on("click", function() {
                $("form input[name=action]").val(action);
                $("form input[name=theme]").val(theme_name);
                $("form").submit();
            });

            $(".fn_dismiss_delete").on("click", function() {
                $("form input[name=action]").val("");
                $("form input[name=theme]").val("");
            });

        });
    {/literal}
</script>