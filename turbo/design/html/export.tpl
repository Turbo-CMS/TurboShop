{$meta_title=$btr->export_products scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="heading_page">{$btr->export_products|escape}</div>
	</div>
	<div class="col-lg-5 col-md-5 float-xs-right"></div>
</div>

<div id="success-export" class="row" style="display: none">
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="boxed boxed_success">
			<div class="heading_box">
				{$btr->general_export_successful|escape}!
			</div>
		</div>
	</div>
</div>

{if $message_error}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_warning">
				<div class="heading_box">
					{if $message_error == 'no_permission'}
						{$btr->general_permissions|escape} {$export_files_dir}
					{else}
						{$message_error|escape}
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}

{if $message_error != 'no_permission'}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_attention">
				<div class="">
					{$btr->export_message|escape}
				</div>
			</div>
		</div>
	</div>

	<div class="boxed fn_toggle_wrap">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div id="fn_start" class="">
					<div class="row">
						<div class="col-lg-12 col-md-12">
							<div class="progress my-1" style="display: none;">
								<div id="progressbar" class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
							</div>
						</div>
						<div class="col-md-3 col-sm-3 col-lg-3 col-sm-12 mb-h">
							<div class="option_export_wrap">
								<div class="heading_label">{$btr->general_export|escape}</div>
								<select class="selectpicker fn_type_export">
									<option value="all_products">{$btr->general_all_products|escape}</option>
									<option value="category_products">{$btr->general_from_category|escape}</option>
									<option value="brands_products">{$btr->general_from_brand|escape}</option>
								</select>
							</div>
						</div>
						{if $categories}
							<div id="category_products" class="col-md-3 col-sm-3 col-lg-3 col-sm-12 export_options hidden mb-h">
								<div class="heading_label">{$btr->general_from_category|escape}</div>
								<select class="selectpicker" data-live-search="true" data-size="10" name="category_id">
									{function name=categories_tree}
										{foreach $categories as $c}
											<option value="{$c->id}">{section name=sp loop=$level}&nbsp;{/section}{$c->name|escape}</option>
											{categories_tree categories=$c->subcategories level=$level+1}
										{/foreach}
									{/function}
									{categories_tree categories=$categories level=0}
								</select>
							</div>
						{/if}
						{if $brands}
							<div id="brands_products" class="col-md-3 col-sm-3 col-lg-3 col-sm-12 export_options hidden mb-h">
								<div class="heading_label">{$btr->general_from_brand|escape}</div>
								<select class="selectpicker" data-size="10" name="brand_id">
									{foreach $brands as $b}
										<option value="{$b->id}" {if $b@first}selected=""{/if}>{$b->name|escape}</option>
									{/foreach}
								</select>
							</div>
						{/if}
						<div class="col-md-3 col-sm-3 col-lg-3 col-sm-12 float-sm-right mt-2">
							<button id="fn_start" type="submit" class="btn btn_small btn-primary float-md-right">
								{include file='svg_icon.tpl' svgId='upload'}
								<span>{$btr->general_export|escape}</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}

{* Piecon *}
{js id="piecon" priority=99 include=[
"turbo/design/js/piecon/piecon.min.js"
]}{/js}
{javascript minify=true}

<script>
	{literal}

		var in_process = false;
		var field = '',
			value = '';

		$(function() {
			$(".fn_type_export").on("change", function() {
				elem = $("#" + $(this).val());
				$(".export_options").addClass("hidden");
				elem.removeClass("hidden");
			});

			$('button#fn_start').click(function() {
				if ($(".export_options:visible")) {
					field = $(".export_options:visible").find('select').attr('name');
					value = $(".export_options:visible").find('select').val();
				}
				Piecon.setOptions({fallback: 'force'});
				Piecon.setProgress(0);
				var progress_item = $("#progressbar"); //specify an element selector with animation
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
	{/literal}
</script>