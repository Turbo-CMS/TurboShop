{if $order->id}
	{$meta_title = "`$btr->general_order_number` `$order->id`" scope=global}
{else}
	{$meta_title = $btr->order_new scope=global}
{/if}

<form method="post" id="order" enctype="multipart/form-data" class="fn_fast_button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<input name="id" type="hidden" value="{$order->id|escape}">
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="wrap_heading">
				<div class="box_heading heading_page">
					{if $order->id}
						{$btr->general_order_number|escape} {$order->id|escape}
					{else}
						{$btr->order_new|escape}
					{/if}
				</div>
				<div class="boxes_inline">
					<select class="selectpicker" name="status">
						<option value='0' {if $order->status == 0}selected{/if}>{$btr->general_new_order|escape}</option>
						<option value='1' {if $order->status == 1}selected{/if}>{$btr->general_accepted_order|escape}</option>
						<option value='2' {if $order->status == 2}selected{/if}>{$btr->general_closed_order|escape}</option>
						<option value='3' {if $order->status == 3}selected{/if}>{$btr->general_canceled_order|escape}</option>
					</select>
				</div>
				<div data-hint="{$btr->order_print|escape}" class="boxes_inline hint-bottom-middle-t-info-s-small-mobile  hint-anim ml-h">
					<a href="{url view=print id=$order->id}" target="_blank" title="{$btr->order_print|escape}" class="print_block">
						{include file='svg_icon.tpl' svgId='printer'}
					</a>
				</div>
				{if $labels}
					<div class="box_btn_heading ml-h hidden-xs-down">
						<div class="add_order_marker">
							<span class="fn_ajax_label_wrapper">
								<span class="fn_labels_show box_labels_show box_btn_heading ml-h">{include file='svg_icon.tpl' svgId='tag'} <span>{$btr->general_select_label|escape}</span> </span>
								<div class='fn_labels_hide box_labels_hide'>
									<span class="heading_label">{$btr->general_labels|escape} <i class="fn_delete_labels_hide btn_close delete_labels_hide">{include file='svg_icon.tpl' svgId='close'}</i></span>
									<ul class="option_labels_box">
										{foreach $labels as $l}
											<li class="fn_ajax_labels" data-order_id="{$order->id}" style="background-color: {$l->color|escape}">
												<input id="l{$order->id}_{$l->id}" type="checkbox" class="hidden_check_1" name="order_labels[]" value="{$l->id}" {if in_array($l->id, $order_labels) && is_array($order_labels)}checked="" {/if} />
												<label for="l{$order->id}_{$l->id}" class="label_labels"><span>{$l->name|escape}</span></label>
											</li>
										{/foreach}
									</ul>
								</div>
								<div class="fn_order_labels orders_labels box_btn_heading ml-h">
									{include file="labels_ajax.tpl"}
								</div>
							</span>
						</div>
					</div>
				{/if}
			</div>
		</div>
	</div>
	{if $hasVariantNotInStock}
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="boxed boxed_warning">
					<div class="">
						{$btr->order_not_in_stock|escape}
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
						{if $message_error=='error_closing'}
							{$btr->order_shortage|escape}
						{else}
							{$message_error|escape}
						{/if}
					</div>
				</div>
			</div>
		</div>
	{elseif $message_success}
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="boxed boxed_success">
					<div class="heading_box">
						{if $message_success=='updated'}
							{$btr->order_updated|escape}
						{elseif $message_success=='added'}
							{$btr->order_added|escape}
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
	<div class="row">
		{*left_column*}
		<div class="col-xl-8 break_1300_12  pr-0">
			<div class="boxed fn_toggle_wrap min_height_230px">
				<div class="heading_box">
					{$btr->order_content|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="">
						<div id="fn_purchase" class="turbo_list turbo_list_order">
							<div class="turbo_list_head">
								<div class="turbo_list_heading turbo_list_photo">{$btr->general_photo|escape}</div>
								<div class="turbo_list_heading turbo_list_order_name">{$btr->order_name_option|escape}</div>
								<div class="turbo_list_heading turbo_list_price">{$btr->general_price|escape} {$currency->sign|escape}</div>
								<div class="turbo_list_heading turbo_list_count">{$btr->order_qty|escape}, {$settings->units|escape}
								</div>
								<div class="turbo_list_heading turbo_list_order_amount_price">{$btr->general_sales_amount}</div>
							</div>
							<div class="turbo_list_body">
								{foreach $purchases as $purchase}
									<div class="fn_row turbo_list_body_item purchases">
										<div class="turbo_list_row">
											<input type="hidden" name="purchases[id][{$purchase->id}]" value="{$purchase->id}">
											<div class="turbo_list_boding turbo_list_photo">
												{$img_flag=0}
												{$image_array=","|explode:$purchase->variant->images_ids}
												{foreach $purchase->product->images as $image}
													{if $image->id|in_array:$image_array}
														{if $img_flag==0}{$image_toshow=$image}{/if}
														{$img_flag=1}
													{/if}
												{/foreach}
												{if $img_flag ne 0}
													<img src="{$image_toshow->filename|resize:50:50}" alt="{$product->name|escape}">
												{else}
													{$image = $purchase->product->images|first}
													{if $image}
														<img class="product_icon" src="{$image->filename|resize:50:50}" alt="{$product->name|escape}">
													{else}
														<img width="40" src="design/images/no_image.svg" alt="{$product->name|escape}">
													{/if}
												{/if}
											</div>
											<div class="turbo_list_boding turbo_list_order_name">
												<div class="boxes_inline">
													{if $purchase->product}
														<a href="{url module=ProductAdmin id=$purchase->product->id}">{$purchase->product_name|escape}</a>
														{if !$order->closed}
															{if !$purchase->product}
																<span data-hint="{$btr->product_does_not_exist|escape}" class="text_warning hint-bottom-middle-t-info-s-small-mobile hint-anim alert-order">{include file='svg_icon.tpl' svgId='alert'}</span>
															{elseif !$purchase->variant}
																<span data-hint="{$btr->product_variant_does_not_exist|escape}" class="text_warning hint-bottom-middle-t-info-s-small-mobile hint-anim alert-order">{include file='svg_icon.tpl' svgId='alert'}</span>
															{elseif $purchase->variant->stock < $purchase->amount}
																<span data-hint="{$btr->in_stock_left|escape} {$purchase->variant->stock}" class="text_warning hint-bottom-middle-t-info-s-small-mobile hint-anim alert-order">{include file='svg_icon.tpl' svgId='alert'}</span>
															{/if}
														{/if}
														{if $purchase->variant_name}
															<span class="text_grey">{$btr->order_option|escape} {$purchase->variant_name|escape} {if $purchase->variant->color}/ {$purchase->variant->color|escape}{/if}</span>
														{/if}
														{if $purchase->sku}
															<span class="text_grey">/ {$btr->general_sku|escape} {$purchase->sku|default:"&mdash;"}</span>
														{/if}
													{else}
														<div class="text_grey">{$purchase->product_name|escape}</div>
														{if $purchase->variant_name}
															<div class="text_grey">{$btr->order_option|escape} {$purchase->variant_name|escape}</div>
														{/if}
														{if $purchase->sku}
															<div class="text_grey">{$btr->general_sku|escape} {$purchase->sku|default:"&mdash;"}</div>
														{/if}
													{/if}
													<div class="hidden-lg-up mt-q">
														<span class="text_primary text_600 text_spacing">{$purchase->price}</span>
														<span class="hidden-md-up text_500 text_spacing">{$purchase->amount} {$settings->units|escape}</span>
													</div>
												</div>
												{if !$purchase->variant}
													<input class="form-control" type="hidden" name="purchases[variant_id][{$purchase->id}]" value="">
												{else}
													<div class="boxes_inline mt-q">
														<select name="purchases[variant_id][{$purchase->id}]" class="selectpicker {if $purchase->product->variants|count == 1}hidden{/if} fn_purchase_variant">
															{foreach $purchase->product->variants as $v}
																<option data-price="{$v->price}" data-amount="{$v->stock}" value="{$v->id}" {if $v->id == $purchase->variant_id}selected{/if}>
																	{if $v->name}
																		{$v->name|escape} {if $v->color}/ {$v->color|escape}{/if}
																	{else}
																		#{$v@iteration}
																	{/if}
																</option>
															{/foreach}
														</select>
													</div>
												{/if}
											</div>
											<div class="turbo_list_boding turbo_list_price">
												<div class="input-group">
													<input type="text" class="form-control fn_purchase_price" name="purchases[price][{$purchase->id}]" value="{$purchase->price}">
													<span class="input-group-addon">{$currency->sign}</span>
												</div>
											</div>
											<div class="turbo_list_boding turbo_list_count">
												<div class="input-group">
													<input class="form-control fn_purchase_amount" type="text" name="purchases[amount][{$purchase->id}]" value="{$purchase->amount}">
													<span class="input-group-addon p-0">
														{$settings->units|escape}
													</span>
												</div>
											</div>
											<div class="turbo_list_boding turbo_list_order_amount_price">
												<div class="text_dark">
													<span>{($purchase->price) * ($purchase->amount)}</span>
													<span class="">{$currency->sign}</span>
												</div>
											</div>
											<div class="turbo_list_boding turbo_list_close">
												{*delete*}
												<button data-hint="{$btr->general_delete_product|escape}" type="button" class="btn_close fn_remove_item hint-bottom-right-t-info-s-small-mobile  hint-anim">
													{include file='svg_icon.tpl' svgId='delete'}
												</button>
											</div>
										</div>
									</div>
								{/foreach}
							</div>
							<div class="turbo_list_body fn_new_purchase" style="display: none">
								<div class="fn_row turbo_list_body_item ">
									<div class="turbo_list_row">
										<div class="turbo_list_boding turbo_list_photo">
											<input type="hidden" name="purchases[id][]" value="">
											<img class="fn_new_image" src="">
										</div>
										<div class="turbo_list_boding turbo_list_order_name">
											<div class="boxes_inline">
												<a class="fn_new_product" href=""></a>
												<div class="fn_new_variant_name"></div>
											</div>
											<div class="boxes_inline">
												<select name="purchases[variant_id][]" class="fn_new_variant"></select>
											</div>
										</div>
										<div class="turbo_list_boding turbo_list_price">
											<div class="input-group">
												<input type="text" class="form-control fn_purchase_price" name="purchases[price][]" value="">
												<span class="input-group-addon">{$currency->sign|escape}</span>
											</div>
										</div>
										<div class="turbo_list_boding turbo_list_count">
											<div class="input-group">
												<input class="form-control fn_purchase_amount" type="text" name="purchases[amount][]" value="1">
												<span class="input-group-addon p-0">
													{$settings->units|escape}
												</span>
											</div>
										</div>
										<div class="turbo_list_boding turbo_list_order_amount_price">
											<div class="text_dark">
												<span>{$purchase->price}</span>
												<span class="">{$currency->sign|escape}</span>
											</div>
										</div>
										<div class="turbo_list_boding turbo_list_close">
											{*delete*}
											<button data-hint="{$btr->general_delete_product|escape}" type="button" class="btn_close fn_remove_item hint-bottom-right-t-info-s-small-mobile  hint-anim">
												{include file='svg_icon.tpl' svgId='delete'}
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-1">
							<div class="col-lg-6 col-md-12">
								<div class="autocomplete_arrow">
									<input type="text" name="new_purchase" id="fn_add_purchase" class="form-control" placeholder="{$btr->general_add_product|escape}">
								</div>
							</div>
							<div class="col-lg-6 col-md-12">
								{if $purchases}
									<div class="text_dark text_500 text-xs-right mr-1 mt-h">
										<div class="h5">{$btr->order_sum|escape} {$subtotal} {$currency->sign|escape}</div>
									</div>
								{/if}
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="boxed fn_toggle_wrap min_height_230px">
				<div class="heading_box">
					{$btr->order_parameters|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div>
						<div>
							<div class="turbo_list turbo_list_order">
								<div class="turbo_list_body">
									<div class="turbo_list_body_item">
										<div class="turbo_list_row  d_flex">
											<div class="turbo_list_boding turbo_list_ordfig_name">
												<div class="text_600 text_dark">{$btr->general_discount|escape}</div>
											</div>
											<div class="turbo_list_boding turbo_list_ordfig_val">
												<div class="input-group">
													<input type="text" class="form-control" name="discount" value="{$order->discount}">
													<span class="input-group-addon p-0">%</span>
												</div>
											</div>
											<div class="turbo_list_boding turbo_list_ordfig_price">
												<div class="text_dark">
													<span>{($subtotal-$subtotal*$order->discount/100)|round:2}</span>
													<span class="">{$currency->sign|escape}</span>
												</div>
											</div>
										</div>
									</div>
									<div class="turbo_list_body_item">
										<div class="turbo_list_row d_flex">
											<div class="turbo_list_boding turbo_list_ordfig_name">
												<div class="text_600 text_dark">{$btr->general_coupon|escape}{if $order->coupon_code} ({$order->coupon_code}){/if}</div>
											</div>
											<div class="turbo_list_boding turbo_list_ordfig_val">
												<div class="input-group">
													<input type="text" class="form-control" name="coupon_discount" value="{$order->coupon_discount}">
													<span class="input-group-addon p-0">{$currency->sign|escape}</span>
												</div>
											</div>
											<div class="turbo_list_boding turbo_list_ordfig_price">
												<div class="text_dark">
													<span>{($subtotal-$subtotal*$order->discount/100-$order->coupon_discount)|round:2}</span>
													<span class="">{$currency->sign|escape}</span>
												</div>
											</div>
										</div>
									</div>
									<div class="turbo_list_body_item">
										<div class="turbo_list_row  d_flex">
											<div class="turbo_list_boding turbo_list_ordfig_name">
												<div class="text_600 text_dark">{$btr->general_weight|escape}</div>
											</div>
											<div class="turbo_list_boding turbo_list_ordfig_val">
												<div class="input-group">
													<input type="text" class="form-control" name="weight" value="{$order->weight}">
													<span class="input-group-addon p-0">{$settings->weight_units}</span>
												</div>
											</div>
										</div>
									</div>
									<div class="turbo_list_body_item">
										<div class="turbo_list_row d_flex">
											<div class="turbo_list_boding turbo_list_ordfig_name">
												<div class="text_600 text_dark boxes_inline heading_label">{$btr->general_shipping|escape}</div>
												<div class="boxes_inline">
													<select name="delivery_id" class="selectpicker">
														<option value="0">{$btr->order_not_selected|escape}</option>
														{foreach $deliveries as $d}
															<option value="{$d->id}" {if $d->id==$delivery->id}selected{/if}>{$d->name|escape}</option>
														{/foreach}
													</select>
												</div>
											</div>
											<div class="turbo_list_boding turbo_list_ordfig_val">
												<div class="input-group">
													<input type="text" name="delivery_price" class="form-control" value='{$order->delivery_price}'>
													<span class="input-group-addon p-0">{$currency->sign|escape}</span>
												</div>
											</div>
											<div class="turbo_list_boding turbo_list_ordfig_price">
												<div class="input-group"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row ">
								<div class="col-lg-4 col-md-12 mt-2">
									<div class="heading_label">{$btr->order_payment_selected|escape}</div>
									<div class="">
										<select name="payment_method_id" class="selectpicker">
											<option value="0">{$btr->order_not_selected|escape}</option>
											{foreach $payment_methods as $pm}
												<option value="{$pm->id}" {if $pm->id==$payment_method->id}selected{/if}>{$pm->name|escape}</option>
											{/foreach}
										</select>
									</div>
								</div>
								<div class="col-lg-8 col-md-12">
									<div class="text_dark text_500 text-xs-right mr-1 mt-1">
										<div class="h5">{$btr->general_total|escape}{$order->total_price} {$currency->sign|escape}</div>
									</div>
									<div class="text_grey text_500 text-xs-right mr-1 mt-1">
										{if $payment_method}
											<div class=" text-xs-right">
												<div class="h5">{$btr->order_to_pay|escape} {$order->total_price|convert:$payment_currency->id} {$payment_currency->sign}</div>
											</div>
										{/if}
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12 col-md-12 mt-1">
									<label class="switch_label">{$btr->order_paid|escape}</label>
									<div class="form-check form-switch">
										<input class="form-check-input" id="paid" name="paid" value="1" type="checkbox" {if $order->paid}checked="" {/if}>
										<label class="form-check-label" for="paid"></label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		{*right_column*}
		<div class="col-xl-4 break_1300_12">
			<div class="boxed fn_toggle_wrap min_height_230px">
				<div class="heading_box">
					{$btr->order_buyer_information|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="box_border_buyer">
						<div class="mb-1">
							<div class="heading_label boxes_inline">{$btr->order_date|escape}</div>
							<div class="boxes_inline text_dark text_600">{$order->date|date} {$order->date|time}</div>
						</div>
						<div class="mb-1">
							<div class="heading_label">{$btr->general_full_name|escape}</div>
							<input name="name" class="form-control" type="text" value="{$order->name|escape}">
						</div>
						<div class="mb-1">
							<div class="heading_label">{$btr->general_phone|escape}</div>
							<input name="phone" class="form-control" type="text" value="{$order->phone|escape}">
						</div>
						<div class="mb-1">
							<div class="heading_label">E-mail</div>
							<input name="email" class="form-control" type="text" value="{$order->email|escape}">
						</div>
						<div class="mb-1">
							<div class="heading_label">{$btr->general_adress|escape} <a href="https://www.google.com/maps/search/{$order->address|escape}?hl={$settings->lang}" target="_blank">{include file='svg_icon.tpl' svgId='marker'} {$btr->order_on_map|escape}</a></div>
							<textarea name="address" class="form-control short_textarea">{$order->address|escape}</textarea>
						</div>
						<div class="mb-1">
							<div class="heading_label">{$btr->general_comment|escape}</div>
							<textarea name="comment" class="form-control short_textarea">{$order->comment|escape}</textarea>
						</div>
						<div class="mb-1">
							<div class="heading_label boxes_inline">{$btr->order_ip|escape} <a href="https://who.is/whois-ip/ip-address/{$order->ip}" target="_blank">{include file='svg_icon.tpl' svgId='marker'} whois</a></div>
							<div class="boxes_inline text_dark text_600">{$order->ip|escape}</div>
						</div>
					</div>
					<div class="box_border_buyer">
						<div class="mb-1">
							<div style="position:relative;">
								{if !$user}
									<div class="heading_label">
										{$btr->order_buyer_not_registred|escape}
									</div>
									<div style="position:relative;">
										<input type="hidden" name="user_id" value="{$user->id}">
										<input type="text" class="fn_user_complite form-control" placeholder="{$btr->order_user_select|escape}">
									</div>
								{else}
									<div class="fn_user_row">
										<div class="heading_label boxes_inline">
											{$btr->order_buyer|escape}
											<a href="{url module=UserAdmin id=$user->id}" target="_blank">
												{$user->name|escape}
											</a>
										</div>
										<a href="javascript:;" data-hint="{$btr->users_delete|escape}" class="btn_close delete_grey fn_delete_user hint-bottom-right-t-info-s-small-mobile  hint-anim boxes_inline">
											{include file='svg_icon.tpl' svgId='delete'}
										</a>
										{if $user->group_id > 0}
											<div class="text_grey">{$user->group->name|escape}</div>
										{else}
											<div class="text_grey">{$btr->order_not_in_group|escape}</div>
										{/if}
									</div>
								{/if}
							</div>
						</div>
					</div>
					<div class="box_border_buyer">
						<div class="mb-1">
							<div class="heading_label">{$btr->order_language|escape}</div>
							<select name="lang_id" class="selectpicker">
								{foreach $languages as $l}
									<option value='{$l->id}' {if $l->id == $order->lang_id}selected{/if} data-content='<span class="flag-icon flag-icon-{$l->label}"></span> {$l->name|escape}'>{$l->name|escape}</option>
								{/foreach}
							</select>
						</div>
						<div class="">
							<div class="form-group">
								<div class="heading_label">{$btr->order_note|escape}</div>
								<textarea name="note" class="form-control short_textarea">{$order->note|escape}</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 mb-2">
			<button type="submit" class="btn btn_small btn-primary float-sm-right">
				{include file='svg_icon.tpl' svgId='checked'}
				<span>{$btr->general_apply|escape}</span>
			</button>
			<div class="checkbox_email float-sm-right text_dark mr-1">
				<label class="form-check">
					<input class="form-check-input mr-h" type="checkbox" name="notify_user" value="1">
					<span class="form-check-label">{$btr->order_email|escape}</span>
				</label>
			</div>
		</div>
	</div>
</form>

{* Autocomplete *}
{js id="autocomplete" priority=99 include=[
"turbo/design/js/autocomplete/jquery.autocomplete-min.js"
]}{/js}
{javascript minify=true}

{css id="autocomplete" include=[
"turbo/design/js/autocomplete/styles.css"
]}{/css}
{stylesheet minify=true}

{* Flag icon *}
{css id="flag" include=[
"turbo/design/css/flag-icon.min.css"
]}{/css}
{stylesheet minify=true}

{literal}
	<script>
		$(function() {

			// Removing a product
			$(document).on("click", "#fn_purchase .fn_remove_item", function() {
				$(this).closest(".fn_row").fadeOut(200, function() { $(this).remove(); });
				return false;
			});

			$(".fn_labels_show").click(function() {
				$(this).next('.fn_labels_hide').toggleClass("active_labels");
			});

			$(".fn_delete_labels_hide").click(function() {
				$(this).closest('.box_labels_hide').removeClass("active_labels");
			});

			$(document).on("change", ".fn_ajax_labels input", function() {
				elem = $(this);
				var order_id = parseInt($(this).closest(".fn_ajax_labels").data("order_id"));
				var state = "";
				session_id = '{/literal}{$smarty.session.id}{literal}';
				toastr.options = {
					closeButton: true,
					newestOnTop: true,
					progressBar: true,
					positionClass: 'toast-top-right',
					preventDuplicates: false,
					onclick: null
				};
				var label_id = parseInt($(this).closest(".fn_ajax_labels").find("input").val());
				if ($(this).closest(".fn_ajax_labels").find("input").is(":checked")) {
					state = "add";
				} else {
					state = "remove";
				}
				$.ajax({
					type: "POST",
					dataType: 'json',
					url: "ajax/update_order.php",
					data: {
						order_id: order_id,
						state: state,
						label_id: label_id,
						session_id: session_id
					},
					success: function(data) {
						var msg = "";
						if (data) {
							elem.closest(".fn_ajax_label_wrapper").find(".fn_order_labels").html(data.data);
							toastr.success(msg, "{/literal}{$btr->general_success|escape}{literal}");
						} else {
							toastr.error(msg, "{/literal}{$btr->general_error|escape}{literal}");
						}
					}
				});
			});

			// Add product
			var new_purchase = $('#fn_purchase .fn_new_purchase').clone(true);
			$('#fn_purchase .fn_new_purchase').remove().removeAttr('class');
			$("#fn_add_purchase").autocomplete({
				serviceUrl: 'ajax/add_order_product.php',
				minChars: 0,
				noCache: false,
				onSelect: function(suggestion) {
					new_item = new_purchase.clone().appendTo('#fn_purchase');
					new_item.removeAttr('id');
					new_item.find('.fn_new_product').html(suggestion.data.name);
					new_item.find('.fn_new_product').attr('href', 'index.php?module=ProductAdmin&id=' + suggestion.data.id);
					// Adding options for a new product
					var variants_select = new_item.find("select.fn_new_variant");
					for (var i in suggestion.data.variants) {
						variants_select.append("<option value='" + suggestion.data.variants[i].id + "' data-price='" + suggestion.data.variants[i].price + "' data-amount='" + suggestion.data.variants[i].stock + "'>" + suggestion.data.variants[i].name + "  " + suggestion.data.variants[i].color + "</option>");
					}
					if (suggestion.data.variants.length > 1 || suggestion.data.variants[0].name != '') {
						variants_select.show();
						variants_select.selectpicker();
					} else {
						variants_select.hide();
					}
					variants_select.find('option:first').attr('selected', true);
					variants_select.bind('change', function() {
						change_variant(variants_select);
					});
					change_variant(variants_select);
					if (suggestion.data.image) {
						new_item.find('.fn_new_image').attr("src", suggestion.data.image);
					} else {
						new_item.find('.fn_new_image').remove();
					}
					$("input#fn_add_purchase").val('').focus().blur();
					new_item.show();
				},
				formatResult: function(suggestions, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return "<div>" + (suggestions.data.image ? "<img align=absmiddle src='" + suggestions.data.image + "'> " : '') + "</div>" + "<span>" + suggestions.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + "</span>";
				}
			});

			// Change in price and max quantity when changing the variant
			function change_variant(element) {
				var price = element.find('option:selected').data('price');
				var amount = element.find('option:selected').data('amount');
				element.closest('.fn_row').find('input.fn_purchase_price').val(price);
				var amount_input = element.closest('.fn_row').find('input.fn_purchase_amount');
				amount_input.val('1');
				amount_input.data('max', amount);
				return false;
			}

			$(".fn_user_complite").autocomplete({
				serviceUrl: 'ajax/search_users.php',
				minChars: 0,
				noCache: false,
				onSelect: function(suggestion) {
					$('input[name="user_id"]').val(suggestion.data.id);
				},
				formatResult: function(suggestions, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return "<span>" + suggestions.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + "</span>";
				}
			});

			$(document).on("click", ".fn_delete_user", function() {
				$(this).closest(".fn_user_row").hide();
				$('input[name="user_id"]').val(0);
			});

			$("select.fn_purchase_variant").bind("change", function() {
				change_variant($(this));
			});
		});
	</script>
{/literal}