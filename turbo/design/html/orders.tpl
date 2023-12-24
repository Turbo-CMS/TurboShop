{$meta_title=$btr->global_orders scope=global}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="d-md-flex mb-3">
			{if $orders_count}
				<h1 class="d-inline align-middle me-3">
					{$btr->global_orders|escape} - {$orders_count}
				</h1>
				<div class="d-inline-block heading-block text-dark me-3 mb-3 mt-1" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->orders_export|escape}">
					<i class="align-middle cursor-pointer" data-feather="file-text"></i>
				</div>
			{else}
				<h1 class="d-inline align-middle me-3">{$btr->orders_no|escape}</h1>
			{/if}
			<div class="d-grid d-sm-block mt-2 mt-md-0">
				<a class="btn btn-primary" href="{url module=OrderAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->orders_add|escape}</a>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-12 float-end">
		<form class="search mb-3" method="get">
			<input type="hidden" name="module" value="OrdersAdmin">
			<div class="input-group">
				<input name="keyword" class="form-control" placeholder="{$btr->global_search|escape}" type="text" value="{if isset($keyword)}{$keyword|escape}{/if}">
				<button class="btn btn-primary" type="submit"><i class="align-middle mt-n1" data-feather="search"></i></button>
			</div>
		</form>
	</div>
</div>

{if isset($message_error)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error=='error_closing'}
						{$btr->orders_in|escape}
						{foreach $error_orders as $error_order_id}
							№ {$error_order_id}
						{/foreach}
						{$btr->orders_shortage|escape}
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
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="d-block d-md-none">
					<div class="row mb-3">
						<div class="col-md-6 col-sm-12">
							<select name="status" class="selectpicker" onchange="location = this.value;">
								<option value="{url module=OrdersAdmin status=0 keyword=null id=null page=null label=null}" {if $status==0}selected{/if}>{$btr->global_new_order|escape}</option>
								<option value="{url module=OrdersAdmin status=1 keyword=null id=null page=null label=null}" {if $status==1}selected{/if}>{$btr->global_accepted_order|escape}</option>
								<option value="{url module=OrdersAdmin status=2 keyword=null id=null page=null label=null}" {if $status==2}selected{/if}>{$btr->global_closed_order|escape}</option>
								<option value="{url module=OrdersAdmin status=3 keyword=null id=null page=null label=null}" {if $status==3}selected{/if}>{$btr->global_canceled_order|escape}</option>
								<option value="{url module=OrdersAdmin status=4 keyword=null id=null page=null label=null}" {if $status==4}selected{/if}>{$btr->global_all|escape}</option>
							</select>
						</div>
					</div>
				</div>
				<div class="d-none d-md-block">
					<form method="get">
						<input type="hidden" name="module" value="OrdersAdmin">
						<input type="hidden" name="status" value="{$status}">
						<div class="row">
							<div class="col-sm-12 col-md-4 col-lg-4">
								<div class="input-group mb-3">
									<span class="input-group-text">{$btr->global_from|escape}</span>
									<input type="text" class="flatpickr form-control" name="from_date" value="{if isset($from_date)}{$from_date}{/if}" autocomplete="off">
									<span class="input-group-text"><i class="align-middle" data-feather="calendar"></i></span>
								</div>
							</div>
							<div class="col-sm-12 col-md-4 col-lg-4">
								<div class="input-group mb-3">
									<span class="input-group-text">{$btr->global_to|escape}</span>
									<input type="text" class="flatpickr form-control" name="to_date" value="{if isset($to_date)}{$to_date}{/if}" autocomplete="off">
									<span class="input-group-text"><i class="align-middle" data-feather="calendar"></i></span>
								</div>
							</div>
							<div class="col-sm-12 col-md-4 col-lg-4">
								<button class="btn btn-primary" type="submit"><i class="align-middle" data-feather="check"></i> {$btr->global_apply|escape}</button>
							</div>
						</div>
					</form>
					<div class="row">
						<div class="col-sm-12 col-md-6 col-lg-4 mb-3">
							<select name="status" class="selectpicker" onchange="location = this.value;">
								<option value="{url module=OrdersAdmin status=0 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $smarty.get.status && $status == 0 || !$status}selected{/if}>{$btr->global_new_order|escape}</option>
								<option value="{url module=OrdersAdmin status=1 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==1}selected{/if}>{$btr->global_accepted_order|escape}</option>
								<option value="{url module=OrdersAdmin status=2 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==2}selected{/if}>{$btr->global_closed_order|escape}</option>
								<option value="{url module=OrdersAdmin status=3 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==3}selected{/if}>{$btr->global_canceled_order|escape}</option>
								<option value="{url module=OrdersAdmin status=4 keyword=null id=null page=null label=null from_date=null to_date=null}" {if $status==4}selected{/if}>{$btr->global_all|escape}</option>
							</select>
						</div>
						{if isset($labels)}
							<div class="col-sm-12 col-md-6 col-lg-4 mb-3">
								<select class="selectpicker" onchange="location = this.value;">
									<option value="{url label=null}" {if isset($label) && $label->id != $l->id}selected{/if}>{$btr->orders_all_labels|escape}</option>
									{foreach $labels as $l}
										<option value="{url label=$l->id}" {if isset($label) && $label->id == $l->id}selected{/if}>{$l->name|escape}</option>
									{/foreach}
								</select>
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
		{if $orders}
			<div class="row">
				<div class="col-12">
					<form class="js-form-list" method="post">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">
						<div class="turbo-list">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-order-number">№</div>
								<div class="turbo-list-heading turbo-list-orders-name">{$btr->global_full_name|escape}</div>
								<div class="turbo-list-heading turbo-list-order-status">{$btr->global_status|escape}</div>
								<div class="turbo-list-heading turbo-list-order-product-count">{$btr->global_products|escape}</div>
								<div class="turbo-list-heading turbo-list-orders-price">{$btr->global_sales_amount}</div>
								<div class="turbo-list-heading turbo-list-order-marker">{$btr->orders_label|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body">
								{foreach $orders as $order}
									<div class="js-row turbo-list-body-item">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$order->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-boding-order turbo-list-order-number">
												<a href="{url module=OrderAdmin id=$order->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$btr->global_order_number|escape} {$order->id}</a>
												{if $order->paid}
													<div class="mt-1">
														<span class="badge badge-success-light">{$btr->order_paid|escape}</span>
													</div>
												{else}
													<div class="mt-1">
														<span class="badge badge-secondary-light">{$btr->order_not_paid|escape}</span>
													</div>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-orders-name">
												<a href="{url module=OrderAdmin id=$order->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$order->name|escape}</a>
												{if $order->note}
													<div class="text-muted fw-light">{$order->note|escape}</div>
												{/if}
												<div class="d-block d-lg-none mt-1">
													{if $order->status == 0}
														<span class="badge badge-primary-light">
															{$btr->global_new_order|escape}
														</span>
													{/if}
													{if $order->status == 1}
														<span class="badge badge-warning-light">
															{$btr->global_new_order|escape}
														</span>
													{/if}
													{if $order->status == 2}
														<span class="badge badge-info-light">
															{$btr->global_closed_order|escape}
														</span>
													{/if}
													{if $order->status == 3}
														<span class="badge badge-danger-light">
															{$btr->global_canceled_order|escape}
														</span>
													{/if}
												</div>
												<div class="mt-1">
													<span class="d-none d-lg-inline-block text-secondary me-1">{$btr->orders_order_in|escape}:</span>
													<span class="badge badge-secondary-light">{$order->date|date} l {$order->date|time}</span>
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-order-status">
												{if $order->status == 0}
													<span class="badge badge-primary-light">
														{$btr->global_new_order|escape}
													</span>
												{/if}
												{if $order->status == 1}
													<span class="badge badge-warning-light">
														{$btr->global_accepted_order|escape}
													</span>
												{/if}
												{if $order->status == 2}
													<span class="badge badge-info-light">
														{$btr->global_closed_order|escape}
													</span>
												{/if}
												{if $order->status == 3}
													<span class="badge badge-danger-light">
														{$btr->global_canceled_order|escape}
													</span>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-order-product-count">
												<span>{$order->purchases|count}</span>
												<span class="js-orders-toggle cursor-pointer">
													<span class="js-icon-arrow">
														<i class="align-middle" data-feather="chevron-down"></i>
													</span>
												</span>
											</div>
											<div class="turbo-list-boding turbo-list-orders-price">
												<div class="input-group">
													<span class="form-control">
														{$order->total_price|escape}
													</span>
													<span class="input-group-text">
														{$currency->sign|escape}
													</span>
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-order-marker">
												<span class="js-ajax-label-wrapper">
													<a class="nav-link dropdown-toggle" href="#" id="labelsDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$btr->global_select_label|escape}</a>
													<div class="dropdown-menu dropdown-menu-start js-labels-hide box-labels-hide" aria-labelledby="labelsDropdown">
														<ul class="option-labels-box">
															{foreach $labels as $l}
																<li class="js-ajax-labels badge d-block text-start my-2" data-order-id="{$order->id}" style="background-color: {$l->color|escape}">
																	<input id="l{$order->id}_{$l->id}" type="checkbox" class="d-none" name="order_labels[]" value="{$l->id}" {if isset($order->labels_ids) && is_array($order->labels_ids) && in_array($l->id,$order->labels_ids)}checked="" {/if}>
																	<label for="l{$order->id}_{$l->id}" class="cursor-pointer w-100"><span class="d-inline-block align-middle ms-3">{$l->name|escape}</span></label>
																</li>
															{/foreach}
														</ul>
													</div>
													<div class="js-order-labels">
														{include file="labels_ajax.tpl"}
													</div>
												</span>
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
													<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
														<i class="align-middle" data-feather="trash-2"></i>
													</button>
												</div>
											</div>
										</div>
										<div class="turbo-list-row purchases-block">
											<div class="orders-purchases-block" style="display: none">
												<div class="purchases-table">
													<div class="purchases-head">
														<div class="purchases-heading purchases-table-orders-num">№</div>
														<div class="purchases-heading purchases-table-orders-sku">{$btr->global_sku|escape}</div>
														<div class="purchases-heading purchases-table-orders-name">{$btr->global_title|escape}</div>
														<div class="purchases-heading purchases-table-orders-price">{$btr->global_price|escape}</div>
														<div class="purchases-heading purchases-table-orders-unit">{$btr->global_qty|escape}</div>
														<div class="purchases-heading purchases-table-orders-total">{$btr->orders_total_price|escape}</div>
													</div>
													<div class="purchases-body">
														{foreach $order->purchases as $purchase}
															<div class="purchases-body-items">
																<div class="purchases-body-item">
																	<div class="purchases-bodyng purchases-table-orders-num">{$purchase@iteration}</div>
																	<div class="purchases-bodyng purchases-table-orders-sku">{$purchase->sku|default:"&mdash;"}</div>
																	<div class="purchases-bodyng purchases-table-orders-name">
																		{$purchase->product_name|escape} {if $purchase->variant_color}/ {$purchase->variant_color|escape}{/if} {if $purchase->variant_name}/ {$purchase->variant_name|escape}{/if}
																	</div>
																	<div class="purchases-bodyng purchases-table-orders-price">{$purchase->price} {$currency->sign|escape}</div> 
																	<div class="purchases-bodyng purchases-table-orders-unit">{$purchase->amount}{$settings->units|escape}</div>
																	<div class="purchases-bodyng purchases-table-orders-total">{($purchase->price*$purchase->amount)|number_format:2:".":""} {$currency->sign|escape}</div>
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
							<div class="turbo-list-footer">
								<div class="turbo-list-foot-left">
									<div class="turbo-list-heading turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
										</label>
									</div>
									<div class="turbo-list-option">
										<select name="action" class="selectpicker js-change-orders">
											<option value="0">{$btr->global_select_action|escape}</option>
											{if $status!==0}<option value="set_status_0">{$btr->move_to_new|escape}</option>{/if}
											{if $status!==1}<option value="set_status_1">{$btr->move_to_accepted|escape}</option>{/if}
											{if $status!==2}<option value="set_status_2">{$btr->move_to_closed|escape}</option>{/if}
											<option data-item="label" value="set_label">{$btr->orders_set_label|escape}</option>
											<option data-item="label" value="unset_label">{$btr->orders_unset_label|escape}</option>
											<option value="delete">{$btr->delete_selected_orders|escape}</option>
										</select>
									</div>
									<div class="row row-cols-md-auto align-items-center ms-3 d-none js-show-label">
										<div class="col-12">
											<select name="change_label_id" class="selectpicker">
												<option value="0">{$btr->global_select_label|escape}</option>
												{foreach $labels as $change_label}
													<option value="{$change_label->id}">{$change_label->name|escape}</option>
												{/foreach}
											</select>
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="align-middle" data-feather="check"></i>
									<span>{$btr->global_apply|escape}</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					{include file='pagination.tpl'}
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->orders_no|escape}</h5>
		{/if}
	</div>
</div>

{* Piecon *}
{js id="piecon" priority=99 include=["turbo/design/js/piecon/piecon.min.js"]}{/js}
{javascript minify=true}

{literal}
	<script>
		$(window).on("load", function() {

			flatpickr(".flatpickr", {
				dateFormat: "d.m.Y",
				locale: "{/literal}{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}{literal}"
			});

			$(document).on("change", ".js-change-orders", function() {
				var item = $(this).find("option:selected").data("item");
				if (item == "label") {
					$(".js-show-label").removeClass('d-none');
				} else {
					$(".js-show-label").addClass('d-none');
				}
			});

			$(document).on("change", ".js-ajax-labels input", function() {
				elem = $(this);
				var order_id = parseInt($(this).closest(".js-ajax-labels").data("order-id"));
				var state = "";
				session_id = '{/literal}{$smarty.session.id}{literal}';
				var label_id = parseInt($(this).closest(".js-ajax-labels").find("input").val());
				if ($(this).closest(".js-ajax-labels").find("input").is(":checked")) {
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
							elem.closest(".js-ajax-label-wrapper").find(".js-order-labels").html(data.data);
							notyf.success({message: '{/literal}{$btr->global_success|escape}{literal}', dismissible: true});
							} else {
								notyf.error({message: '{/literal}{$btr->global_error|escape}{literal}', dismissible: true});
								}
							}
						});
					});

					$(document).on('click', '.js-orders-toggle', function() {
						$(this).find('.js-icon-arrow').toggleClass('rotate-180');
						$(this).parents('.js-row').find('.orders-purchases-block').slideToggle();
					});

				{/literal}
					var status = '{if isset($status)}{$status|escape}{/if}',
					label='{if isset($label)}{$label->id|escape}{/if}',
					from_date = '{if isset($from_date)}{$from_date}{/if}',
					to_date = '{if isset($to_date)}{$to_date}{/if}';
				{literal}

				$(document).on('click', '.feather-file-text', function() {
					Piecon.setOptions({fallback: 'force'});
					Piecon.setProgress(0);
					var progress_item = $("#progressbar");
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