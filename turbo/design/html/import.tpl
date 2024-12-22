{$meta_title=$btr->import_products scope=global}

<div class="row">
	<div class="col-12">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-2">
				{$btr->import_products|escape}
			</h1>
			<div class="d-inline-block heading-block mb-3 mt-1" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_example|escape}">
				<a href="files/import/example.csv" class="text-dark" target="_blank">
					<i class="align-middle cursor-pointer" data-feather="file-text"></i>
				</a>
			</div>
		</div>
	</div>
</div>

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
					{elseif $message_error == 'required_fields'}
						{$btr->import_required|escape}
					{elseif $message_error == 'duplicated_columns'}
						{$btr->import_duplicated|escape}: {implode($duplicated_columns, ", ")}
					{elseif $message_error == 'duplicated_columns_pairs'}
						{$btr->import_duplicated_pairs|escape}:<BR>
						{foreach $duplicated_columns_pairs as $pair}
							{implode($pair, ", ")}
							{if !$pair@last}<BR>{/if}
						{/foreach}
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
	<form method="post" enctype="multipart/form-data">
		<input type="hidden" name="session_id" value="{$smarty.session.id}">
		{if isset($filename) || isset($import)}
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title mb-0">{$btr->import_file|escape} {$file->name|escape} ({($file->size/1024)|round:'2'} {$btr->global_kb|escape})</h5>
						</div>
						<div class="card-body">
							{if isset($filename)}
								<div class="alert alert-primary alert-dismissible" role="alert">
									<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
									<div class="alert-message">
										{$btr->import_info|escape}
									</div>
								</div>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
									<button class="btn btn-danger me-md-2 js-skip-all" type="button"><i class="align-middle" data-feather="minus"></i> {$btr->import_skip_all|escape}</button>
									<button class="btn btn-success js-new-all" type="button"><i class="align-middle" data-feather="plus"></i> {$btr->import_new_all|escape}</button>
								</div>
								<div class="turbo-list">
									<div class="turbo-list-head">
										<div class="turbo-list-heading turbo-list-import-name">{$btr->import_csv_columns|escape}</div>
										<div class="turbo-list-heading turbo-list-import-value">
											{$btr->import_field_system|escape}
										</div>
									</div>
									<div class="turbo-list-body import-body">
										{foreach $source_columns as $column}
											<div class="turbo-list-body-item body-narrow">
												<div class="turbo-list-row narrow">
													<div class="turbo-list-boding turbo-list-import-name">
														<span class="fw-bold">{$column->name|escape}</span>{if $column->is_feature || !$column->is_exist} ({$btr->import_feature|escape}){/if}
													</div>
													<div class="turbo-list-boding turbo-list-import-value js-row">
														<input type="hidden" name="csv_fields[{$column->name|escape}]" value="{$column->value|escape}">
														<a href="javascript:;" class="js-edit-column fw-bold text-decoration-none {if empty($column->value)}text-danger{elseif $column->is_nf_selected}text-success{/if}" data-column-name="{$column->name|escape}" data-is-exist="{if $column->is_exist}1{else}0{/if}">
															{if in_array($column->value, $columns_names)}
																{$btr->get_translation('import_field_'|cat:$column->value)}
															{elseif empty($column->value)}
																{$btr->import_skip|escape}
															{elseif $column->is_nf_selected}
																{$btr->import_new_feature|escape}
															{else}
																{$column->value|escape}
															{/if}
														</a>
													</div>
												</div>
											</div>
										{/foreach}
									</div>
									<div class="turbo-list-footer">
										<div class="col-12">
											<button type="submit" name="import" value="1" class="btn btn-primary float-md-end">
												<i class="align-middle" data-feather="check"></i>
												{$btr->import_do_import|escape}
											</button>
										</div>
									</div>
								</div>
								<select class="selectpicker import-select js-select" data-live-search="true">
									<optgroup label="{$btr->import_additional|escape}">
										<option value="" data-label="{$btr->import_skip|escape}">{$btr->import_skip|escape}</option>
										<option value="" data-label="{$btr->import_new_feature|escape}" class="js-new-feature">
											{$btr->import_new_feature|escape}
										</option>
									</optgroup>
									<optgroup label="{$btr->import_main_fields|escape}">
										{foreach $columns_names as $cname}
											<option value="{$cname}" data-label="{$btr->get_translation('import_field_'|cat:$cname)}">
												{$btr->get_translation('import_field_'|cat:$cname)}
											</option>
										{/foreach}
									</optgroup>
									<optgroup label="{$btr->import_shop_features|escape}">
										{foreach $features as $feature}
											<option value="{$feature|escape}" data-label="{$feature|escape}">
												{$feature|escape}
											</option>
										{/foreach}
									</optgroup>
								</select>
							{elseif $import}
								<div class="position-relative">
									<div class="progress position-absolute w-100 mt-n4 mb-1" style="display: none;">
										<div id="progressbar" class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
									</div>
								</div>
								<ul class="import-result list-unstyled" id="js-import-result"></ul>
							{/if}
						</div>
					</div>
				</div>
			</div>
		{else}
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
									<div class="alert-message">{$btr->import_backup|escape}</div>
								</div>
								<label for="file" class="form-label">
									{$btr->import_maxsize|escape}
									{if $config->max_upload_filesize>1024*1024}
										{$config->max_upload_filesize/1024/1024|round:'2'} {$btr->global_mb|escape}
									{else}
										{$config->max_upload_filesize/1024|round:'2'} {$btr->global_kb|escape}
									{/if}
								</label>
								<div class="input-group">
									<input name="file" class="form-control" id="file" type="file">
									<button type="submit" class="btn btn-primary">
										<i class="align-middle" data-feather="upload"></i>
										{$btr->import_to_download|escape}
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/if}
	</form>
{/if}

{* Piecon *}
{js id="piecon" priority=99 include=["turbo/design/js/piecon/piecon.min.js"]}{/js}
{javascript minify=true}

<script>
	{literal}
		var new_feature_label = "{/literal}{$btr->import_new_feature|escape}{literal}";
		var skip_label = "{/literal}{$btr->import_skip|escape}{literal}";
		$(function() {
			var select_column = $(".js-select");
			$(".js-select").remove();
			$(document).on("click", ".js-edit-column", function() {
				var edit = $(this),
					parent = edit.closest(".js-row");
				$(".js-edit-column").show();
				edit.hide();
				$(".selectpicker").selectpicker("destroy");
				$(".js-select").remove();
				parent.append(select_column.clone());

				var select = parent.find("select.js-select"),
					new_feature = parent.find(".js-new-feature"),
					input = parent.find("[name*='csv_fields']");
				new_feature.val(edit.data("column_name"));
				new_feature.prop("disabled", edit.data("is-exist") ? true : false);
				select.find("option[value='" + input.val() + "']").prop("selected", true);

				$("[name*='csv_fields']").each(function() {
					if ($(this).val() != "") {
						select.find("option[value='" + $(this).val() + "']").prop("disabled", true);
					}
				});

				select.selectpicker();
				select.on("hide.bs.select", function() {
					select.closest(".js-row").find(".js-edit-column").show();
					$(".selectpicker").selectpicker("destroy");
					$(".js-select").remove();
				});
				setTimeout(function() {
					select.selectpicker("toggle");
				}, 10);
			});

			$(document).on("change", ".js-select select", function() {
				var select = $(this),
					parent = select.closest(".js-row"),
					selected = select.find("option:selected"),
					edit = parent.find(".js-edit-column");
				edit.text(selected.data("label"));
				edit.removeClass("text-danger").removeClass("text-success");
				if (select.val() == "") {
					edit.addClass("text-danger");
				} else if (selected.hasClass("js-new-feature")) {
					edit.addClass("text-success");
				}
				parent.find("[name*='csv_fields']").val(select.val());
			});

			$(document).on("click", ".js-skip-all", function() {
				$('.js-edit-column').each(function() {
					var edit = $(this),
						parent = edit.closest(".js-row");
					edit.text(skip_label);
					edit.removeClass("text-danger").removeClass("text-success");
					edit.addClass("text-danger");
					parent.find("[name*='csv_fields']").val("");
				});
				return false;
			});

			$(document).on("click", ".js-new-all", function() {
				$('.js-edit-column').each(function() {
					var edit = $(this),
						parent = edit.closest(".js-row");
					if (!edit.data("is-exist")) {
						edit.text(new_feature_label);
						edit.removeClass("text-danger").removeClass("text-success");
						edit.addClass("text-success");
						parent.find("[name*='csv_fields']").val(edit.data('column-name'));
					}
				});
				return false;
			});
		});
	{/literal}
	{if isset($import)}
		{literal}
			var in_process = false;
			var count = 1;

			$(function() {
				Piecon.setOptions({fallback: 'force'});
				Piecon.setProgress(0);
				var progress_item = $("#progressbar");
				$(".progress").show();
				do_import('', progress_item);
			});

			function do_import(from, progress) {
				from = typeof(from) != 'undefined' ? from : 0;
				$.ajax({
					url: "ajax/import.php",
					data: {from:from},
					dataType: 'json',
					success: function(data) {
						for (var key in data.items) {
							$('#js-import-result').prepend('<li><span class=count>' + count + '</span> <span title=' + data.items[key].status + ' class="status ' + data.items[key].status + '"></span> <a target=_blank href="index.php?module=ProductAdmin&id=' + data.items[key].product.id + '">' + data.items[key].product.name + '</a> ' + data.items[key].variant.name + '</li>');
							count++;
						}
						if (data.error) {
							var error = '';
							if (data.missing_fields) {
								error = '<span class="alert-message">{/literal}{$btr->import_required_columns|escape}{literal}: </span><b>';
								for (var i in data.missing_fields) {
									error += data.missing_fields[i] + ', ';
								}
								error = error.substring(0, error.length - 2);
								error += '</b>';
							}

							$(".progress").fadeOut(500);
							$('#import-error').html(error);
							$('#import-error').show();
						} else {
							Piecon.setProgress(Math.round(100 * data.from / data.totalsize));
							progress.css('width', 100 * data.from / data.totalsize + '%');

							if (data != false && !data.end) {
								do_import(data.from, progress);
							} else {
								Piecon.setProgress(100);
								progress.css('width', '100%');
								$("#js-import-result").show();
								$(".progress").fadeOut(500);
							}
						}
					},
					error: function(xhr, status, errorThrown) {
						alert(errorThrown + '\n' + xhr.responseText);
					}
				});
			}
		{/literal}
	{/if}
</script>