{$meta_title=$btr->export_products scope=global}

<h1 class="mb-3">
	{$btr->export_products|escape}
</h1>

{if $categories || $brands}
	<div id="success-export" class="row" style="display: none">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{$btr->global_export_successful|escape}!
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>

	{if $message_error}
		<div class="row">
			<div class="col-12">
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					<div class="alert-message">
						{if $message_error == 'no_permission'}
							{$btr->global_permissions|escape} {$export_files_dir}
						{else}
							{$message_error|escape}
						{/if}
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				</div>
			</div>
		</div>
	{/if}

	{if !$message_error}
		<div class="alert alert-primary alert-dismissible" role="alert">
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			<div class="alert-message">
				{$btr->export_message|escape}
			</div>
		</div>

		<div class="card">
			<div class="card-header">
				<div class="card-actions float-end">
					<div class="d-block d-lg-none position-relative collapse-icon">
						<a href="javascript:;" class="collapse-chevron">
							<i class="align-middle" data-feather="chevron-up"></i>
						</a>
					</div>
				</div>
				<h5 class="card-title mb-0">{$btr->global_export|escape}</h5>
				<div class="position-relative">
					<div class="progress position-absolute w-100 mt-2" style="display: none;">
						<div id="progressbar" class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
					</div>
				</div>
			</div>
			<div class="collapse-card">
				<div id="js-start" class="card-body">
					<div class="row mb-3">
						<div class="col-md-6 col-lg-4 col-sm-12 mb-3 mb-md-0">
							<div class="form-label">{$btr->global_export|escape}</div>
							<select class="selectpicker js-type-export">
								<option value="all_products">{$btr->global_all_products|escape}</option>
								<option value="category_products">{$btr->global_from_category|escape}</option>
								<option value="brands_products">{$btr->global_from_brand|escape}</option>
							</select>
						</div>
						{if $categories}
							<div id="category_products" class="col-md-6 col-lg-4 col-sm-12 export-options d-none mb-3 mb-md-0">
								<div class="form-label">{$btr->global_from_category|escape}</div>
								<select class="selectpicker" data-live-search="true" data-size="10" name="category_id">
									{function name=categories_tree}
										{foreach $categories as $c}
											<option value="{$c->id}">{section name=sp loop=$level}--{/section} {$c->name|escape}</option>
											{if $c->subcategories}
												{categories_tree categories=$c->subcategories level=$level+1}
											{/if}
										{/foreach}
									{/function}
									{categories_tree categories=$categories level=0}
								</select>
							</div>
						{/if}
						{if $brands}
							<div id="brands_products" class="col-md-6 col-lg-4 col-sm-12 export-options d-none mb-3 mb-md-0">
								<div class="form-label">{$btr->global_from_brand|escape}</div>
								<select class="selectpicker" data-size="10" name="brand_id">
									{foreach $brands as $b}
										<option value="{$b->id}" {if $b@first}selected="" {/if}>{$b->name|escape}</option>
									{/foreach}
								</select>
							</div>
						{/if}
						<div class="col-md-6 col-lg-4 col-sm-12 d-grid d-sm-block mt-n3 mt-md-0">
							<div class="form-label">&nbsp;</div>
							<button id="js-start" type="submit" class="btn btn-primary">
								<i class="align-middle" data-feather="download"></i>
								{$btr->global_export|escape}
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}

	{* Piecon *}
	{js id="piecon" priority=99 include=["turbo/design/js/piecon/piecon.min.js"]}{/js}
	{javascript minify=true}

	{literal}
		<script>
			var in_process = false;
			var field = '',
				value = '';

			$(function() {
				$(".js-type-export").on("change", function() {
					elem = $("#" + $(this).val());
					$(".export-options").addClass("d-none");
					elem.removeClass("d-none");
				});

				$('button#js-start').click(function() {
					if ($(".export-options:visible")) {
						field = $(".export-options:visible").find('select').attr('name');
						value = $(".export-options:visible").find('select').val();
					}
					Piecon.setOptions({fallback: 'force'});
					Piecon.setProgress(0);
					var progress_item = $("#progressbar");
					$(".progress").show();
					do_export('', progress_item);
				});

				function do_export(page, progress) {
					page = typeof(page) != 'undefined' ? page : 1;
					var data = {page: page};
					if (field && value) {
						data[field] = value;
					}
					$.ajax({
						url: "ajax/export.php",
						data: data,
						dataType: 'json',
						success: function(data) {

							if (data && !data.end) {
								Piecon.setProgress(Math.round(100 * data.page / data.totalpages));
								progress.css('width', 100 * data.page / data.totalpages + '%');
								do_export(data.page * 1 + 1, progress);
							} else {
								if (data && data.end) {
									Piecon.setProgress(100);
									progress.css('width', '100%');
									window.location.href = 'files/export/export.csv';
									$(".progress").fadeOut(500);
									$('#success-export').show();
								}
							}
						},
						error: function(xhr, status, errorThrown) {
							alert(errorThrown + '\n' + xhr.responseText);
						}
					});
				}
			});
		</script>
	{/literal}
{else}
	<div class="card">
		<div class="card-body">
			<h5 class="card-title ms-1 my-3">{$btr->products_no|escape}</h5>
		</div>
	</div>
{/if}