{if $coupon->code}
	{$meta_title = $coupon->code scope=global}
{else}
	{$meta_title = $btr->coupons_new scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if $coupon->code}
			{$coupon->code}
		{else}
			{$btr->coupons_add|escape}
		{/if}
	</h1>
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'added'}
						{$btr->coupons_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->coupons_updated|escape}
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

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'code_exists'}
						{$btr->coupons_exists|escape}
					{elseif $message_error=='empty_code'}
						{$btr->coupons_enter_code|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<div class="card">
	<div class="card-body">
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="session_id" value="{$smarty.session.id}">
			<div class="turbo-list turbo-list-order">
				<div class="turbo-list-head">
					<div class="turbo-list-heading turbo-list-coupon-name">{$btr->coupons_name|escape}</div>
					<div class="turbo-list-heading turbo-list-coupon-sale">{$btr->global_discount|escape}</div>
					<div class="turbo-list-heading turbo-list-coupon-condit">{$btr->global_conditions|escape}</div>
					<div class="turbo-list-heading turbo-list-coupon-disposable">{$btr->coupons_one_off|escape}</div>
					<div class="turbo-list-heading turbo-list-coupon-validity">{$btr->coupons_terms|escape}</div>
					<div class="turbo-list-heading turbo-list-coupon-disposable">{$btr->coupons_expired|escape}</div>
				</div>
				<div class="turbo-list-body">
					<div class="turbo-list-body-item">
						<div class="turbo-list-row">
							<div class="turbo-list-boding turbo-list-coupon-name">
								<input class="form-control" name="code" type="text" value="{$coupon->code|escape}" placeholder="{$btr->coupons_enter_name|escape}">
								<input name="id" class="name" type="hidden" value="{$coupon->id|escape}">
							</div>
							<div class="turbo-list-boding turbo-list-coupon-sale">
								<div class="input-group">
									<input class="form-control" name="value" type="text" value="{if $coupon->type == 'percentage'}{$coupon->value*1}{else}{$coupon->value|escape}{/if}">
									<select class="js-coupon-sale selectpicker d-none" name="type">
										<option value="percentage" {if $coupon->type=='percentage'}selected{/if}>%</option>
										<option value="absolute" {if $coupon->type=='absolute'}selected{/if}>{$currency->sign}</option>
									</select>
								</div>
							</div>
							<div class="turbo-list-boding turbo-list-coupon-condit">
								<div class="input-group">
									<input class="form-control" type="text" name="min_order_price" value="{$coupon->min_order_price|escape}" placeholder="{$btr->coupons_order_price|escape}">
									<div class="input-group-text">
										{$currency->sign}
									</div>
								</div>
							</div>
							<div class="turbo-list-boding turbo-list-coupon-disposable">
								<label class="form-check d-inline-block align-top">
									<input class="form-check-input" type="checkbox" name="single" value="1" {if $coupon->single == 1}checked{/if}>
								</label>
							</div>
							<div class="turbo-list-boding turbo-list-coupon-validity">
								<div class="input-group">
									<input class="form-control flatpickr" type="text" name="expire" value="{$coupon->expire|date}">
									<div class="input-group-text">
										<i class="align-middle" data-feather="calendar"></i>
									</div>
								</div>
							</div>
							<div class="turbo-list-boding turbo-list-coupon-disposable">
								<label class="form-check d-inline-block align-top">
									<input class="form-check-input" type="checkbox" name="expires" value="1" {if $coupon->expire}checked{/if}>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="d-grid d-sm-block mt-3">
						<button type="submit" class="btn btn-primary float-end">
							<i class="align-middle" data-feather="check"></i>
							<span>{$btr->global_apply|escape}</span>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

{literal}
	<script>
		$(window).on("load", function() {
			flatpickr(".flatpickr", {
				dateFormat: "d.m.Y",
				locale: "{/literal}{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}{literal}"
			});

			$('.js-coupon-sale').removeClass('d-none');
		});
	</script>
{/literal}