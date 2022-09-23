{* Title *}
{$meta_title=$btr->brands_brands scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{$btr->brands_brands|escape}
			</div>
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="{url module=BrandAdmin return=$smarty.server.REQUEST_URI}">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->brands_add_brand|escape}</span>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="boxed fn_toggle_wrap">
	{if $brands}
		<form method="post" class="fn_form_list">
			<input type="hidden" name="session_id" value="{$smarty.session.id}">

			<div class="turbo_list fn_sort_list">
				<div class="turbo_list_head">
					<div class="turbo_list_heading turbo_list_check">
						<label class="form-check">
							<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
						</label>
					</div>
					<div class="turbo_list_heading turbo_list_photo">{$btr->general_photo|escape}</div>
					<div class="turbo_list_heading turbo_list_brands_name">{$btr->general_name|escape}</div>
					<div class="turbo_list_heading turbo_list_status">{$btr->general_enable|escape}</div>
					<div class="turbo_list_heading turbo_list_setting">{$btr->general_activities|escape}</div>
					<div class="turbo_list_heading turbo_list_close"></div>
				</div>
				<div class="turbo_list_body sortable">
					{foreach $brands as $brand}
						<div class="fn_row turbo_list_body_item fn_sort_item body_narrow">
							<div class="turbo_list_row narrow">

								<div class="turbo_list_boding turbo_list_check">
									<label class="form-check">
										<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$brand->id}">
									</label>
								</div>

								<div class="turbo_list_boding turbo_list_photo small_photo boding_small turbo_list_brand_photo">
									{if $brand->image}
										<a href="{url module=BrandAdmin id=$brand->id return=$smarty.server.REQUEST_URI}">
											<img src="{$brand->image|resize_brands:30:30}" alt="{$brand->name|escape}">
										</a>
									{else}
										<a href="{url module=BrandAdmin id=$brand->id return=$smarty.server.REQUEST_URI}">
											<img width="30" src="design/images/no_image.svg" alt="{$brand->name|escape}">
										</a>
									{/if}
								</div>

								<div class="turbo_list_boding turbo_list_brands_name">
									<a href="{url module=BrandAdmin id=$brand->id return=$smarty.server.REQUEST_URI}">
										{$brand->name|escape}
									</a>
								</div>

								<div class="turbo_list_boding turbo_list_status">
									{*visible*}
									<div class="form-check form-switch">
										<input class="form-check-input fn_ajax_action {if $brand->visible}fn_active_class{/if}" id="id_{$brand->id}" data-module="brands" data-action="visible" data-id="{$brand->id}" name="visible" value="1" type="checkbox" {if $brand->visible}checked=""{/if}>
										<label class="form-check-label" for="id_{$brand->id}"></label>
									</div>
								</div>

								<div class="turbo_list_setting">
									<a href="../{$lang_link}brands/{$brand->url|escape}" target="_blank" data-hint="{$btr->general_view|escape}" class="setting_icon setting_icon_open hint-bottom-middle-t-info-s-small-mobile  hint-anim">
										{include file='svg_icon.tpl' svgId='icon_desktop'}
									</a>
								</div>

								<div class="turbo_list_boding turbo_list_close">
									{*delete*}
									<button data-hint="{$btr->brands_delete_brand|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
										{include file='svg_icon.tpl' svgId='delete'}
									</button>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
				<div class="turbo_list_footer fn_action_block">
					<div class="turbo_list_foot_left">
						<div class="turbo_list_heading turbo_list_check">
							<label class="form-check">
								<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo_list_option">
							<select name="action" class="selectpicker">
								<option value="delete">{$btr->general_delete|escape}</option>
							</select>
						</div>
					</div>
					<button type="submit" class="btn btn_small btn-primary">
						{include file='svg_icon.tpl' svgId='checked'}
						<span>{$btr->general_apply|escape}</span>
					</button>
				</div>
			</div>
		</form>
	{else}
		<div class="heading_box mt-1">
			<div class="text_grey">{$btr->brands_no|escape}</div>
		</div>
	{/if}
</div>