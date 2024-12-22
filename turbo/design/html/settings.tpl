{$meta_title = $btr->global_settings_title scope=global}

<h1 class="mb-3">
	{$btr->global_settings_title|escape}
</h1>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'saved'}
						{$btr->global_settings_saved|escape}
					{elseif $message_success == 'cache_cleared'}
						{$btr->cache_cleared|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data" class="js-fast-button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row gx-2">
		<div class="col-lg-6 col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_parameters|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_general_sitename|escape}</div>
									<input name="site_name" class="form-control" type="text" value="{$settings->site_name|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_general_company_name|escape}</div>
									<input name="company_name" class="form-control" type="text" value="{$settings->company_name|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_general_date|escape}</div>
									<input name="date_format" class="form-control" type="text" value="{$settings->date_format|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_general_admintooltip|escape}</div>
									<select name="admintooltip" class="selectpicker">
										<option value="on" {if $settings->admintooltip == "on"}selected{/if}>{$btr->global_do_enable|escape}</option>
										<option value="off" {if $settings->admintooltip == "off"}selected{/if}>{$btr->global_do_disable|escape}</option>
									</select>
								</div>
							</div><div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_general_shutdown|escape}</div>
									<select name="site_work" class="selectpicker">
										<option value="on" {if $settings->site_work == "on"}selected{/if}>{$btr->global_do_enable|escape}</option>
										<option value="off" {if $settings->site_work == "off"}selected{/if}>{$btr->global_do_disable|escape}</option>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->manager_language|escape}</div>
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
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->settings_notify_notifications|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_notify_emails|escape}</div>
									<input name="order_email" class="form-control" type="text" value="{$settings->order_email|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_notify_comments|escape}</div>
									<input name="comment_email" class="form-control" type="text" value="{$settings->comment_email|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_notify_reverce|escape}</div>
									<input name="notify_from_email" class="form-control" type="text" value="{$settings->notify_from_email|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_admin_email|escape}</div>
									<input name="admin_email" class="form-control" type="text" value="{$settings->admin_email|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_notify_email_lang|escape}</div>
									<select name="email_lang" class="selectpicker">
										{foreach $btr_languages as $name=>$label}
											<option value='{$label}' {if $settings->email_lang==$label}selected{/if} data-content='<span class="flag-icon flag-icon-{$label}"></span> {$name|escape}'>{$name|escape}</option>
										{/foreach}
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_notify_sender_name|escape}</div>
									<input name="notify_from_name" class="form-control" type="text" value="{$settings->notify_from_name|escape}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_customize|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-3">
								<div class="mb-3">
									<div class="form-label">{$btr->global_color_mode|escape}</div>
									<select name="admin_theme" class="selectpicker">
										<option value="default" {if $settings->admin_theme == "default"}selected{/if}>{$btr->global_default|escape}</option>
										<option value="dark" {if $settings->admin_theme == "dark"}selected{/if}>{$btr->global_dark|escape}</option>
										<option value="light" {if $settings->admin_theme == "light"}selected{/if}>{$btr->global_light|escape}</option>
										<option value="colored" {if $settings->admin_theme == "colored"}selected{/if}>{$btr->global_colored|escape}</option>
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_sidebar|escape}</div>
									<select name="sidebar" class="selectpicker">
										<option value="default" {if $settings->sidebar == "default"}selected{/if}>{$btr->global_default|escape}</option>
										<option value="compact" {if $settings->sidebar == "compact"}selected{/if}>{$btr->global_compact|escape}</option>
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<div class="mb-3">
									<div class="form-label">{$btr->global_layout|escape}</div>
									<select name="layout" class="selectpicker">
										<option value="fluid" {if $settings->layout == "fluid"}selected{/if}>{$btr->global_fluid|escape}</option>
										<option value="boxed" {if $settings->layout == "boxed"}selected{/if}>{$btr->global_boxed|escape}</option>
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_sidebar_position|escape}</div>
									<select name="position" class="selectpicker">
										<option value="left" {if $settings->position == "left"}selected{/if}>{$btr->global_left|escape}</option>
										<option value="right" {if $settings->position == "right"}selected{/if}>{$btr->global_right|escape}</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->settings_notify_smtp|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<div class="row">
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="smtp-notify" name="use_smtp" value="1" type="checkbox" {if $settings->use_smtp}checked="" {/if}>
											<label class="form-check-label" for="smtp-notify">{$btr->settings_notify_use_smtp|escape}</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_notify_smtp_server|escape}</div>
									<input name="smtp_server" class="form-control" type="text" value="{$settings->smtp_server|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_notify_smtp_port|escape}</div>
									<input name="smtp_port" class="form-control" type="text" value="{$settings->smtp_port|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_notify_smtp_user|escape}</div>
									<input name="smtp_user" class="form-control" type="text" value="{$settings->smtp_user|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_notify_smtp_pass|escape}</div>
									<input name="smtp_pass" class="form-control" type="password" value="{$settings->smtp_pass|escape}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<button type="button" class="js-test-smtp btn btn-primary rotate-icon">
										<i class="align-middle me-1" data-feather="refresh-cw"></i>
										{$btr->settings_notify_do_test_smtp|escape}
									</button>
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="js-test-smtp-status form-label"></div>
								</div>
							</div>
							<div class="js-trace col-12 d-none">
								<div class="alert alert-primary alert-dismissible mb-2" role="alert">
									<div class="alert-message">
										<h4 class="alert-heading">{$btr->settings_notify_test_smtp_trace|escape}</h4>
										<div class="js-test-smtp-trace"></div>
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
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_messengers_settings|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">Viber</div>
									<input name="chat_viber" class="form-control" type="text" value="{$settings->chat_viber|escape}" placeholder="XXXXXXXXXXXX">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">WhatsApp</div>
									<input name="chat_whats_app" class="form-control" type="text" value="{$settings->chat_whats_app|escape}" placeholder="XXXXXXXXXXXX">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">Telegram</div>
									<input name="chat_telegram" class="form-control" type="text" value="{$settings->chat_telegram|escape}" placeholder="username">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">Facebook Messenger</div>
									<input name="chat_facebook" class="form-control" type="text" value="{$settings->chat_facebook|escape}" placeholder="username">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->notifications_telegram|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<div class="row">
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="tg-notify" name="tg_notify" value="1" type="checkbox" {if $settings->tg_notify}checked="" {/if}>
											<label class="form-check-label" for="tg-notify">{$btr->enable_notifications|escape}</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<div class="mb-3">
									<div class="form-label">Token</div>
									<input name="tg_token" class="form-control" type="text" value="{$settings->tg_token|escape}">
								</div>
							</div>
							<div class="col-md-4">
								<div class="mb-3">
									<div class="form-label">API URL</div>
									<input name="tg_apiurl" class="form-control" type="text" value="{$settings->tg_apiurl|escape}">
								</div>
							</div>
							<div class="col-md-4">
								<div class="mb-3">
									<div class="form-label">Chat ID</div>
									<input name="tg_channel" class="form-control" type="text" value="{$settings->tg_channel|escape}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->gpt_settings|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="alert alert-primary" role="alert">
							<div class="alert-message">
								{$btr->gpt_get_key|escape} <a href="https://platform.openai.com/api-keys" class="alert-link" target="_blank">{$btr->gpt_account|escape}</a>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">Key</div>
									<input name="gpt_key" class="form-control" type="text" value="{$settings->gpt_key|escape}">
								</div>
							</div>
							<div class="col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">Model</div>
									<input name="model" class="form-control" type="text" value="{$settings->model|escape}">
								</div>
							</div>
							<div class="col-lg-2 col-md-6">
								<div class="mb-3">
									<div class="form-label">Max Tokens</div>
									<input name="max_tokens" class="form-control" type="text" value="{$settings->max_tokens|escape}">
								</div>
							</div>
							<div class="col-lg-2 col-md-6">
								<div class="mb-3">
									<div class="form-label">Temperature</div>
									<input name="temperature" class="form-control" type="text" value="{$settings->temperature|escape}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->settings_catalog|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_catalog_products_on_page|escape}</div>
									<input name="products_num" class="form-control" type="text" value="{$settings->products_num|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_catalog_products_on_admin|escape}</div>
									<input name="products_num_admin" class="form-control" type="text" value="{$settings->products_num_admin|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_features_on_admin|escape}</div>
									<input name="features_num_admin" class="form-control" type="text" value="{$settings->features_num_admin|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_catalog_products_max|escape}</div>
									<input name="max_order_amount" class="form-control" type="text" value="{$settings->max_order_amount|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_catalog_units|escape}</div>
									<input name="units" class="form-control" type="text" value="{$settings->units|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_catalog_weight_units|escape}</div>
									<input name="weight_units" class="form-control" type="text" value="{$settings->weight_units|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_catalog_cents|escape}</div>
									<select name="decimals_point" class="selectpicker">
										<option value='.' {if $settings->decimals_point == '.'}selected{/if}>{$btr->settings_catalog_dot|escape} 12.45 {$currency->sign|escape}</option>
										<option value=',' {if $settings->decimals_point == ','}selected{/if}>{$btr->settings_catalog_comma|escape} 12,45 {$currency->sign|escape}</option>
									</select>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_catalog_thousands|escape}</div>
									<select name="thousands_separator" class="selectpicker">
										<option value=' ' {if $settings->thousands_separator == ' '}selected{/if}>{$btr->settings_catalog_space|escape} 1 245 678 {$currency->sign|escape}</option>
										<option value='' {if $settings->thousands_separator == ''}selected{/if}>{$btr->settings_catalog_without|escape} 1245678 {$currency->sign|escape}</option>
									</select>
								</div>
							</div>
						</div>
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<div class="row">
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="category-count" name="category_count" value="1" type="checkbox" {if $settings->category_count}checked="" {/if}>
											<label class="form-check-label" for="category-count">{$btr->count_products_category|escape}</label>
										</div>
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
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_brands|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_brands_on_site|escape}</div>
									<input name="brands_num" class="form-control" type="text" value="{$settings->brands_num|escape}">
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_brands_on_admin|escape}</div>
									<input name="brands_num_admin" class="form-control" type="text" value="{$settings->brands_num_admin|escape}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_faq|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_faq_on_site|escape}</div>
									<input name="faq_num" class="form-control" type="text" value="{$settings->faq_num|escape}">
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_faq_on_admin|escape}</div>
									<input name="faq_num_admin" class="form-control" type="text" value="{$settings->faq_num_admin|escape}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->settings_blog_articles|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_blog_posts_site|escape}</div>
									<input name="blog_num" class="form-control" type="text" value="{$settings->blog_num|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_blog_posts_admin|escape}</div>
									<input name="blog_num_admin" class="form-control" type="text" value="{$settings->blog_num_admin|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_articles_on_site|escape}</div>
									<input name="articles_num" class="form-control" type="text" value="{$settings->articles_num|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_articles_on_admin|escape}</div>
									<input name="articles_num_admin" class="form-control" type="text" value="{$settings->articles_num_admin|escape}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->settings_comments|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_comments_site|escape}</div>
									<input name="comments_num" class="form-control" type="text" value="{$settings->comments_num|escape}">
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->settings_comments_admin|escape}</div>
									<input name="comments_num_admin" class="form-control" type="text" value="{$settings->comments_num_admin|escape}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card mh-210px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->settings_general_capcha|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<div class="row">
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="captcha-product" name="captcha_product" value="1" type="checkbox" {if $settings->captcha_product}checked="" {/if}>
											<label class="form-check-label" for="captcha-product">{$btr->settings_general_product|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="captcha-post" name="captcha_post" value="1" type="checkbox" {if $settings->captcha_post}checked="" {/if}>
											<label class="form-check-label" for="captcha-post">{$btr->settings_general_blog|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="captcha-article" name="captcha_article" value="1" type="checkbox" {if $settings->captcha_article}checked="" {/if}>
											<label class="form-check-label" for="captcha-article">{$btr->settings_general_article|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="captcha-cart" name="captcha_cart" value="1" type="checkbox" {if $settings->captcha_cart}checked="" {/if}>
											<label class="form-check-label" for="captcha-cart">{$btr->settings_general_cart|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="captcha-register" name="captcha_register" value="1" type="checkbox" {if $settings->captcha_register}checked="" {/if}>
											<label class="form-check-label" for="captcha-register">{$btr->settings_general_register|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="captcha-feedback" name="captcha_feedback" value="1" type="checkbox" {if $settings->captcha_feedback}checked="" {/if}>
											<label class="form-check-label" for="captcha-feedback">{$btr->settings_general_contact_form|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="captcha-callback" name="captcha_callback" value="1" type="checkbox" {if $settings->captcha_callback}checked="" {/if}>
											<label class="form-check-label" for="captcha-callback">{$btr->settings_general_callback|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="captcha-fastorder" name="captcha_fastorder" value="1" type="checkbox" {if $settings->captcha_fastorder}checked="" {/if}>
											<label class="form-check-label" for="captcha-fastorder">{$btr->settings_general_fastorder|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="captcha-review" name="captcha_review" value="1" type="checkbox" {if $settings->captcha_review}checked="" {/if}>
											<label class="form-check-label" for="captcha-review">{$btr->settings_general_review|escape}</label>
										</div>
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
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->caching_settings|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->cache_database_queries|escape}</div>
									<select name="cached" class="selectpicker">
										<option value='0' {if $settings->cached == '0'}selected{/if}>{$btr->global_no|escape}</option>
										<option value='1' {if $settings->cached == '1'}selected{/if}>{$btr->global_yes|escape}</option>
									</select>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->caching_service|escape}</div>
									<select name="cache_type" class="selectpicker">
										<option value='0' {if $settings->cache_type == '0'}selected{/if}>Memcache</option>
										<option value='1' {if $settings->cache_type == '1'}selected{/if}>Memcached</option>
									</select>
								</div>
							</div>
							<div class="col-lg-3 col-md-3">
								<div class="mb-3">
									<div class="form-label">{$btr->cache_lifetime|escape}</div>
									<input name="cache_time" class="form-control" type="text" value="{$settings->cache_time|escape}">
								</div>
							</div>
							<div class="col-lg-3 col-md-3">
								<div class="mb-3">
									<div class="form-label">&nbsp;</div>
									<button name="clear_cache" type="submit" value="{$btr->clear_cache|escape}" class="btn btn-danger rotate-icon">
										<i class="align-middle me-1" data-feather="refresh-cw"></i>
										{$btr->clear_cache|escape}
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->settings_image|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<div class="row">
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="smart-resize" name="smart_resize" value="1" type="checkbox" {if $settings->smart_resize}checked=""{/if}>
											<label class="form-check-label" for="smart-resize">{$btr->settings_precise_resizing_images|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="webp-support" name="webp_support" value="1" type="checkbox" {if $settings->webp_support}checked=""{/if}>
											<label class="form-check-label" for="webp-support">{$btr->settings_enable_webp|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2">
										<div class="form-check form-switch form-check-reverse form-check-inline">
											<input class="form-check-input ms-2" id="watermark-enable" name="watermark_enable" value="1" type="checkbox" {if $settings->watermark_enable}checked=""{/if}>
											<label class="form-check-label" for="watermark-enable">{$btr->settings_watermark_enable|escape}</label>
										</div>
									</div>
									<div class="col-xl-3 col-lg-4 col-md-6 my-2 js-range-wrap">
										<div class="form-label">
											{$btr->settings_image_quality|escape}
											<span class="font-weight-bold js-show-range">{$settings->image_quality|escape}</span>
										</div>
										<div class="raiting-boxed">
											<input class="js-range-value" type="hidden" value="{$settings->image_quality|escape}" name="image_quality">
											<input class="js-range form-range" type="range" min="0" max="100" step="1" value="{$settings->image_quality|escape}">
											<div class="raiting-range-number">
												<span class="float-start">0</span>
												<span class="float-end">100</span>
											</div>
										</div>
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
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->settings_catalog_watermark|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<div class="nested-boxed-watermark">
									<ul class="watermark-images-list">
										<li class="watermark-image-item border-image-item {if $config->watermark_file}border{/if}">
											{if $config->watermark_file}
												<input type="hidden" class="js-accept-delete" name="delete_image" value="">
												<div class="js-parent-image">
													<div class="watermark-image image-wrapper js-image-wrapper text-center">
														<a href="javascript:;" class="js-delete-item remove-image"></a>
														<img src="{$config->root_url}/{$config->watermark_file}?{math equation='rand(10,10000)'}" alt="">
													</div>
												</div>
											{else}
												<div class="js-parent-image"></div>
											{/if}
											<div class="js-upload-image dropzone-block-image {if $config->watermark_file}d-none{/if}">
												<i class="align-middle" data-feather="plus"></i>
												<input class="dropzone-image" name="watermark_file" type="file">
											</div>
											<div class="watermark-image image-wrapper js-image-wrapper js-new-image text-center">
												<a href="javascript:;" class="js-delete-item remove-image"></a>
												<img src="" alt="">
											</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="row">
									<div class="col-xs-12 js-range-wrap">
										<div class="form-label">
											{$btr->settings_catalog_watermark_position|escape}
											<span class="js-show-range">{$settings->watermark_offset_x|escape}</span>
										</div>
										<div class="raiting-boxed mb-4">
											<input class="js-range-value" type="hidden" value="{$settings->watermark_offset_x|escape}" name="watermark_offset_x">
											<input class="js-range form-range" type="range" min="0" max="100" step="1" value="{$settings->watermark_offset_x|escape}">
											<div class="raiting-range-number">
												<span class="float-start">0</span>
												<span class="float-end">100</span>
											</div>
										</div>
									</div>
									<div class="col-xs-12 js-range-wrap">
										<div class="form-label">
											{$btr->settings_catalog_watermark_position_y|escape}
											<span class="font-weight-bold js-show-range">{$settings->watermark_offset_y|escape}</span>
										</div>
										<div class="raiting-boxed mb-4">
											<input class="js-range-value" type="hidden" value="{$settings->watermark_offset_y|escape}" name="watermark_offset_y">
											<input class="js-range form-range" type="range" min="0" max="100" step="1" value="{$settings->watermark_offset_y|escape}">
											<div class="raiting-range-number">
												<span class="float-start">0</span>
												<span class="float-end">100</span>
											</div>
										</div>
									</div>
									<div class="col-xs-12 js-range-wrap">
										<div class="form-label">
											{$btr->settings_catalog_watermark_transparency|escape}
											<span class="font-weight-bold js-show-range">{$settings->watermark_transparency}</span>
										</div>
										<div class="raiting-boxed mb-4">
											<input class="js-range-value" type="hidden" value="{$settings->watermark_transparency}" name="watermark_transparency">
											<input class="js-range form-range" type="range" min="0" max="100" step="1" value="{$settings->watermark_transparency|escape}">
											<div class="raiting-range-number">
												<span class="float-start">0</span>
												<span class="float-end">100</span>
											</div>
										</div>
									</div>
									<div class="col-xs-12 js-range-wrap">
										<div class="form-label">
											{$btr->settings_catalog_watermark_sharpness|escape}
											<span class="font-weight-bold js-show-range">{$settings->images_sharpen}</span>
										</div>
										<div class="raiting-boxed mb-4">
											<input class="js-range-value" type="hidden" value="{$settings->images_sharpen}" name="images_sharpen">
											<input class="js-range form-range" type="range" min="0" max="100" step="1" value="{$settings->images_sharpen|escape}">
											<div class="raiting-range-number">
												<span class="float-start">0</span>
												<span class="float-end">100</span>
											</div>
										</div>
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
		<div class="col-12">
			<div class="d-grid d-sm-block mt-3">
				<button type="submit" class="btn btn-primary float-end">
					<i class="align-middle" data-feather="check"></i>
					{$btr->global_apply|escape}
				</button>
			</div>
		</div>
	</div>
</form>

{* Flag icon *}
{css id="flag" include=["turbo/design/css/flag-icon.min.css"]}{/css}
{stylesheet minify=true}

<script>
	$(document).on("input", ".js-range", function() {
		$(this).closest(".js-range-wrap").find(".js-show-range").html($(this).val());
		$(this).closest(".js-range-wrap").find(".js-range-value").val($(this).val());
	});

	$(document).on('click', '.js-test-smtp', function() {
		$('.js-test-smtp-status').fadeOut(100);

		var server = $('input[name="smtp_server"]').val(),
			port = $('input[name="smtp_port"]').val(),
			user = $('input[name="smtp_user"]').val(),
			pass = $('input[name="smtp_pass"]').val();

		$.ajax({
			url: 'ajax/test_smtp.php',
			type: 'POST',
			data: {
				server: server,
				port: port,
				user: user,
				pass: pass
			},
			success: function(data) {
				$('.js-test-smtp-status').text(data.message);

				if (data.status == true) {
					$('.js-test-smtp-trace').text('').closest('.js-trace').addClass('d-none');
					$('.js-test-smtp-status').removeClass('text-danger').addClass('text-success');
				} else {
					$('.js-test-smtp-trace').html(data.trace).closest('.js-trace').removeClass('d-none');
					$('.js-test-smtp-status').removeClass('text-success').addClass('text-danger');
				}

				$('.js-test-smtp-status').fadeIn(500);
			}
		});
	});
</script>