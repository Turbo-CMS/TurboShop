{* Title *}
{$meta_title=$btr->general_orders scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			{if $orders_count}
				<div class="box_heading heading_page">
					{$btr->general_orders|escape} - {$orders_count}
					<div class="export_block hint-bottom-middle-t-info-s-small-mobile hint-anim" data-hint="{$btr->orders_export|escape}">
						{include file='svg_icon.tpl' svgId='file_export'}
					</div>
				</div>
			{else}
				<div class="box_heading heading_page">{$btr->orders_no|escape}</div>
			{/if}
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="{url module=OrderAdmin}">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->orders_add|escape}</span>
				</a>
			</div>
		</div>
	</div>
	<div class="col-lg-5 col-md-5 col-xs-12 float-xs-right">
		<div class="boxed_search">
			<form class="search" method="get">
				<input type="hidden" name="module" value="OrdersAdmin">
				<div class="input-group">
					<input name="keyword" class="form-control" placeholder="{$btr->general_search|escape}" type="text" value="{$keyword|escape}">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary">{include file='svg_icon.tpl' svgId='search'} <span class="hidden-md-down"></span></button>
					</span>
				</div>
			</form>
		</div>
	</div>
</div>

{if $message_error}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_warning">
				<div class="heading_box">
					{if $message_error=='error_closing'}
						{$btr->orders_in|escape}
						{foreach $error_orders as $error_order_id}
							<div>
								№ {$error_order_id}
							</div>
						{/foreach}
						{$btr->orders_shortage|escape}
					{else}
						{$message_error|escape}
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}

<div class="boxed fn_toggle_wrap">
	{if $orders}
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="hidden-md-up">
					<div class="row mb-1">
						<div class=" col-md-6 col-sm-12">
							<select name="status" class="selectpicker" onchange="location = this.value;">
								<option value="{url module=OrdersAdmin status=0 keyword=null id=null page=null label=null}" {if $status==0}selected=""{/if}>{$btr->general_new_order|escape}</option>
								<option value="{url module=OrdersAdmin status=1 keyword=null id=null page=null label=null}" {if $status==1}selected=""{/if}>{$btr->general_accepted_order|escape}</option>
								<option value="{url module=OrdersAdmin status=2 keyword=null id=null page=null label=null}" {if $status==2}selected=""{/if}>{$btr->general_closed_order|escape}</option>
								<option value="{url module=OrdersAdmin status=3 keyword=null id=null page=null label=null}" {if $status==3}selected=""{/if}>{$btr->general_canceled_order|escape}</option>
								<option value="{url module=OrdersAdmin status=4 keyword=null id=null page=null label=null}" {if $status==4}selected=""{/if}>{$btr->general_all|escape}</option>
							</select>
						</div>
					</div>
				</div>
				<div class="boxed_sorting">
					<div class="row">
						<div class="col-md-11 col-lg-11 col-xl-7 col-sm-12 mb-1">
							<div class="date">
								<form class="date_filter row" method="get">
									<input type="hidden" name="module" value="OrdersAdmin">
									<input type="hidden" name="status" value="{$status}">
									<div class="col-md-5 col-lg-5 pr-0 pl-0">
										<div class="input-group">
											<span class="input-group-addon-date">{$btr->general_from|escape}</span>
											<input type="text" class="fn_from_date form-control" name="from_date" value="{$from_date}" autocomplete="off">
											<div class="input-group-addon">
												{include file='svg_icon.tpl' svgId='calendar'}
											</div>
										</div>
									</div>
									<div class="col-md-5 col-lg-5 pr-0 pl-0">
										<div class="input-group">
											<span class="input-group-addon-date">{$btr->general_to|escape}</span>
											<input type="text" class="fn_to_date form-control" name="to_date" value="{$to_date}" autocomplete="off">
											<div class="input-group-addon">
												{include file='svg_icon.tpl' svgId='calendar'}
											</div>
										</div>
									</div>
									<div class="col-md-2 col-lg-2 pr-0">
										<button class="btn btn-primary" type="submit">{$btr->general_apply|escape}</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4 col-sm-12">
							<select name="status" class="selectpicker" onchange="location = this.value;">
								<option value="{url module=OrdersAdmin status=0 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $smarty.get.status && $status == 0 || !$status}selected{/if}>{$btr->general_new_order|escape}</option>
								<option value="{url module=OrdersAdmin status=1 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==1}selected{/if}>{$btr->general_accepted_order|escape}</option>
								<option value="{url module=OrdersAdmin status=2 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==2}selected{/if}>{$btr->general_closed_order|escape}</option>
								<option value="{url module=OrdersAdmin status=3 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==3}selected{/if}>{$btr->general_canceled_order|escape}</option>
								<option value="{url module=OrdersAdmin status=4 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==4}selected=""{/if}>{$btr->general_all|escape}</option>
							</select>
						</div>
						{if $labels}
							<div class="col-md-6 col-lg-4 col-sm-12">
								<select class="selectpicker" onchange="location = this.value;">
									<option value="{url label=null}" {if $label->id != $l->id} selected{/if}>{$btr->orders_all_labels|escape}</option>
									{foreach $labels as $l}
										<option value="{url label=$l->id}" {if $label->id == $l->id}selected{/if}>{$l->name|escape}</option>
									{/foreach}
								</select>
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<form class="fn_form_list" method="post">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<div class="orders_list turbo_list products_list">
						<div class="turbo_list_head">
							<div class="turbo_list_heading turbo_list_check">
								<label class="form-check">
									<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo_list_heading turbo_list_order_number">№ </div>
							<div class="turbo_list_heading turbo_list_orders_name">{$btr->general_full_name|escape}</div>
							<div class="turbo_list_heading turbo_list_order_status">{$btr->general_status|escape}</div>
							<div class="turbo_list_heading turbo_list_order_product_count">{$btr->general_products|escape}</div>
							<div class="turbo_list_heading turbo_list_orders_price">{$btr->general_sales_amount}</div>
							<div class="turbo_list_heading turbo_list_order_marker">{$btr->orders_label|escape}</div>
							<div class="turbo_list_heading turbo_list_close"></div>
						</div>
						<div class="turbo_list_body">
							{foreach $orders as $order}
								<div class="fn_row turbo_list_body_item">
									<div class="turbo_list_row">
										<div class="turbo_list_boding turbo_list_check">
											<label class="form-check">
												<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$order->id}">
											</label>
										</div>
										<div class="turbo_list_boding turbo_list_boding_order turbo_list_order_number">
											<a href="{url module=OrderAdmin id=$order->id return=$smarty.server.REQUEST_URI}">{$btr->general_order_number|escape} {$order->id}</a>
											{if $order->paid}
												<div class="order_paid">
													<span class="tag tag-success">{$btr->order_paid|escape}</span>
												</div>
											{else}
												<div class="order_paid">
													<span class="tag tag-default">{$btr->order_not_paid|escape}</span>
												</div>
											{/if}
										</div>
										<div class="turbo_list_boding turbo_list_orders_name">
											<span class="text_dark text_bold">{$order->name|escape}</span>
											{if $order->note}
												<div class="note">{$order->note|escape}</div>
											{/if}
											<div class="hidden-lg-up mt-q">
												<span class="tag tag-warning">
													{if $order->status == 0}
														{$btr->general_new_order|escape}
													{/if}
													{if $order->status == 1}
														{$btr->general_accepted_order|escape}
													{/if}
													{if $order->status == 2}
														{$btr->general_closed_order|escape}
													{/if}
													{if $order->status == 3}
														{$btr->general_canceled_order|escape}
													{/if}
												</span>
											</div>
											<div class="mt-q"><span class="hidden-md-down">{$btr->orders_order_in|escape}</span>
												<span class="tag tag-default">{$order->date|date} l {$order->date|time}</span>
											</div>
										</div>
										<div class="turbo_list_boding turbo_list_order_status">
											{if $order->status == 0}
												{$btr->general_new_order|escape}
											{/if}
											{if $order->status == 1}
												{$btr->general_accepted_order|escape}
											{/if}
											{if $order->status == 2}
												{$btr->general_closed_order|escape}
											{/if}
											{if $order->status == 3}
												{$btr->general_canceled_order|escape}
											{/if}
										</div>
										<div class="turbo_list_boding turbo_list_order_product_count">
											<span>{$order->purchases|count}</span>
											<span class="fn_orders_toggle">
												<i class="fn_icon_arrow icon-chevron-down m-t-2"></i>
											</span>
										</div>
										<div class="turbo_list_boding turbo_list_orders_price">
											<div class="input-group">
												<span class="form-control">
													{$order->total_price|escape}
												</span>
												<span class="input-group-addon">
													{$currency->sign|escape}
												</span>
											</div>
										</div>
										<div class="turbo_list_boding turbo_list_order_marker">
											<span class="fn_ajax_label_wrapper">
												<span class="fn_labels_show box_labels_show">{include file='svg_icon.tpl' svgId='tag'} <span>{$btr->orders_choose|escape}</span> </span>

												<div class='fn_labels_hide box_labels_hide'>
													<span class="heading_label">{$btr->general_labels|escape} <i class="fn_delete_labels_hide btn_close delete_labels_hide">{include file='svg_icon.tpl' svgId='close'}</i></span>
													<ul class="option_labels_box">
														{foreach $labels as $l}
															<li class="fn_ajax_labels" data-order_id="{$order->id}" style="background-color: {$l->color|escape}">
																<input id="l{$order->id}_{$l->id}" type="checkbox" class="hidden_check_1" value="{$l->id}" {if is_array($order->labels_ids) && in_array($l->id,$order->labels_ids)}checked=""{/if} />
																<label for="l{$order->id}_{$l->id}" class="label_labels"><span>{$l->name|escape}</span></label>
															</li>
														{/foreach}
													</ul>
												</div>
												<div class="fn_order_labels orders_labels">
													{include file="labels_ajax.tpl"}
												</div>
											</span>
										</div>
										<div class="turbo_list_boding turbo_list_close">
											{*delete*}
											<button data-hint="{$btr->orders_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
												{include file='svg_icon.tpl' svgId='delete'}
											</button>
										</div>
									</div>
									<div class="turbo_list_row purchases_block">
										<div class="orders_purchases_block" style="display: none">
											<div class="purchases_table">
												<div class="purchases_head">
													<div class="purchases_heading purchases_table_orders_num">№</div>
													<div class="purchases_heading purchases_table_orders_sku">{$btr->general_sku|escape}</div>
													<div class="purchases_heading purchases_table_orders_name">{$btr->general_name|escape}</div>
													<div class="purchases_heading purchases_table_orders_price">{$btr->general_price|escape}</div>
													<div class="purchases_heading col-lg-2 purchases_table_orders_unit">{$btr->general_qty|escape}</div>
													<div class="purchases_heading purchases_table_orders_total">{$btr->orders_total_price|escape}</div>
												</div>
												<div class="purchases_body">
													{foreach $order->purchases as $purchase}
														<div class="purchases_body_items">
															<div class="purchases_body_item">
																<div class="purchases_bodyng purchases_table_orders_num">{$purchase@iteration}</div>
																<div class="purchases_bodyng purchases_table_orders_sku">{$purchase->sku|default:"&mdash;"}</div>
																<div class="purchases_bodyng purchases_table_orders_name">
																	{$purchase->product_name|escape} {if $purchase->variant_color}/ {$purchase->variant_color|escape}{/if} {if $purchase->variant_name}/ {$purchase->variant_name|escape}{/if}
																</div>
																<div class="purchases_bodyng purchases_table_orders_price">{$purchase->price|convert} {$currency->sign|escape}</div>
																<div class="purchases_bodyng purchases_table_orders_unit"> {$purchase->amount}{$settings->units|escape}</div>
																<div class="purchases_bodyng purchases_table_orders_total"> {($purchase->amount*$purchase->price)|convert} {$currency->sign|escape}</div>
															</div>
														</div>
													{/foreach}
												</div>
											</div>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
						<div class="turbo_list_footer">
							<div class="turbo_list_foot_left">
								<div class="turbo_list_heading turbo_list_check">
									<label class="form-check">
										<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo_list_option">
									<select name="action" class="selectpicker fn_change_orders">
										<option value="0">{$btr->general_select_action|escape}</option>
										{if $status!==0}<option value="set_status_0">{$btr->move_to_new|escape}</option>{/if}
										{if $status!==1}<option value="set_status_1">{$btr->move_to_accepted|escape}</option>{/if}
										{if $status!==2}<option value="set_status_2">{$btr->move_to_closed|escape}</option>{/if}
										{foreach $labels as $l}
											<option value="set_label_{$l->id}">{$btr->set_label|escape} &laquo;{$l->name}&raquo;</option>
										{/foreach}
										{foreach $labels as $l}
											<option value="unset_label_{$l->id}">{$btr->unset_label|escape} &laquo;{$l->name}&raquo;</option>
										{/foreach}
										<option value="delete">{$btr->delete_selected_orders|escape}</option>
									</select>
								</div>
							</div>
							<button type="submit" class=" btn btn_small btn-primary">
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
			<div class="text_grey">{$btr->orders_no|escape}</div>
		</div>
	{/if}
</div>

{* Piecon *}
{js id="piecon" priority=99 include=[
"turbo/design/js/piecon/piecon.min.js"
]}{/js}
{javascript minify=true}

{* Datetimepicker *}
{css id="datetimepicker" include=[
"turbo/design/js/datetimepicker/jquery.datetimepicker.css"
]}{/css}
{stylesheet minify=true}

{js id="datetimepicker" priority=99 include=[
"turbo/design/js/datetimepicker/jquery.datetimepicker.js"
]}{/js}
{javascript minify=true}

{* On document load *}
{literal}
	<script>
		$(function() {

			$(".fn_labels_show").click(function() {
				$(this).next('.fn_labels_hide').toggleClass("active_labels");
			});
			$(".fn_delete_labels_hide").click(function() {
				$(this).closest('.box_labels_hide').removeClass("active_labels");
			});

			$(document).on("change", ".fn_change_orders", function() {
				var item = $(this).find("option:selected").data("item");
				if (item == "status") {
					$(".fn_show_label").hide();
					$(".fn_show_status").show();

				} else if (item == "label") {
					$(".fn_show_label").show();
					$(".fn_show_status").hide();
				} else {
					$(".fn_show_label").hide();
					$(".fn_show_status").hide();
				}

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

			$(document).on('click', '.fn_orders_toggle', function() {
				$(this).find('.fn_icon_arrow').toggleClass('rotate_180');
				$(this).parents('.fn_row').find('.orders_purchases_block').slideToggle();
			});

			$('.fn_from_date, .fn_to_date').datetimepicker({
				lang: '{/literal}{$settings->lang}{literal}',
				timepicker: false,
				format: 'd.m.Y'
			});

		{/literal}
		var status = '{$status|escape}',
		label='{$label->id|escape}',
		from_date = '{$from_date}',
		to_date = '{$to_date}';
		{literal}
			// On document load
			$(document).on('click', '.feather-file-text', function() {
				Piecon.setOptions({fallback: 'force'});
				Piecon.setProgress(0);
				var progress_item = $("#progressbar"); // specify element selector with animation
				progress_item.show();
				do_export('', progress_item);
			});

			function do_export(page, progress) {
				page = typeof(page) != 'undefined' ? page : 1;
				label = typeof(label) != 'undefined' ? label : null;
				status = typeof(status) != 'undefined' ? status : null;
				from_date = typeof(from_date) != 'undefined' ? from_date : null;
				to_date = typeof(to_date) != 'undefined' ? to_date : null;
				$.ajax({
					url: "ajax/export_orders.php",
					data: {
						page: page,
						label: label,
						status: status,
						from_date: from_date,
						to_date: to_date
					},
					dataType: 'json',
					success: function(data) {
						if (data && !data.end) {
							Piecon.setProgress(Math.round(100 * data.page / data.totalpages));
							progress.attr('value', 100 * data.page / data.totalpages);
							do_export(data.page * 1 + 1, progress);
						} else {
							Piecon.setProgress(100);
							progress.attr('value', '100');
							window.location.href = 'files/export/export_orders.csv';
							progress.fadeOut(500);
						}
					},
					error: function(xhr, status, errorThrown) {
						alert(errorThrown + '\n' + xhr.responseText);
					}
				});
			}

		});
	</script>
{/literal}