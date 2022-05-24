{if $m->login}
    {$meta_title = $m->login scope=global}
{else}
    {$meta_title = $btr->manager_new scope=global}
{/if}

<div class="row">
    <div class="col-lg-7 col-md-7">
        {if $m->login}
            <div class="heading_page">{$m->login|escape}</div>
        {else}
            <div class="heading_page">{$btr->manager_add|escape}</div>
        {/if}
    </div>
    <div class="col-lg-4 col-md-3 text-xs-right float-xs-right"></div>
</div>

{if $message_success}
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="boxed boxed_success">
                <div class="heading_box">
                    {if $message_success=='added'}
                        {$btr->manager_added|escape}
                    {elseif $message_success=='updated'}
                        {$btr->manager_updated|escape}
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
                    {if $message_error=='login_exists'}
                        {$btr->manager_exists|escape}
                    {elseif $message_error=='empty_login'}
                        {$btr->manager_enter_login|escape}
                    {elseif $message_error=='not_writable'}
                        {$btr->manager_not_writable|escape}
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
        <div class="col-lg-12 col-md-12">
            <div class="boxed fn_toggle_wrap">
                <div class="heading_box">
                    {$btr->manager_basic|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="mb-1">
                        <div class="heading_label">{$btr->manager_login|escape}</div>
                        <div class="">
                            <input class="form-control" name="login" autocomplete="off" type="text" value="{$m->login|escape}" />
                            <input name="old_login" type="hidden" value="{$m->login|escape}" />
                            <input name="id" type="hidden" value="{$m->id|escape}" />
                        </div>
                    </div>
                    <div class="mb-1">
                        <div class="heading_label">{$btr->manager_pass|escape}</div>
                        <div class="">
                            <input class="form-control" autocomplete="off" name="password" type="password" value="" placeholder="••••••" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {$perms = [
		'dashboard'  => $btr->dashboard_global,
		'products'   => $btr->general_products,
		'categories' => $btr->general_categories,
		'brands'     => $btr->brands_brands,
		'features'   => $btr->general_features,
		'orders'     => $btr->general_orders,
		'labels'     => $btr->left_labels_title,
		'users'      => $btr->left_users,
		'groups'     => $btr->left_groups_title,
		'coupons'    => $btr->left_coupons_title,
		'pages'      => $btr->left_pages,
		'menus'      => $btr->menus_menu,
		'blog'       => $btr->left_blog,
		'articles'   => $btr->left_articles_title,
		'comments'   => $btr->general_comments,
		'feedbacks'  => $btr->general_feedback,
		'callbacks'  => $btr->callbacks_requests,
		'subscribes' => $btr->subscribe_mailing_subscribes,
		'faq'        => $btr->left_faq_title,
		'import'     => $btr->left_import_title,
		'export'     => $btr->left_export_title,
		'backup'     => $btr->general_backup,
		'clear'      => $btr->left_clear_title,
		'stats'      => $btr->left_stats,
		'design'     => $btr->left_design,
		'banners'    => $btr->left_banners,
        'seo'        => $btr->left_seo,
		'settings'   => $btr->left_settings,
		'currency'   => $btr->left_currency_title,
		'delivery'   => $btr->general_shipping,
		'payment'    => $btr->order_payment_selected,
		'managers'   => $btr->left_managers_title,
        'languages'  => $btr->left_languages_title
	]}
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="boxed fn_toggle_wrap min_height_230px">
                <div class="heading_box">
                    {$btr->manager_rights|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
                    </div>
                    <span class="font_14 text_600">{$btr->manager_all_access|escape}</span>
                    <div class="form-check form-switch manager">
                        <input class="form-check-input fn_all_perms" id="fn_all_perms" value="" type="checkbox">
                        <label class="form-check-label" for="fn_all_perms"></label>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    {foreach $perms as $title=>$items}
                        <div class="permission_block">
                            <div class="permission_boxes row">
                                {foreach $items as $key=>$item}
                                    <div class="col-xl-3 col-lg-4 col-md-6 {if $m->login==$manager->login}text-muted{/if}">
                                        <div class="permission_box">
                                            <span>{$item|escape}</span>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input fn_item_perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if $m->permissions && in_array($title, $m->permissions)}checked{/if} {if $m->login==$manager->login}disabled{/if} />
                                                <label class="form-check-label" for="{$title}"></label>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                        <div class="col-xs-12 clearfix"></div>
                    {/foreach}
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 ">
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
<script>
    $(document).on("change", ".fn_all_perms", function() {
        if ($(this).is(":checked")) {
            $('.fn_item_perm').each(function() {
                if (!$(this).is(":checked")) {
                    $(this).trigger("click");
                }
            });
        } else {
            $('.fn_item_perm').each(function() {
                if ($(this).is(":checked")) {
                    $(this).trigger("click");
                }
            })
        }
    })
</script>