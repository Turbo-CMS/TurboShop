{* Title *}
{$meta_title=$btr->general_shipping scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{$btr->general_shipping|escape}
			</div>
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="{url module=DeliveryAdmin}">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->deliveries_add|escape}</span>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="boxed fn_toggle_wrap">
	{if $deliveries}
		<form class="fn_form_list" method="post">
			<div class="turbo_list fn_sort_list">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">

				<div class="turbo_list_head">
					<div class="turbo_list_boding turbo_list_drag"></div>
					<div class="turbo_list_heading turbo_list_check">
						<label class="form-check">
							<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
						</label>
					</div>

					<div class="turbo_list_heading turbo_list_delivery_name">{$btr->general_name|escape}</div>
					<div class="turbo_list_heading turbo_list_delivery_photo"></div>
					<div class="turbo_list_heading turbo_list_delivery_condit">{$btr->general_conditions|escape}</div>
					<div class="turbo_list_heading turbo_list_status">{$btr->general_enable|escape}</div>
					<div class="turbo_list_heading turbo_list_close"></div>
				</div>

				<div class="deliveries_wrap turbo_list_body sortable">
					{foreach $deliveries as $delivery}
						<div class="fn_row turbo_list_body_item fn_sort_item body_narrow">
							<div class="turbo_list_row narrow">
								<input type="hidden" name="positions[{$delivery->id}]" value="{$delivery->position}">

								<div class="turbo_list_boding turbo_list_drag move_zone">
									{include file='svg_icon.tpl' svgId='drag_vertical'}
								</div>

								<div class="turbo_list_boding turbo_list_check">
									<label class="form-check">
										<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$delivery->id}">
									</label>
								</div>

								<div class="turbo_list_boding turbo_list_delivery_name">
									<a href="{url module=DeliveryAdmin id=$delivery->id return=$smarty.server.REQUEST_URI}">
										{$delivery->name|escape}
									</a>
									<div class="hidden-lg-up mt-q">
										{if $delivery->separate_payment}
											<div><span class="tag tag-primary">{$btr->general_paid_separately|escape}</span></div>
										{/if}
										{if $delivery->price > 0}
											<div><span class="tag tag-warning">{$btr->general_price|escape} {$delivery->price} {$currency->sign|escape}</span></div>
										{else}
											<div><span class="tag tag-info">{$btr->deliveries_free|escape}</span></div>
										{/if}
										{if $delivery->free_from > 0}
											<div><span class="tag tag-success">{$btr->deliveries_free_from|escape} {$delivery->free_from} {$currency->sign|escape}</span></div>
										{/if}
									</div>
								</div>

								<div class="turbo_list_boding turbo_list_delivery_photo"></div>

								<div class="turbo_list_boding turbo_list_delivery_condit">
									{if $delivery->separate_payment}
										<div><span class="tag tag-primary">{$btr->general_paid_separately|escape}</span></div>
									{/if}
									{if $delivery->price > 0}
										<div><span class="tag tag-warning">{$btr->general_price|escape} {$delivery->price} {$currency->sign|escape}</span></div>
									{else}
										<div><span class="tag tag-info">{$btr->deliveries_free|escape}</span></div>
									{/if}
									{if $delivery->free_from > 0}
										<div><span class="tag tag-success">{$btr->deliveries_free_from|escape} {$delivery->free_from} {$currency->sign|escape}</span></div>
									{/if}
								</div>

								<div class="turbo_list_boding turbo_list_status">
									{*visible*}
									<div class="form-check form-switch">
										<input class="form-check-input fn_ajax_action {if $delivery->enabled}fn_active_class{/if}" id="id_{$delivery->id}" data-module="delivery" data-action="enabled" data-id="{$delivery->id}" name="enabled" value="1" type="checkbox" {if $delivery->enabled}checked=""{/if}>
										<label class="form-check-label" for="id_{$delivery->id}"></label>
									</div>
								</div>
								<div class="turbo_list_boding turbo_list_close">
									{*delete*}
									<button data-hint="{$btr->general_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
										{include file='svg_icon.tpl' svgId='delete'}
									</button>
								</div>
							</div>
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
							<select name="action" class="selectpicker">
								<option value="enable">{$btr->general_do_enable|escape}</option>
								<option value="disable">{$btr->general_do_disable|escape}</option>
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
			<div class="text_grey">{$btr->deliveries_no|escape}</div>
		</div>
	{/if}
</div>