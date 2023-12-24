{if isset($feature->id)}
	{$meta_title = $feature->name scope=global}
{else}
	{$meta_title = $btr->feature_new scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if !isset($feature->id)}
			{$btr->feature_add|escape}
		{else}
			{$feature->name|escape}
		{/if}
	</h1>
</div>

{if isset($message_success)}
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
					{if $smarty.get.return}
						<a class="alert-link fw-normal btn-return text-decoration-none me-5" href="{$smarty.get.return}">
							<i class="align-middle mt-n1" data-feather="corner-up-left"></i>
							{$btr->global_back|escape}
						</a>
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if isset($message_error)}
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

<form class="js-fast-button" method="post" enctype="multipart/form-data">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_title|escape}</div>
								<input class="form-control" name="name" type="text" value="{if isset($feature->name)}{$feature->name|escape}{/if}">
								<input name="id" type="hidden" value="{if isset($feature->id)}{$feature->id|escape}{/if}">
							</div>
							<div class="row">
								<div class="col-xs-12 col-lg-6 col-md-6">
									<div class="mt-2 mb-3">
										<div class="input-group">
											<span class="input-group-text">URL</span>
											<input name="url" class="form-control js-url {if isset($feature->id)}js-disabled{/if}" {if isset($feature->id)}readonly="" {/if} type="text" value="{if isset($feature->url)}{$feature->url|escape}{/if}">
											<input type="checkbox" id="block-translit" class="d-none" value="1" {if isset($feature->id)}checked="" {/if}>
											<span class="input-group-text js-disable-url">
												{if isset($feature->id)}
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
											<input class="form-check-input ms-2" type="checkbox" id="url-in-product" name="url_in_product" value="1" type="checkbox" {if isset($feature->url_in_product) && $feature->url_in_product}checked="" {/if}>
											<label class="form-check-label ms-2" for="url-in-product">{$btr->feature_url_in_product|escape}</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="in-filter" name="in_filter" value="1" type="checkbox" {if isset($feature->in_filter) && $feature->in_filter}checked="" {/if}>
									<label class="form-check-label ms-2" for="in-filter">{$btr->feature_filter|escape}</label>
								</div>
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="is-color" name="is_color" value="1" type="checkbox" {if isset($feature->is_color) && $feature->is_color}checked="" {/if}>
									<label class="form-check-label ms-2" for="is-color">{$btr->color_filter|escape}</label>
								</div>
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="is-size" name="is_size" value="1" type="checkbox" {if isset($feature->is_size) && $feature->is_size}checked="" {/if}>
									<label class="form-check-label ms-2" for="is-size">{$btr->size_filter|escape}</label>
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
								<select class="selectpicker js-select-all-categories px-0 d-none" multiple name="feature_categories[]" size="15" data-selected-text-format="count">
									{function name=category_select level=0}
										{foreach $categories as $category}
											<option value="{$category->id}" {if in_array($category->id, $feature_categories)}selected{/if} {if isset($category->single_name)}category_name="{$category->single_name}" {/if}>{section name=sp loop=$level}--{/section} {$category->name}</option>
											{if isset($category->subcategories)}
												{category_select categories=$category->subcategories level=$level+1}
											{/if}
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
	</div>
	{if isset($feature->id) && $feature_categories}
		<div class="row">
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
						<h5 class="card-title mb-0">{$btr->feature_feature_values|escape} ({$options_count})</h5>
					</div>
					<div class="collapse-card">
						<div class="card-body">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<div class="turbo-list tb-related-list">
										<div class="currencies-wrap clearfix">
											<div class="turbo-list-head">
												<div class="turbo-list-heading turbo-list-drag"></div>
												<div class="turbo-list-heading feature-value-name">{$btr->global_value}</div>
												<div class="turbo-list-heading feature-value-translit text-center">{$btr->feature_value_translit}</div>
												<div class="turbo-list-heading feature-value-products-num text-center">{$btr->feature_value_products_num}</div>
												<div class="turbo-list-heading turbo-list-delete"></div>
											</div>
											<div class="turbo-list-body sortable js-values-list">
												{foreach $options as $option}
													<div class="js-row turbo-list-body-item js-sort-item">
														<div class="turbo-list-row mb-3 mb-md-0">
															<input type="hidden" name="options[id][]" value="{$option->id|escape}">
															<input type="hidden" class="js-options-delete" name="options_delete[]" disabled="" value="{$option->id|escape}">
															<div class="turbo-list-boding turbo-list-drag move-zone">
																<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
															</div>
															<div class="turbo-list-boding feature-value-name">
																<div class="form-label d-block d-md-none">{$btr->global_value}</div>
																{if isset($feature->is_color) && $feature->is_color}
																	<div class="input-group color-picker">
																		<input type="text" class="form-control" name="options[value][]" value="{$option->value|escape}">
																		<span class="input-group-text add-on"><i></i></span>
																	</div>
																{else}
																	<input type="text" class="form-control" name="options[value][]" value="{$option->value|escape}">
																{/if}
															</div>
															<div class="turbo-list-boding feature-value-translit">
																<div class="form-label d-block d-md-none">{$btr->feature_value_translit}</div>
																<input type="text" class="form-control" name="options[translit][]" value="{$option->translit|escape}">
															</div>
															<div class="turbo-list-boding feature-value-products-num">
																<div class="form-label d-block d-md-none">{$btr->feature_value_products_num}</div>
																<a href="index.php?module=ProductsAdmin&features[{$feature->id}]={$option->translit|escape}" class="form-control text-body text-decoration-none" target="_blank" disabled>{$option->count|escape}</a>
															</div>
															<div class="turbo-list-setting feature-save">
																<div class="form-label d-block d-md-none">&nbsp;</div>
																<button type="button" class="btn-delete js-remove-option" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
																	<i class="align-middle" data-feather="trash-2"></i>
																</button>
															</div>
														</div>
													</div>
												{/foreach}
												<div class="js-row turbo-list-body-item js-sort-item js-new-value" style="display: none;">
													<div class="turbo-list-row mb-3 mb-md-0">
														<input type="hidden" name="options[id][]" value="">
														<input type="hidden" class="js-options-delete" name="options_delete[]" disabled="" value="">
														<div class="turbo-list-boding turbo-list-drag move-zone">
															<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
														</div>
														<div class="turbo-list-boding feature-value-name">
															<div class="form-label d-block d-md-none">{$btr->global_value}</div>
															{if isset($feature->is_color) && $feature->is_color}
																<div class="input-group">
																	<input type="text" class="form-control" name="options[value][]" value="#ffffff">
																	<span class="input-group-text add-on"><i></i></span>
																</div>
															{else}
																<input type="text" class="form-control" name="options[value][]" value="">
															{/if}
														</div>
														<div class="turbo-list-boding feature-value-translit">
															<div class="form-label d-block d-md-none">{$btr->feature_value_translit}</div>
															<input type="text" class="form-control" name="options[translit][]" value="">
														</div>
														<div class="turbo-list-boding feature-value-products-num">
															<div class="form-label d-block d-md-none">{$btr->feature_value_products_num}</div>
															<a href="#" class="form-control text-body text-decoration-none" disabled>0</a>
														</div>
														<div class="turbo-list-setting feature-save">
															<div class="form-label d-block d-md-none">&nbsp;</div>
															<button type="button" class="btn-delete js-remove-option" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
																<i class="align-middle" data-feather="trash-2"></i>
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
								<div class="col-12 mt-3">
									{include file='pagination.tpl'}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}
	<div class="row">
		{if isset($feature->id) && $feature_categories}
			<div class="col-md-6">
				<div class="d-grid d-md-block">
					<button type="button" class="js-add-value btn btn-success mt-3">
						<i data-feather="plus"></i>
						{$btr->feature_add_value|escape}
					</button>
				</div>
			</div>
			<div class="col-md-6">
				<div class="d-grid d-md-block">
					<button type="submit" class="btn btn-primary float-end mt-3">
						<i class="align-middle" data-feather="check"></i>
						{$btr->global_apply|escape}
					</button>
				</div>
			</div>
		{else}
			<div class="col">
				<div class="d-grid d-md-block">
					<button type="submit" class="btn btn-primary float-end mt-3">
						<i class="align-middle" data-feather="check"></i>
						{$btr->global_apply|escape}
					</button>
				</div>
			</div>
		{/if}
	</div>
</form>

{* Colorpicker *}
{css id="colorpicker" include=["turbo/design/js/colorpicker/css/bootstrap-colorpicker.min.css"]}{/css}
{stylesheet minify=true}

{js id="colorpicker" priority=99 include=["turbo/design/js/colorpicker/js/bootstrap-colorpicker.min.js"]}{/js}
{javascript minify=true}

{literal}
	<script>
		$(window).on('load', function() {

			var colorPickerOptions = {
				colorSelectors: {
					"black": "#000000",
					"blue": "#0000ff",
					"brown": "#a52a2a",
					"gray": "#808080",
					"green": "#008000",
					"red": "#ff0000",
					"orange": "#ffa500",
					"yellow": "#ffff00",
					"white": "#ffffff"
				},
				format: "hex"
			};

			$('.color-picker').colorpicker(colorPickerOptions);

			$(document).on('change', '#select-all-categories', function() {
				$('.js-select-all-categories option').prop("selected", $(this).is(':checked'));
				$('.js-select-all-categories').selectpicker('refresh');
			});

			var new_value = $('.js-new-value').clone(true);
			$('.js-new-value').remove().removeAttr('id');
			$('.js-add-value').click(function() {
				var new_line = $(new_value).clone(true);
				new_line.appendTo('.turbo-list-body').fadeIn('slow');
				new_line.find('.input-group').addClass('color-picker').colorpicker(colorPickerOptions);
				return false;
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

			$(document).on('click', '.js-remove-option', function() {
				$(this).closest('.js-row').fadeOut(200, function() {
					$(this).closest('.js-row').find('.js-options-delete').attr('disabled', false);
				});
			});

			$('.js-select-all-categories').removeClass('d-none');
		});
	</script>
{/literal}