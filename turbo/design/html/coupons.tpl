{* Title *}
{$meta_title=$btr->coupons_coupons scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if $coupons_count}
					{$btr->coupons_coupons} - {$coupons_count}
				{else}
					{$btr->coupons_coupons}
				{/if}
			</div>
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="{url module=CouponAdmin return=$smarty.server.REQUEST_URI}">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->coupons_add|escape}</span>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="boxed fn_toggle_wrap">
	{if $coupons}
		<form class="fn_form_list" method="post">
			<input type="hidden" name="session_id" value="{$smarty.session.id}">

			<div class="turbo_list fn_sort_list">
				<div class="turbo_list_head">
					<div class="turbo_list_heading turbo_list_check">
						<label class="form-check">
							<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
						</label>
					</div>
					<div class="turbo_list_heading turbo_list_coupon_name">{$btr->coupons_name|escape}</div>
					<div class="turbo_list_heading turbo_list_coupon_sale">{$btr->general_discount|escape}</div>
					<div class="turbo_list_heading turbo_list_coupon_condit">{$btr->general_conditions|escape}</div>
					<div class="turbo_list_heading turbo_list_coupon_validity">{$btr->coupons_terms|escape}</div>
					<div class="turbo_list_heading turbo_list_coupon_disposable">{$btr->coupons_one_off|escape}</div>

					<div class="turbo_list_heading turbo_list_close"></div>
				</div>

				<div class="turbo_list_body fn_coupon_wrap">
					{foreach $coupons as $coupon}
						<div class="fn_row turbo_list_body_item body_narrow">
							<div class="turbo_list_row narrow">
								<div class="turbo_list_boding turbo_list_check">
									<label class="form-check">
										<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$coupon->id}">
									</label>
								</div>
								<div class="turbo_list_boding turbo_list_coupon_name">
									<span class="text_dark">
										<a href="{url module=CouponAdmin id=$coupon->id return=$smarty.server.REQUEST_URI}">{$coupon->code}</a>
									</span>
									<div class="hidden-lg-up mt-q">
										{if $coupon->expire}
											{if $smarty.now|date_format:'Ymd' <= $coupon->expire|date_format:'Ymd'}
												<span class="tag tag-primary">
													{$btr->coupons_valid_until|escape} {$coupon->expire|date}
												</span>
											{else}
												<span class="tag tag-danger">
													{$btr->coupons_expired|escape} {$coupon->expire|date}
												</span>
											{/if}
										{else}
											<span class="tag tag-warning">
												{include file='svg_icon.tpl' svgId='infinity'}
											</span>
										{/if}
										{if $coupon->min_order_price>0}
											<span class="tag tag-success">
												{$btr->coupons_order_from|escape} {$coupon->min_order_price|escape} {$currency->sign|escape}
											</span>
										{/if}
										<div class="mt-q">
											{if $coupon->single}
												{$btr->coupons_one_off|escape}
											{else}
												{$btr->coupons_many|escape}
											{/if}
										</div>

									</div>
								</div>
								<div class="turbo_list_boding turbo_list_coupon_sale">
									{$coupon->value*1}
									{if $coupon->type=='absolute'}
										{$currency->sign|escape}
									{else}
										%
									{/if}
								</div>
								<div class="turbo_list_boding turbo_list_coupon_condit">
									{if $coupon->min_order_price>0}
										<div>
											{$btr->coupons_order_from|escape} {$coupon->min_order_price|escape} {$currency->sign|escape}
										</div>
									{else}
										<div>
											-
										</div>
									{/if}
								</div>
								<div class="turbo_list_boding turbo_list_coupon_validity">
									<div>
										{if $coupon->expire}
											{if $smarty.now|date_format:'Ymd' <= $coupon->expire|date_format:'Ymd'}
												{$btr->coupons_valid_until|escape} {$coupon->expire|date}
											{else}
												{$btr->coupons_expired|escape} {$coupon->expire|date}
											{/if}
										{else}
											{include file='svg_icon.tpl' svgId='infinity'}
										{/if}
									</div>
								</div>
								<div class="turbo_list_boding turbo_list_coupon_disposable">
									{if $coupon->single}
										{$btr->coupons_yes|escape}
									{else}
										{$btr->coupons_no|escape}
									{/if}
								</div>

								<div class="turbo_list_boding turbo_list_close">
									{*delete*}
									<button data-hint="{$btr->coupons_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
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
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm 12 txt_center">
				{include file='pagination.tpl'}
			</div>
		</div>
	{else}
		<div class="heading_box mt-1">
			<div class="text_grey">{$btr->no_coupons|escape}</div>
		</div>
	{/if}
</div>