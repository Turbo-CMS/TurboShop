{$meta_title = $btr->global_theme_settings scope=global}

<h1 class="mb-3">{$btr->global_theme_settings|escape} {$theme|escape}</h1>

{if isset($message_success)}
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

{if $theme_settings_xml}
	<form method="post" enctype="multipart/form-data" class="js-fast-button">
		<input type=hidden name="session_id" value="{$smarty.session.id}">
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
						<h5 class="card-title mb-0">{$btr->global_settings|escape}</h5>
					</div>
					<div class="collapse-card">
						<div class="card-body">
							<div class="row">
								<div class="col-12">
									<div class="row">
										<div class="col-12">
											{foreach $theme_settings_xml as $theme_setting_xml}
												<div class="row">
													{foreach $theme_setting_xml->settings as $setting}
														{$variable_name = $setting->variable}
														{if !empty($setting->options) && $setting->options|@count>1}
															<div class="col-lg-6">
																<div class="mb-3">
																	<div class="form-label">{$setting->name|escape}</div>
																	<select name="theme_settings[{$setting->variable}]" class="selectpicker">
																		{foreach $setting->options as $option}
																			<option value="{$option->value}" {if isset($theme_settings[$setting->variable]) && $option->value == $theme_settings[$setting->variable]}selected{/if}>{$option->name|escape}</option>
																		{/foreach}
																	</select>
																</div>
															</div>
														{elseif !empty($setting->options) && $setting->options|@count==1}
															{$option = $setting->options|@first}
															<div class="col-lg-6">
																<div class="d-flex align-items-center mb-3">
																	<div class="form-check">
																		<input class="form-check-input me-2" type="checkbox" id="theme-settings-{$option->value|escape}" name="theme_settings[{$setting->variable}]" value="{$option->value|escape}" {if $option->value==$theme_settings[$setting->variable]}checked{/if}>
																	</div>
																	<label class="form-check-label" for="theme-settings-{$option->value|escape}">{$setting->name|escape}</label>
																</div>
															</div>
														{else}
															<div class="col-lg-6">
																<div class="mb-3">
																	<div class="form-label" for="{$setting->variable}">{$setting->name|escape}</div>
																	<input name="theme_settings[{$setting->variable}]" class="form-control" type="text" value="{if isset($theme_settings[$setting->variable])}{$theme_settings[$setting->variable]|escape}{/if}" id="{$setting->variable}">
																</div>
															</div>
														{/if}
													{/foreach}
												</div>
											{/foreach}
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
{else}
	<div class="card">
		<div class="card-body">
			<h5 class="card-title ms-1 my-3">{$btr->settings_no|escape}</h5>
		</div>
	</div>
{/if}