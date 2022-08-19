{if $product->id}
	{$meta_title = $product->name scope=global}
{else}
	{$meta_title = $btr->product_new scope=global}
{/if}

<div class="row">
	<div class="col-lg-12 col-md-12">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if !$product->id}
					{$btr->product_add|escape}
				{else}
					{$product->name|escape}
				{/if}
			</div>
			{if $product->id}
				<div class="box_btn_heading">
					<a class="btn btn_small btn-primary add" target="_blank" href="../{$lang_link}products/{$product->url}">
						{include file='svg_icon.tpl' svgId='icon_desktop'}
						<span>{$btr->general_open|escape}</span>
					</a>
				</div>
			{/if}
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
						{$btr->product_added|escape}
					{elseif $message_success=='updated'}
						{$btr->product_updated|escape}
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
					{if $message_error=='url_exists'}
						{$btr->product_exists|escape}
					{elseif $message_error=='empty_name'}
						{$btr->general_enter_title|escape}
					{elseif $message_error == 'empty_url'}
						{$btr->general_enter_url|escape}
					{elseif $message_error == 'url_wrong'}
						{$btr->general_not_underscore|escape}
					{elseif $message_error == 'empty_categories'}
						{$btr->product_no_category|escape}
					{else}
						{$message_error|escape}
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}
<form method="post" id="product" enctype="multipart/form-data" class="clearfix fn_fast_button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<input type="hidden" name="lang_id" value="{$lang_id}" />
	<div class="row">
		<div class="col-xs-12">
			<div class="boxed">
				<div class="row d_flex">
					<div class="col-lg-10 col-md-9 col-sm-12">
						<div class="heading_label">
							{$btr->general_name|escape}
						</div>
						<div class="form-group">
							<input class="form-control" name="name" type="text" value="{$product->name|escape}" />
							<input name="id" type="hidden" value="{$product->id|escape}" />
						</div>
						<div class="row">
							<div class="col-xs-12 col-lg-6 col-md-10">
								<div class="mt-h mb-h">
									<div class="input-group">
										<span class="input-group-addon input-group-addon-left">URL</span>
										<input name="url" class="fn_meta_field form-control fn_url {if $product->id}fn_disabled{/if}" {if $product->id}readonly="" {/if} type="text" value="{$product->url|escape}" />
										<input type="checkbox" id="block_translit" class="hidden" value="1" {if $product->id}checked="" {/if}>
										<span class="input-group-addon fn_disable_url">
											{if $product->id}
												<i class="url-lock"></i>
											{else}
												<i class="url-lock url-unlock"></i>
											{/if}
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-sm-12">
						<div class="activity_of_switch">
							<div class="activity_of_switch_item">
								<div class="turbo_switch clearfix">
									<label class="switch_label">{$btr->general_enable|escape}</label>
									<div class="form-check form-switch">
										<input class="form-check-input" id="visible_checkbox" name="visible" value="1" type="checkbox" {if $product->visible}checked="" {/if}>
										<label class="form-check-label" for="visible_checkbox"></label>
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
		<div class="col-lg-8 col-md-12 pr-0">
			<div class="boxed fn_toggle_wrap min_height_210px">
				<div class="heading_box">
					{$btr->general_additional_settings|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="permission_block">
						<div class="permission_boxes row">
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->general_bestseller|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="featured_checkbox" name="featured" value="1" type="checkbox" {if $product->featured}checked="" {/if}>
										<label class="form-check-label" for="featured_checkbox"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->general_new|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="new_checkbox" name="is_new" value="1" type="checkbox" {if $product->is_new}checked="" {/if}>
										<label class="form-check-label" for="new_checkbox"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->general_hit|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="hit_checkbox" name="is_hit" value="1" type="checkbox" {if $product->is_hit}checked="" {/if}>
										<label class="form-check-label" for="hit_checkbox"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="permission_box">
									<span>{$btr->feature_xml|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="export_checkbox" name="to_export" value="1" type="checkbox" {if $product->to_export}checked="" {/if}>
										<label class="form-check-label" for="export_checkbox"></label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-12">
			<div class="boxed fn_toggle_wrap min_height_210px">
				<div class="heading_box">
					{$btr->product_rating|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="heading_label">
						{$btr->product_rating_value|escape}
						<span class="font-weight-bold fn_show_rating">{$product->rating}</span>
					</div>
					<div class="raiting_boxed">
						<input class="fn_rating_value" type="hidden" value="{$product->rating}" name="rating" />
						<input class="fn_rating range_input" type="range" min="1" max="5" step="0.1" value="{$product->rating}" />

						<div class="raiting_range_number">
							<span class="float-xs-left">1</span>
							<span class="float-xs-right">5</span>
						</div>
					</div>
					<div class="heading_label">
						{$btr->product_rating_number|escape}
						<input type="text" class="form-control" name="votes" value="{$product->votes}">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-8 col-md-12 pr-0">
			<div class="boxed fn_toggle_wrap min_height_270px">
				<div class="heading_box">
					{$btr->product_images|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap fn_card on">
					<ul class="fn_droplist_wrap product_images_list clearfix sortable" data-image="product">
						<li class="fn_dropzone dropzone_block">
							{include file='svg_icon.tpl' svgId='plus_big'}
							<input type="file" name="dropped_images[]" multiple class="dropinput">
						</li>
						{foreach $product_images as $image}
							<li class="product_image_item {if $image@first}first_image{/if} {if $image@iteration > 4}fn_toggle_hidden hidden{/if} fn_sort_item">
								<button type="button" class="fn_remove_image remove_image"></button>
								<i class="move_zone">
									{if $image}
										<img class="product_icon" src="{$image->filename|resize:200:100}" alt="" />
									{else}
										<img class="product_icon" src="design/images/no_image.svg" width="50">
									{/if}
									<input type="hidden" name='images[]' value="{$image->id}">
								</i>
							</li>
						{/foreach}
						<li class="fn_new_image_item product_image_item fn_sort_item">
							<button type="button" class="fn_remove_image remove_image"></button>
							<img src="" alt="" />
							<input type="hidden" name='images_urls[]' value="">
						</li>
					</ul>
					{if $product_images|count > 4}
						<div class="show_more_images fn_show_images">{$btr->product_images_all|escape}</div>
					{/if}
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-12 ">
			<div class="boxed fn_toggle_wrap min_height_270px">
				<div class="row">
					<div class="col-lg-12 toggle_body_wrap on fn_card">
						<div class="heading_label">{$btr->product_sale_to|escape}</div>
						<p><input id="sale_to" name="sale_to" class="form-control" autocomplete="off" type="text" value="{$product->sale_to}" /></p>
						<div class="heading_label">{$btr->general_brand|escape}</div>
						<select name="brand_id" class="selectpicker mb-1 fn_meta_brand" data-live-search="true">
							<option value="0" {if !$product->brand_id}selected="" {/if} data-brand_name="">{$btr->general_not_set|escape}</option>
							{foreach $brands as $brand}
								<option value="{$brand->id}" {if $product->brand_id == $brand->id}selected="" {/if} data-brand_name="{$brand->name|escape}">{$brand->name|escape}</option>
							{/foreach}
						</select>
						<div class="heading_label">{$btr->general_category|escape}</div>
						<fieldset class="form-group">
							<div id="product_categories" {if !$categories}style='display:none;' {/if}>
								<div class="product_cats" id="product_cats">
									{foreach $product_categories as $product_category name=categories}
										<span class="list">
											{assign var ='first_category' value=reset($product_categories)}
											<div class="input-group">
												<select name="categories[]" class="selectpicker form-control fn_meta_categories" data-live-search="true">
													<option value="0" data-category_name="">{$btr->not_specified}</option>
													{function name=category_select level=0}
														{foreach $categories as $category}
															<option value='{$category->id}' {if $category->id == $selected_id}selected{/if} category_name='{$category->name|escape}'>{section name=sp loop=$level}-{/section} {$category->name|escape}</option>
															{category_select categories=$category->subcategories selected_id=$selected_id  level=$level+1}
														{/foreach}
													{/function}
													{category_select categories=$categories selected_id=$product_category->id}
												</select>
												<span {if not $smarty.foreach.categories.first}style='display:none;' {/if} tabindex="0" class="add input-group-addon-categories">
													{include file='svg_icon.tpl' svgId='plus'}
												</span>
												<span onclick="" {if $smarty.foreach.categories.first}style='display:none;' {/if} tabindex="0" class="delete input-group-addon-categories">
													{include file='svg_icon.tpl' svgId='minus'}
												</span>
											</div>
											<br>
										</span>
									{/foreach}
								</div>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed fn_toggle_wrap match_matchHeight_true">
				<div class="heading_box">
					{$btr->general_options|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="variants_wrapper fn_card">
					<div class="turbo_list variants_list scrollbar-variants">
						<div class="turbo_list_body sortable variants_listadd">
							{foreach $product_variants as $variant}
								<div class="turbo_list_body_item variants_list_item">
									<div class="turbo_list_row">
										<div class="turbo_list_boding variants_item_drag">
											<div class="heading_label"></div>
											<div class="move_zone">
												{include file='svg_icon.tpl' svgId='drag_vertical'}
											</div>
										</div>
										<div class="turbo_list_boding variants_item_sku">
											<div class="heading_label">{$btr->general_sku|escape}</div>
											<input class="variant_input" name="variants[sku][]" type="text" value="{$variant->sku|escape}" />
										</div>
										<div class="turbo_list_boding variants_item_name">
											<div class="heading_label">{$btr->general_option_name|escape}</div>
											<input name="variants[id][]" type="hidden" value="{$variant->id|escape}" />
											<input class="variant_input" name="variants[name][]" type="text" value="{$variant->name|escape}" />
										</div>
										<div class="turbo_list_boding variants_item_height color-picker">
											<div class="heading_label"></div>
											<span data-hint="{$btr->select_color|escape}" class="hint-top-right-t-info-s-small-mobile hint-anim">
												<input name="variants[color_code][]" type="hidden" value="{$variant->color_code|escape}" class="" />
												<div class="add-on colorPicker-picker"></div>
											</span>
										</div>
										<div class="turbo_list_boding variants_item_color">
											<div class="heading_label">{$btr->general_color|escape}</div>
											<input name="variants[color][]" class="variant_input" type="text" value="{$variant->color|escape}" />
										</div>
										<div class="turbo_list_boding variants_item_image">
											<div class="heading_label"></div>
											<a href='javascript:;' data-hint="{$btr->select_color_image|escape}" class="hint-top-right-t-info-s-small-mobile hint-anim add_images"><img src="design/images/picture{if !$variant->images_ids}_empty{/if}.svg" title="{$btr->select_color_image|escape}" /></a>
											<input name="variants[images_ids][]" type="hidden" value="{$variant->images_ids|escape}" />
										</div>
										<div class="turbo_list_boding variants_item_price">
											<div class="heading_label">{$btr->general_price|escape}, {if isset($currencies[$variant->currency_id])}{$currencies[$variant->currency_id]->sign|escape}{else}{$currency->sign}{/if}</div>
											<input class="variant_input" name="variants[price][]" type="text" value="{$variant->oprice|escape}" />
										</div>
										<div class="turbo_list_boding variants_item_discount">
											<div class="heading_label">{$btr->general_old_price|escape}, {if isset($currencies[$variant->currency_id])}{$currencies[$variant->currency_id]->sign|escape}{else}{$currency->sign}{/if}</div>
											<input class="variant_input text_grey" name="variants[compare_price][]" type="text" value="{$variant->compare_oprice|escape}" />
										</div>
										<div class="turbo_list_boding variants_item_currency">
											<div class="heading_label">{$btr->general_currency|escape}</div>
											<select name="variants[currency_id][]" class="selectpicker">
												{foreach $currencies as $c}
													<option value="{$c->id}" {if $c->id == $variant->currency_id}selected="" {/if}>{$c->code|escape}</option>
												{/foreach}
											</select>
										</div>
										<div class="turbo_list_boding variants_item_weight">
											<div class="heading_label">{$btr->general_weight|escape}, {$settings->weight_units}</div>
											<input class="variant_input" name="variants[weight][]" type="text" value="{$variant->weight|escape}" />
										</div>
										<div class="turbo_list_boding variants_item_amount">
											<div class="heading_label">{$btr->general_qty|escape}</div>
											<div class="input-group">
												<input class="form-control" name="variants[stock][]" type="text" value="{if $variant->infinity || $variant->stock == ''}∞{else}{$variant->stock|escape}{/if}" />
												<span class="input-group-addon p-0">
													{$settings->units|escape}
												</span>
											</div>
										</div>
										{if !$variant@first}
											<div class="turbo_list_boding turbo_list_close remove_variant">
												<div class="heading_label"></div>
												<button data-hint="{$btr->delete_variants|escape}" type="button" class="btn_close fn_remove_variant hint-bottom-right-t-info-s-small-mobile  hint-anim">
													{include file='svg_icon.tpl' svgId='delete'}
												</button>
											</div>
										{/if}
									</div>
								</div>
							{/foreach}
							<div class="turbo_list_body_item variants_list_item fn_new_row_variant">
								<div class="turbo_list_row ">
									<div class="turbo_list_boding variants_item_drag">
										<div class="heading_label"></div>
										<div class="move_zone">
											{include file='svg_icon.tpl' svgId='drag_vertical'}
										</div>
									</div>
									<div class="turbo_list_boding variants_item_sku">
										<div class="heading_label">{$btr->general_sku|escape}</div>
										<input class="variant_input" name="variants[sku][]" type="text" value="" />
									</div>
									<div class="turbo_list_boding variants_item_name">
										<div class="heading_label">{$btr->general_option_name|escape}</div>
										<input name="variants[id][]" type="hidden" value="" />
										<input class="variant_input" name="variants[name][]" type="text" value="" />
									</div>
									<div class="turbo_list_boding variants_item_height">
										<div class="heading_label"></div>
										<span data-hint="{$btr->select_color|escape}" class="hint-top-right-t-info-s-small-mobile hint-anim">
											<input name="variants[color_code][]" type="hidden" value="" />
											<div class="add-on colorPicker-picker"></div>
										</span>
									</div>
									<div class="turbo_list_boding variants_item_color">
										<div class="heading_label">{$btr->general_color|escape}</div>
										<input name="variants[color][]" class="variant_input" type="text" value="" />
									</div>
									<div class="turbo_list_boding variants_item_image">
										<div class="heading_label"></div>
										<a href='javascript:;' data-hint="{$btr->select_color_image|escape}" class="hint-top-right-t-info-s-small-mobile hint-anim add_images"><img src="design/images/picture_empty.svg" title="{$btr->select_color_image|escape}" /></a>
										<input name="variants[images_ids][]" type="hidden" value="" />
									</div>
									<div class="turbo_list_boding variants_item_price">
										<div class="heading_label">{$btr->general_price|escape}, {$currency->sign}</div>
										<input class="variant_input" name="variants[price][]" type="text" value="" />
									</div>
									<div class="turbo_list_boding variants_item_discount">
										<div class="heading_label">{$btr->general_old_price|escape}, {$currency->sign}</div>
										<input class="variant_input" name="variants[compare_price][]" type="text" value="" />
									</div>
									<div class="turbo_list_boding variants_item_currency">
										<div class="heading_label">{$btr->general_currency|escape}</div>
										<select name="variants[currency_id][]">
											{foreach $currencies as $c}
												<option value="{$c->id}">{$c->code|escape}</option>
											{/foreach}
										</select>
									</div>
									<div class="turbo_list_boding variants_item_weight">
										<div class="heading_label">{$btr->general_weight|escape}, {$settings->weight_units}</div>
										<input class="variant_input" name="variants[weight][]" type="text" value="" />
									</div>
									<div class="turbo_list_boding variants_item_amount">
										<div class="heading_label">{$btr->general_qty|escape}</div>
										<div class="input-group">
											<input class="form-control" name="variants[stock][]" type="text" value="∞" />
											<span class="input-group-addon p-0">
												{$settings->units|escape}
											</span>
										</div>
									</div>
									<div class="turbo_list_boding turbo_list_close remove_variant">
										<div class="heading_label"></div>
										<button data-hint="{$btr->delete_variants|escape}" type="button" class="btn_close fn_remove_variant hint-bottom-right-t-info-s-small-mobile hint-anim">
											{include file='svg_icon.tpl' svgId='delete'}
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="box_btn_heading mt-1">
						<button type="button" class="btn btn_mini btn-primary fn_add_variant">
							{include file='svg_icon.tpl' svgId='plus'}
							<span>{$btr->product_add_option|escape}</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-12 pr-0">
			<div class="boxed fn_toggle_wrap min_height_210px">
				<div class="heading_box">
					{$btr->product_features|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="features_wrap fn_features_wrap">
						{foreach $features as $feature}
							<div class="fn_feature_block_{$feature->id}">
								{assign var="feature_id" value=$feature->id}
								{foreach $options[$feature->id]->values as $feature_value}
									<div class="feature_row clearfix">
										<span feature_id={$feature_id}>
												<div class="feature_name{if !$feature_value@first} additional_values{/if} {if !$feature_value@first}feature_value_mobile{/if}">
													{if $feature_value@first}
														<span title="{$feature->name|escape}">
															<a href="index.php?module=FeatureAdmin&id={$feature->id}" target="_blank">
																{$feature->name|escape}
															</a>
														</span>
													{/if}
												</div>
											<div class="feature_value {if $feature->is_color}color-picker{/if}">
												<input class="feature_input fn_auto_option {if !$feature_value@first}feature_input_single{/if}" data-id="{$feature_id}" type="text" name="options[{$feature_id}][]" value="{$feature_value|escape}" />
												{if $feature->is_color}<div class="add-on colorPicker-picker"></div>{/if}
												<button type="button" class="btn btn_mini{if $feature_value@first} btn-feature {if $feature->is_color}fn_add_color{else}fn_add{/if}{else} btn-danger-feature fn_remove{/if} fn_feature_multi_values feature_multi_values">
													<span class="fn_plus" {if !$feature_value@first}style="display: none;" {/if}>
														{include file='svg_icon.tpl' svgId='plus'}
													</span>
													<span class="fn_minus" {if $feature_value@first}style="display: none;" {/if}>
														{include file='svg_icon.tpl' svgId='minus'}
													</span>
												</button>
											</div>
										</span>
									</div>
								{foreachelse}
									<div class="feature_row clearfix">
										<span feature_id={$feature_id}>
											<div class="feature_name">
												<span title="{$feature->name|escape}">
													<a href="index.php?module=FeatureAdmin&id={$feature->id}" target="_blank">
														{$feature->name|escape}
													</a>
												</span>
											</div>
											<div class="feature_value {if $feature->is_color}color-picker{/if}">
												<input class="feature_input fn_auto_option" data-id="{$feature_id}" type="text" name="options[{$feature_id}][]" value="" />
												{if $feature->is_color}<div class="add-on colorPicker-picker"></div>{/if}
												<button type="button" class="btn btn_mini btn-feature fn_add fn_feature_multi_values feature_multi_values">
													<span class="fn_plus">
														{include file='svg_icon.tpl' svgId='plus'}
													</span>
													<span class="fn_minus" style="display: none">
														{include file='svg_icon.tpl' svgId='minus'}
													</span>
												</button>
											</div>
										</span>
									</div>
								{/foreach}
							</div>
						{/foreach}
						<div class="fn_new_feature">
							<div feature_id="" class="new_feature_row clearfix">
								<div class="wrap_inner_new_feature">
									<input type="text" class="new_feature new_feature_name" name="new_features_names[]" placeholder="{$btr->product_features_enter|escape}" />
									<input type="text" class="new_feature new_feature_value" name="new_features_values[]" placeholder="{$btr->product_features_value_enter|escape}" />
								</div>
								<span class="fn_delete_feature btn_close delete_feature">
									{include file='svg_icon.tpl' svgId='delete'}
								</span>
							</div>
						</div>
						<div class="fn_new_feature_category">
							<div class="feature_row clearfix">
								<div class="feature_name">
									<span title="" class="fn_feature_name">
										<a href="" target="_blank"></a>
									</span>
								</div>
								<div class="feature_value">
									<input class="feature_input fn_auto_option" data-id="" type="text" name="" value="" />
									<button type="button" class="btn btn_mini btn-feature fn_add fn_feature_multi_values feature_multi_values">
										<span class="fn_plus">
											{include file='svg_icon.tpl' svgId='plus'}
										</span>
										<span class="fn_minus" style="display: none">
											{include file='svg_icon.tpl' svgId='minus'}
										</span>
									</button>
								</div>
							</div>
						</div>
						<div class="fn_new_value">
							<div class="feature_row clearfix">
									<div class="feature_name feature_value_mobile">
										<span title="" class="fn_feature_name">
											<a href="" target="_blank"></a>
										</span>
									</div>
								<div class="feature_value">
									<input class="feature_input fn_auto_option" data-id="" type="text" name="" value="" />
									<button type="button" class="btn btn_mini btn-feature fn_add fn_feature_multi_values feature_multi_values">
										<span class="fn_plus">
											{include file='svg_icon.tpl' svgId='plus'}
										</span>
										<span class="fn_minus" style="display: none">
											{include file='svg_icon.tpl' svgId='minus'}
										</span>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="box_btn_heading mt-1">
						<button type="button" class="btn btn_mini btn-primary fn_add_feature">
							{include file='svg_icon.tpl' svgId='plus'}
							<span>{$btr->product_feature_add|escape}</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="boxed fn_toggle_wrap min_height_210px">
				<div class="heading_box">
					{$btr->general_recommended|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card fn_sort_list">
					<div class="turbo_list ok_related_list">
						<div class="turbo_list_body related_products sortable">
							{foreach $related_products as $related_product}
								<div class="fn_row turbo turbo_list_body_item fn_sort_item">
									<div class="turbo_list_row">
										<div class="turbo_list_boding turbo_list_drag move_zone">
											{include file='svg_icon.tpl' svgId='drag_vertical'}
										</div>
										<div class="turbo_list_boding turbo_list_related_photo">
											<input type="hidden" name="related_products[]" value="{$related_product->id}">
											<a href="{url module=ProductAdmin id=$related_product->id}">
												{if $related_product->images[0]}
													<img class="product_icon" src='{$related_product->images[0]->filename|resize:40:40}'>
												{else}
													<img class="product_icon" src="design/images/no_image.svg" width="40">
												{/if}
											</a>
										</div>
										<div class="turbo_list_boding turbo_list_related_name">
											<a class="link" href="{url module=ProductAdmin id=$related_product->id}">{$related_product->name|escape}</a>
										</div>
										<div class="turbo_list_boding turbo_list_close">
											<button data-hint="{$btr->general_delete_product|escape}" type="button" class="btn_close fn_remove_item hint-bottom-right-t-info-s-small-mobile hint-anim">
												{include file='svg_icon.tpl' svgId='delete'}
											</button>
										</div>
									</div>
								</div>
							{/foreach}
							<div id="new_related_product" class="fn_row turbo turbo_list_body_item fn_sort_item" style='display:none;'>
								<div class="turbo_list_row">
									<div class="turbo_list_boding turbo_list_drag move_zone">
										{include file='svg_icon.tpl' svgId='drag_vertical'}
									</div>
									<div class="turbo_list_boding turbo_list_related_photo">
										<input type="hidden" name="related_products[]" value="">
										<img class="product_icon" src="">
									</div>
									<div class="turbo_list_boding turbo_list_related_name">
										<a class="link related_product_name" href=""></a>
									</div>
									<div class="turbo_list_boding turbo_list_close">
										<button data-hint="{$btr->general_delete_product|escape}" type="button" class="btn_close fn_remove_item hint-bottom-right-t-info-s-small-mobile  hint-anim">
											{include file='svg_icon.tpl' svgId='delete'}
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="heading_label">{$btr->general_recommended_add|escape}</div>
					<div class="autocomplete_arrow">
						<input type="text" name="related" id="related_products" class="form-control" placeholder='{$btr->general_add_product|escape}'>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-12 pr-0">
			<div class="boxed fn_toggle_wrap min_height_210px">
				<div class="heading_box">
					{$btr->product_files|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card fn_sort_list">
					<div class="turbo_list ok_related_list">
						<div class="turbo_list_body sortable">
							{foreach $cms_files as $file}
								<div class="fn_row turbo turbo_list_body_item fn_sort_item">
									<div class="turbo_list_row">
										<div class="turbo_list_boding turbo_list_drag move_zone">
											{include file='svg_icon.tpl' svgId='drag_vertical'}
										</div>
										<div class="turbo_list_boding">
											<input type="hidden" name="files[id][]" value="{$file->id}">
											<input class="form-control" type="text" name="files[name][]" value="{$file->name}">
										</div>
										<div class="turbo_list_boding turbo_list_related_name">
											<a class="link" href="../{$config->cms_files_dir}{$file->filename|escape}">{$file->filename|escape}</a>
										</div>
										<div class="turbo_list_boding turbo_list_close">
											<button data-hint="{$btr->general_delete_file|escape}" type="button" class="btn_close fn_remove_item hint-bottom-right-t-info-s-small-mobile hint-anim">
												{include file='svg_icon.tpl' svgId='delete'}
											</button>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
					<div class="heading_label">{$btr->general_add_file|escape}</div>
					<div class="heading_label">
						<p class="text_primary">
							{$btr->import_maxsize|escape}
							{if $config->max_upload_filesize>1024*1024}
								{$config->max_upload_filesize/1024/1024|round:'2'} {$btr->general_mb|escape}
							{else}
								{$config->max_upload_filesize/1024|round:'2'} {$btr->general_kb|escape}
							{/if}
						</p>
					</div>
					<div class="input_file_container">
						<input class="file_upload input_file" name="files[]" placeholder='{$btr->general_select_file|escape}' type="file" multiple accept="pdf/txt/doc/docx">
						<label tabindex="0" for="my-file" class="input_file_trigger">
							{include file='svg_icon.tpl' svgId='download'}
							<span>{$btr->general_select_file|escape}</span>
						</label>
					</div>
					<p class="input_file_return"></p>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="boxed fn_toggle_wrap min_height_210px">
				<div class="heading_box">
					{$btr->general_video|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card fn_sort_list videos">
					<div class="turbo_list ok_related_list">
						<div class="turbo_list_body sortable">
							{foreach $product_videos as $video}
								<div class="fn_row turbo turbo_list_body_item fn_sort_item">
									<div class="turbo_list_row">
										<div class="turbo_list_boding turbo_list_drag move_zone">
											{include file='svg_icon.tpl' svgId='drag_vertical'}
										</div>
										<div class="turbo_list_boding turbo_list_related_photo">
											<a href="https://www.youtube.com/embed/{$video->vid}" data-fancybox class="iframe fancybox.iframe">
												<img class="product_icon" src="https://img.youtube.com/vi/{$video->vid}/mqdefault.jpg" />
											</a>
										</div>
										<div class="turbo_list_boding turbo_list_related_name">
											<input name="videos[]" value="{$video->link}" class="form-control" style="width:100%;">
										</div>
										<div class="turbo_list_boding turbo_list_close">
											<button data-hint="{$btr->general_delete_video|escape}" type="button" class="btn_close fn_remove_item hint-bottom-right-t-info-s-small-mobile  hint-anim">
												{include file='svg_icon.tpl' svgId='delete'}
											</button>
										</div>
									</div>
								</div>
							{/foreach}
							<div id="new_video" class="fn_row turbo turbo_list_body_item fn_sort_item" style='display:none;'>
								<div class="turbo_list_row">
									<div class="turbo_list_boding turbo_list_drag move_zone">
										{include file='svg_icon.tpl' svgId='drag_vertical'}
									</div>
									<div class="turbo_list_boding turbo_list_related_photo"></div>
									<div class="turbo_list_boding turbo_list_related_name">
										<input name="videos[]" class="form-control" value="" style="width:100%;">
									</div>
									<div class="turbo_list_boding turbo_list_close">
										<button data-hint="{$btr->general_delete_video|escape}" type="button" class="btn_close fn_remove_item hint-bottom-right-t-info-s-small-mobile hint-anim delete">
											{include file='svg_icon.tpl' svgId='delete'}
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="box_btn_heading mt-1">
						<button type="button" class="btn btn_mini btn-primary fn_add_video">
							{include file='svg_icon.tpl' svgId='plus'}
							<span>{$btr->general_add_video|escape}</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed match fn_toggle_wrap">
				<div class="heading_box">
					{$btr->general_metatags|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card row">
					<div class="col-lg-6 col-md-6">
						<div class="heading_label">Meta-title <span id="fn_meta_title_counter"></span></div>
						<input name="meta_title" class="form-control fn_meta_field mb-h" type="text" value="{$product->meta_title|escape}" />
						<div class="heading_label">Meta-keywords</div>
						<input name="meta_keywords" class="form-control fn_meta_field mb-h" type="text" value="{$product->meta_keywords|escape}" />
					</div>
					<div class="col-lg-6 col-md-6 pl-0">
						<div class="heading_label">Meta-description <span id="fn_meta_description_counter"></span></div>
						<textarea name="meta_description" class="form-control turbo_textarea fn_meta_field">{$product->meta_description|escape}</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed match fn_toggle_wrap tabs">
				<div class="heading_tabs">
					<div class="tab_navigation">
						<a href="#tab1" class="heading_box tab_navigation_link">{$btr->general_short_description|escape}</a>
						<a href="#tab2" class="heading_box tab_navigation_link">{$btr->general_full_description|escape}</a>
					</div>
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="tab_container">
						<div id="tab1" class="tab">
							<textarea name="annotation" id="annotation" class="editor_small">{$product->annotation|escape}</textarea>
						</div>
						<div id="tab2" class="tab">
							<textarea id="fn_editor" name="body" class="editor_large fn_editor_class">{$product->body|escape}</textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 mt-1">
						<button type="submit" name="" class="btn btn_small btn-primary float-md-right">
							{include file='svg_icon.tpl' svgId='checked'}
							<span>{$btr->general_apply|escape}</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div style="display: none;" class="images">
	<ul>
		{foreach from=$product_images item=image}
			<li>
				<label>
					<img src="{$image->filename|resize:80:80}" alt="" />
					<input type="hidden" name='images[]' value='{$image->id}'>
					<span class="start">
						{include file='svg_icon.tpl' svgId='circle'}
						{include file='svg_icon.tpl' svgId='checked'}
					</span>
				</label>
			</li>
		{/foreach}
	</ul>
</div>

{* Tiny MCE *}
{include file='tinymce_init.tpl'}
{* On document load *}

{* Datetimepicker *}
{css id="datetimepicker" include=[
"turbo/design/js/datetimepicker/jquery.datetimepicker.css"
]}{/css}
{stylesheet minify=true}

{js id="datetimepicker" priority=99 include=[
"turbo/design/js/datetimepicker/jquery.datetimepicker.js"
]}{/js}
{javascript minify=true}

{* Autocomplete *}
{js id="autocomplete" priority=99 include=[
"turbo/design/js/autocomplete/jquery.autocomplete-min.js"
]}{/js}
{javascript minify=true}

{* Chosen *}
{css id="chosen" include=[
"turbo/design/js/chosen/chosen.min.css"
]}{/css}
{stylesheet minify=true}

{js id="chosen" priority=99 include=[
"turbo/design/js/chosen/chosen.jquery.js"
]}{/js}
{javascript minify=true}

{* Fancybox *}
{css id="fancybox" include=[
"turbo/design/js/fancybox/jquery.fancybox.css"
]}{/css}
{stylesheet minify=true}

{js id="fancybox" priority=99 include=[
"turbo/design/js/fancybox/jquery.fancybox.min.js"
]}{/js}
{javascript minify=true}

{* Colorpicker *}
{css id="colorpicker" include=[
"turbo/design/js/colorpicker/css/bootstrap-colorpicker.min.css"
]}{/css}
{stylesheet minify=true}

{js id="colorpicker" priority=99 include=[
"turbo/design/js/colorpicker/js/bootstrap-colorpicker.min.js"
]}{/js}
{javascript minify=true}

{literal}
	<style>
		.new_video{ldelim}
		display:none;
		{rdelim}
	</style>
	<script>
		$(window).on("load", function() {
			$(document).on("click", ".fn_show_images", function() {
				$(this).prev().find($(".fn_toggle_hidden")).toggleClass("hidden");
			});

			// Timer
			$('input[name="sale_to"]').datetimepicker({
				lang: '{/literal}{$settings->lang}{literal}',
				format: 'Y-m-d H:i:s'
			});

			// Delete product
			$(document).on("click", ".fn_remove_item", function() {
				$(this).closest(".fn_row").fadeOut(200, function() { $(this).remove(); });
				return false;
			});

			$(".chosen").chosen('chosen-select');
			$(document).on("input", ".fn_rating", function() {
				$(".fn_show_rating").html($(this).val());
				$(".fn_rating_value").val($(this).val());
			});

			// Add category
			$('#product_categories .add').click(function() {
				var $orginal = $('#product_categories .product_cats span.list:last');
				var $cloned = $orginal.clone();
				$cloned.find('.bootstrap-select').replaceWith(function() { return $('select', this); })
				$cloned.find('.selectpicker').selectpicker('render');
				$cloned.appendTo('#product_categories .product_cats');
				$("#product_categories .product_cats span.list:last span.add").hide();
				$("#product_categories .product_cats span.list:last span.delete").show();
			});

			// Delete category
			$(document).on("click", "#product_categories .delete", function() {
				$(this).closest(".list").remove();
				return false;
			});

			var image_item_clone = $(".fn_new_image_item").clone(true);
			$(".fn_new_image_item").remove();
			var new_image_tem_clone = $(".fn_new_spec_image_item").clone(true);
			$(".fn_new_spec_image_item").remove();

			// Drop
			if (window.File && window.FileReader && window.FileList) {
				$(".fn_dropzone").on('dragover', function(e) {
					e.preventDefault();
					$(this).css('background', '#bababa');
				});
				$(".fn_dropzone").on('dragleave', function() {
					$(this).css('background', '#f8f8f8');
				});

				function handleFileSelect(evt) {
					dropInput = $(this).closest(".fn_droplist_wrap").find("input.dropinput:last").clone();
					var parent = $(this).closest(".fn_droplist_wrap");
					var files = evt.target.files; // FileList object
					// Loop through the FileList and render image files as thumbnails.
					for (var i = 0, f; f = files[i]; i++) {
						// Only process image files.
						if (!f.type.match('image.*')) {
							continue;
						}
						var reader = new FileReader();
						// Closure to capture the file information.
						reader.onload = (function(theFile) {
							return function(e) {
								// Render thumbnail.
								if (parent.data('image') == "product") {
									var clone_item = image_item_clone.clone(true);
								} else if (parent.data('image') == "special") {
									var clone_item = new_image_tem_clone.clone(true);
								}
								clone_item.find("img").attr("onerror", '');
								clone_item.find("img").attr("src", e.target.result);
								clone_item.find("input").val(theFile.name);
								clone_item.appendTo(parent);
								temp_input = dropInput.clone();
								parent.find("input.dropinput").hide();
								parent.find(".fn_dropzone").append(temp_input);
							};
						})(f);
						// Read in the image file as a data URL.
						reader.readAsDataURL(f);
					}
					$(".fn_dropzone").removeAttr("style");
				}
				$(document).on('change', '.dropinput', handleFileSelect);
			}

			$(document).on("click", ".fn_remove_image", function() {
				$(this).closest("li").remove();
			});

			$(document).on("click", ".fn_change_special", function() {
				if ($(this).closest('li').hasClass("product_special")) {
					$(this).closest("ul").find("input[type=radio]").attr("checked", false);
					$(this).closest("li").removeClass("product_special");
					$(this).text($(this).data("origin"));
				} else {
					$(this).closest("ul").find("input[type=radio]").attr("checked", false);
					$(this).closest("li").removeClass("product_special");
					$(this).closest("li").find("input[type=radio]").attr("checked", true).click();
					$(this).closest("ul").find("li").removeClass("product_special");
					$(this).closest("li").addClass("product_special");
					$(this).text($(this).data("result"));
				}
			});

			$(document).on("click", ".fn_remove_variant", function() {
				$(this).closest(".variants_list_item ").fadeOut(200);
				$(this).closest(".variants_list_item ").remove();
			});

			// Color picker
			$('.color-picker').colorpicker({
				colorSelectors: {
					'black': '#000000',
					'white': '#ffffff',
					'red': '#FF0000',
					'default': '#777777',
					'primary': '#337ab7',
					'success': '#5cb85c',
					'info': '#5bc0de',
					'warning': '#f0ad4e',
					'danger': '#d9534f'
				},
				format: "hex"
			});

			//////////////////////////////////
			var color_variant, ids;

			function changeVarName(obj) {
				parent = $(obj).closest('ul');
				color = parent.find('.variant_color input').val();
				size = parent.find('.variant_size input').val();
				parent.find('.variant_name input').val(color + ' ' + size);
			}

			$('.variants_wrapper a.add_images').on('click', function() {
				offset = $(this).offset();
				color_variant = $(this);
				ids = $(color_variant).closest('div').find('input[type=hidden]').val().split(',');
				$('#popup_images').html('');
				$('.images ul').clone().appendTo('#popup_images');
				$('#popup_images input[type=hidden]').each(function() {
					id = $(this).val() + '';
					if ($.inArray(id, ids) >= 0) $('<input type="checkbox" value="' + $(this).val() + '" style="display:none" checked="checked" />').insertAfter(this);
					else $('<input type="checkbox" value="' + $(this).val() + '" style="display:none" />').insertAfter(this);
					$(this).remove();
				});
				$('#popup_images :checkbox:checked').closest('li').addClass('active');
				$('#popup_images input:checkbox').click(function() {
					if ($(this).is(':checked')) {
						$(this).closest('li').addClass('active');
					} else {
						$(this).closest('li').removeClass('active');
					}
				});
				$('#popup_images li').each(function() { $(this).find('a').remove(); });
				$('#popup_images').append('<div class="box_btn"><a href="#" class="btn btn_mini btn-success apply">{/literal} {$btr->general_apply|escape}{literal}</a></div>');
				$('#popup_images').css('top', (offset.top + 28) + 'px').css('left', (offset.left + 0) + 'px').toggle();
				return false;
			});

			$(document).on('click', '#popup_images a.apply', function() {
				ids = [];
				$('#popup_images :checkbox:checked').each(function() { ids.push($(this).val()); });
				$(color_variant).closest('div').find('input[type=hidden]').val(ids.join(','));
				if (ids.length > 0) $(color_variant).closest('div').find('img').attr('src', 'design/images/picture.svg');
				else $(color_variant).closest('div').find('img').attr('src', 'design/images/picture_empty.svg');
				$('#popup_images').toggle();
				return false;
			});

			function changeVarName(obj) {
				parent = $(obj).closest('ul');
				color = parent.find('.variant_color input').val();
				size = parent.find('.variant_size input').val();
				parent.find('.variant_name input').val(color + ' ' + size);
			}

			// New variant
			var variant = $('.fn_new_row_variant').clone(true);
			$('.fn_new_row_variant').remove().removeAttr('id');
			variant.find('.bootstrap-select').replaceWith(function() { return $('select', this); });
			$('.fn_add_variant').click(function() {
				if (!$('.variants_wrapper').is('.single_variant')) {
					var new_line = $(variant).clone(true);
					new_line.appendTo('.variants_listadd').fadeIn('slow').find("select").selectpicker();
					new_line.find(".variants_item_height").addClass('.color-picker').colorpicker({
						colorSelectors: {
							'black': '#000000',
							'white': '#ffffff',
							'red': '#FF0000',
							'default': '#777777',
							'primary': '#337ab7',
							'success': '#5cb85c',
							'info': '#5bc0de',
							'warning': '#f0ad4e',
							'danger': '#d9534f'
						},
						format: "hex"
					});
				} else {
					$('.variants_wrapper .variants_item_name').show('slow');
					$('.variants_wrapper').removeClass('single_variant');
				}
				return false;
			});

			var new_feature_category = $(".fn_new_feature_category").clone(true);
			var new_val = $(".fn_new_value").clone(true);
			$(".fn_new_feature_category").remove();
			new_feature_category.removeClass("fn_new_feature_category");
			$(".fn_new_value").remove();
			new_val.removeClass("fn_new_value");

			function show_category_features(category_id) {
				$('div.fn_features_wrap').empty();
				$.ajax({
					url: "ajax/get_features.php",
					data: {category_id: category_id, product_id: $("input[name=id]").val()},
					dataType: 'json',
					success: function(data) {
						for (i = 0; i < data.length; i++) {
							feature = data[i];
							var new_line = new_feature_category.clone(true);
							new_line.addClass('fn_feature_block_' + feature.id);
							new_line.find(".fn_feature_name").attr('title', feature.name);
							new_line.find(".fn_feature_name a").text(feature.name).attr('href', "index.php?module=FeatureAdmin&id=" + feature.id);
							new_line.find("input").attr('name', "options[" + feature.id + "][]").val(feature.value[0]);
							var values = new_line.find(".fn_auto_option");
							values.data('id', feature.id);
							values.attr('name', "options[" + feature.id + "][]");
							if (feature.value.length > 1) {
								for (var j = 1; j < feature.value.length; j++) {
									var new_subline = new_val.clone(true);
									new_subline.find("input").attr('name', "options[" + feature.id + "][]").val(feature.value[j]);
									new_line.append(new_subline);
									if (j > 0) {
										new_subline.find(".fn_feature_multi_values")
											.removeClass("fn_add")
											.removeClass("btn-feature")
											.addClass("fn_remove")
											.addClass("btn-danger-feature");
										new_subline.find(".fn_plus").hide();
										new_subline.find(".fn_minus").show();
										new_subline.find(".feature_name").html("").addClass("additional_values");
										new_subline.find(".feature_input").html("").addClass("feature_input_single");
									}
									new_line.appendTo("div.fn_features_wrap");
								}
							}
							new_line.appendTo('div.fn_features_wrap').find("input")
								.autocomplete({
									serviceUrl: 'ajax/options_autocomplete.php',
									minChars: 0,
									params: {feature_id:feature.id},
									noCache: false
								});
						}
					}
				});
				return false;
			}

			$(document).on("click", ".fn_feature_multi_values.fn_add_color", function() {
				var feature_id = $(this).closest(".feature_value").find(".fn_auto_option").data("id"),
					new_value = new_val.clone(true),
					value_input = new_value.find(".fn_auto_option"),
					id_input = new_value.find(".fn_value_id_input");
				value_input.data("id", feature_id);
				value_input.val("");
				value_input.attr('name', "options[" + feature_id + "][]");
				id_input.attr("name", "features_values[" + feature_id + "][]");
				new_value.find(".feature_name").html("").addClass("additional_values");
				new_value.find(".feature_input").html("").addClass("feature_input_single");
				new_value.find('.feature_value').append('<div class="add-on colorPicker-picker"></div>');
				new_value.find(".feature_value").addClass('.color-picker').colorpicker({
					colorSelectors: {
						'black': '#000000',
						'white': '#ffffff',
						'red': '#FF0000',
						'default': '#777777',
						'primary': '#337ab7',
						'success': '#5cb85c',
						'info': '#5bc0de',
						'warning': '#f0ad4e',
						'danger': '#d9534f'
					},
					format: "hex"
				});
				new_value.find(".fn_feature_multi_values")
					.removeClass("fn_add")
					.removeClass("btn-feature")
					.addClass("fn_remove")
					.addClass("btn-danger-feature");
				new_value.find(".fn_plus").hide();
				new_value.find(".fn_minus").show();
				value_input.autocomplete({
					serviceUrl: 'ajax/options_autocomplete.php',
					minChars: 0,
					params: {feature_id:feature_id},
					noCache: false
				});
				new_value.appendTo(".fn_feature_block_" + feature_id).fadeIn('slow');
				return false;
			});

			$(document).on("click", ".fn_feature_multi_values.fn_add", function() {
				var feature_id = $(this).closest(".feature_value").find(".fn_auto_option").data("id"),
					new_value = new_val.clone(true),
					value_input = new_value.find(".fn_auto_option"),
					id_input = new_value.find(".fn_value_id_input");
				value_input.data("id", feature_id);
				value_input.val("");
				value_input.attr('name', "options[" + feature_id + "][]");
				id_input.attr("name", "features_values[" + feature_id + "][]");
				new_value.find(".feature_name").html("").addClass("additional_values");
				new_value.find(".feature_input").html("").addClass("feature_input_single");
				new_value.find(".fn_feature_multi_values")
					.removeClass("fn_add")
					.removeClass("btn-feature")
					.addClass("fn_remove")
					.addClass("btn-danger-feature");
				new_value.find(".fn_plus").hide();
				new_value.find(".fn_minus").show();
				value_input.autocomplete({
					serviceUrl: 'ajax/options_autocomplete.php',
					minChars: 0,
					params: {feature_id:feature_id},
					noCache: false
				});
				new_value.appendTo(".fn_feature_block_" + feature_id).fadeIn('slow');
				return false;
			});

			$(document).on("click", ".fn_feature_multi_values.fn_remove", function() {
				$(this).closest(".feature_row").remove();
			});

			// Show category features
			$('select[name="categories[]"]:first').change(function() {
				show_category_features($("option:selected", this).val());
			});

			// Options autocomplete
			$('div.fn_features_wrap input[name*=options]').each(function(index) {
				feature_id = $(this).closest('span').attr('feature_id');
				$(this).autocomplete({
					serviceUrl: 'ajax/options_autocomplete.php',
					minChars: 0,
					params: {feature_id:feature_id},
					noCache: false
				});
			});

			// New feature
			var new_feature = $(".fn_new_feature").clone(true);
			$(".fn_new_feature").remove();
			new_feature.removeClass("fn_new_feature");
			$(document).on("click", ".fn_add_feature", function() {
				$(new_feature).clone(true).appendTo(".features_wrap").fadeIn('slow');
				return false;
			});

			$(document).on("click", ".fn_delete_feature", function() {
				$(this).parent().remove();
			});

			// New related product
			var new_related_product = $('#new_related_product').clone(true);
			$('#new_related_product').remove();
			new_related_product.removeAttr('id');
			$("input#related_products").autocomplete({
				serviceUrl: 'ajax/search_products.php',
				minChars: 0,
				noCache: false,
				onSelect: function(suggestion) {
					$("input#related_products").val('').focus().blur();
					new_item = new_related_product.clone().appendTo('.related_products');
					new_item.find('a.related_product_name').html(suggestion.data.name);
					new_item.find('a.related_product_name').attr('href', 'index.php?module=ProductAdmin&id=' + suggestion.data.id);
					new_item.find('input[name*="related_products"]').val(suggestion.data.id);
					if (suggestion.data.image)
						new_item.find('img.product_icon').attr("src", suggestion.data.image);
					else
						new_item.find('img.product_icon').remove();
					new_item.show();
				},
				formatResult: function(suggestions, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return "<div>" + (suggestions.data.image ? "<img align=absmiddle src='" + suggestions.data.image + "'> " : '') + "</div>" + "<span>" + suggestions.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + "</span>";
				}
			});

			// Add video
			$('.videos .fn_add_video').click(function() {
				$('#new_video').clone(false).appendTo('.videos .sortable').fadeIn('slow', function() {
					$(this).removeClass('#new_video').find('input').focus()
				});
			});

			// Infinity
			$("input[name*=variant][name*=stock]").focus(function() {
				if ($(this).val() == '∞')
					$(this).val('');
				return false;
			});

			$("input[name*=variant][name*=stock]").blur(function() {
				if ($(this).val() == '')
					$(this).val('∞');
			});
		});
	</script>
{/literal}