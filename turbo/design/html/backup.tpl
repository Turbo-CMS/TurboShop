{* Title *}
{$meta_title=$btr->general_backup scope=global}

<div class="row">
    <div class="col-lg-7 col-md-7">
        <div class="wrap_heading">
            <div class="box_heading heading_page">
                {$btr->general_backup|escape}
            </div>
            <div class="box_btn_heading">
                <a class="btn btn_small btn-primary" href="">
                    {include file='svg_icon.tpl' svgId='plus'}
                    <span>{$btr->create_backup|escape}</span>
                </a>
                <form id="hidden" method="post">
                    <input type="hidden" name="session_id" value="{$smarty.session.id}">
                    <input type="hidden" name="action" value="">
                    <input type="hidden" name="name" value="">
                </form>
            </div>
        </div>
    </div>
</div>

<div class="boxed fn_toggle_wrap">
    {if $backups}
        <form method="post" class="fn_form_list">
            <input type="hidden" name="session_id" value="{$smarty.session.id}">
            <div class="turbo_list products_list fn_sort_list">
                <div class="turbo_list_head">
                    <div class="turbo_list_heading turbo_list_check">
                        <label class="form-check">
                            <input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
                        </label>
                    </div>
                    <div class="turbo_list_heading turbo_list_backup_name">{$btr->general_backup|escape}</div>
                    <div class="turbo_list_heading turbo_list_setting turbo_list_backup_setting">{$btr->general_activities|escape}</div>
                    <div class="turbo_list_heading turbo_list_backup_close"></div>
                </div>
                <div class="turbo_list_body sortable">
                    {foreach $backups as $backup}
                        <div class="fn_row turbo_list_body_item fn_sort_item">
                            <div class="turbo_list_row ">
                                <div class="turbo_list_boding turbo_list_check">
                                    <label class="form-check">
                                        <input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$backup->name}">
                                    </label>
                                </div>

                                <div class="turbo_list_boding turbo_list_backup_name">
                                    <a href="files/backup/{$backup->name}">
                                        {$backup->name}
                                    </a>
                                    ({if $backup->size>1024*1024}{($backup->size/1024/1024)|round:2} {$btr->general_mb|escape}{else}{($backup->size/1024)|round:2} {$btr->general_kb|escape}{/if})
                                </div>

                                <div class="turbo_list_boding turbo_list_setting turbo_list_backup_setting">
                                    <a href="#" data-hint="{$btr->restore_backup|escape}" class="restore hint-bottom-middle-t-info-s-small-mobile hint-anim">
                                        {include file='svg_icon.tpl' svgId='rotate_cw'}
                                    </a>
                                </div>

                                <div class="turbo_list_boding turbo_list_close turbo_list_backup_close">
                                    {*delete*}
                                    <button data-hint="{$btr->general_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
                                        {include file='svg_icon.tpl' svgId='delete'}
                                    </button>
                                </div>
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
    {else}
        <div class="heading_box mt-1">
            <div class="text_grey">{$btr->no_backups|escape}</div>
        </div>
    {/if}
</div>

<a data-toggle="modal" data-target="#fn_restore_backup" class="hidden"></a>

<div id="fn_restore_backup" class="modal fade show" role="document">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="card-header">
                <div class="heading_modal">{$btr->index_confirm|escape}</div>
            </div>
            <div class="modal-body">
                <button type="submit" class="btn btn_small btn-success fn_restore_confirm mx-h">
                    {include file='svg_icon.tpl' svgId='checked'}
                    <span>{$btr->index_yes|escape}</span>
                </button>

                <button type="button" class="btn btn_small btn-danger fn_restore_dismiss mx-h" data-dismiss="modal">
                    {include file='svg_icon.tpl' svgId='close'}
                    <span>{$btr->index_no|escape}</span>
                </button>
            </div>
        </div>
    </div>
</div>

{literal}
    <script>
        $(function() {

            // Reestablish 
            $("a.restore").click(function() {
                file = $(this).closest(".fn_row").find('[name*="check"]').val();
                $('form#hidden input[name="action"]').val('restore');
                $('form#hidden input[name="name"]').val(file);
                $('form#hidden').submit();
                return false;
            });

            // Create backup 
            $("a.btn-primary").click(function() {
                $('form#hidden input[name="action"]').val('create');
                $('form#hidden').submit();
                return false;
            });

            // Подтвердили 
            $(document).on("click", ".fn_restore_confirm", function() {
                confirm = false;
                $('form#hidden').submit();
            });

            // Отменили
            $(document).on("click", ".fn_restore_dismiss", function() {
                return false;
            });

            $("form#hidden").submit(function() {
                if ($('input[name="action"]').val() == 'restore' && confirm) {
                    $('[data-target="#fn_restore_backup"]').trigger('click');
                    return false;
                }
            });

        });
    </script>
{/literal}