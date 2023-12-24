{$meta_title=$btr->global_groups scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->global_groups|escape} - {$groups|count}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=GroupAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->user_groups_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $groups}
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<form class="js-form-list" method="post">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">

						<div class="groups-wrap turbo-list">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-usergroups-name">{$btr->user_groups_name|escape}</div>
								<div class="turbo-list-heading turbo-list-usergroups-sale">{$btr->global_discount|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body">
								{foreach $groups as $group}
									<div class="js-row turbo-list-body-item body-narrow">
										<div class="turbo-list-row narrow">
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$group->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-usergroups-name">
												<a href="{url module=GroupAdmin id=$group->id}" class="fw-bold text-body text-decoration-none">
													{$group->name|escape}
												</a>
											</div>
											<div class="turbo-list-boding turbo-list-usergroups-sale">
												<span class="tag tag-danger">{$btr->global_discount|escape} {$group->discount*1}%</span>
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
								<button type="submit" class="btn btn_small btn-primary">
									<i class="align-middle" data-feather="check"></i>
									{$btr->global_apply|escape}
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->user_groups_no|escape}</h5>
		{/if}
	</div>
</div>