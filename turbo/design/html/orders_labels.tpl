{$meta_title=$btr->order_settings_labels scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->order_settings_labels|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=OrdersLabelAdmin}"><i data-feather="plus"></i> {$btr->order_settings_add_label|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $labels}
			<form class="js-form-list" method="post">
				<input type="hidden" value="labels" name="labels">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="turbo-list">
					<div class="turbo-list-head">
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-order-stg-lbl-name">{$btr->global_title|escape}</div>
						<div class="turbo-list-heading turbo-list-order-stg-sts-label">{$btr->global_color|escape}</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="js-labels_list turbo-list-body sortable">
						{foreach $labels as $label}
							<div class="js-row turbo-list-body-item body-narrow">
								<div class="turbo-list-row js-sort-item narrow">
									<input type="hidden" name="positions[{$label->id}]" value="{$label->position}">
									<input type="hidden" name="id[]" value="{$label->id}">
									<div class="cturbo-list-boding turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$label->id}">
										</label>
									</div>
									<div class="turbo-list-boding turbo-list-order-stg-lbl-name">
										<a href="{url module=OrdersLabelAdmin id=$label->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$label->name|escape}</a>
									</div>
									<div class="turbo-list-boding turbo-list-order-stg-sts-label">
										<a href="{url module=OrdersLabelAdmin id=$label->id return=$smarty.server.REQUEST_URI}" data-hint="{$label->color}" class="label-color-item" data-bs-toggle="tooltip" data-bs-placement="top" title="{$label->color}" style="background-color:{$label->color};"></a>
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
					<div class="turbo-list-footer">
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
						<button type="submit" value="labels" class="btn btn-primary">
							<i class="align-middle" data-feather="check"></i>
							{$btr->global_apply|escape}
						</button>
					</div>
				</div>
			</form>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->no_labels|escape}</h5>
		{/if}
	</div>
</div>