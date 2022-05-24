{* Title *}
{$meta_title=$btr->translations_translate scope=global}

{*Page name*}
<div class="row">
    <div class="col-lg-7 col-md-7">
        <div class="wrap_heading">
            <div class="box_heading heading_page">
                {$btr->translations_translate|escape}
            </div>
            {if !$locked_theme}
                <div class="box_btn_heading">
                    <a class="btn btn_small btn-primary" href="{url module=TranslationAdmin return=$smarty.server.REQUEST_URI}">
                        {include file='svg_icon.tpl' svgId='plus'}
                        <span>{$btr->translations_add|escape}</span>
                    </a>
                </div>
            {/if}
        </div>
    </div>
    <div class="col-md-12 col-lg-5 col-xs-12 float-xs-right">
        <div class="boxed_search">
            <form class="search" method="get">
                <input type="hidden" name="module" value="TranslationsAdmin">
                <div class="input-group">
                    <input name="keyword" class="form-control" placeholder="{$btr->translations_search|escape}" type="text" value="{$keyword|escape}">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary">{include file='svg_icon.tpl' svgId='search'} <span class="hidden-md-down"></span></button>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>

{if $locked_theme}
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="boxed boxed_warning">
                <div class="">
                    {$btr->general_protected|escape}
                </div>
            </div>
        </div>
    </div>
{/if}

{*Main page form*}
<div class="boxed fn_toggle_wrap">
    {if $translations}
        <form class="fn_form_list" method="post">
            <input type="hidden" name="session_id" value="{$smarty.session.id}">

            <div class="translation_wrap turbo_list products_list fn_sort_list">
                <div class="turbo_list_head">
                    <div class="turbo_list_heading turbo_list_check">
                        <label class="form-check">
                            <input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
                        </label>
                    </div>
                    <div class="turbo_list_heading turbo_list_translations_num">
                        <span>№</span>
                    </div>
                    <div class="turbo_list_heading turbo_list_translations_name">
                        <span>{$btr->translations_translation|escape}</span>
                        {if $sort == 'lang_asc'}
                            <a href="{url sort=lang_desc}" class="lang_desc selected">{include file='svg_icon.tpl' svgId='sorts'}</a>
                        {elseif $sort == 'lang_desc'}
                            <a href="{url sort=lang_asc}" class="lang_asc selected">{include file='svg_icon.tpl' svgId='sorts'}</a>
                        {else}
                            <a href="{url sort=lang_desc}">{include file='svg_icon.tpl' svgId='sorts'}</a>
                        {/if}
                    </div>
                    <div class="turbo_list_heading turbo_list_translations_variable">
                        <span>{$btr->translations_var|escape}</span>
                        {if $sort == 'label_asc'}
                            <a href="{url sort=label_desc}" class="label_desc selected">{include file='svg_icon.tpl' svgId='sorts'}</a>
                        {elseif $sort == 'label_desc'}
                            <a href="{url sort=label_asc}" class="label_asc selected">{include file='svg_icon.tpl' svgId='sorts'}</a>
                        {else}
                            <a href="{url sort=label_desc}">{include file='svg_icon.tpl' svgId='sorts'}</a>
                        {/if}
                    </div>
                    <div class="turbo_list_heading turbo_list_close"></div>
                </div>

                {*Element parameters*}
                <div class="turbo_list_body">
                    {foreach $translations as $translation}
                        <div class="fn_row turbo_list_body_item fn_sort_item" {if !$translations_template[$label]} title="{$btr->translations_system_translation}" {/if}>
                            <div class="turbo_list_row ">
                                <div class="turbo_list_boding turbo_list_check">
                                    <label class="form-check">
                                        <input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$translation->id}">
                                    </label>
                                </div>
                                <div class="turbo_list_heading turbo_list_translations_num">№ {$translation@iteration}</div>
                                <div class="turbo_list_boding turbo_list_translations_name">
                                    <a href="{url module=TranslationAdmin id=$translation->id return=$smarty.server.REQUEST_URI}">{$translation->lang_{$lang_label}|escape}</a>
                                </div>
                                <div class="turbo_list_boding  turbo_list_translations_variable">
                                    <a href="{url module=TranslationAdmin id=$translation->id return=$smarty.server.REQUEST_URI}">{$translation->label|escape}</a>
                                </div>
                                <div class="turbo_list_boding turbo_list_close">
                                    {if !$locked_theme}
                                        <button data-hint="{$btr->general_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
                                            {include file='svg_icon.tpl' svgId='delete'}
                                        </button>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
                {if !$locked_theme}
                    {*Block of Mass Actions*}
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
                        <button id="apply_action" type="submit" class="btn btn_small btn-primary">
                            {include file='svg_icon.tpl' svgId='checked'}
                            <span>{$btr->general_apply|escape}</span>
                        </button>
                    </div>
                {/if}
            </div>
        </form>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm 12 txt_center">
                {include file='pagination.tpl'}
            </div>
        </div>
    {else}
        <div class="heading_box mt-1">
            <div class="text_grey">{$btr->translations_no|escape}</div>
        </div>
    {/if}
</div>