{* Title *}
{if $category}
	{$meta_title=$category->name scope=global}
{else}
	{$meta_title=$btr->general_products scope=global}
{/if}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			{if $products_count}
				<div class="box_heading heading_page">
					{if $category->name || $brand->name}
						{$category->name|escape} {$brand->name|escape} - {$products_count}
					{elseif $keyword}
						{$btr->general_products|escape} - {$products_count}
					{else}
						{$btr->general_products|escape} - {$products_count}
					{/if}
				</div>
			{else}
				<div class="box_heading heading_page">{$btr->products_no|escape}</div>
			{/if}
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="{url module=ProductAdmin return=$smarty.server.REQUEST_URI}">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->products_add|escape}</span>
				</a>
			</div>
		</div>
	</div>
	<div class="col-lg-5 col-md-5 col-xs-12 float-xs-right">
		<div class="boxed_search">
			<form class="search" method="get">
				<input type="hidden" name="module" value="ProductsAdmin">
				<div class="input-group">
					<input name="keyword" class="form-control" placeholder="{$btr->products_search|escape}" type="text" value="{$keyword|escape}">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary">{include file='svg_icon.tpl' svgId='search'} <span class="hidden-md-down"></span></button>
					</span>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="boxed fn_toggle_wrap">
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="fn_toggle_wrap">
				<div class="heading_box visible_md">
					{$btr->general_filter|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="boxed_sorting toggle_body_wrap off fn_card">
					<div class="row">
						<div class="col-md-3 col-lg-3 col-sm-12">
							<select id="id_filter" name="products_filter" class="selectpicker form-control" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url brand_id=null category_id=null keyword=null page=null limit=null filter=null}" {if !$filter}selected{/if}>{$btr->general_all_products|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='featured'}" {if $filter == 'featured'}selected{/if}>{$btr->products_bestsellers|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='new'}" {if $filter == 'new'}selected{/if}>{$btr->general_new|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='hit'}" {if $filter == 'hit'}selected{/if}>{$btr->general_hit|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='discounted'}" {if $filter == 'discounted'}selected{/if}>{$btr->products_discount|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='to_export'}" {if $filter == 'to_export'}selected{/if}>{$btr->general_add_xml_short|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='visible'}" {if $filter == 'visible'}selected{/if}>{$btr->products_enable|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='hidden'}" {if $filter == 'hidden'}selected{/if}>{$btr->products_disable|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='outofstock'}" {if $filter == 'outofstock'}selected{/if}>{$btr->products_out_of_stock|escape}</option>
							</select>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-12">
							<select id="id_categories" name="categories_filter" title="{$btr->general_category_filter|escape}" class="selectpicker form-control" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url keyword=null brand_id=null page=null limit=null category_id=null}" {if !$category}selected{/if}>{$btr->general_all_categories|escape}</option>
								{function name=category_select level=0}
									{foreach $categories as $c}
										<option value='{url keyword=null brand_id=null page=null limit=null category_id=$c->id}' {if $category->id == $c->id}selected{/if}>
											{section sp $level}- {/section}{$c->name|escape}
										</option>
										{category_select categories=$c->subcategories level=$level+1}
									{/foreach}
								{/function}
								{category_select categories=$categories}
							</select>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-12">
							<select id="id_brands" name="brands_filter" title="{$btr->general_brand_filter|escape}" class="selectpicker form-control" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url keyword=null brand_id=null page=null limit=null category_id=null}" {if !$brand}selected{/if}>{$btr->general_all_brands|escape}</option>
								{foreach $brands as $b}
									<option value="{url keyword=null page=null limit=null brand_id=$b->id}" brand_id="{$b->id}" {if $brand->id == $b->id}selected{/if}>{$b->name}</option>
								{/foreach}
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	{if $products}
		<div class="row">
			{* Main form *}
			<div class="col-lg-12 col-md-12 col-sm-12">
				<form method="post" class="fn_form_list">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<div class="turbo_list fn_sort_list">
						<div class="turbo_list_head">
							<div class="turbo_list_boding turbo_list_drag"></div>
							<div class="turbo_list_heading turbo_list_check">
								<label class="form-check">
									<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo_list_heading turbo_list_photo">{$btr->general_photo|escape}</div>
							<div class="turbo_list_heading turbo_list_name">{$btr->general_name|escape}</div>
							<div class="turbo_list_heading turbo_list_price">{$btr->general_price|escape}</div>
							<div class="turbo_list_heading turbo_list_count">{$btr->general_qty|escape}</div>
							<div class="turbo_list_heading turbo_list_status">{$btr->general_enable|escape}</div>
							<div class="turbo_list_heading turbo_list_setting turbo_list_products_setting">{$btr->general_activities|escape}</div>
							<div class="turbo_list_heading turbo_list_close"></div>
						</div>
						<div id="" class="turbo_list_body sortable">
							{foreach $products as $product}
								<div class="fn_row turbo_list_body_item fn_sort_item">
									<div class="turbo_list_row">
										<input type="hidden" name="positions[{$product->id}]" value="{$product->position}">
										<div class="turbo_list_boding turbo_list_drag move_zone">
											{include file='svg_icon.tpl' svgId='drag_vertical'}
										</div>
										<div class="turbo_list_boding turbo_list_check form-check">
											<label class="form-check">
												<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$product->id}">
											</label>
										</div>
										<div class="turbo_list_boding turbo_list_photo">
											{$image = $product->images|@first}
											{if $image}
												<a href="{url module=ProductAdmin id=$product->id return=$smarty.server.REQUEST_URI}">
													<img src="{$image->filename|escape|resize:45:45}" alt="{$product->name|escape}"></a>
											{else}
												<a href="{url module=ProductAdmin id=$product->id return=$smarty.server.REQUEST_URI}">
													<img width="35" src="design/images/no_image.svg" alt="{$product->name|escape}">
												</a>
											{/if}
										</div>
										<div class="turbo_list_boding turbo_list_name">
											<a class="link" href="{url module=ProductAdmin id=$product->id return=$smarty.server.REQUEST_URI}">
												{$product->name|escape}
												{if $product->variants[0]->name || $product->variants[0]->color}
													<span class="text_grey">({$product->variants[0]->name|escape}{if $product->variants[0]->color} {$product->variants[0]->color|escape}{/if})</span>
												{/if}
											</a>
											<div class="hidden-lg-up mt-q">
												<span class="text_primary text_600 text_spacing">
													{$product->variants[0]->oprice}
													{if isset($currencies[$product->variants[0]->currency_id])}
														{$currencies[$product->variants[0]->currency_id]->code|escape}
													{/if}
												</span>
												<span class="text_500 text_spacing">{if $product->variants[0]->infinity}∞{else}{$product->variants[0]->stock}{/if} {$settings->units|escape}</span>
											</div>
											{if $brands_name[$product->brand_id]->name}
												<div class="turbo_list_name_brand">{$btr->general_brand|escape} {$brands_name[$product->brand_id]->name|escape}</div>
											{/if}
											{if $product->variants|count > 1}
												<div class="fn_variants_toggle variants_toggle">
													<span>{$btr->general_options|escape}</span>
													<i class="fn_icon_arrow icon-chevron-down m-t-2"></i>
												</div>
											{/if}
										</div>
										<div class="turbo_list_boding turbo_list_price">
											<div class="input-group">
												<input class="form-control {if $product->variants[0]->compare_price > 0}text_warning{/if}" type="text" name="price[{$product->variants[0]->id}]" value="{$product->variants[0]->oprice}">
												<span class="input-group-addon">
													{if isset($currencies[$product->variants[0]->currency_id])}
														{$currencies[$product->variants[0]->currency_id]->sign|escape}
													{else}
														{$currency->sign}
													{/if}
												</span>
											</div>
										</div>
										<div class="turbo_list_boding turbo_list_count">
											<div class="input-group">
												<input class="form-control" type="text" name="stock[{$product->variants[0]->id}]" value="{if $product->variants[0]->infinity}∞{else}{$product->variants[0]->stock}{/if}">
												<span class="input-group-addon p-0">
													{$settings->units|escape}
												</span>
											</div>
										</div>
										{* Visible *}
										<div class="turbo_list_boding turbo_list_status">
											<div class="form-check form-switch">
												<input class="form-check-input fn_ajax_action {if $product->visible}fn_active_class{/if}" id="id_{$product->id}" data-module="product" data-action="visible" data-id="{$product->id}" name="visible" value="1" type="checkbox" {if $product->visible}checked=""{/if}>
												<label class="form-check-label" for="id_{$product->id}"></label>
											</div>
										</div>
										<div class=" turbo_list_setting turbo_list_products_setting">
											{* Buttons *}
											<div class="">
												{*open*}
												<a href="../{$lang_link}products/{$product->url|escape}" target="_blank" data-hint="{$btr->general_view|escape}" class="setting_icon setting_icon_open hint-bottom-middle-t-info-s-small-mobile  hint-anim">
													{include file='svg_icon.tpl' svgId='icon_desktop'}
												</a>
												{*featured*}
												<button data-hint="{$btr->general_bestseller|escape}" type="button" class="setting_icon setting_icon_featured fn_ajax_action {if $product->featured}fn_active_class{/if} hint-bottom-middle-t-info-s-small-mobile  hint-anim" data-module="product" data-action="featured" data-id="{$product->id}">
													{include file='svg_icon.tpl' svgId='icon_featured'}
												</button>
												{*new*}
												<button data-hint="{$btr->general_new|escape}" type="button" class="setting_icon setting_icon_new fn_ajax_action {if $product->is_new}fn_active_class{/if} hint-bottom-middle-t-info-s-small-mobile  hint-anim" data-module="product" data-action="is_new" data-id="{$product->id}">
													{include file='svg_icon.tpl' svgId='icon_new'}
												</button>
												{*feed*}
												<button data-hint="{$btr->general_add_xml|escape}" type="button" class="setting_icon setting_icon_export fn_ajax_action {if $product->to_export}fn_active_class{/if} hint-bottom-middle-t-info-s-small-mobile  hint-anim" data-module="product" data-action="to_export" data-id="{$product->id}">
													{include file='svg_icon.tpl' svgId='icon_export'}
												</button>
												{*hit*}
												<button data-hint="{$btr->general_hit|escape}" type="button" class="setting_icon setting_icon_hit fn_ajax_action {if $product->is_hit}fn_active_class{/if} hint-bottom-middle-t-info-s-small-mobile  hint-anim" data-module="product" data-action="is_hit" data-id="{$product->id}">
													{include file='svg_icon.tpl' svgId='icon_hit'}
												</button>
												{*copy*}
												<button data-hint="{$btr->products_dublicate|escape}" type="button" class="setting_icon setting_icon_copy fn_copy hint-bottom-middle-t-info-s-small-mobile  hint-anim">
													{include file='svg_icon.tpl' svgId='icon_copy'}
												</button>
											</div>
										</div>
										<div class="turbo_list_boding turbo_list_close">
											{*delete*}
											<button data-hint="{$btr->general_delete_product|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
												{include file='svg_icon.tpl' svgId='delete'}
											</button>
										</div>
									</div>
									{if $product->variants|count > 1}
										{*If there are product variants*}
										<div class="turbo_list_variants products_variants_block">
											{foreach $product->variants as $variant}
												{if $variant@iteration > 1}
													<div class="turbo_list_row products">
														<div class="turbo_list_boding turbo_list_drag"></div>
														<div class="turbo_list_boding turbo_list_check"></div>
														<div class="turbo_list_boding turbo_list_photo"></div>
														<div class="turbo_list_boding turbo_list_variant_name">
															<span class="text_grey">{$variant->name|escape}{if $variant->color} / {$variant->color|escape}{/if}</span>
														</div>
														<div class="turbo_list_boding turbo_list_price">
															<div class="input-group">
																<input class="form-control {if $product->variants[0]->compare_price > 0}text_warning{/if}" type="text" name="price[{$variant->id}]" value="{$variant->oprice}">
																<span class="input-group-addon">
																	{if isset($currencies[$variant->currency_id])}
																		{$currencies[$variant->currency_id]->sign|escape}
																	{else}
																		{$currency->sign}
																	{/if}
																</span>
															</div>
														</div>
														<div class="turbo_list_boding turbo_list_count">
															<div class="input-group">
																<input class="form-control" type="text" name="stock[{$variant->id}]" value="{if $variant->infinity}∞{else}{$variant->stock}{/if}">
																<span class="input-group-addon p-0">
																	{$settings->units|escape}
																</span>
															</div>
														</div>
														<div class="turbo_list_boding turbo_list_status"></div>
														<div class="turbo_list_boding turbo_list_close"></div>
													</div>
												{/if}
											{/foreach}
										</div>
									{/if}
								</div>
							{/foreach}
						</div>
						<div class="turbo_list_footer fn_action_block">
							<div class="turbo_list_foot_left">
								<div class="turbo_list_boding turbo_list_drag"></div>
								<div class="turbo_list_heading turbo_list_check">
									<label class="form-check">
										<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo_list_option">
									<select name="action" class="selectpicker products_action">
										<option value="enable">{$btr->general_do_enable|escape}</option>
										<option value="disable">{$btr->general_do_disable|escape}</option>
										<option value="set_featured">{$btr->products_mark_bestseller|escape}</option>
										<option value="unset_featured">{$btr->products_unmark_bestseller|escape}</option>
										<option value="set_is_new">{$btr->products_mark_new|escape}</option>
										<option value="unset_is_new">{$btr->products_unmark_new|escape}</option>
										<option value="set_is_hit">{$btr->products_mark_hit|escape}</option>
										<option value="unset_is_hit">{$btr->products_unmark_hit|escape}</option>
										<option value="set_export">{$btr->general_add_xml_short|escape}</option>
										<option value="unset_export">{$btr->general_from_xml_short|escape}</option>
										<option value="duplicate">{$btr->products_create_dublicate|escape}</option>
										{if $pages_count>1}
											<option value="move_to_page">{$btr->products_move_to_page|escape}</option>
										{/if}
										{if $categories|count>1}
											<option value="move_to_category">{$btr->products_move_to_category|escape}</option>
										{/if}
										{if $brands|count>0}
											<option value="move_to_brand">{$btr->products_specify_brand|escape}</option>
										{/if}
										<option value="change_price">{$btr->products_change_price|escape}</option>
										<option value="delete">{$btr->general_delete|escape}</option>
									</select>
								</div>
								<div>
									<div id="move_to_page" class="col-lg-12 col-md-12 col-sm-12 hidden fn_hide_block">
										<select name="target_page" class="selectpicker">
											{section target_page $pages_count}
												<option value="{$smarty.section.target_page.index+1}">{$smarty.section.target_page.index+1}</option>
											{/section}
										</select>
									</div>
									<div id="move_to_category" class="col-lg-12 col-md-12 col-sm-12 hidden fn_hide_block">
										<select name="target_category" class="selectpicker" data-live-search="true" data-size="5">
											{function name=category_select_btn level=0}
												{foreach $categories as $category}
													<option value="{$category->id}">{section sp $level}-{/section}{$category->name|escape}</option>
													{category_select_btn categories=$category->subcategories selected_id=$selected_id level=$level+1}
												{/foreach}
											{/function}
											{category_select_btn categories=$categories}
										</select>
									</div>
									<div id="move_to_brand" class="col-lg-12 col-md-12 col-sm-12 hidden fn_hide_block">
										<select name="target_brand" class="selectpicker" data-live-search="true" data-size="5">
											<option value="0">{$btr->general_not_set|escape}</option>
											{foreach $all_brands as $b}
												<option value="{$b->id}">{$b->name|escape}</option>
											{/foreach}
										</select>
									</div>
									<div id="change_price" class="col-lg-12 col-md-12 col-sm-12 hidden fn_hide_block group_price_change">
										<select name="op_type" class="selectpicker">
											<option value="0">{$btr->products_add_subtract|escape}</option>
											<option value="1">{$btr->products_percent|escape}</option>
										</select>
										<div class="col-lg-12 col-md-12 col-sm-12 group_price_change form-group">
											<input type="text" name="value" class="col-lg-12 col-md-12 col-sm-12 form-control text_form" placeholder="{$btr->enter_numeric_value|escape}">
											<div data-hint="{$btr->save_old_price|escape}" class="checkbox_change_price float-sm-right text_dark hint-bottom-left-t-info-s-small-mobile hint-anim">
												<label class="form-check mr-h">
													<input class="form-check-input fn_check_all_single" type="checkbox" checked="checked" name="save_old" value="1">
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn_small btn-primary">
								{include file='svg_icon.tpl' svgId='checked'}
								<span>{$btr->general_apply|escape}</span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm 12 txt_center">
				{include file='pagination.tpl'}
			</div>
		</div>
	{else}
		<div class="heading_box mt-1">
			<div class="text_grey">{$btr->products_no|escape}</div>
		</div>
	{/if}
</div>
{literal}
	<script>
		$(function() {

			$(document).on('click', '.fn_variants_toggle', function() {
				$(this).find('.fn_icon_arrow').toggleClass('rotate_180');
				$(this).parents('.fn_row').find('.products_variants_block').slideToggle();
			});

			$(document).on('change', '.fn_action_block select.products_action', function() {
				var elem = $(this).find('option:selected').val();
				$('.fn_hide_block').addClass('hidden');
				if ($('#' + elem).size() > 0) {
					$('#' + elem).removeClass('hidden');
				}
			});

			$(document).on('click', '.fn_show_icon_menu', function() {
				$(this).toggleClass('show');
			});

			// Duplicate product
			$(document).on("click", ".fn_copy", function() {
				$('.fn_form_list input[type="checkbox"][name*="check"]').attr('checked', false);
				$(this).closest(".fn_form_list").find('select[name="action"] option[value=duplicate]').attr('selected', true);
				$(this).closest(".fn_row").find('input[type="checkbox"][name*="check"]').attr('checked', true);
				$(this).closest(".fn_row").find('input[type="checkbox"][name*="check"]').click();
				$(this).closest(".fn_form_list").submit();
			});

			// Infinity in stock
			$("input[name*=stock]").focus(function() {
				if ($(this).val() == '∞')
					$(this).val('');
				return false;
			});

			$("input[name*=stock]").blur(function() {
				if ($(this).val() == '')
					$(this).val('∞');
			});

		});
	</script>
{/literal}