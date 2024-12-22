{$meta_title = $btr->global_theme_settings scope=global}

<h1 class="mb-3">{$btr->global_theme_settings|escape} {$theme|escape}</h1>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'saved'}
						{$btr->global_settings_saved|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if $locked_theme}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{$btr->global_protected|escape}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if $theme_settings_xml}
	<form method="post" enctype="multipart/form-data" {if !$locked_theme}class="js-fast-button js-form-list"{/if}>
		<input type=hidden name="session_id" value="{$smarty.session.id}">
		{foreach $theme_settings_xml as $theme_setting_xml}
			{foreach $theme_setting_xml->groups as $group}
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
								<h5 class="card-title mb-0">{$group->name|escape}</h5>
							</div>
							<div class="collapse-card">
								<div class="card-body">
									<div class="row">
										{if $group->type == 'sort'}
											<div class="col-12">
												<div class="turbo-list">
													<div class="turbo-list-head">
														<div class="turbo-list-heading turbo-list-drag"></div>
														<div class="turbo-list-heading turbo-list-settings-name">{$btr->global_title|escape}</div>
														<div class="turbo-list-heading turbo-list-settings-status">{$btr->global_enable|escape}</div>
													</div>
													<div class="turbo-list-body sort">
														{foreach $group->settings|sort:$theme_settings as $setting}
															{$option = $setting->options|@first}
															<div class="js-row turbo turbo-list-body-item body-narrow js-sort-item {if $setting@first}no-drag{/if}">
																<div class="turbo-list-row narrow">
																	<input type="hidden" name="theme_settings[{$setting->variable}]" value="{if $theme_settings[$setting->variable]}{$theme_settings[$setting->variable]|escape}{else}{$option->value}{/if}" class="js-sort-hidden-input">
																	<div class="turbo-list-boding turbo-list-drag move-zone">
																		<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
																	</div>
																	<div class="turbo-list-boding turbo-list-settings-name">
																		<div class="fw-bold text-body text-decoration-none">{$setting->name|escape}</div>
																	</div>
																	<div class="turbo-list-boding turbo-list-settings-status">
																		<div class="form-check form-switch">
																			<input type="hidden" name="theme_settings[{$setting->visible}]" value="0">
																			<input class="form-check-input me-2" type="checkbox" id="visible-settings-{$setting->variable|escape}" name="theme_settings[{$setting->visible}]" value="1" {if $theme_settings[$setting->visible] == 1}checked{/if}>
																			<label class="form-check-label" for="visible-settings-{$setting->variable|escape}"></label>
																		</div>
																	</div>
																</div>
															</div>
														{/foreach}
													</div>
												</div>
											</div>
										{else}
											{foreach $group->settings as $setting}
												{if !empty($setting->options) && $setting->options|@count > 1}
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">{$setting->name|escape}</div>
															{if $setting->variable == "colors" || $setting->variable == "more_colors"}
																<select name="theme_settings[{$setting->variable}]" class="selectpicker" data-size="10">
																	{foreach $setting->options as $option}
																		<option value="{$option->value}" data-content="<span class='translate-middle px-color me-2 rounded-circle' style='background-color: {$option->value};'><span class='visually-hidden'>New alerts</span></span>{$option->name|escape}" {if isset($theme_settings[$setting->variable]) && $option->value == $theme_settings[$setting->variable]}selected{/if}>{$option->name|escape}</option>
																	{/foreach}
																</select>
															{else}
																<select name="theme_settings[{$setting->variable}]" class="selectpicker">
																	{foreach $setting->options as $option}
																		<option value="{$option->value}" {if isset($theme_settings[$setting->variable]) && $option->value == $theme_settings[$setting->variable]}selected{/if}>{$option->name|escape}</option>
																	{/foreach}
																</select>
															{/if}
														</div>
													</div>
												{elseif !empty($setting->options) && $setting->options|@count == 1}
													{$option = $setting->options|@first}
													<div class="col-lg-6 d-flex align-items-center">
														<div class="form-check form-switch mb-3 mt-lg-3 mt-0">
															<input type="hidden" name="theme_settings[{$setting->variable}]" value="0">
															<input class="form-check-input me-2" type="checkbox" id="theme-settings-{$setting->variable}" name="theme_settings[{$setting->variable}]" value="{$option->value|escape}" {if isset($theme_settings[$setting->variable]) && $option->value==$theme_settings[$setting->variable]}checked{/if}>
															<label class="form-check-label" for="theme-settings-{$setting->variable}">{$setting->name|escape}</label>
														</div>
													</div>
												{else}
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label" for="{$setting->variable}">{$setting->name|escape}</div>
															{if $setting->variable == "custom_color" || $setting->variable == "more_custom_color"}
																<div class="input-group color-picker">
																	<input name="theme_settings[{$setting->variable}]" class="form-control" type="text" value="{$theme_settings[$setting->variable]|default:''|escape}" id="{$setting->variable}">
																	<span class="input-group-text add-on"><i></i></span>
																</div>
															{else}
																<input name="theme_settings[{$setting->variable}]" class="form-control" type="text" value="{$theme_settings[$setting->variable]|default:''|escape}" id="{$setting->variable}">
															{/if}
														</div>
													</div>
												{/if}
											{/foreach}
										{/if}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			{/foreach}
		{/foreach}
		{if !$locked_theme}
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
		{/if}
	</form>
{else}
	<div class="card">
		<div class="card-body">
			<h5 class="card-title ms-1 my-3">{$btr->settings_no|escape}</h5>
		</div>
	</div>
{/if}

{* Colorpicker *}
{css id="colorpicker" include=["turbo/design/js/colorpicker/css/bootstrap-colorpicker.min.css"]}{/css}
{stylesheet minify=true}

{js id="colorpicker" priority=99 include=["turbo/design/js/colorpicker/js/bootstrap-colorpicker.min.js"]}{/js}
{javascript minify=true}

{literal}
	<script>
		$(function() {
			$('.color-picker').colorpicker({
				colorSelectors: {
					'primary': '#3b7ddd',
					'secondary': '#6c757d',
					'success': '#1cbb8c',
					'info': '#17a2b8',
					'warning': '#fcb92c',
					'danger': '#dc3545',
					'dark': '#212529',
					'purple': '#6f42c1',
					'pink': '#e83e8c',
				},
				format: "hex"
			});
		});

		{/literal}
			{if !$locked_theme}
				if ($(".sort").length > 0) {
					var el = document.querySelectorAll(".sort");
					for (var i = 0; i < el.length; i++) {
						var sortable = Sortable.create(el[i], {
							handle: ".move-zone",
							sort: true,
							animation: 150,
							ghostClass: "sortable-ghost",
							chosenClass: "sortable-chosen",
							dragClass: "sortable-drag",
							scrollSensitivity: 30,
							scrollSpeed: 10,
							filter: '.no-drag',
							preventOnFilter: true,
							onStart: function(evt) {
								if (evt.item.classList.contains('no-drag')) {
									evt.preventDefault();
								}
							},
							onMove: function(evt) {
								if (evt.related.classList.contains('no-drag')) {
									return false;
								}
							},
							onUpdate: function(evt) {
								var sortedItems = evt.to.querySelectorAll(".js-sort-item");
								sortedItems.forEach(function(item, index) {
									var hiddenInput = item.querySelector(".js-sort-hidden-input");
									if (hiddenInput) {
										hiddenInput.value = index + 1;
									}
								});
								$(".js-form-list").ajaxSubmit();
								{literal}
									notyf.success({message: '{/literal}{$btr->global_success|escape}{literal}', dismissible: true});
								{/literal}
							}
						});
					}
				}
			{/if}
		{literal}	
	</script>
	<style>
		.colorpicker-element .add-on i:before {
			content: "";
			position: absolute;
			width: 16px;
			height: 16px;
			display: inline-block;
			vertical-align: text-top;
			margin-left: -8px;
			background: linear-gradient(45deg, rgba(0, 0, 0, 0.1) 25%, transparent 25%, transparent 75%, rgba(0, 0, 0, 0.1) 75%, rgba(0, 0, 0, 0.1) 0), linear-gradient(45deg, rgba(0, 0, 0, 0.1) 25%, transparent 25%, transparent 75%, rgba(0, 0, 0, 0.1) 75%, rgba(0, 0, 0, 0.1) 0), white;
			background-size: 10px 10px;
			background-position: 0 0, 5px 5px;
		}

		.colorpicker-element .add-on i[style*="background-color"]::before {
			content: none;
		}
	</style>
{/literal}