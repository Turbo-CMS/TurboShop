{if $delivery->id}
	{$meta_title = $delivery->name scope=global}
{else}
	{$meta_title = $btr->delivery_new scope=global}
{/if}

<div class="row">
	<div class="col-lg-12 col-md-12">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if !$delivery->id}
					{$btr->delivery_add|escape}
				{else}
					{$delivery->name|escape}
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
					{if $message_success == 'added'}
						{$btr->delivery_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->delivery_updated|escape}
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
					{else}
						{$message_error|escape}
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data" class="fn_fast_button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<input type="hidden" name="lang_id" value="{$lang_id}">

	<div class="row">
		<div class="col-xs-12">
			<div class="boxed">
				<div class="row d_flex">
					<div class="col-lg-10 col-md-9 col-sm-12">
						<div class="heading_label">
							{$btr->general_name|escape}
						</div>
						<div class="form-group">
							<input class="form-control mb-h" name="name" type="text" value="{$delivery->name|escape}">
							<input name="id" type="hidden" value="{$delivery->id|escape}">
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-sm-12">
						<div class="activity_of_switch">
							<div class="activity_of_switch_item">
								<div class="turbo_switch clearfix">
									<label class="switch_label">{$btr->general_enable|escape}</label>
									<div class="form-check form-switch">
										<input class="form-check-input" id="enabled_checkbox" name="enabled" value="1" type="checkbox" {if $delivery->enabled}checked="" {/if}>
										<label class="form-check-label" for="enabled_checkbox"></label>
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
		<div class="col-lg-6 col-md-12 pr-0">
			<div class="boxed fn_toggle_wrap min_height_335px">
				<div class="heading_box">
					{$btr->delivery_type|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>

				<div class="toggle_body_wrap on fn_card">
					<button type="button" class="btn btn_small btn-outline-primary delivery_btn fn_type_delivery delivery_type {if $delivery->price > 0}active{/if}" data-type="paid">
						{$btr->delivery_paid|escape}
					</button>
					<button type="button" class="btn btn_small btn-outline-primary delivery_btn fn_type_delivery delivery_type {if $delivery->price == 0 && !$delivery->separate_payment}active{/if}" data-type="free">
						{$btr->deliveries_free|escape}
					</button>
					<button type="button" class="btn btn_small btn-outline-primary delivery_btn fn_type_delivery delivery_type {if $delivery->separate_payment}active{/if}" data-type="delivery">
						{$btr->general_paid_separately|escape}
					</button>
					<div class="row fn_delivery_option {if $delivery->price == 0}hidden{/if} mt-1">
						<div class="col-lg-12 col-md-12">
							<div class="delivery_inline_block mt-1">
								<div class="input-group">
									<span class="boxes_inline heading_label">{$btr->delivery_cost|escape}</span>
									<span class="boxes_inline bnr_dl_price">
										<div class="input-group">
											<input name="price" class="form-control" type="text" value="{$delivery->price|escape}">
											<span class="input-group-addon">{$currency->sign|escape}</span>
										</div>
									</span>
								</div>
							</div>
							<div class="delivery_inline_block mt-1">
								<div class="input-group">
									<span class="boxes_inline heading_label">{$btr->deliveries_free_from|escape}</span>
									<span class="boxes_inline bnr_dl_price">
										<div class="input-group">
											<div class="input-group">
												<input name="free_from" class="form-control" type="text" value="{$delivery->free_from|escape}">
												<span class="input-group-addon">{$currency->sign|escape}</span>
											</div>
										</div>
									</span>
								</div>
							</div>
						</div>
					</div>
					<input class="hidden" name="separate_payment" type="checkbox" value="1" {if $delivery->separate_payment}checked{/if} />
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="boxed fn_toggle_wrap min_height_335px">
				<div class="heading_box">
					{$btr->delivery_payments|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row wrap_payment_item">
						{foreach $payment_methods as $payment_method}
							<div class="col-lg-4 col-md-6 col-sm-12">
								<div class="payment_item">
									<label class="form-check {if in_array($payment_method->id, $delivery_payments)}active_payment{/if}">
										<input class="form-check-input" type="checkbox" name="delivery_payments[]" value="{$payment_method->id}" {if in_array($payment_method->id, $delivery_payments)}checked{/if}>
										<span class="form-check-label payment_name_wrap">{$payment_method->name|escape}</span>
									</label>
								</div>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed match fn_toggle_wrap tabs">
				<div class="heading_box">
					{$btr->delivery_description|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="tab_container">
						<div id="tab1" class="tab">
							<textarea name="description" class="editor_small">{$delivery->description|escape}</textarea>
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
			</div>
		</div>
	</div>
</form>
{* We connect Tiny MCE *}
{include file='tinymce_init_two.tpl'}
<script>
	$(document).on("click", ".fn_type_delivery", function() {
		var action = $(this).data("type");
		$(".delivery_type").removeClass("active");

		switch (action) {
			case 'paid':
				$(".fn_delivery_option").removeClass("hidden");
				$("input[name=separate_payment]").removeAttr("checked");
				$(this).addClass("active");
				break;
			case 'free':
				$(".fn_delivery_option").addClass("hidden");
				$(".fn_delivery_option").find("input").val(0);
				$("input[name=separate_payment]").removeAttr("checked");
				$(this).addClass("active");
				break;
			case 'delivery':
				$(".fn_delivery_option").addClass("hidden");
				$(".fn_delivery_option").find("input").val(0);
				$("input[name=separate_payment]").trigger("click");
				$(this).addClass("active");
				break;
		}
	});
</script>