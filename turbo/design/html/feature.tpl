{if $feature->id}
	{$meta_title = $feature->name scope=global}
{else}
	{$meta_title = $btr->feature_new scope=global}
{/if}

<div class="row">
	<div class="col-lg-12 col-md-12">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if !$feature->id}
					{$btr->feature_add|escape}
				{else}
					{$feature->name|escape}
				{/if}
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-12 col-sm-12 float-xs-right"></div>
</div>

{if $message_success}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_success">
				<div class="heading_box">
					{if $message_success=='added'}
						{$btr->feature_added|escape}
					{elseif $message_success=='updated'}
						{$btr->feature_updated|escape}
					{else}
						{$message_success|escape}
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

{if $message_error}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_warning">
				<div class="heading_box">
					{if $message_error=='empty_name'}
						{$btr->general_enter_title|escape}
					{elseif $message_error == "url_exists"}
						{$btr->feature_duplicate_url|escape}
					{else}
						{$message_error|escape}
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-xs-12">
			<div class="boxed match_matchHeight_true">
				<div class="row d_flex">
					<div class="col-lg-10 col-md-9 col-sm-12">
						<div class="heading_label">
							{$btr->general_name|escape}
						</div>
						<div class="form-group">
							<input class="form-control" name="name" type="text" value="{$feature->name|escape}">
							<input name="id" type="hidden" value="{$feature->id|escape}">
						</div>
						<div class="row">
							<div class="col-xs-12 col-lg-6 col-md-6">
								<div class="input-group">
									<span class="input-group-addon input-group-addon-left">URL</span>
									<input name="url" class="form-control fn_url {if $feature->id}fn_disabled{/if}" {if $feature->id}readonly="" {/if} type="text" value="{$feature->url|escape}">
									<input type="checkbox" id="block_translit" class="hidden" value="1" {if $feature->id}checked="" {/if}>
									<span class="input-group-addon fn_disable_url">
										{if $feature->id}
											<i class="url-lock"></i>
										{else}
											<i class="url-lock url-unlock"></i>
										{/if}
									</span>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-xs-12 mt-q">
								<div class="heading_label boxes_inline">{$btr->feature_url_in_product|escape}</div>
								<div class="boxes_inline">
									<div class="turbo_switch clearfix">
										<div class="form-check form-switch">
											<input class="form-check-input" id="url_in_product" name="url_in_product" value="1" type="checkbox" {if $feature->url_in_product}checked="" {/if}>
											<label class="form-check-label" for="url_in_product"></label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-sm-12">
						<div class="activity_of_switch">
							<div class="activity_of_switch_item">
								<div class="turbo_switch clearfix">
									<label class="switch_label">{$btr->feature_filter|escape}</label>
									<div class="form-check form-switch">
										<input class="form-check-input" id="in_filter" name="in_filter" value="1" type="checkbox" {if $feature->in_filter}checked="" {/if}>
										<label class="form-check-label" for="in_filter"></label>
									</div>
								</div>
							</div>
							<div class="activity_of_switch_item">
								<div class="turbo_switch clearfix">
									<label class="switch_label">{$btr->color_filter|escape}</label>
									<div class="form-check form-switch">
										<input class="form-check-input" id="is_color" name="is_color" value="1" type="checkbox" {if $feature->is_color}checked="" {/if}>
										<label class="form-check-label" for="is_color"></label>
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
		<div class="col-xs-12">
			<div class="boxed fn_toggle_wrap min_height_210px">
				<div class="heading_box">
					{$btr->feature_in_categories|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="boxed boxed_warning">
						<div>
							{$btr->feature_message|escape}
						</div>
					</div>
					<div class="activity_of_switch_item">
						<div class="turbo_switch clearfix">
							<label class="switch_label">{$btr->feature_select_all_categories|escape}</label>
							<div class="form-check form-switch">
								<input class="form-check-input" id="select_all_categories" name="" value="" type="checkbox">
								<label class="form-check-label" for="select_all_categories"></label>
							</div>
						</div>
					</div>
					<select class="selectpicker fn_select_all_categories col-xs-12 px-0" multiple name="feature_categories[]" size="10" data-selected-text-format="count">
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

	<div class="row">
		<div class="col-lg-12 col-md-12">
			<button type="submit" class="btn btn_small btn-primary float-md-right">
				{include file='svg_icon.tpl' svgId='checked'}
				<span>{$btr->general_apply|escape}</span>
			</button>
		</div>
	</div>

</form>
{if $features_values}
	<div class="row mt-1">
		<div class="col-lg-12 col-md-12">
			<div class="boxed fn_toggle_wrap min_height_210px">
				<div class="heading_box">
					{$btr->feature_feature_values|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="turbo_list tb_related_list">
								<div class="currencies_wrap clearfix">
									<div class="turbo_list_head">
										<div class="turbo_list_heading"></div>
										<div class="turbo_list_heading feature_value_name">{$btr->feature_value_name}</div>
										<div class="turbo_list_heading feature_value_translit">{$btr->feature_value_translit}</div>
										<div class="turbo_list_heading feature_value_products_num">{$btr->feature_value_products_num}</div>
										<div class="turbo_list_heading turbo_list_close"></div>
									</div>
									<div class="turbo_list_body">
										{foreach $features_values as $value}
											<div class="fn_row turbo_list_body_item">
												<div class="turbo_list_row">
													<div class="turbo_list_boding"></div>
													<div class="turbo_list_boding feature_value_name">
														<div class="heading_label visible_md">{$btr->feature_value_name}</div>
														<input type="text" class="form-control" name="value" value="{$value->value|escape}">
													</div>
													<div class="turbo_list_boding feature_value_translit">
														<div class="heading_label visible_md">{$btr->feature_value_translit}</div>
														<input type="text" class="form-control" name="translit" value="{$value->translit|escape}">
													</div>
													<div class="turbo_list_boding feature_value_products_num">
														<div class="heading_label visible_md">{$btr->feature_value_products_num}</div>
														<span class="form-control">{$value->count|escape}</span>
													</div>
													<div class="turbo_list_setting feature_save">
														<button data-hint="{$btr->general_apply|escape}" type="button" class="setting_icon setting_icon_new fn_ajax_update_options fn_active_class hint-bottom-middle-t-info-s-small-mobile hint-anim" data-old_value="{$value->value|escape}">
															{include file='svg_icon.tpl' svgId='save_icon'}
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
{/if}
{* On document load *}
{literal}
	<script>
		$(document).on('change', '#select_all_categories', function() {
			$('.fn_select_all_categories option').prop("selected", $(this).is(':checked'));
			$('.fn_select_all_categories').selectpicker('refresh');
		});
		$(function() {
			$('input[name="name"]').keyup(function() {
				if (!$('#block_translit').is(':checked')) {
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
			if ($(".fn_ajax_update_options").size() > 0) {
				$(document).on("click", ".fn_ajax_update_options", function() {
					ajax_update_options($(this));
				});
			}
		});

		if ($(".fn_ajax_update_options").size() > 0) {
			function ajax_update_options($this) {
				var feature_id, value, translit, session_id, old_value, line;
				line = $this.closest(".fn_row");
				feature_id = $this.data("feature_id");
				value = line.find('input[name=value]').val();
				translit = line.find('input[name=translit]').val();
				old_value = $this.data("old_value");
				session_id = '{/literal}{$smarty.session.id}{literal}';
				toastr.options = {
					closeButton: true,
					newestOnTop: true,
					progressBar: true,
					positionClass: 'toast-top-right',
					preventDuplicates: false,
					onclick: null
				};
				$.ajax({
					type: "POST",
					dataType: 'json',
					url: "ajax/update_options.php",
					data: {feature_id: '{/literal}{$feature->id}{literal}', value: value, translit: translit, old_value: old_value, session_id : session_id},
					success: function(data) {
						var msg = "";
						if (data) {
							$this.removeClass('unapproved');
							toastr.success(msg, "{/literal}{$btr->general_success|escape}{literal}");
							if (value == "approved" || value == "processed") {
								$this.closest("div").find(".fn_answer_btn").show();
								$this.closest(".fn_row").removeClass('unapproved');
							}
						} else {
							toastr.error(msg, "{/literal}{$btr->general_error|escape}{literal}");
						}
					}
				});
				return false;
			}
		}
	</script>
{/literal}