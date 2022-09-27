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
					{elseif $message_success == 'cache_cleared'}
						{$btr->cache_cleared|escape}
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
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-lg-6 col-md-12 pr-0">
			<div class="boxed fn_toggle_wrap">
				<div class="heading_box">
					{$btr->settings_general_options|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-md-12">
							<div class="heading_label">{$btr->settings_general_sitename|escape}</div>
							<div class="mb-1">
								<input name="site_name" class="form-control" type="text" value="{$settings->site_name|escape}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="heading_label">{$btr->settings_general_company_name|escape}</div>
							<div class="mb-1">
								<input name="company_name" class="form-control" type="text" value="{$settings->company_name|escape}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="heading_label">{$btr->settings_general_date|escape}</div>
							<div class="mb-1">
								<input name="date_format" class="form-control" type="text" value="{$settings->date_format|escape}">
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
								<select name="manager_lang" class="selectpicker" data-width="fit">
									{foreach $btr_languages as $name=>$label}
										<option value='{$label}' {if $settings->lang==$label}selected{/if} data-content='<span class="flag-icon flag-icon-{$label}"></span> {$name|escape}'>{$name|escape}</option>
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
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-md-6">
							<div class="heading_label">{$btr->settings_notify_emails|escape}</div>
							<div class="mb-1">
								<input name="order_email" class="form-control" type="text" value="{$settings->order_email|escape}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="heading_label">{$btr->settings_notify_comments|escape}</div>
							<div class="mb-1">
								<input name="comment_email" class="form-control" type="text" value="{$settings->comment_email|escape}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="heading_label">{$btr->settings_notify_reverce|escape}</div>
							<div class="mb-1">
								<input name="notify_from_email" class="form-control" type="text" value="{$settings->notify_from_email|escape}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="heading_label">{$btr->settings_admin_email|escape}</div>
							<div class="mb-1">
								<input name="admin_email" class="form-control" type="text" value="{$settings->admin_email|escape}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="heading_label">{$btr->settings_notify_email_lang|escape}</div>
							<div class="mb-1">
								<select name="email_lang" class="selectpicker">
									{foreach $btr_languages as $name=>$label}
										<option value='{$label}' {if $settings->email_lang==$label}selected{/if} data-content='<span class="flag-icon flag-icon-{$label}"></span> {$name|escape}'>{$name|escape}</option>
									{/foreach}
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="heading_label">{$btr->settings_notify_sender_name|escape}</div>
							<div class="mb-1">
								<input name="notify_from_name" class="form-control" type="text" value="{$settings->notify_from_name|escape}">
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
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
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
					{$btr->notifications_telegram|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="permission_block">
						<div class="permission_boxes row">
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->enable_notifications|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="tg_notify" name="tg_notify" value="1" type="checkbox" {if $settings->tg_notify|escape}checked=""{/if}>
										<label class="form-check-label" for="tg_notify"></label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="heading_label">Token</div>
							<div class="mb-1">
								<input name="tg_token" class="form-control" type="text" value="{$settings->tg_token|escape}">
							</div>
						</div>
						<div class="col-md-4">
							<div class="heading_label">API URL</div>
							<div class="mb-1">
								<input name="tg_apiurl" class="form-control" type="text" value="{$settings->tg_apiurl|escape}">
							</div>
						</div>
						<div class="col-md-4">
							<div class="heading_label">Chat ID</div>
							<div class="mb-1">
								<input name="tg_channel" class="form-control" type="text" value="{$settings->tg_channel|escape}">
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
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_catalog_products_on_page|escape}</div>
							<div class="mb-1">
								<input name="products_num" class="form-control" type="text" value="{$settings->products_num|escape}">
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_catalog_products_max|escape}</div>
							<div class="mb-1">
								<input name="max_order_amount" class="form-control" type="text" value="{$settings->max_order_amount|escape}">
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_catalog_products_on_admin|escape}</div>
							<div class="mb-1">
								<input name="products_num_admin" class="form-control" type="text" value="{$settings->products_num_admin|escape}">
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_features_on_admin|escape}</div>
							<div class="mb-1">
								<input name="features_num_admin" class="form-control" type="text" value="{$settings->features_num_admin|escape}">
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_catalog_units|escape}</div>
							<div class="mb-1">
								<input name="units" class="form-control" type="text" value="{$settings->units|escape}">
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_catalog_weight_units|escape}</div>
							<div class="mb-1">
								<input name="weight_units" class="form-control" type="text" value="{$settings->weight_units|escape}">
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
									<div class="form-check form-switch">
										<input class="form-check-input" id="category_count" name="category_count" value="1" type="checkbox" {if $settings->category_count}checked=""{/if}>
										<label class="form-check-label" for="category_count"></label>
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
			<div class="boxed fn_toggle_wrap ">
				<div class="heading_box">
					{$btr->settings_blog_articles|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_blog_posts_site|escape}</div>
							<div class="mb-1">
								<input name="blog_num" class="form-control" type="text" value="{$settings->blog_num|escape}">
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_blog_posts_admin|escape}</div>
							<div class="mb-1">
								<input name="blog_num_admin" class="form-control" type="text" value="{$settings->blog_num_admin|escape}">
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_articles_on_site|escape}</div>
							<div class="mb-1">
								<input name="articles_num" class="form-control" type="text" value="{$settings->articles_num|escape}">
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="heading_label">{$btr->settings_articles_on_admin|escape}</div>
							<div class="mb-1">
								<input name="articles_num_admin" class="form-control" type="text" value="{$settings->articles_num_admin|escape}">
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
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
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
						<div class="col-xl-3 col-lg-4 col-md-6">
							<div class="heading_label"> {$btr->comments_tree_reviews|escape}</div>
							<div class="mb-1">
								<select name="comments_tree_reviews" class="selectpicker">
									<option value="on" {if $settings->comments_tree_reviews == "on"}selected{/if}>{$btr->settings_general_turn_on|escape}</option>
									<option value="off" {if $settings->comments_tree_reviews == "off"}selected{/if}>{$btr->settings_general_turn_off|escape}</option>
								</select>
							</div>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-6">
							<div class="heading_label"> {$btr->comments_tree_products|escape}</div>
							<div class="mb-1">
								<select name="comments_tree_products" class="selectpicker">
									<option value="on" {if $settings->comments_tree_products == "on"}selected{/if}>{$btr->settings_general_turn_on|escape}</option>
									<option value="off" {if $settings->comments_tree_products == "off"}selected{/if}>{$btr->settings_general_turn_off|escape}</option>
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
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="permission_block">
						<div class="permission_boxes row">
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_general_product|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="captcha_product" name="captcha_product" value="1" type="checkbox" {if $settings->captcha_product}checked=""{/if}>
										<label class="form-check-label" for="captcha_product"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_general_blog|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="captcha_post" name="captcha_post" value="1" type="checkbox" {if $settings->captcha_post}checked=""{/if}>
										<label class="form-check-label" for="captcha_post"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_general_article|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="captcha_article" name="captcha_article" value="1" type="checkbox" {if $settings->captcha_article}checked=""{/if}>
										<label class="form-check-label" for="captcha_article"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_general_cart|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="captcha_cart" name="captcha_cart" value="1" type="checkbox" {if $settings->captcha_cart}checked=""{/if}>
										<label class="form-check-label" for="captcha_cart"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_general_register|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="captcha_register" name="captcha_register" value="1" type="checkbox" {if $settings->captcha_register}checked=""{/if}>
										<label class="form-check-label" for="captcha_register"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_general_contact_form|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="captcha_feedback" name="captcha_feedback" value="1" type="checkbox" {if $settings->captcha_feedback}checked=""{/if}>
										<label class="form-check-label" for="captcha_feedback"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_general_callback|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="captcha_callback" name="captcha_callback" value="1" type="checkbox" {if $settings->captcha_callback}checked=""{/if}>
										<label class="form-check-label" for="captcha_callback"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_general_fastorder|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="captcha_review" name="captcha_fastorder" value="1" type="checkbox" {if $settings->captcha_review}checked=""{/if}>
										<label class="form-check-label" for="captcha_review"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_general_review|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="captcha_review" name="captcha_review" value="1" type="checkbox" {if $settings->captcha_review}checked=""{/if}>
										<label class="form-check-label" for="captcha_review"></label>
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
			<div class="boxed fn_toggle_wrap">
				<div class="heading_box">
					{$btr->caching_settings|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-xl-3 col-lg-4 col-md-6">
							<div class="heading_label">{$btr->cache_database_queries|escape}</div>
							<div class="mb-1">
								<select name="cached" class="selectpicker">
									<option value='0' {if $settings->cached == '0'}selected{/if}>{$btr->index_no|escape}</option>
									<option value='1' {if $settings->cached == '1'}selected{/if}>{$btr->index_yes|escape}</option>
								</select>
							</div>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-6">
							<div class="heading_label">{$btr->caching_service|escape}</div>
							<div class="mb-1">
								<select name="cache_type" class="selectpicker">
									<option value='0' {if $settings->cache_type == '0'}selected{/if}>Memcache</option>
									<option value='1' {if $settings->cache_type == '1'}selected{/if}>Memcached</option>
								</select>
							</div>
						</div>
						<div class="col-lg-3 col-md-3">
							<div class="heading_label">{$btr->cache_lifetime|escape}</div>
							<div class="mb-1">
								<input name="cache_time" class="form-control" type="text" value="{$settings->cache_time|escape}">
							</div>
						</div>
						<div class="col-lg-3 col-md-3">
							<div class="heading_label">&nbsp;</div>
							<div class="mb-1">
								<button name="clear_cache" type="submit" value="{$btr->clear_cache|escape}" class="btn btn_small btn-danger clear-button">
									{include file='svg_icon.tpl' svgId='refresh_icon'}
									<span>{$btr->clear_cache|escape}</span>
								</button>
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
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="permission_block">
						<div class="permission_boxes row">
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_precise_resizing_images|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="smart_resize" name="smart_resize" value="1" type="checkbox" {if $settings->smart_resize}checked=""{/if}>
										<label class="form-check-label" for="smart_resize"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_enable_webp|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="webp_support" name="webp_support" value="1" type="checkbox" {if $settings->webp_support}checked=""{/if}>
										<label class="form-check-label" for="webp_support"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->settings_watermark_enable|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="watermark_enable" name="watermark_enable" value="1" type="checkbox" {if $settings->watermark_enable}checked=""{/if}>
										<label class="form-check-label" for="watermark_enable"></label>
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
			<div class="boxed fn_toggle_wrap ">
				<div class="heading_box">
					{$btr->settings_catalog_watermark|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="nested_boxed_watermark">
								<div class="toggle_body_wrap on fn_card">
									<ul class="watermark_images_list">
										<li class="watermark_image_item border_image_item {if $config->watermark_file}border{/if}">
											{if $config->watermark_file}
												<input type="hidden" class="fn_accept_delete" name="delete_image" value="">
												<div class="fn_parent_image">
													<div class="watermark_image image_wrapper fn_image_wrapper text-xs-center">
														<a href="javascript:;" class="fn_delete_item remove_image"></a>
														<img src="{$config->root_url}/{$config->watermark_file}?{math equation='rand(10,10000)'}" alt="">
													</div>
												</div>
											{else}
												<div class="fn_parent_image"></div>
											{/if}
											<div class="fn_upload_image dropzone_block_image {if $config->watermark_file} hidden{/if}">
												{include file='svg_icon.tpl' svgId='plus_big'}
												<input class="dropzone_image" name="watermark_file" type="file">
											</div>
											<div class="watermark_image image_wrapper fn_image_wrapper fn_new_image text-xs-center">
												<a href="javascript:;" class="fn_delete_item remove_image"></a>
												<img src="" alt="">
											</div>
										</li>
									</ul>
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
										<input class="fn_range_value" type="hidden" value="{$settings->watermark_offset_x|escape}" name="watermark_offset_x">
										<input class="fn_range range_input" type="range" min="0" max="100" step="1" value="{$settings->watermark_offset_x|escape}">
										<div class="raiting_range_number">
											<span class="float-xs-left">0</span>
											<span class="float-xs-right">100</span>
										</div>
									</div>
								</div>
								<div class="col-xs-12 fn_range_wrap">
									<div class="heading_label">
										{$btr->settings_catalog_watermark_position_y|escape}
										<span class="font-weight-bold fn_show_range">{$settings->watermark_offset_y|escape}</span>
									</div>
									<div class="raiting_boxed">
										<input class="fn_range_value" type="hidden" value="{$settings->watermark_offset_y|escape}" name="watermark_offset_y">
										<input class="fn_range range_input" type="range" min="0" max="100" step="1" value="{$settings->watermark_offset_y|escape}">
										<div class="raiting_range_number">
											<span class="float-xs-left">0</span>
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
										<input class="fn_range_value" type="hidden" value="{$settings->watermark_transparency}" name="watermark_transparency">
										<input class="fn_range range_input" type="range" min="0" max="100" step="1" value="{$settings->watermark_transparency|escape}">
										<div class="raiting_range_number">
											<span class="float-xs-left">0</span>
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
										<input class="fn_range_value" type="hidden" value="{$settings->images_sharpen}" name="images_sharpen">
										<input class="fn_range range_input" type="range" min="0" max="100" step="1" value="{$settings->images_sharpen|escape}">
										<div class="raiting_range_number">
											<span class="float-xs-left">0</span>
											<span class="float-xs-right">100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12">
							<button type="submit" class="btn btn_small btn-primary float-md-right">
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
{* Flag icon *}
{css id="flag" include=[
"turbo/design/css/flag-icon.min.css"
]}{/css}
{stylesheet minify=true}
<script>
	$(document).on("input", ".fn_range", function() {
		$(this).closest(".fn_range_wrap").find(".fn_show_range").html($(this).val());
		$(this).closest(".fn_range_wrap").find(".fn_range_value").val($(this).val());
	});
</script>