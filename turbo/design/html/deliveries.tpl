{$meta_title=$btr->global_shipping scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->global_shipping|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=DeliveryAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->deliveries_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $deliveries}
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
						<div class="turbo-list-heading turbo-list-photo">{$btr->global_photo|escape}</div>
						<div class="turbo-list-heading turbo-list-delivery-name">{$btr->global_title|escape}</div>
						<div class="turbo-list-heading turbo-list-delivery-condit">{$btr->global_conditions|escape}</div>
						<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="deliveries-wrap turbo-list-body sortable">
						{foreach $deliveries as $delivery}
							<div class="js-row turbo-list-body-item js-sort-item body-narrow">
								<div class="turbo-list-row narrow">
									<input type="hidden" name="positions[{$delivery->id}]" value="{$delivery->position}">
									<div class="turbo-list-boding turbo-list-drag move-zone">
										<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
									</div>
									<div class="turbo-list-boding turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$delivery->id}">
										</label>
									</div>
									<div class="turbo-list-boding turbo-list-photo small-photo boding-small turbo-list-delivery-photo">
										{if $delivery->icon}
											<a href="{url module=DeliveryAdmin id=$delivery->id return=$smarty.server.REQUEST_URI}">
												<img src="../{$config->delivery_images_dir}{$delivery->icon}" alt="{$delivery->name|escape}">
											</a>
										{elseif $delivery->code}
											<a href="{url module=DeliveryAdmin id=$delivery->id return=$smarty.server.REQUEST_URI}">
												<i class="align-middle" data-feather="code"></i>
											</a>
										{else}
											<a href="{url module=DeliveryAdmin id=$delivery->id return=$smarty.server.REQUEST_URI}">
												<i class="align-middle" data-feather="camera"></i>
											</a>
										{/if}
									</div>
									<div class="turbo-list-boding turbo-list-delivery-name">
										<a href="{url module=DeliveryAdmin id=$delivery->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">
											{$delivery->name|escape}
										</a>
										<div class="d-block d-lg-none mt-1">
											{if $delivery->separate_payment}
												<div><span class="badge badge-primary-light">{$btr->global_paid_separately|escape}</span></div>
											{/if}
											{if $delivery->price > 0}
												<div><span class="badge badge-danger-light">{$btr->global_price|escape} {$delivery->price} {$currency->sign|escape}</span></div>
											{else}
												<div><span class="badge badge-success-light">{$btr->deliveries_free|escape}</span></div>
											{/if}
											{if $delivery->free_from > 0}
												<div><span class="badge badge-info-light">{$btr->deliveries_free_from|escape} {$delivery->free_from} {$currency->sign|escape}</span></div>
											{/if}
										</div>
									</div>
									<div class="turbo-list-boding turbo-list-delivery-condit">
										{if $delivery->separate_payment}
											<div><span class="badge badge-primary-light">{$btr->global_paid_separately|escape}</span></div>
										{/if}
										{if $delivery->price > 0}
											<div><span class="badge badge-danger-light">{$btr->global_price|escape} {$delivery->price} {$currency->sign|escape}</span></div>
										{else}
											<div><span class="badge badge-success-light">{$btr->deliveries_free|escape}</span></div>
										{/if}
										{if $delivery->free_from > 0}
											<div><span class="badge badge-info-light">{$btr->deliveries_free_from|escape} {$delivery->free_from} {$currency->sign|escape}</span></div>
										{/if}
									</div>
									<div class="turbo-list-boding turbo-list-status">
										<div class="form-check form-switch">
											<input class="form-check-input js-ajax-action {if $delivery->enabled}js-active-class{/if}" id="id-{$delivery->id}" data-module="delivery" data-action="enabled" data-id="{$delivery->id}" name="enabled" value="1" type="checkbox" {if $delivery->enabled}checked=""{/if}>
											<label class="form-check-label" for="id-{$delivery->id}"></label>
										</div>
									</div>
									<div class="turbo-list-boding turbo-list-delete">
										<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
											<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
												<i class="align-middle" data-feather="trash-2"></i>
											</span>
										</button>
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
			<h5 class="card-title ms-1 my-3">{$btr->deliveries_no|escape}</h5>
		{/if}
	</div>
</div>