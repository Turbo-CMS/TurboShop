{$meta_title=$btr->payment_methods_methods scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->payment_methods_methods|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=PaymentMethodAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->payment_methods_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $payment_methods}
			<form class="js-form-list" method="post">
				<div class="turbo-list ">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<div class="turbo-list-head">
						<div class="turbo-list-boding turbo-list-drag"></div>
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-payment-name">{$btr->global_title|escape}</div>
						<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="deliveries-wrap turbo-list-body sortable">
						{foreach $payment_methods as $payment_method}
							<div class="js-row turbo-list-body-item js-sort-item body-narrow">
								<div class="turbo-list-row narrow">
									<input type="hidden" name="positions[{$payment_method->id}]" value="{$payment_method->position}">
									<div class="turbo-list-boding turbo-list-drag move-zone">
										<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
									</div>
									<div class="turbo-list-boding turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$payment_method->id}">
										</label>
									</div>
									<div class="turbo-list-boding turbo-list-payment-name">
										<a href="{url module=PaymentMethodAdmin id=$payment_method->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">
											{$payment_method->name|escape}
										</a>
									</div>
									<div class="turbo-list-boding turbo-list-status">
										<div class="form-check form-switch">
											<input class="form-check-input js-ajax-action {if $payment_method->enabled}js-active-class{/if}" id="id_{$payment_method->id}" data-module="payment" data-action="enabled" data-id="{$payment_method->id}" name="visible" value="1" type="checkbox" {if $payment_method->enabled}checked="" {/if}>
											<label class="form-check-label" for="id_{$payment_method->id}"></label>
										</div>
									</div>
									<div class="turbo-list-boding turbo-list-delete">
										<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
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
							<div class="turbo-list-boding turbo-list-drag"></div>
							<div class="turbo-list-heading turbo-list-check">
								<label class="form-check">
									<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo-list-option">
								<select name="action" class="selectpicker">
									<option value="enable">{$btr->global_do_enable|escape}</option>
									<option value="disable">{$btr->global_do_disable|escape}</option>
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
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->payment_methods_no|escape}</h5>
		{/if}
	</div>
</div>