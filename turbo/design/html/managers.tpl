{* Title *}
{$meta_title=$btr->managers_managers scope=global}

<div class="row">
    <div class="col-lg-7 col-md-7">
        <div class="wrap_heading">
            <div class="box_heading heading_page">
                {$btr->managers_managers|escape} - {$managers_count}
            </div>
            <div class="box_btn_heading">
                <a class="btn btn_small btn-primary" href="{url module=ManagerAdmin}">
                    {include file='svg_icon.tpl' svgId='plus'}
                    <span>{$btr->managers_add|escape}</span>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="boxed fn_toggle_wrap">
    {if $managers}
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <form method="post" class="fn_form_list">
                    <input type="hidden" name="session_id" value="{$smarty.session.id}">

                    <div class="managers_wrap turbo_list">
                        <div class="turbo_list_head">
                            <div class="turbo_list_heading turbo_list_check">
                                <label class="form-check">
                                    <input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
                                </label>
                            </div>
                            <div class="turbo_list_heading turbo_list_manager_name">{$btr->general_name|escape}</div>
                            <div class="turbo_list_heading turbo_list_close"></div>
                        </div>

                        <div class="turbo_list_body">
                            {foreach $managers as $m}
                                <div class="fn_row turbo_list_body_item body_narrow">
                                    <div class="turbo_list_row narrow">
                                        <div class="turbo_list_boding turbo_list_check">
                                            <label class="form-check">
                                                <input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$m->login|escape}">
                                            </label>
                                        </div>

                                        <div class="turbo_list_boding turbo_list_manager_name">
                                            <a class="link" href="index.php?module=ManagerAdmin&login={$m->login|urlencode}">
                                                {$m->login|escape}
                                            </a>
                                        </div>

                                        {if $manager->login != $m->login}
                                            <div class="turbo_list_boding turbo_list_close">
                                                {*delete*}
                                                <button data-hint="{$btr->managers_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
                                                    {include file='svg_icon.tpl' svgId='delete'}
                                                </button>
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                            {/foreach}
                        </div>

                        <div class="turbo_list_footer fn_action_block">
                            <div class="turbo_list_foot_left">
                                <div class="turbo_list_heading turbo_list_check">
                                    <label class="form-check">
                                        <input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
                                    </label>
                                </div>
                                <div class="turbo_list_option">
                                    <select name="action" class="selectpicker">
                                        <option value="delete">{$btr->general_delete|escape}</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn_small btn-primary">
                                {include file='svg_icon.tpl' svgId='checked'}
                                <span>{$btr->general_apply|escape}</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    {else}
        <div class="heading_box mt-1">
            <div class="text_grey">{$btr->managers_no|escape}</div>
        </div>
    {/if}
</div>