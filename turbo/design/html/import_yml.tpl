{$meta_title=$btr->global_yml_import scope=global}

<h1 class="mb-3">
	{$btr->global_yml_import|escape}
</h1>

<div id="import-error" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;"></div>

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'no_permission'}
						{$btr->global_permissions|escape} {$import_files_dir|escape}
					{elseif $message_error == 'convert_error'}
						{$btr->import_utf|escape}
					{elseif $message_error == 'locale_error'}
						{$btr->import_locale|escape} {$btr->import_not_correctly|escape}
					{elseif $message_error == 'upload_error'}
						{$btr->upload_error|escape}
					{elseif $message_error == 'download_error'}
						{$btr->global_error|escape}
					{else}
						{$message_error|escape}
					{/if}
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</div>
	</div>
{/if}

{if $message_error != 'no_permission'}
	{if isset($filename_yml)}
		{if isset($filename_csv)}
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
							<h5 class="card-title mb-0">{if $filename_csv}{$btr->import_file|escape} {$filename_csv|escape}{/if} {if $filename_csv_size}({$filename_csv_size|escape}){/if}</h5>
						</div>
						<div class="card-body">
							{if !isset($convert_only)}
								<div id="progressbar"></div>
								<div id="success" class="alert alert-success alert-dismissible fade show" role="alert" style="display: none">
									<div class="alert-message">
										{$btr->global_success|escape}!
										<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
									</div>
								</div>
								<div id="import-result" class="mt-1"></div>
							{else}
								<div id="success" class="alert alert-success alert-dismissible fade show" role="alert">
									<div class="alert-message">
										{$btr->global_success|escape}!
										<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
									</div>
								</div>
							{/if}
						</div>
					</div>
				</div>
			</div>
		{/if}
		{if isset($yml_params)}
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{if $filename_yml}{$btr->import_file|escape} {$filename_yml|escape}{/if} {if $filename_yml_size}({$filename_yml_size|escape}){/if}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-12">
								<form method="post" enctype="multipart/form-data">
									<input type="hidden" name="session_id" value="{$smarty.session.id}">
									<input type="hidden" name="start_import_yml" value="1">
									<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
										<button class="btn btn-danger me-md-2 js-skip-all" type="button"><i class="align-middle" data-feather="minus"></i> {$btr->import_skip_all|escape}</button>
										<button class="btn btn-success js-new-all" type="button"><i class="align-middle" data-feather="plus"></i> {$btr->import_new_all|escape}</button>
									</div>
									<div class="turbo-list">
										<div class="turbo-list-head">
											<div class="turbo-list-heading turbo-list-import-name">{$btr->import_yml_columns|escape}</div>
											<div class="turbo-list-heading turbo-list-import-value">{$btr->import_field_system|escape}</div>
										</div>
										<div class="turbo-list-body import-body">
											{foreach $yml_params as $pkey=>$pvalue}
												<div class="turbo-list-body-item body-narrow">
													<div class="turbo-list-row narrow">
														<div class="turbo-list-boding turbo-list-import-name">
															<span class="fw-bold">{$pkey|replace:'param_':''|replace:'#':''}</span>
														</div>
														<div class="turbo-list-boding turbo-list-import-value js-row">
															<select class="selectpicker import-select js-select" data-live-search="true" name="yml_params[{$pkey}]">
																<optgroup label="{$btr->import_additional|escape}">
																	<option id="import-skip" data-content="<span class='text-danger'>{$btr->import_skip|escape}</span>" value="">{$btr->import_skip|escape}</option>
																	<option id="import-new-feature" data-content="<span class='text-success'>{$btr->import_new_feature}</span>" value="{$pkey}">{$btr->import_new_feature|escape}</option>
																</optgroup>
																<optgroup label="{$btr->import_main_fields|escape}">
																	{foreach $columns as $k=>$f}
																		<option value="{$k}" {if isset($columns_compared[$pkey]) && $columns_compared[$pkey] == $k}selected{/if}>{$btr->get_translation('import_field_'|cat:$f)}</option>
																	{/foreach}
																</optgroup>
																<optgroup label="{$btr->import_shop_features|escape}">
																	{foreach $features as $f}
																		<option value="{$f}" {if $pkey == $f}selected{elseif $pkey == "param_`$f`"}selected{/if}>{$f}</option>
																	{/foreach}
																</optgroup>
															</select>
														</div>
													</div>
												</div>
											{/foreach}
										</div>
										<div class="turbo-list-footer">
											<div class="turbo-list-foot-left">
												<div class="turbo-list-option">
													<select class="selectpicker" name="convert_only">
														<option value="0">{$btr->import_do_import|escape} YML</option>
														<option value="1">{$btr->convert_yml_file_to_csv|escape}</option>
													</select>
												</div>
												<div class="turbo-list-option">
													<select class="selectpicker" name="yml_import_currency">
														{foreach $yml_currencies as $k=>$c}
															<option value="{$c['id']}">{$c['id']} ({$c['rate']})</option>
														{/foreach}
													</select>
												</div>
											</div>
											<button type="submit" class="btn btn-primary">
												<i class="align-middle" data-feather="check"></i>
												{$btr->global_apply|escape}
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/if}
	{/if}
	{if !isset($filename_yml_size)}
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="card">
					<div class="card-header">
						<div class="card-actions float-end">
							<div class="d-block d-lg-none position-relative collapse-icon">
								<a href="javascript:;" class="collapse-chevron">
									<i class="align-middle" data-feather="chevron-up"></i>
								</a>
							</div>
						</div>
						<h5 class="card-title mb-0">{$btr->import_download|escape}</h5>
					</div>
					<div class="collapse-card">
						<div class="card-body mb-3">
							<div class="alert alert-primary alert-dismissible" role="alert">
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
								<div class="alert-message">
									{$btr->import_backup|escape}
								</div>
							</div>
							<form method="post" id="product" enctype="multipart/form-data">
								<input type="hidden" name="session_id" value="{$smarty.session.id}">
								<div class="form-label">
									{$btr->import_maxsize|escape}
									{if $config->max_upload_filesize>1024*1024}
										{$config->max_upload_filesize/1024/1024|round:'2'} {$btr->global_mb|escape}
									{else}
										{$config->max_upload_filesize/1024|round:'2'} {$btr->global_kb|escape}
									{/if}
								</div>
								<div class="input-group">
									<input name="file" class="form-control" type="file">
									<button type="submit" class="btn btn-primary">
										<i class="align-middle" data-feather="upload"></i>
										{$btr->import_to_download|escape}
									</button>
								</div>
								<div class="form-label mt-1">
									{$btr->supported_formats|escape}: xml, yml, gz.
								</div>
								<div class="row mt-3">
									<div class="col-12">
										<div class="form-label">{$btr->link_to_yml|escape}</div>
										<div class="input-group">
											<input name="file_url" class="form-control" type="text" value="" placeholder="URL...">
											<button class="btn btn-primary" type="submit"><i class="align-middle mt-n1" data-feather="upload"></i> {$btr->import_to_download|escape}</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	{elseif isset($filename_yml_size) && !isset($filename_csv_size) && !isset($yml_params)}
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
						<h5 class="card-title mb-0">
							{if isset($filename_yml)}{$btr->import_file|escape} {$filename_yml|escape}{/if} {if isset($filename_yml_size)}({$filename_yml_size|escape}){/if}
							{if isset($filename_csv)}{$btr->import_file|escape} {$filename_csv|escape}{/if} {if isset($filename_csv_size)}({$filename_csv_size|escape}){/if}
						</h5>
					</div>
					<div class="collapse-card">
						<div class="card-body">
							<form method="post" enctype="multipart/form-data">
								<input type="hidden" name="session_id" value="{$smarty.session.id}">
								<input type="hidden" name="file_fields" value="{$filename_yml}">
								<button type="submit" class="btn btn-primary"><i class="align-middle" data-feather="check"></i> {$btr->read_field_names|escape}</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}
{/if}

{* jQuery UI *}
{css id="jqueryui" include=["turbo/design/js/jquery/jquery-ui.min.css"]}{/css}
{stylesheet minify=true}

{js id="jqueryui" priority=99 include=["turbo/design/js/jquery/jquery-ui.min.js"]}{/js}
{javascript minify=true}

{* Piecon *}
{js id="piecon" priority=99 include=["turbo/design/js/piecon/piecon.min.js"]}{/js}
{javascript minify=true}

<script>
	{if isset($filename_csv) && !isset($convert_only)}
		{literal}
			var in_process = false;
			var count = 1;

			$(function() {
				Piecon.setOptions({fallback: 'force'});
				Piecon.setProgress(0);
				$("#progressbar").progressbar({ value: 1 });
				in_process = true;
				do_import();
			});

			function do_import(from) {
				from = typeof(from) != 'undefined' ? from : 0;
				$.ajax({
					url: "ajax/import_yml.php",
					data: {from:from},
					dataType: 'json',
					success: function(data) {
						Piecon.setProgress(Math.round(100 * data.from / data.totalsize * 100) / 100);
						$("#progressbar").progressbar({ value: 100 * data.from / data.totalsize });
						$("#import-result").text('{/literal}{$btr->global_progress|escape}{literal}: ' + Math.round(data.from / 1024) + ' {/literal}{$btr->global_of|escape}{literal} ' + Math.round(data.totalsize / 1024) + ' {/literal}{$btr->global_kb|escape}{literal}.');
						if (data != false && !data.end) {
							do_import(data.from);
						} else {
							Piecon.setProgress(100);
							$("#progressbar").hide('fast');
							$("#import-result").hide('fast');
							$('#success').show();
							in_process = false;
						}
					},
					error: function(xhr, status, errorThrown) {
						alert(errorThrown + '\n' + xhr.responseText);
					}
				});
			}
		{/literal}
	{/if}
	{literal}
		$('.js-skip-all').click(function() {
			$('.js-select #import-skip').prop('selected', true);
			$('.js-select').selectpicker('refresh');
		});
		$('.js-new-all').click(function() {
			$('.js-select').find('#import-skip').remove();
			$('.js-select #import-new-feature').after('<option id="import-skip" data-content="<span class=&quot;text-danger&quot;>{/literal}{$btr->import_skip|escape}{literal}</span>" value="">{/literal}{$btr->import_skip|escape}{literal}</option>');
			$('.js-select').selectpicker('refresh');
		});
	{/literal}
</script>
{literal}
	<style>
		#result {
			clear: both;
			width: 100%;
		}

		.ui-progressbar .ui-progressbar-value {margin: 0px; height: 100%;}
		.ui-widget.ui-widget-content {border: none;}
		@-webkit-keyframes progress-bar-stripes {
			0% {
				background-position-x: 1rem;
			}
		}

		@keyframes progress-bar-stripes {
			0% {
				background-position-x: 1rem;
			}
		}

		#progressbar {
		{/literal}
		{if $settings->admin_theme == "dark"}
			background-color: #4e5863;
		{else}
			background-color: #e9ecef;
		{/if}
		{literal}		
			border-radius: 0.2rem;
			font-size: 0.61875rem;
			height: 1rem;
		}

		#progressbar,
		.ui-progressbar-value {
			display: flex;
			overflow: hidden;
		}

		.ui-progressbar-value {
			background-color: #3b7ddd;
			color: #fff;
			flex-direction: column;
			justify-content: center;
			text-align: center;
			transition: width 0.6s ease;
			white-space: nowrap;
			border: 0;
		}

		@media (prefers-reduced-motion: reduce) {
			.ui-progressbar-value {
				transition: none;
			}
		}

		.ui-progressbar-value {
			background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 0, transparent 50%, rgba(255, 255, 255, 0.15) 0, rgba(255, 255, 255, 0.15) 75%, transparent 0, transparent);
			background-size: 1rem 1rem;
		}

		.ui-progressbar-value {
			-webkit-animation: progress-bar-stripes 1s linear infinite;
			animation: progress-bar-stripes 1s linear infinite;
		}

		@media (prefers-reduced-motion: reduce) {
			.ui-progressbar-value {
				-webkit-animation: none;
				animation: none;
			}
		}
	</style>
{/literal}