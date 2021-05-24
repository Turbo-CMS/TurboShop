{$meta_title = $btr->settings_general_sites scope=global}

<div class="row">
    <div class="col-lg-7 col-md-7">
        <div class="heading_page">{$btr->settings_general_sites|escape}</div>
    </div>
    <div class="col-lg-5 col-md-5 text-xs-right float-xs-right"></div>
</div>

{if $message_success}
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12">
        <div class="boxed boxed_success">
            <div class="heading_box">
                {if $message_success == 'saved'}
					{$btr->general_settings_saved|escape}
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

<form method="post" enctype="multipart/form-data">
    <input type=hidden name="session_id" value="{$smarty.session.id}">
    <div class="row">
        <div class="col-lg-6 col-md-12 pr-0">
            <div class="boxed fn_toggle_wrap">
                <div class="heading_box">
                    {$btr->settings_general_options|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;" ><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="heading_label">{$btr->settings_general_sitename|escape}</div>
                            <div class="mb-1">
                                <input name="site_name" class="form-control" type="text" value="{$settings->site_name|escape}" />
                            </div>
							</div>
                        <div class="col-md-6">
                            <div class="heading_label">{$btr->settings_general_company_name|escape}</div>
                            <div class="mb-1">
                                <input name="company_name" class="form-control" type="text" value="{$settings->company_name|escape}" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="heading_label">{$btr->settings_general_date|escape}</div>
                            <div class="mb-1">
                                <input name="date_format" class="form-control" type="text" value="{$settings->date_format|escape}" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="heading_label">{$btr->settings_general_shutdown|escape}</div>
                            <div class="mb-1">
                                <select name="site_work" class="selectpicker">
                                    <option value="on" {if $settings->site_work == "on"}selected{/if}>{$btr->settings_general_turn_on|escape}</option>
                                    <option value="off" {if $settings->site_work == "off"}selected{/if}>{$btr->settings_general_turn_off|escape}</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="heading_label">{$btr->manager_language|escape}</div>
                            <div class="mb-1">
                                <select name="manager_lang" id="countries_select" size="1">
                                    {foreach $btr_languages as $name=>$label}
                                        <option value='{$label}' {if $settings->lang==$label}selected{/if} data-image="{$config->root_url}/files/lang/{$label}.png" data-imagecss="flag ad" data-title="{$name|escape}">{$name|escape} [{$label|escape}]</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12">
            <div class="boxed fn_toggle_wrap">
                <div class="heading_box">
                    {$btr->settings_notify_notifications|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;" ><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="row">
                         <div class="col-md-6">
                            <div class="heading_label">{$btr->settings_notify_emails|escape}</div>
                            <div class="mb-1">
                                 <input name="order_email" class="form-control" type="text" value="{$settings->order_email|escape}" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="heading_label">{$btr->settings_notify_comments|escape}</div>
                            <div class="mb-1">
                                <input name="comment_email" class="form-control" type="text" value="{$settings->comment_email|escape}" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="heading_label">{$btr->settings_notify_reverce|escape}</div>
                            <div class="mb-1">
                                <input name="notify_from_email" class="form-control" type="text" value="{$settings->notify_from_email|escape}" />
                            </div>
                        </div>
						<div class="col-md-6">
                            <div class="heading_label">{$btr->settings_admin_email|escape}</div>
                            <div class="mb-1">
                                <input name="admin_email" class="form-control" type="text" value="{$settings->admin_email|escape}" />
                            </div>
                        </div>
						<div class="col-md-6">
                            <div class="heading_label">{$btr->settings_notify_email_lang|escape}</div>
                            <div class="mb-1">
                                <select name="email_lang" class="selectpicker">
                                    {foreach $btr_languages as $name=>$label}
                                        <option value="{$label}" {if $settings->email_lang==$label}selected{/if}>
                                            {$name|escape}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
						<div class="col-md-6">
                            <div class="heading_label">{$btr->settings_notify_sender_name|escape}</div>
                            <div class="mb-1">
                                <input name="notify_from_name" class="form-control" type="text" value="{$settings->notify_from_name|escape}" />
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
                    {$btr->general_messengers_settings|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;" ><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="heading_label">Viber</div>
                            <div class="mb-1">
								 <input name="chat_viber" class="form-control" type="text" value="{$settings->chat_viber|escape}" placeholder="XXXXXXXXXXXX">
                            </div>
                        </div>
						<div class="col-md-6">
                            <div class="heading_label">WhatsApp</div>
                            <div class="mb-1">
								<input name="chat_whats_app" class="form-control" type="text" value="{$settings->chat_whats_app|escape}" placeholder="XXXXXXXXXXXX">
                            </div>
                        </div>
						<div class="col-md-6">
                            <div class="heading_label">Telegram</div>
                            <div class="mb-1">
								<input name="chat_telegram" class="form-control" type="text" value="{$settings->chat_telegram|escape}" placeholder="username">
                            </div>
                        </div>
						<div class="col-md-6">
                            <div class="heading_label">Facebook Messenger</div>
                            <div class="mb-1">
								<input name="chat_facebook" class="form-control" type="text" value="{$settings->chat_facebook|escape}" placeholder="username">
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
                    {$btr->settings_catalog_catalog|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;" ><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="heading_label">{$btr->settings_catalog_products_on_page|escape}</div>
                            <div class="mb-1">
                                <input name="products_num" class="form-control" type="text" value="{$settings->products_num|escape}" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="heading_label">{$btr->settings_catalog_products_max|escape}</div>
                            <div class="mb-1">
                                <input name="max_order_amount" class="form-control" type="text" value="{$settings->max_order_amount|escape}" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="heading_label">{$btr->settings_catalog_products_on_admin|escape}</div>
                            <div class="mb-1">
                                <input name="products_num_admin" class="form-control" type="text" value="{$settings->products_num_admin|escape}" />
                            </div>
                        </div>
						 <div class="col-lg-3 col-md-6">
                            <div class="heading_label">{$btr->settings_features_on_admin|escape}</div>
                            <div class="mb-1">
                                <input name="features_num_admin" class="form-control" type="text" value="{$settings->features_num_admin|escape}" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="heading_label">{$btr->settings_catalog_units|escape}</div>
                            <div class="mb-1">
                                <input name="units" class="form-control" type="text" value="{$settings->units|escape}" />
                            </div>
                        </div>
						<div class="col-lg-3 col-md-6">
                            <div class="heading_label">{$btr->settings_catalog_weight_units|escape}</div>
                            <div class="mb-1">
                                <input name="weight_units" class="form-control" type="text" value="{$settings->weight_units|escape}" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="heading_label">{$btr->settings_catalog_cents|escape}</div>
                            <div class="mb-1">
                                <select name="decimals_point" class="selectpicker">
                                    <option value='.' {if $settings->decimals_point == '.'}selected{/if}>{$btr->settings_catalog_dot|escape} 12.45 {$currency->sign|escape}</option>
                                    <option value=',' {if $settings->decimals_point == ','}selected{/if}>{$btr->settings_catalog_comma|escape} 12,45 {$currency->sign|escape}</option>
                                </select>
                            </div>
                        </div>
						<div class="col-lg-3 col-md-6">
                            <div class="heading_label">{$btr->settings_catalog_thousands|escape}</div>
                            <div class="mb-1">
                               <select name="thousands_separator" class="selectpicker">
                                    <option value='' {if $settings->thousands_separator == ''}selected{/if}>{$btr->settings_catalog_without|escape} 1245678 {$currency->sign|escape}</option>
                                    <option value=' ' {if $settings->thousands_separator == ' '}selected{/if}>{$btr->settings_catalog_space|escape} 1 245 678 {$currency->sign|escape}</option>
                                    <option value=',' {if $settings->thousands_separator == ','}selected{/if}>{$btr->settings_catalog_comma|escape} 1,245,678 {$currency->sign|escape}</option>
                                </select>
                            </div>
                        </div>
                    </div>
					<div class="permission_block">
						<div class="permission_boxes row">
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->count_products_category|escape}</span>
                                    <label class="switch switch-default">
										<input class="switch-input" name="category_count"  value='1' type="checkbox" {if $settings->category_count}checked{/if} /></li>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
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
            <div class="boxed fn_toggle_wrap ">
                <div class="heading_box">
                    {$btr->settings_blog_articles|escape} 
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;" ><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="row">
						 <div class="col-lg-3 col-md-3">
                            <div class="heading_label">{$btr->settings_blog_posts_site|escape}</div>
                            <div class="mb-1">
                                <input name="blog_num" class="form-control" type="text" value="{$settings->blog_num|escape}" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div class="heading_label">{$btr->settings_blog_posts_admin|escape}</div>
                            <div class="mb-1">
                                <input name="blog_num_admin" class="form-control" type="text" value="{$settings->blog_num_admin|escape}" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div class="heading_label">{$btr->settings_articles_on_site|escape}</div>
                            <div class="mb-1">
                                <input name="articles_num" class="form-control" type="text" value="{$settings->articles_num|escape}" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div class="heading_label">{$btr->settings_articles_on_admin|escape}</div>
                            <div class="mb-1">
                                <input name="articles_num_admin" class="form-control" type="text" value="{$settings->articles_num_admin|escape}" />
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
                    {$btr->settings_comments|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;" ><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="row">
						<div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="heading_label"> {$btr->comments_tree_blog|escape}</div>
                            <div class="mb-1">
                                <select name="comments_tree_blog" class="selectpicker">
                                    <option value="on" {if $settings->comments_tree_blog == "on"}selected{/if}>{$btr->settings_general_turn_on|escape}</option>
                                    <option value="off" {if $settings->comments_tree_blog == "off"}selected{/if}>{$btr->settings_general_turn_off|escape}</option>
                                </select>
                            </div>
                        </div>
						<div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="heading_label"> {$btr->comments_tree_articles|escape}</div>
                            <div class="mb-1">
                                <select name="comments_tree_articles" class="selectpicker">
                                    <option value="on" {if $settings->comments_tree_articles == "on"}selected{/if}>{$btr->settings_general_turn_on|escape}</option>
                                    <option value="off" {if $settings->comments_tree_articles == "off"}selected{/if}>{$btr->settings_general_turn_off|escape}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="boxed fn_toggle_wrap min_height_210px">
                <div class="heading_box">
                    {$btr->settings_general_capcha|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;" ><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="permission_block">
                        <div class="permission_boxes row">
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_general_product|escape}</span>
                                    <label class="switch switch-default">
                                        <input class="switch-input" name="captcha_product" value='1' type="checkbox" {if $settings->captcha_product}checked=""{/if}/>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_general_blog|escape}</span>
                                    <label class="switch switch-default">
                                        <input class="switch-input" name="captcha_post" value='1' type="checkbox" {if $settings->captcha_post}checked=""{/if}/>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </div>
                            </div>
							 <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_general_article|escape}</span>
                                    <label class="switch switch-default">
                                        <input class="switch-input" name="captcha_article" value='1' type="checkbox" {if $settings->captcha_article}checked=""{/if}/>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_general_cart|escape}</span>
                                    <label class="switch switch-default">
                                        <input class="switch-input" name="captcha_cart" value='1' type="checkbox" {if $settings->captcha_cart}checked=""{/if}/>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                 </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_general_register|escape}</span>
                                    <label class="switch switch-default">
                                        <input class="switch-input" name="captcha_register" value='1' type="checkbox" {if $settings->captcha_register}checked=""{/if}/>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_general_contact_form|escape}</span>
                                    <label class="switch switch-default">
                                        <input class="switch-input" name="captcha_feedback" value='1' type="checkbox" {if $settings->captcha_feedback}checked=""{/if}/>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_general_callback|escape}</span>
                                    <label class="switch switch-default">
                                        <input class="switch-input" name="captcha_callback" value='1' type="checkbox" {if $settings->captcha_callback}checked=""{/if}/>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_general_fastorder|escape}</span>
                                    <label class="switch switch-default">
                                        <input class="switch-input" name="captcha_fastorder" value='1' type="checkbox" {if $settings->captcha_fastorder}checked=""{/if}/>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
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
            <div class="boxed fn_toggle_wrap">
                <div class="heading_box">
                    {$btr->settings_image|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;" ><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
					<div class="permission_block">
						<div class="permission_boxes row">
							<div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_precise_resizing_images|escape}</span>
                                    <label class="switch switch-default">
										<input class="switch-input" name="smart_resize"  value='1' type="checkbox" {if $settings->smart_resize}checked{/if} /></li>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
                                </div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="permission_box">
                                    <span>{$btr->settings_enable_webp|escape}</span>
                                    <label class="switch switch-default">
										<input class="switch-input" name="webp_support"  value='1' type="checkbox" {if $settings->webp_support}checked{/if} /></li>
                                        <span class="switch-label"></span>
                                        <span class="switch-handle"></span>
                                    </label>
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
            <div class="boxed fn_toggle_wrap ">
                <div class="heading_box">
                    {$btr->settings_catalog_watermark|escape}
                    <div class="toggle_arrow_wrap fn_toggle_card text-primary">
                        <a class="btn-minimize" href="javascript:;" ><i class="fa fn_icon_arrow fa-angle-down"></i></a>
                    </div>
                </div>
                <div class="toggle_body_wrap on fn_card">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="boxed">
                                {if $config->watermark_file}
                                <div class="fn_parent_image">
                                    <div class="banner_image fn_image_wrapper text-xs-center">
                                        <a href="javascript:;" class="fn_delete_item remove_image"></a>
                                        <img class="watermark_image" src="{$config->root_url}/{$config->watermark_file}?{math equation='rand(10,10000)'}" alt="" />
                                    </div>
                                </div>
                                {else}
                                <div class="fn_parent_image"></div>
                                {/if}
                                <div class="fn_upload_image dropzone_block_image text-xs-center {if $config->watermark_file} hidden{/if}">
                                    <i class="fa fa-plus font-5xl" aria-hidden="true"></i>
                                    <input class="dropzone_image" name="watermark_file" type="file" />
                                </div>
                                <div class="image_wrapper fn_image_wrapper fn_new_image text-xs-center">
                                    <a href="javascript:;" class="fn_delete_item delete_image remove_image"></a>
                                    <img src="" alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="row">
                                <div class="col-xs-12 fn_range_wrap">
                                    <div class="heading_label">
                                        {$btr->settings_catalog_watermark_position|escape}
                                        <span class="font-weight-bold fn_show_range">{$settings->watermark_offset_x|escape}</span>
                                    </div>
                                    <div class="raiting_boxed">
                                        <input class="fn_range_value" type="hidden" value="{$settings->watermark_offset_x|escape}" name="watermark_offset_x" />
                                        <input class="fn_rating range_input" type="range" min="0" max="100" step="1" value="{$settings->watermark_offset_x|escape}" />
                                        <div class="raiting_range_number">
                                            <span class="float-xs-left">1%</span>
                                            <span class="float-xs-right">100%</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 fn_range_wrap">
                                    <div class="heading_label">
                                        {$btr->settings_catalog_watermark_position_y|escape}
                                        <span class="font-weight-bold fn_show_range">{$settings->watermark_offset_y|escape}</span>
                                    </div>
                                    <div class="raiting_boxed">
                                        <input class="fn_range_value" type="hidden" value="{$settings->watermark_offset_y|escape}" name="watermark_offset_y" />
                                        <input class="fn_rating range_input" type="range" min="0" max="100" step="1" value="{$settings->watermark_offset_y|escape}" />
                                        <div class="raiting_range_number">
                                            <span class="float-xs-left">1</span>
                                            <span class="float-xs-right">100</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 fn_range_wrap">
                                    <div class="heading_label">
										{$btr->settings_catalog_watermark_transparency|escape}
                                        <span class="font-weight-bold fn_show_range">{$settings->watermark_transparency}</span>
                                    </div>
                                    <div class="raiting_boxed">
                                        <input class="fn_range_value" type="hidden" value="{$settings->watermark_transparency}" name="watermark_transparency" />
                                        <input class="fn_rating range_input" type="range" min="0" max="100" step="1" value="{$settings->watermark_transparency|escape}" />
                                        <div class="raiting_range_number">
                                            <span class="float-xs-left">1</span>
                                            <span class="float-xs-right">100</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 fn_range_wrap">
                                    <div class="heading_label">
                                        {$btr->settings_catalog_watermark_sharpness|escape}
                                        <span class="font-weight-bold fn_show_range">{$settings->images_sharpen}</span>
                                    </div>
                                    <div class="raiting_boxed">
                                        <input class="fn_range_value" type="hidden" value="{$settings->images_sharpen}" name="images_sharpen" />
                                        <input class="fn_rating range_input" type="range" min="0" max="100" step="1" value="{$settings->images_sharpen|escape}" />
                                        <div class="raiting_range_number">
                                            <span class="float-xs-left">1</span>
                                            <span class="float-xs-right">100</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 ">
                            <button type="submit" class="btn btn_small btn_green float-md-right">
                                {include file='svg_icon.tpl' svgId='checked'}
                                <span>{$btr->general_apply|escape}</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    $(document).on("input", ".fn_rating", function () {
        $(this).closest(".fn_range_wrap").find(".fn_show_range").html($(this).val());
        $(this).closest(".fn_range_wrap").find(".fn_range_value").val($(this).val());
    });
</script>