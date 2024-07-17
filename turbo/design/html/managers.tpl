{$meta_title=$btr->managers_managers scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->managers_managers|escape} - {if isset($managers_count)}{$managers_count}{/if}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=ManagerAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->managers_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $managers}
			<div class="row">
				<div class="col-12">
					<form method="post" class="js-form-list">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">
						<div class="managers-wrap turbo-list">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-manager-name">{$btr->manager_login|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body">
								{foreach $managers as $m}
									<div class="js-row turbo-list-body-item body-narrow">
										<div class="turbo-list-row narrow">
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$m->login|escape}" {if $manager->login == $m->login}disabled{/if}>
												</label>
											</div>

											<div class="turbo-list-boding turbo-list-manager-name">
												<a class="fw-bold text-body text-decoration-none" href="index.php?module=ManagerAdmin&login={$m->login|urlencode}">
													{$m->login|escape}
												</a>
											</div>
											{if $manager->login != $m->login}
												<div class="turbo-list-boding turbo-list-delete">
													<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
														<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
															<i class="align-middle" data-feather="trash-2"></i>
														</span>
													</button>
												</div>
											{/if}
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
								<button type="submit" class="btn btn-primary">
									<i class="align-middle" data-feather="check"></i>
									{$btr->global_apply|escape}
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->managers_no|escape}</h5>
		{/if}
	</div>
</div>