<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
    <META HTTP-EQUIV="Expires" CONTENT="-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title>{$meta_title|escape}</title>
    <link rel="icon" href="design/images/favicon.svg" type="image/x-icon" />
    <link href="design/css/turbo.css" rel="stylesheet" type="text/css" />
    <link href="design/css/media.css" rel="stylesheet" type="text/css" />
    <script src="design/js/jquery/jquery.js"></script>
    <script src="design/js/jquery/jquery.form.min.js"></script>
    <script src="design/js/jquery.scrollbar.min.js"></script>
    <script src="design/js/bootstrap.min.js"></script>
    <script src="design/js/bootstrap-select.js"></script>
    <script src="design/js/toastr.min.js"></script>
    <script src="design/js/Sortable.js"></script>
</head>

<body class="navbar-fixed {if $smarty.cookies.view !== 'fixed' && $is_mobile === false && $is_tablet === false}menu-pin{/if}">
    <nav id="admin_catalog" class="fn_left_menu">
        <a href="index.php?module=DashboardAdmin" id="fix_logo"></a>
        <div id="mob_menu"></div>
        <div class="sidebar_header">
            <a class="logo_box" href="index.php?module=DashboardAdmin">
                <img src="design/images/logo_title.svg" alt="TurboCMS" />
            </a>
            <span class="fn_switch_menu hidden-xl-up menu_close">
                {include file='svg_icon.tpl' svgId='close'}
            </span>
        </div>
        <div class="sidebar sidebar-menu">
            <div class="scrollbar-inner menu_items">
                <div>
                    <ul class="menu_items">
                        {if in_array('dashboard', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("DashboardAdmin"))}open active{/if}">
                                <a class="nav-link" href="index.php?module=DashboardAdmin">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='home'}
                                    </span>
                                    <span class="left_blog title">{$btr->dashboard_global|escape}</span>
                                </a>
                            </li>
                        {/if}
                        {if in_array('products', $manager->permissions) || in_array('categories', $manager->permissions) || in_array('brands', $manager->permissions) || in_array('features', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("ProductsAdmin","ProductAdmin","CategoriesAdmin","CategoryAdmin","BrandsAdmin","BrandAdmin","FeaturesAdmin","FeatureAdmin"))}open active{/if} fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_catalog'}
                                    </span>
                                    <span class="left_catalog title">{$btr->general_catalog|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    {if in_array('products', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("ProductsAdmin", "ProductAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=ProductsAdmin">
                                                <span class="left_products_title title">{$btr->general_products|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('categories', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("CategoriesAdmin","CategoryAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=CategoriesAdmin">
                                                <span class="left_categories_title title">{$btr->general_categories|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('brands', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("BrandsAdmin","BrandAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=BrandsAdmin">
                                                <span class="left_brands_title title">{$btr->brands_brands|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('features', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("FeaturesAdmin","FeatureAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=FeaturesAdmin">
                                                <span class="left_features_title title">{$btr->general_features|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                        {if in_array('orders', $manager->permissions) || in_array('labels', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("OrdersAdmin", "OrderAdmin", "OrdersLabelsAdmin", "OrdersLabelAdmin"))}open active{/if} fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_orders'}
                                    </span>
                                    <span class="left_orders title">{$btr->general_orders}</span>
                                    {if $new_orders_counter}<span class="menu_counter orders">{$new_orders_counter}</span>{/if}
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    {if in_array('orders', $manager->permissions)}
                                        <li {if $status===0}class="active" {/if} {if in_array($smarty.get.module, array("OrderAdmin"))}{if $order->status==0}class="active" {/if}{/if}>
                                            <a class="nav-link" href="index.php?module=OrdersAdmin&status=0">
                                                <span class="left_orders_title title">{$btr->general_new_order}</span>
                                            </a>
                                        </li>
                                        <li {if $status==1 || $order->status==1}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=OrdersAdmin&status=1">
                                                <span class="left_orders_settings_title title">{$btr->general_accepted_order|escape}</span>
                                            </a>
                                        </li>
                                        <li {if $status==2 || $order->status==2}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=OrdersAdmin&status=2">
                                                <span class="left_orders_settings_title title">{$btr->general_closed_order|escape}</span>
                                            </a>
                                        </li>
                                        <li {if $status==3 || $order->status==3}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=OrdersAdmin&status=3">
                                                <span class="left_orders_settings_title title">{$btr->general_canceled_order|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $keyword}
                                        <li class="active">
                                            <a class="nav-link" href="{url module=OrdersAdmin keyword=$keyword id=null label=null}">
                                                <span class="left_orders_settings_title title">{$btr->general_search_order|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('labels', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("OrdersLabelsAdmin","OrdersLabelAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=OrdersLabelsAdmin">
                                                <span class="left_orders_settings_title title">{$btr->general_labels}</span>
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                        {if in_array('users', $manager->permissions) || in_array('groups', $manager->permissions) || in_array('coupons', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("UsersAdmin","UserAdmin","GroupsAdmin","GroupAdmin","CouponsAdmin","CouponAdmin"))}open active{/if} fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_users'}
                                    </span>
                                    <span class="left_users title">{$btr->users_users|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    {if in_array('users', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("UsersAdmin","UserAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=UsersAdmin">
                                                <span class="left_users_title title">{$btr->left_users_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('groups', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("GroupsAdmin","GroupAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=GroupsAdmin">
                                                <span class="left_groups_title title">{$btr->left_groups_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('coupons', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("CouponsAdmin","CouponAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=CouponsAdmin">
                                                <span class="left_coupons_title title">{$btr->left_coupons_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                        {if in_array('pages', $manager->permissions) || in_array('menus', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("PagesAdmin","PageAdmin","MenuAdmin","indexAdmin"))}open active{/if} fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_pages'}
                                    </span>
                                    <span class="left_users title">{$btr->left_pages|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    {if in_array('pages', $manager->permissions)}
                                        {foreach $menus as $m}
                                            <li {if $m->id == $menu->id}class="active" {/if}>
                                                <a class="nav-link" href="index.php?module=PagesAdmin&menu_id={$m->id}">
                                                    <span class="left_pages_title title">{$m->name}</span>
                                                </a>
                                            </li>
                                        {/foreach}
                                    {/if}
                                    {if in_array('menus', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("MenuAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=MenuAdmin">
                                                <span class="left_managers_title title">{$btr->menus_settings|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                        {if in_array('blog', $manager->permissions) || in_array('articles', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("BlogAdmin","ArticlesCategoriesAdmin","ArticlesAdmin","ArticleAdmin","PostAdmin","ArticlesCategoryAdmin"))}open active{/if} fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_blog'}
                                    </span>
                                    <span class="left_users title">{$btr->blog_blog|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    {if in_array('blog', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("BlogAdmin","PostAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=BlogAdmin">
                                                <span class="left_book-open title">{$btr->blog_posts|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('articles', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("ArticlesCategoriesAdmin","ArticlesCategoryAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=ArticlesCategoriesAdmin">
                                                <span class="left_book-open title">{$btr->article_categories|escape}</span>
                                            </a>
                                        </li>
                                        <li {if in_array($smarty.get.module, array("ArticlesAdmin","ArticleAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=ArticlesAdmin">
                                                <span class="left_book-open title">{$btr->left_articles_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                        {if in_array('comments', $manager->permissions) || in_array('feedbacks', $manager->permissions) || in_array('callbacks', $manager->permissions) || in_array('subscribes', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("CommentsAdmin","CommentAdmin","FeedbacksAdmin","SubscribesAdmin","CallbacksAdmin"))}open active{/if} fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_comments'}
                                    </span>
                                    <span class="left_comments title">{$btr->general_feedback|escape}</span>
                                    <span class="arrow"></span>
                                    {if $all_counter}<span class="menu_counter notification">{$all_counter}</span>{/if}
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    {if in_array('comments', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("CommentsAdmin","CommentAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=CommentsAdmin">
                                                <span class="left_comments_title title">{$btr->general_comments|escape}</span>
                                                {if $new_comments_counter > 0}<span class="menu_counters comments">{$new_comments_counter}</span>{/if}
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('feedbacks', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("FeedbacksAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=FeedbacksAdmin">
                                                <span class="left_feedbacks_title title">{$btr->general_feedback|escape}</span>
                                                {if $new_feedbacks_counter > 0}<span class="menu_counters feedback">{$new_feedbacks_counter}</span>{/if}
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('callbacks', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("CallbacksAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=CallbacksAdmin">
                                                <span class="left_callbacks_title title">{$btr->callbacks_requests|escape}</span>
                                                {if $new_callbacks_counter > 0}<span class="menu_counters callbacks">{$new_callbacks_counter}</span>{/if}
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('subscribes', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("SubscribesAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=SubscribesAdmin">
                                                <span class="left_callbacks_title title">{$btr->subscribe_mailing_subscribes|escape}</span>
                                                {if $new_subscribes_counter > 0}<span class="menu_counters subscribes">{$new_subscribes_counter}</span>{/if}
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                        {if in_array('faq', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("FAQsAdmin","FAQAdmin"))}open active{/if} fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_faq'}
                                    </span>
                                    <span class="left_faq title">{$btr->left_faq_title|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu fn_sort_menu_item">
                                    <li {if in_array($smarty.get.module, array("FAQsAdmin","FAQAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=FAQsAdmin">
                                            <span class="left_faq_patterns_title title">{$btr->list_questions|escape}</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        {/if}
                        {if in_array('import', $manager->permissions) || in_array('export', $manager->permissions) || in_array('backup', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("ImportAdmin","ImportYmlAdmin","ExportAdmin","BackupAdmin","ClearAdmin"))}open active{/if}  fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_auto'}
                                    </span>
                                    <span class="left_auto title">{$btr->general_automation|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    {if in_array('import', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("ImportAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=ImportAdmin">
                                                <span class="left_import_title title">{$btr->left_import_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('import', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("ImportYmlAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=ImportYmlAdmin">
                                                <span class="left_import_title title">{$btr->yml_import_global|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('export', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("ExportAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=ExportAdmin">
                                                <span class="left_export_title title">{$btr->left_export_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('backup', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("BackupAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=BackupAdmin">
                                                <span class="left_multiimport_title title">{$btr->general_backup|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('backup', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("ClearAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=ClearAdmin">
                                                <span class="left_multiimport_title title">{$btr->left_clear_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                        {if in_array('stats', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("StatsAdmin","ReportStatsAdmin","ReportStatsProdAdmin","CategoryStatsAdmin"))}open active{/if}  fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_stats'}
                                    </span>
                                    <span class="left_pages title">{$btr->left_stats|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    <li {if in_array($smarty.get.module, array("StatsAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=StatsAdmin">
                                            <span class="left_multiimport_title title">{$btr->stats_orders|escape}</span>
                                        </a>
                                    </li>
                                    <li {if in_array($smarty.get.module, array("ReportStatsAdmin","ReportStatsProdAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=ReportStatsAdmin">
                                            <span class="left_multiimport_title title">{$btr->left_products_stat_title|escape}</span>
                                        </a>
                                    </li>
                                    <li {if in_array($smarty.get.module, array("CategoryStatsAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=CategoryStatsAdmin">
                                            <span class="left_multiimport_title title">{$btr->left_categories_stat_title|escape}</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        {/if}
                        {if in_array('seo', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("SeoAdmin","SettingsCounterAdmin"))}open active{/if}  fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_seo'}
                                    </span>
                                    <span class="left_seo title">{$btr->left_seo|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu fn_sort_menu_item">
                                    <li {if in_array($smarty.get.module, array("SeoAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=SeoAdmin">
                                            <span class="left_seo_patterns_title title">{$btr->seo_automation|escape}</span>
                                        </a>
                                    </li>
                                    <li {if in_array($smarty.get.module, array("SettingsCounterAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=SettingsCounterAdmin">
                                            <span class="left_seo_patterns_title title">{$btr->left_script_title|escape}</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        {/if}
                        {if in_array('design', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("ThemeAdmin","TemplatesAdmin","StylesAdmin","ImagesAdmin","TranslationsAdmin","TranslationAdmin"))}open active{/if} fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_design'}
                                    </span>
                                    <span class="left_design title">{$btr->left_design|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    <li {if in_array($smarty.get.module, array("ThemeAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=ThemeAdmin">
                                            <span class="left_theme_title title">{$btr->left_theme_title|escape}</span>
                                        </a>
                                    </li>
                                    <li {if in_array($smarty.get.module, array("TemplatesAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=TemplatesAdmin">
                                            <span class="left_template_title title">{$btr->left_template_title|escape}</span>
                                        </a>
                                    </li>
                                    <li {if in_array($smarty.get.module, array("StylesAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=StylesAdmin">
                                            <span class="left_style_title title">{$btr->left_style_title|escape}</span>
                                        </a>
                                    </li>
                                    <li {if in_array($smarty.get.module, array("ImagesAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=ImagesAdmin">
                                            <span class="left_images_title title">{$btr->left_images_title|escape}</span>
                                        </a>
                                    </li>
                                    <li {if in_array($smarty.get.module, array("TranslationsAdmin","TranslationAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=TranslationsAdmin">
                                            <span class="left_images_title title">{$btr->left_translations_title|escape}</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        {/if}
                        {if in_array('banners', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("BannersAdmin","BannerAdmin","BannersImagesAdmin","BannersImageAdmin"))}open active{/if} {if $banners_image->id}open active{/if}  fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_banners'}
                                    </span>
                                    <span class="left_banners title">{$btr->left_banners|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    <li {if in_array($smarty.get.module, array("BannersAdmin","BannerAdmin"))}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=BannersAdmin&do=groups">
                                            <span class="left_banners_title title">{$btr->left_banners_title|escape}</span>
                                        </a>
                                    </li>
                                    <li {if in_array($smarty.get.module, array("BannersImagesAdmin","BannersImageAdmin"))}class="active" {/if} {if $banners_image->id}class="active" {/if}>
                                        <a class="nav-link" href="index.php?module=BannersImagesAdmin">
                                            <span class="left_banners_images_title title">{$btr->left_banners_images_title|escape}</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        {/if}
                        {if in_array('settings', $manager->permissions) || in_array('currency', $manager->permissions) || in_array('delivery', $manager->permissions) || in_array('payment', $manager->permissions) || in_array('managers', $manager->permissions) || in_array('languages', $manager->permissions)}
                            <li class="{if in_array($smarty.get.module, array("SettingsAdmin","CurrencyAdmin","DeliveriesAdmin","DeliveryAdmin","PaymentMethodsAdmin","PaymentMethodAdmin","ManagersAdmin","ManagerAdmin","SettingsFeedAdmin","LanguagesAdmin","LanguageAdmin","SystemAdmin"))}open active{/if} fn_item_sub_switch nav-dropdown">
                                <a class="nav-link fn_item_switch nav-dropdown-toggle" href="javascript:;">
                                    <span class="icon-thumbnail">
                                        {include file='svg_icon.tpl' svgId='left_settings'}
                                    </span>
                                    <span class="left_settings title">{$btr->left_settings|escape}</span>
                                    <span class="arrow"></span>
                                </a>
                                <ul class="fn_submenu_toggle submenu">
                                    {if in_array('settings', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("SettingsAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=SettingsAdmin">
                                                <span class="left_setting_general_title title">{$btr->left_settings|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('settings', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("SettingsFeedAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=SettingsFeedAdmin">
                                                <span class="left_setting_feed_title title">{$btr->left_setting_feed_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('currency', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("CurrencyAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=CurrencyAdmin">
                                                <span class="left_currency_title title">{$btr->left_currency_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('delivery', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("DeliveriesAdmin","DeliveryAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=DeliveriesAdmin">
                                                <span class="left_delivery_title title">{$btr->general_shipping|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('payment', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("PaymentMethodsAdmin","PaymentMethodAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=PaymentMethodsAdmin">
                                                <span class="left_payment_title title">{$btr->order_payment_selected|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('managers', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("ManagersAdmin","ManagerAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=ManagersAdmin">
                                                <span class="left_managers_title title">{$btr->left_managers_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('languages', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("LanguagesAdmin","LanguageAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=LanguagesAdmin">
                                                <span class="left_managers_title title">{$btr->left_languages_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if in_array('settings', $manager->permissions)}
                                        <li {if in_array($smarty.get.module, array("SystemAdmin"))}class="active" {/if}>
                                            <a class="nav-link" href="index.php?module=SystemAdmin">
                                                <span class="left_managers_title title">{$btr->left_system_title|escape}</span>
                                            </a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <div id="content-scroll" class="page-container">
        <a href="{$config->root_url}/{$lang_link}" class="admin_bookmark"></a>
        <header class="navbar">
            <div class="container-fluid">
                <div class="admin_switches float-xs-left">
                    {if $is_mobile === false && $is_tablet === false}
                        {if $smarty.cookies.view != 'fixed'}
                            <span onclick="document.cookie='view=fixed;path=/';document.location.reload();" href="javascript:;" class="fn_switch_menu menu_hamburger">
                                <i class="hamburger align-self-center"></i>
                            </span>
                        {else}
                            <span onclick="document.cookie='view=/;path=/';document.location.reload();" href="javascript:;" class="fn_switch_menu menu_hamburger">
                                <i class="hamburger align-self-center"></i>
                            </span>
                        {/if}
                    {else}
                        <span class="fn_switch_menu menu_hamburger" data-module="managers" data-action="menu_status" data-id="{$manager->id}">
                            <i class="hamburger align-self-center"></i>
                        </span>
                    {/if}
                </div>
                <div id="mobile_menu_right" class="fn_mobile_menu_right hidden-md-up menu_hamburger_right text_white float-xs-right">
                    <i class="hamburger_right align-self-center"></i>
                </div>
                <div id="quickview" class="fn_quickview">
                    <div class="sidebar_header hidden-md-up">
                        <span class="fn_switch_quickview menu_close_right">
                            {include file='svg_icon.tpl' svgId='close'}
                        </span>
                    </div>
                    <div class="admin_open hidden-md-up">
                        <a target="_blank" href="{$config->root_url}/{$lang_link}">
                            <span>{$btr->index_go_to_site|escape}</span>
                            {include file='svg_icon.tpl' svgId='icon_desktop'}
                        </a>
                    </div>
                    <div class="admin_exit hidden-sm-down">
                        <a href="{$config->root_url}?logout">
                            <span class="hidden-lg-down">{$btr->index_exit|escape}</span>
                            {include file='svg_icon.tpl' svgId='exit'}
                        </a>
                    </div>
                    <div class="admin_open hidden-sm-down">
                        <a target="_blank" href="{$config->root_url}/{$lang_link}">
                            <span class="hidden-lg-down">{$btr->index_go_to_site|escape}</span>
                            {include file='svg_icon.tpl' svgId='icon_desktop'}
                        </a>
                    </div>
                    <div class="admin_notification">
                        <div class="notification_inner">
                            <span class="notification_title">
                                <span class="quickview_hidden">{$btr->index_notifications|escape}</span>
                                {include file='svg_icon.tpl' svgId='notify'}
                                {if $all_counter}
                                    <span class="counter">
                                        {$all_counter}
                                    </span>
                                {/if}
                            </span>
                            <div class="notification_toggle ui_sub_menu--right-arrow">
                                {if $new_comments_counter || $new_callbacks_counter || $new_feedbacks_counter || $new_subscribes_counter}
                                    {if in_array('comments', $manager->permissions)}
                                        {if $new_comments_counter > 0}
                                            <div class="notif_item">
                                                <a href="index.php?module=CommentsAdmin" class="l_notif">
                                                    <span class="notif_icon">
                                                        {include file='svg_icon.tpl' svgId='left_comments'}
                                                    </span>
                                                    <span class="notif_title">{$btr->general_comments|escape}</span>
                                                </a>
                                                <span class="notif_count">{$new_comments_counter}</span>
                                            </div>
                                        {/if}
                                    {/if}
                                    {if in_array('feedbacks', $manager->permissions)}
                                        {if $new_feedbacks_counter > 0}
                                            <div class="notif_item">
                                                <a href="index.php?module=FeedbacksAdmin" class="l_notif">
                                                    <span class="notif_icon">
                                                        {include file='svg_icon.tpl' svgId='email'}
                                                    </span>
                                                    <span class="notif_title">{$btr->general_feedback|escape}</span>
                                                </a>
                                                <span class="notif_count">{$new_feedbacks_counter}</span>
                                            </div>
                                        {/if}
                                    {/if}
                                    {if in_array('subscribes', $manager->permissions)}
                                        {if $new_subscribes_counter > 0}
                                            <div class="notif_item">
                                                <a href="index.php?module=SubscribesAdmin" class="l_notif">
                                                    <span class="notif_icon">
                                                        {include file='svg_icon.tpl' svgId='at'}
                                                    </span>
                                                    <span class="notif_title">{$btr->general_subscribes|escape}</span>
                                                </a>
                                                <span class="notif_count">{$new_subscribes_counter}</span>
                                            </div>
                                        {/if}
                                    {/if}
                                    {if in_array('callbacks', $manager->permissions)}
                                        {if $new_callbacks_counter > 0}
                                            <div class="notif_item">
                                                <a href="index.php?module=CallbacksAdmin" class="l_notif">
                                                    <span class="notif_icon">
                                                        {include file='svg_icon.tpl' svgId='phone'}
                                                    </span>
                                                    <span class="notif_title">{$btr->general_callback|escape}</span>
                                                </a>
                                                <span class="notif_count">{$new_callbacks_counter}</span>
                                            </div>
                                        {/if}
                                    {/if}
                                {else}
                                    <div class="notif_item">
                                        <span class="notif_title no_notif">{$btr->index_no_notification|escape}</span>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <div class="admin_notification">
                        <div class="notification_inner">
                            <span class="notification_title">
                                <span class="quickview_hidden">{$btr->general_orders|escape}</span>
                                {include file='svg_icon.tpl' svgId='cart'}
                                {if $new_orders_counter}
                                    <span class="counter_cart">
                                        {$new_orders_counter}
                                    </span>
                                {/if}
                            </span>
                            <div class="notification_toggle ui_sub_menu--right-arrow-cart">
                                {if $new_orders_counter > 0}
                                    <div class="notif_item">
                                        <a href="index.php?module=OrdersAdmin" class="l_notif">
                                            <span class="notif_icon">
                                                {include file='svg_icon.tpl' svgId='left_orders'}
                                            </span>
                                            <span class="notif_title">{$btr->general_orders|escape}</span>
                                        </a>
                                        <span class="notif_count">{$new_orders_counter}</span>
                                    </div>
                                {else}
                                    <div class="notif_item">
                                        <span class="notif_title no_notif">{$btr->index_no_new_orders|escape}</span>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <div class="admin_languages">
                        <div class="languages_inner">
                            <span class="languages_title hidden-md-up">{$btr->general_languages|escape}</span>
                            <div class="languages_body">
								{include file="include_languages.tpl"}
							</div>	
                        </div>
                    </div>
                    <div class="admin_exit hidden-md-up">
                        <a href="{$config->root_url}?logout">
                            <span>{$btr->index_exit|escape}</span>
                            {include file='svg_icon.tpl' svgId='exit'}
                        </a>
                    </div>
                </div>
            </div>
        </header>
        <div class="main">
            <div class="container-fluid animated fadeIn">
                {if $content}
                    {$content}
                {else}
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 mt-1">
                            <div class="boxed boxed_warning">
                                <div class="heading_box">
                                    {$btr->general_no_permission}
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
        <footer id="footer" class="app-footer">
            <div class="col-md-12 font_12 text_dark">
                <div class="float-md-right">
					<a href="https://turbo-cms.com">TurboCMS </a> &copy; TurboShop {$smarty.now|date_format:"Y"} v.{$config->version} | {$manager->login|escape}
                </div>
            </div>
        </footer>
        <div id="fn_action_modal" class="modal fade show" role="document">
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
    </div>
    <div class="fn_fast_save">
        <button type="submit" class="btn btn_small btn-primary">
            {include file='svg_icon.tpl' svgId='checked'}
            <span>{$btr->general_apply|escape}</span>
        </button>
    </div>
    {*main scripts*}
    <script>
        $(function() {
            if ($('form.fn_fast_button').size() > 0) {
                $('input,textarea,select, .dropdown-toggle').bind('keyup change dragover click', function() {
                    $('.fn_fast_save').show();
                });
                $('.fn_fast_save').on('click', function() {
                    $('body').find("form.fn_fast_button").trigger('submit');
                });
            }
            /* Check */
            if ($('.fn_check_all').size() > 0) {
                $(document).on('change', '.fn_check_all', function() {
                    if ($(this).is(":checked")) {
                        $('.fn_check_all_single').each(function() {
                            if (!$(this).is(":checked")) {
                                $(this).trigger("click");
                            }
                        });
                    } else {
                        $('.fn_check_all_single').each(function() {
                            if ($(this).is(":checked")) {
                                $(this).trigger("click");
                            }
                        })
                    }
                });
            }
            /* Catalog items toggle */
            if ($('.fn_item_switch').size() > 0) {
                $('.fn_item_switch').on('click', function(e) {
                    var parent = $(this).closest("ul"),
                        li = $(this).closest(".fn_item_sub_switch"),
                        sub = li.find(".fn_submenu_toggle");
                    if (li.hasClass("open active")) {
                        sub.slideUp(200, function() {
                            li.removeClass("open active")
                        })
                    } else {
                        parent.find("li.open").children(".fn_submenu_toggle").slideUp(200),
                            parent.find("li.open").removeClass("open active"),
                            li.children(".arrow").addClass("open active"),
                            sub.slideDown(200, function() {
                                li.addClass("open active")
                            })
                    }
                });
            }
            /* Left menu toggle */
            if ($('.fn_switch_menu').size() > 0) {
                $(document).on("click", ".fn_switch_menu", function() {
                    $("body").toggleClass("menu-pin");
                });
                $(document).on("click", ".fn_mobile_menu", function() {
                    $("body").toggleClass("menu-pin");
                    $(".fn_quickview").removeClass("open");
                });
            }
            /* Right menu toggle */
            if ($('.fn_switch_quickview').size() > 0) {
                $(document).on("click", ".fn_mobile_menu_right", function() {
                    $(this).next().toggleClass("open");
                    $("body").removeClass("menu-pin");
                });
                $(document).on("click", ".fn_switch_quickview", function() {
                    $(this).closest(".fn_quickview").toggleClass("open");
                });
            }
            /* Delete images for products */
            if ($('.images_list').size() > 0) {
                $('.fn_delete').on('click', function() {
                    if ($('.fn_accept_delete').size() > 0) {
                        $('.fn_accept_delete').val('1');
                        $(this).closest("li").fadeOut(200, function() {
                            $(this).remove();
                        });
                    } else {
                        $(this).closest("li").fadeOut(200, function() {
                            $(this).remove();
                        });
                    }
                    return false;
                });
            }
            /* Input_file */
            if ($('.input_file').size() > 0) {
                document.querySelector("html").classList.add('fn_input_file');

                var fileInput = document.querySelector(".input_file"),
                    button = document.querySelector(".input_file_trigger"),
                    the_return = document.querySelector(".input_file_return");

                button.addEventListener("keydown", function(event) {
                    if (event.keyCode == 13 || event.keyCode == 32) {
                        fileInput.focus();
                    }
                });
                button.addEventListener("click", function(event) {
                    fileInput.focus();
                    return false;
                });
                fileInput.addEventListener("change", function(event) {
                    the_return.innerHTML = this.value;
                });
            }
            /* Initializing the scrollbar */
            if ($('.scrollbar-inner').size() > 0) {
                $('.scrollbar-inner').scrollbar();
            }
            if ($(window).width() < 1199) {
                if ($('.scrollbar-variants').size() > 0) {
                    $('.scrollbar-variants').scrollbar();
                }
            }
            /* Initializing sorting */
            if ($(".sortable").size() > 0) {
                {literal}
                    var el = document.querySelectorAll(".sortable");
                    for (var i = 0; i < el.length; i++) {
                        var sortable = Sortable.create(el[i], {
                            handle: ".move_zone", // Drag handle selector within list items
                            sort: true, // sorting inside list
                            animation: 150, // ms, animation speed moving items when sorting, `0` — without animation
                            ghostClass: "sortable-ghost", // Class name for the drop placeholder
                            chosenClass: "sortable-chosen", // Class name for the chosen item
                            dragClass: "sortable-drag", // Class name for the dragging item
                            scrollSensitivity: 30, // px, how near the mouse must be to an edge to start scrolling.
                            scrollSpeed: 10, // px
                            // Changed sorting within list
                            onUpdate: function(evt) {
                                if ($(".product_images_list").size() > 0) {
                                    var itemEl = evt.item; // dragged HTMLElement
                                    if ($(itemEl).closest(".fn_droplist_wrap").data("image") == "product") {
                                        $(".product_images_list").find("li.first_image").removeClass("first_image");
                                        $(".product_images_list").find("li:nth-child(2)").addClass("first_image");
                                    }
                                }
                                {/literal}
                                    {if !in_array($smarty.get.module, array("CurrencyAdmin"))}$(".fn_form_list").ajaxSubmit();
                                    {/if}
                                    {literal}
                                    },
                                });
                            }
                        {/literal}
                    }
                    /* Call an ajax entity update */
                    if ($(".fn_ajax_action").size() > 0) {
                        $(document).on("click", ".fn_ajax_action", function() {
                            ajax_action($(this));
                        });
                    }
                    if ($(".fn_parent_image").size() > 0) {
                        var image_wrapper = $(".fn_new_image").clone(true);
                        $(".fn_new_image").remove();
                        $(document).on("click", '.fn_delete_item', function() {
                            $(".fn_upload_image").removeClass("hidden");
                            $(".border_image_item").removeClass("border");
                            $(".fn_accept_delete").val(1);
                            $(this).closest(".fn_image_wrapper").remove()
                        });
                        if (window.File && window.FileReader && window.FileList) {
                            $(".fn_upload_image").on('dragover', function(e) {
                                e.preventDefault();
                                $(this).css('background', '#bababa');
                            });
                            $(".fn_upload_image").on('dragleave', function() {
                                $(this).css('background', '#f8f8f8');
                            });

                            function handleFileSelect(evt) {
                                var parent = $(".fn_parent_image");
                                var files = evt.target.files;
                                for (var i = 0, f; f = files[i]; i++) {
                                    if (!f.type.match('image.*')) {
                                        continue;
                                    }
                                    var reader = new FileReader();
                                    reader.onload = (function(theFile) {
                                        return function(e) {
                                            clone_image = image_wrapper.clone(true);
                                            clone_image.find("img").attr("src", e.target.result);
                                            clone_image.find("img").attr("onerror", '$(this).closest(\"div\").remove()');
                                            clone_image.appendTo(parent);
                                            $(".fn_upload_image").addClass("hidden");
                                            $(".border_image_item").addClass("border");
                                        };
                                    })(f);
                                    reader.readAsDataURL(f);
                                }
                                $(".fn_upload_image").removeAttr("style");
                            }
                            $(document).on('change', '.dropzone_image', handleFileSelect);
                        }
                    }
                    if ($(".fn_parent_image2").size() > 0) {
                        var image_wrapper = $(".fn_new_image2").clone(true);
                        $(".fn_new_image2").remove();
                        $(document).on("click", '.fn_delete_item', function() {
                            $(".fn_upload_image2").removeClass("hidden");
                            $(".border_image_item").removeClass("border");
                            $(".fn_accept_delete").val(1);
                            $(this).closest(".fn_image_wrapper2").remove()
                        });
                        if (window.File && window.FileReader && window.FileList) {
                            $(".fn_upload_image2").on('dragover', function(e) {
                                e.preventDefault();
                                $(this).css('background', '#bababa');
                            });
                            $(".fn_upload_image2").on('dragleave', function() {
                                $(this).css('background', '#f8f8f8');
                            });

                            function handleFileSelect(evt) {
                                var parent = $(".fn_parent_image2");
                                var files = evt.target.files;
                                for (var i = 0, f; f = files[i]; i++) {
                                    if (!f.type.match('image.*')) {
                                        continue;
                                    }
                                    var reader = new FileReader();
                                    reader.onload = (function(theFile) {
                                        return function(e) {
                                            clone_image = image_wrapper.clone(true);
                                            clone_image.find("img").attr("src", e.target.result);
                                            clone_image.find("img").attr("onerror", '$(this).closest(\"div\").remove()');
                                            clone_image.appendTo(parent);
                                            $(".fn_upload_image2").addClass("hidden");
                                            $(".border_image_item").addClass("border");
                                        };
                                    })(f);
                                    reader.readAsDataURL(f);
                                }
                                $(".fn_upload_image2").removeAttr("style");
                            }
                            $(document).on('change', '.dropzone_image2', handleFileSelect);
                        }
                    }
                });
                if ($('.fn_remove').size() > 0) {
                    // Confirm deletion
                    /*
					 * modal window function with delete confirmation
					 * takes an argument $ this - in fact, the delete button itself
					 * the function is called directly in the tpl files
					 * */
                    function success_action($this) {
                        $(document).on('click', '.fn_submit_delete', function() {
                            $('.fn_form_list input[type="checkbox"][name*="check"]').attr('checked', false);
                            $this.closest(".fn_form_list").find('select[name="action"] option[value=delete]').attr('selected', true);
                            $this.closest(".fn_row").find('input[type="checkbox"][name*="check"]').attr('checked', true);
                            if (!(/Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent))) {
                                $this.closest(".fn_row").find('input[type="checkbox"][name*="check"]').trigger("click");
                            }
                            $this.closest(".fn_form_list").submit();
                        });
                        $(document).on('click', '.fn_dismiss_delete', function() {
                            $('.fn_form_list input[type="checkbox"][name*="check"]').attr('checked', false);
                            $this.closest(".fn_form_list").find('select[name="action"] option[value=delete]').removeAttr('selected');
                            return false;
                        });
                    }
                }
                {literal}
                    if ($(".fn_ajax_action").size() > 0) {
                        /* Function for ajax update of fields
						 * state - the state of the object (enabled / disabled)
						 * id - id of the updated entity
						 * module - type of entity
						 * action - updated field (field in the database)
						 * */
                        function ajax_action($this) {
                            var state, module, session_id, action, id;
                            state = $this.hasClass("fn_active_class") ? 0 : 1;
                            id = parseInt($this.data('id'));
                            module = $this.data("module");
                            action = $this.data("action");
                            session_id = '{/literal}{$smarty.session.id}{literal}';
                            toastr.options = {
                                closeButton: true,
                                newestOnTop: true,
                                progressBar: true,
                                positionClass: 'toast-top-right',
                                preventDuplicates: false,
                                onclick: null
                            };
                            $.ajax({
                                type: "POST",
                                dataType: 'json',
                                url: "ajax/update_object.php",
                                data: {
                                    object: module,
                                    id: id,
                                    values: {[action]: state},
                                    session_id: session_id
                                },
                                success: function(data) {
                                    var msg = "";
                                    if (data) {
                                        $this.toggleClass("fn_active_class");
                                        $this.removeClass('unapproved');
                                        toastr.success(msg, "{/literal}{$btr->general_success|escape}{literal}");
                                        if (action == "approved" || action == "processed") {
                                            $this.closest("div").find(".fn_answer_btn").show();
                                            $this.closest(".fn_row").removeClass('unapproved');
                                        }
                                    } else {
                                        toastr.error(msg, "{/literal}{$btr->general_error|escape}{literal}");
                                    }
                                }
                            });
                            return false;
                        }
                    }
                {/literal}
                /*
				 * Metadata generation functions
				 * */
                if ($('input').is('.fn_meta_field')) {
                    $(window).on("load", function() {
                        // Autocomplete meta tags
                        header_touched = true;
                        meta_title_touched = true;
                        meta_keywords_touched = true;
                        meta_description_touched = true;
                        if ($('input[name="header"]').val() == generate_header() || $('input[name="header"]').val() == '')
                            header_touched = false;
                        if ($('input[name="meta_title"]').val() == generate_meta_title() || $('input[name="meta_title"]').val() == '')
                            meta_title_touched = false;
                        if ($('input[name="meta_keywords"]').val() == generate_meta_keywords() || $('input[name="meta_keywords"]').val() == '')
                            meta_keywords_touched = false;
                        if ($('textarea[name="meta_description"]').val() == generate_meta_description() || $('textarea[name="meta_description"]').val() == '')
                            meta_description_touched = false;
                        $('input[name="header"]').change(function() { header_touched = true; });
                        $('input[name="meta_title"]').change(function() { meta_title_touched = true; });
                        $('input[name="meta_keywords"]').change(function() { meta_keywords_touched = true; });
                        $('textarea[name="meta_description"]').change(function() { meta_description_touched = true; });

                        $('#fn_meta_title_counter').text('(' + $('input[name="meta_title"]').val().length + ')');
                        $('#fn_meta_description_counter').text('(' + $('textarea[name="meta_description"]').val().length + ')');

                        $('input[name="name"]').keyup(function() { set_meta(); });
                        $('input[name="author"]').keyup(function() { set_meta(); });
                        $('input[name="meta_title"]').keyup(function() { $('#fn_meta_title_counter').text('(' + $('input[name="meta_title"]').val().length + ')'); });
                        $('textarea[name="meta_description"]').keyup(function() { $('#fn_meta_description_counter').text('(' + $('textarea[name="meta_description"]').val().length + ')'); });

                        if ($(".fn_meta_brand").size() > 0) {
                            $("select[name=brand_id]").on("change", function() {
                                set_meta();
                            })
                        }
                        if ($(".fn_meta_categories").size() > 0) {
                            $(".fn_meta_categories").on("change", function() {
                                set_meta();
                            })
                        }
                    });

                    function set_meta() {
                        if (!header_touched)
                            $('input[name="header"]').val(generate_header());
                        if (!meta_title_touched)
                            $('input[name="meta_title"]').val(generate_meta_title());
                        if (!meta_keywords_touched)
                            $('input[name="meta_keywords"]').val(generate_meta_keywords());
                        if (!meta_description_touched)
                            $('textarea[name="meta_description"]').val(generate_meta_description());
                        if (!$('#block_translit').is(':checked'))
                            $('input[name="url"]').val(generate_url());
                    }

                    function generate_header() {
                        name = $('input[name="name"]').val();
                        return name;
                    }

                    function generate_meta_title() {
                        name = $('input[name="name"]').val();
                        $('#fn_meta_title_counter').text('(' + name.length + ')');
                        return name;
                    }

                    function generate_meta_keywords() {
                        name = $('input[name="name"]').val();
                        result = name;
                        if ($('input[name="author"]').size() > 0) {
                            author = $('input[name="author"]').val();
                            result += ', ' + author;
                        }
                        if ($(".fn_meta_brand").size() > 0) {
                            brand = $('select[name="brand_id"] option:selected').data('brand_name');
                            if (typeof(brand) == 'string' && brand != '')
                                result += ', ' + brand;
                        }
                        $('select[name="categories[]"]').each(function(index) {
                            c = $(this).find('option:selected').attr('category_name');
                            if (typeof(c) == 'string' && c != '')
                                result += ', ' + c;
                        });
                        return result;
                    }

                    function generate_meta_description() {
                        if (typeof(tinyMCE.get("fn_editor")) == 'object') {
                            description = tinyMCE.get("fn_editor").getContent().replace(/(<([^>]+)>)/ig, " ").replace(/(\&nbsp;)/ig, " ").replace(/^\s+|\s+$/g, '').substr(0, 512);
                            $('#fn_meta_description_counter').text('(' + description.length + ')');
                            return description;
                        } else {
                            return $('.fn_editor_class').val().replace(/(<([^>]+)>)/ig, " ").replace(/(\&nbsp;)/ig, " ").replace(/^\s+|\s+$/g, '').substr(0, 512);
                        }
                    }

                    function generate_url() {
                        url = $('input[name="name"]').val();
                        url = url.replace(/[\s]+/gi, '-');
                        url = translit(url);
                        url = url.replace(/[^0-9a-z_\-]+/gi, '').toLowerCase();
                        return url;
                    }

                    function translit(str) {
                        var ru = ("А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я").split("-")
                        var en = ("A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch-'-'-Y-y-'-'-E-e-YU-yu-YA-ya").split("-")
                        var res = '';
                        for (var i = 0, l = str.length; i < l; i++) {
                            var s = str.charAt(i),
                                n = ru.indexOf(s);
                            if (n >= 0) { res += en[n]; } else { res += s; }
                        }
                        return res;
                    }
                }
                /* Metadata generation functions end */
                $(window).on('load', function() {
                    /*
					 * Tab script
					 * */
                    $('.tabs').each(function(i) {
                        var cur_nav = $(this).find('.tab_navigation'),
                            cur_tabs = $(this).find('.tab_container');
                        if (cur_nav.children('.selected').size() > 0) {
                            $(cur_nav.children('.selected').attr("href")).show();
                            cur_tabs.css('height', cur_tabs.children($(cur_nav.children('.selected')).attr("href")).outerHeight());
                        } else {
                            cur_nav.children().first().addClass('selected');
                            cur_tabs.children().first().show();
                            cur_tabs.css('height', cur_tabs.children().first().outerHeight());
                        }
                    });
                    $('.tab_navigation_link').click(function(e) {
                        e.preventDefault();
                        if ($(this).hasClass('selected')) {
                            return true;
                        }
                        var cur_nav = $(this).closest('.tabs').find('.tab_navigation'),
                            cur_tabs = $(this).closest('.tabs').find('.tab_container');
                        cur_tabs.children().hide();
                        cur_nav.children().removeClass('selected');
                        $(this).addClass('selected');
                        $($(this).attr("href")).fadeIn(200);
                        cur_tabs.css('height', cur_tabs.children($(this).attr("href")).outerHeight());
                    });
                    /* Tab script end*/
                    /*
					 * Information block folding script
					 * */
                    $(document).on("click", ".fn_toggle_card", function() {
                        $(this).closest(".fn_toggle_wrap").find('.fn_icon_arrow').toggleClass('rotate_180');
                        $(this).closest(".fn_toggle_wrap").find(".fn_card").slideToggle(500);
                    });
                    /*
					 * Blocking link auto-generation
					 * */
                    $(document).on("click", ".fn_disable_url", function() {
                        if ($(".fn_url").attr("readonly")) {
                            $(".fn_url").removeAttr("readonly");
                        } else {
                            $(".fn_url").attr("readonly", true);
                        }
                        $(this).find('i').toggleClass("url-unlock");
                        $("#block_translit").trigger("click");
                    });
                    /* Blocking link auto-generation end*/
                    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent)) {
                        $('.selectpicker').selectpicker('mobile');
                    }
                });
	</script>
	{if $product_images}<div id="popup_images"></div>{/if}
</body>
</html>