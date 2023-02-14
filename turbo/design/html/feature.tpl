{if $feature->id}
	{$meta_title = $feature->name scope=global}
{else}
	{$meta_title = $btr->feature_new scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if !$feature->id}
			{$btr->feature_add|escape}
		{else}
			{$feature->name|escape}
		{/if}
	</h1>
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success=='added'}
						{$btr->feature_added|escape}
					{elseif $message_success=='updated'}
						{$btr->feature_updated|escape}
					{else}
						{$message_success|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error=='empty_name'}
						{$btr->global_enter_name|escape}
					{elseif $message_error == "url_exists"}
						{$btr->feature_duplicate_url|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_title|escape}</div>
								<input class="form-control" name="name" type="text" value="{$feature->name|escape}">
								<input name="id" type="hidden" value="{$feature->id|escape}">
							</div>
							<div class="row">
								<div class="col-xs-12 col-lg-6 col-md-6">
									<div class="mt-2 mb-3">
										<div class="input-group">
											<span class="input-group-text">URL</span>
											<input name="url" class="form-control js-url {if $feature->id}js-disabled{/if}" {if $feature->id}readonly=""{/if} type="text" value="{$feature->url|escape}">
											<input type="checkbox" id="block-translit" class="d-none" value="1" {if $feature->id}checked=""{/if}>
											<span class="input-group-text js-disable-url">
												{if $feature->id}
													<i class="url-lock"></i>
												{else}
													<i class="url-lock url-unlock"></i>
												{/if}
											</span>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-xs-12">
									<div class="d-flex justify-content-center align-content-start flex-wrap flex-md-column h-100">
										<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
											<input class="form-check-input ms-2" type="checkbox" id="url-in-product" name="url_in_product" value="1" type="checkbox" {if $feature->url_in_product}checked=""{/if}>
											<label class="form-check-label ms-2" for="url-in-product">{$btr->feature_url_in_product|escape}</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="in-filter" name="in_filter" value="1" type="checkbox" {if $feature->in_filter}checked=""{/if}>
									<label class="form-check-label ms-2" for="in-filter">{$btr->feature_filter|escape}</label>
								</div>
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="is-color" name="is_color" value="1" type="checkbox" {if $feature->is_color}checked=""{/if}>
									<label class="form-check-label ms-2" for="is-color">{$btr->color_filter|escape}</label>
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
					<h5 class="card-title mb-0">{$btr->feature_in_categories|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="alert alert-danger alert-dismissible fade show" role="alert">
							<div class="alert-message">
								{$btr->feature_message|escape}
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="form-check form-switch form-check-reverse float-start mb-3">
									<input class="form-check-input ms-2" type="checkbox" id="select-all-categories">
									<label class="form-check-label" for="select-all-categories">{$btr->feature_select_all_categories|escape}</label>
								</div>
							</div>
							<div class="col-12 col-md-6 col-lg-6">
								<select class="selectpicker js-select-all-categories px-0" multiple name="feature_categories[]" size="15" data-selected-text-format="count">
									{function name=category_select selected_id=$product_category level=0}
										{foreach $categories as $category}
											<option value='{$category->id}' {if in_array($category->id, $feature_categories)}selected{/if} category_name='{$category->single_name}'>{section name=sp loop=$level}&nbsp;&nbsp;&nbsp;&nbsp;{/section}{$category->name}</option>
											{category_select categories=$category->subcategories selected_id=$selected_id  level=$level+1}
										{/foreach}
									{/function}
									{category_select categories=$categories}
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12">
			<div class="d-grid d-sm-block">
				<button type="submit" class="btn btn-primary float-end my-3">
					<i class="align-middle" data-feather="check"></i>
					{$btr->global_apply|escape}
				</button>
			</div>
		</div>
	</div>
</form>
{if $features_values}
	<div class="row mt-1">
		<div class="col-lg-12 col-md-12">
			<div class="card mh-210px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->feature_feature_values|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="turbo-list tb-related-list">
									<div class="currencies-wrap clearfix">
										<div class="turbo-list-head">
											<div class="turbo-list-heading"></div>
											<div class="turbo-list-heading feature-value-name">{$btr->global_value}</div>
											<div class="turbo-list-heading feature-value-translit">{$btr->feature_value_translit}</div>
											<div class="turbo-list-heading feature-value-products-num">{$btr->feature_value_products_num}</div>
											<div class="turbo-list-heading turbo-list-delete"></div>
										</div>
										<div class="turbo-list-body">
											{foreach $features_values as $value}
												<div class="js-row turbo-list-body-item">
													<div class="turbo-list-row mb-3 mb-md-0">
														<div class="turbo-list-boding"></div>
														<div class="turbo-list-boding feature-value-name">
															<div class="form-label d-block d-md-none">{$btr->global_value}</div>
															<input type="text" class="form-control" name="value" value="{$value->value|escape}">
														</div>
														<div class="turbo-list-boding feature-value-translit">
															<div class="form-label d-block d-md-none">{$btr->feature_value_translit}</div>
															<input type="text" class="form-control" name="translit" value="{$value->translit|escape}">
														</div>
														<div class="turbo-list-boding feature-value-products-num">
															<div class="form-label d-block d-md-none">{$btr->feature_value_products_num}</div>
															<span class="form-control">{$value->count|escape}</span>
														</div>
														<div class="turbo-list-setting feature-save">
															<div class="form-label d-block d-md-none">&nbsp;</div>
															<button type="button" class="setting-icon setting-icon-new js-ajax-update-options js-active-class" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_apply|escape}" data-old_value="{$value->value|escape}">
																<i class="align-middle" data-feather="save"></i>
															</button>
														</div>
													</div>
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
	</div>
{/if}

{literal}
	<script>
		$(document).on('change', '#select-all-categories', function() {
			$('.js-select-all-categories option').prop("selected", $(this).is(':checked'));
			$('.js-select-all-categories').selectpicker('refresh');
		});
		
		$(function() {
			$('input[name="name"]').keyup(function() {
				if (!$('#block-translit').is(':checked')) {
					$('input[name="url"]').val(generate_url());
				}
			});
		});

		function generate_url() {
			url = $('input[name="name"]').val();
			url = url.replace(/[\s-_]+/gi, '');
			url = translit(url);
			url = url.replace(/[^0-9a-z\-]+/gi, '').toLowerCase();
			return url;
		}

		function translit(str) {
			var cyr = ("А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я-'_'").split("-")
			var lat = ("A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch-'-'-Y-y-'-'-E-e-YU-yu-YA-ya-''").split("-")
			var res = '';
			for (var i = 0, l = str.length; i < l; i++) {
				var s = str.charAt(i),
					n = cyr.indexOf(s);
				if (n >= 0) { res += lat[n]; } else { res += s; }
			}
			return res;
		}

		$(function() {
			/* Call an ajax entity update */
			if ($(".js-ajax-update-options").size() > 0) {
				$(document).on("click", ".js-ajax-update-options", function() {
					ajax_update_options($(this));
				});
			}
		});

		if ($(".js-ajax-update-options").size() > 0) {
			function ajax_update_options($this) {
				var feature_id, value, translit, session_id, old_value, line;
				line = $this.closest(".js-row");
				feature_id = $this.data("feature_id");
				value = line.find('input[name=value]').val();
				translit = line.find('input[name=translit]').val();
				old_value = $this.data("old_value");
				session_id = '{/literal}{$smarty.session.id}{literal}';
				$.ajax({
					type: "POST",
					dataType: 'json',
					url: "ajax/update_options.php",
					data: {feature_id: '{/literal}{$feature->id}{literal}', value: value, translit: translit, old_value: old_value, session_id : session_id},
					success: function(data) {
						var msg = "";
						if (data) {
							$this.removeClass('unapproved');
							notyf.success({message: '{/literal}{$btr->global_success|escape}{literal}', dismissible: true});
								if (value == "approved" || value == "processed") {
									$this.closest("div").find(".js-answer_btn").show();
									$this.closest(".js-row").removeClass('unapproved');
								}
						} else {
							notyf.error({message: '{/literal}{$btr->global_error|escape}{literal}', dismissible: true});
						}
					}
				});
				return false;
			}
		}
	</script>
{/literal}