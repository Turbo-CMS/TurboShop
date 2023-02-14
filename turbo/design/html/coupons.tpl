{$meta_title=$btr->global_coupons scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if $coupons_count}
			{$btr->global_coupons} - {$coupons_count}
		{else}
			{$btr->global_coupons}
		{/if}
	</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=CouponAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->coupons_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $coupons}
			<form class="js-form-list" method="post">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="turbo-list">
					<div class="turbo-list-head">
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-coupon-name">{$btr->coupons_name|escape}</div>
						<div class="turbo-list-heading turbo-list-coupon-sale">{$btr->global_discount|escape}</div>
						<div class="turbo-list-heading turbo-list-coupon-condit">{$btr->global_conditions|escape}</div>
						<div class="turbo-list-heading turbo-list-coupon-validity">{$btr->coupons_terms|escape}</div>
						<div class="turbo-list-heading turbo-list-coupon-disposable">{$btr->coupons_one_off|escape}</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="turbo-list-body js-coupon_wrap">
						{foreach $coupons as $coupon}
							<div class="js-row turbo-list-body-item body-narrow">
								<div class="turbo-list-row narrow">
									<div class="turbo-list-boding turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$coupon->id}">
										</label>
									</div>
									<div class="turbo-list-boding turbo-list-coupon-name">
										<span class="text_dark">
											<a href="{url module=CouponAdmin id=$coupon->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$coupon->code}</a>
										</span>
										<div class="d-block d-lg-none mt-1">
											{if $coupon->expire}
												{if $smarty.now|date_format:'Ymd' <= $coupon->expire|date_format:'Ymd'}
													<span class="badge badge-primary-light">
														{$btr->coupons_valid_until|escape} {$coupon->expire|date}
													</span>
												{else}
													<span class="badge badge-danger-light">
														{$btr->coupons_expired|escape} {$coupon->expire|date}
													</span>
												{/if}
											{else}
												<span class="badge badge-warning-light">
													{include file='svg_icon.tpl' svgId='infinity'}
												</span>
											{/if}
											{if $coupon->min_order_price>0}
												<span class="badge badge-success-light">
													{$btr->coupons_order_from|escape} {$coupon->min_order_price|escape} {$currency->sign|escape}
												</span>
											{/if}
											<div class="mt-1">
												{if $coupon->single}
													{$btr->coupons_one_off|escape}
												{else}
													{$btr->coupons_many|escape}
												{/if}
											</div>
										</div>
									</div>
									<div class="turbo-list-boding turbo-list-coupon-sale">
										{$coupon->value*1}
										{if $coupon->type=='absolute'}
											{$currency->sign|escape}
										{else}
											%
										{/if}
									</div>
									<div class="turbo-list-boding turbo-list-coupon-condit">
										{if $coupon->min_order_price>0}
											{$btr->coupons_order_from|escape} {$coupon->min_order_price|escape} {$currency->sign|escape}
										{else}
											-
										{/if}
									</div>
									<div class="turbo-list-boding turbo-list-coupon-validity">
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
									<div class="turbo-list-boding turbo-list-coupon-disposable">
										{if $coupon->single}
											{$btr->coupons_yes|escape}
										{else}
											{$btr->coupons_no|escape}
										{/if}
									</div>
									<div class="turbo-list-boding turbo-list-delete">
										<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->coupons_delete|escape}">
											<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
												<i class="align-middle" data-feather="trash-2"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						{/foreach}
					</div>
					<div class="turbo-list-footer js-action-block">
						<div class="turbo-list-foot-left">
							<div class="turbo-list-heading turbo-list-check">
								<label class="form-check">
									<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo-list-option">
								<select name="action" class="selectpicker">
									<option value="delete">{$btr->global_delete|escape}</option>
								</select>
							</div>
						</div>
						<button type="submit" class="btn btn-primary">
							<i class="align-middle" data-feather="check"></i>
							{$btr->global_apply|escape}
						</button>
					</div>
				</div>
			</form>
			<div class="row">
				<div class="col-12">
					{include file='pagination.tpl'}
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->coupons_no|escape}</h5>
		{/if}
	</div>
</div>