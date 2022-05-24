{* Title *}
{$meta_title= $btr->blog_blog scope=global}

<div class="row">
    <div class="col-lg-7 col-md-7">
        <div class="wrap_heading">
            <div class="box_heading heading_page">
                {if $keyword && $posts_count}
                    {$btr->blog_blog|escape} - {$posts_count}
                {elseif $posts_count}
                    {$btr->blog_blog|escape} - {$posts_count}
                {/if}
            </div>
            <div class="box_btn_heading">
                <a class="btn btn_small btn-primary" href="{url module=PostAdmin return=$smarty.server.REQUEST_URI}">
                    {include file='svg_icon.tpl' svgId='plus'}
                    <span>{$btr->blog_add|escape}</span>
                </a>
            </div>
        </div>
    </div>
    <div class="col-md-12 col-lg-5 col-xs-12 float-xs-right">
        <div class="boxed_search">
            <form class="search" method="get">
                <input type="hidden" name="module" value="BlogAdmin">
                <div class="input-group">
                    <input name="keyword" class="form-control" placeholder="{$btr->blog_search|escape}" type="text" value="{$keyword|escape}">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary">{include file='svg_icon.tpl' svgId='search'} <span class="hidden-md-down"></span></button>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="boxed fn_toggle_wrap">
    {if $posts}
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <form class="fn_form_list" method="post">
                    <input type="hidden" name="session_id" value="{$smarty.session.id}">
                    <div class="post_wrap turbo_list">
                        <div class="turbo_list_head">
                            <div class="turbo_list_heading turbo_list_check">
                                <label class="form-check">
                                    <input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
                                </label>
                            </div>
                            <div class="turbo_list_heading turbo_list_photo">{$btr->general_photo|escape}</div>
                            <div class="turbo_list_heading turbo_list_blog_name">{$btr->blog_name|escape}</div>
                            <div class="turbo_list_heading turbo_list_status">{$btr->general_enable|escape}</div>
                            <div class="turbo_list_heading turbo_list_setting turbo_list_blog_setting">{$btr->general_activities|escape}</div>
                            <div class="turbo_list_heading turbo_list_close"></div>
                        </div>
                        <div class="turbo_list_body">
                            {foreach $posts as $post}
                                <div class="fn_row turbo_list_body_item">
                                    <div class="turbo_list_row">
                                        <div class="turbo_list_boding turbo_list_check">
                                            <label class="form-check">
                                                <input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$post->id}">
                                            </label>
                                        </div>
                                        <div class="turbo_list_boding turbo_list_photo">
                                            {if $post->image}
                                                <a href="{url module=PostAdmin id=$post->id return=$smarty.server.REQUEST_URI}">
                                                    <img src="{$post->image|resize_posts:45:45}" />
                                                </a>
                                            {else}
                                                <a href="{url module=PostAdmin id=$post->id return=$smarty.server.REQUEST_URI}">
                                                    <img width="35" src="design/images/no_image.svg" alt="{$post->name|escape}">
                                                </a>
                                            {/if}
                                        </div>
                                        <div class="turbo_list_boding turbo_list_blog_name">
                                            <a class="link" href="{url module=PostAdmin id=$post->id return=$smarty.server.REQUEST_URI}">{$post->name|escape}</a>
                                            <span class="text_grey">{$post->date|date}</span>
                                        </div>
                                        <div class="turbo_list_boding turbo_list_status">
                                            <div class="form-check form-switch">
                                                <input class="form-check-input fn_ajax_action {if $post->visible}fn_active_class{/if}" id="id_{$post->id}" data-module="blog" data-action="visible" data-id="{$post->id}" name="visible" value="1" type="checkbox" {if $post->visible}checked="" {/if}>
                                                <label class="form-check-label" for="id_{$post->id}"></label>
                                            </div>
                                        </div>
                                        <div class="turbo_list_setting turbo_list_blog_setting">
                                            {*open*}
                                            <a href="../{$lang_link}blog/{$post->url}" target="_blank" data-hint="{$btr->general_view|escape}" class="setting_icon setting_icon_open hint-bottom-middle-t-info-s-small-mobile  hint-anim">
                                                {include file='svg_icon.tpl' svgId='icon_desktop'}
                                            </a>
                                        </div>
                                        <div class="turbo_list_boding turbo_list_close">
                                            {*delete*}
                                            <button data-hint="{$btr->blog_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
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
                                        <option value="enable">{$btr->general_do_enable|escape}</option>
                                        <option value="disable">{$btr->general_do_disable|escape}</option>
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
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm 12 txt_center">
                {include file='pagination.tpl'}
            </div>
        </div>
    {else}
        <div class="heading_box mt-1">
            <div class="text_grey">{$btr->blog_no_post|escape}</div>
        </div>
    {/if}
</div>