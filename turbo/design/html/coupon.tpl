{* Title *}
{if $coupon->code}
	{$meta_title = $coupon->code scope=global}
{else}
	{$meta_title = $btr->coupons_new scope=global}
{/if}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if $coupon->code}
					{$coupon->code}
				{else}
					{$btr->coupons_new|escape}
				{/if}
			</div>
		</div>
	</div>
</div>

{if $message_success}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_success">
				<div class="heading_box">
					{if $message_success == 'added'}
						{$btr->coupons_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->coupons_update|escape}
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
					{if $message_error == 'code_exists'}
						{$btr->coupons_exists|escape}
					{elseif $message_error=='empty_code'}
						{$btr->coupons_enter_code|escape}
					{else}
						{$message_error|escape}
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

<div class="boxed fn_toggle_wrap">
	<form method="post" id="product" class="clearfix" enctype="multipart/form-data">
		<input type="hidden" name="session_id" value="{$smarty.session.id}">
		<div class="turbo_list fn_sort_list turbo_list_order">
			<div class="turbo_list_head">
				<div class="turbo_list_heading turbo_list_coupon_name">{$btr->coupons_name|escape}</div>
				<div class="turbo_list_heading turbo_list_coupon_sale">{$btr->general_discount|escape}</div>
				<div class="turbo_list_heading turbo_list_coupon_condit">{$btr->general_conditions|escape}</div>
				<div class="turbo_list_heading turbo_list_coupon_disposable">{$btr->coupons_one_off|escape}</div>
				<div class="turbo_list_heading turbo_list_coupon_validity">{$btr->coupons_terms|escape}</div>
				<div class="turbo_list_heading turbo_list_coupon_count">{$btr->coupons_expired|escape}</div>

			</div>
			<div class="turbo_list_body">
				<div class="turbo_list_body_item">
					<div class="turbo_list_row ">
						<div class="turbo_list_boding turbo_list_coupon_name">
							<input class="form-control" name="code" type="text" value="{$coupon->code|escape}" placeholder="{$btr->coupons_enter_name|escape}" />
							<input name="id" class="name" type="hidden" value="{$coupon->id|escape}" />
						</div>
						<div class="turbo_list_boding turbo_list_coupon_sale">
							<div class="input-group">
								<input class="form-control" name="value" type="text" value="{$coupon->value|escape}" />
								<select class="selectpicker form-control" name="type">
									<option value="percentage" {if $coupon->type=='percentage'}selected{/if}>%</option>
									<option value="absolute" {if $coupon->type=='absolute'}selected{/if}>{$currency->sign}</option>
								</select>
							</div>
						</div>
						<div class="turbo_list_boding turbo_list_coupon_condit">
							<div class="input-group">
								<input class="form-control" type="text" name="min_order_price" value="{$coupon->min_order_price|escape}" placeholder="{$btr->coupons_order_price|escape}">
								<div class="input-group-addon">
									{$currency->sign}
								</div>
							</div>
						</div>
						<div class="turbo_list_boding turbo_list_coupon_disposable">
							<label class="form-check">
								<input class="form-check-input" type="checkbox" name="single" value="1" {if $coupon->single==1}checked{/if}>
							</label>
						</div>
						<div class="turbo_list_boding turbo_list_coupon_validity">
							<div class="input-group">
								<input class="form-control" type="text" name="expire" value="{$coupon->expire|date}">
								<div class="input-group-addon">
									{include file='svg_icon.tpl' svgId='calendar'}
								</div>
							</div>
						</div>

						<div class="turbo_list_boding turbo_list_coupon_disposable">
							<label class="form-check">
								<input class="form-check-input" type="checkbox" name="expires" value="1" {if $coupon->expire}checked{/if}>
							</label>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 mt-1">
				<button type="submit" class="btn btn_small btn-primary float-md-right">
					{include file='svg_icon.tpl' svgId='checked'}
					<span>{$btr->general_apply|escape}</span>
				</button>
			</div>
		</div>
	</form>
</div>
{* Datetimepicker *}
{css id="datetimepicker" include=[
"turbo/design/js/datetimepicker/jquery.datetimepicker.css"
]}{/css}
{stylesheet minify=true}

{js id="datetimepicker" priority=99 include=[
"turbo/design/js/datetimepicker/jquery.datetimepicker.js"
]}{/js}
{javascript minify=true}
{literal}
	<script>
		$(window).on("load", function() {
			$('input[name="expire"]').datetimepicker({
				lang: '{/literal}{$settings->lang}{literal}',
				timepicker: false,
				format: 'd.m.Y'
			});
		});
	</script>
{/literal}