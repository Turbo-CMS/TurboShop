{$meta_title=$btr->callbacks_order scope=global}

<h1 class="mb-3">
	{$btr->global_callbacks|escape} - {$callbacks_count}
</h1>

<div class="card">
	<div class="card-body">
		{if $callbacks}
			<div class="row">
				<div class="col-12">
					<form class="js-form-list" method="post">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">
						<div class="post-wrap turbo-list">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-comments-name">{$btr->global_callbacks|escape}</div>
								<div class="turbo-list-heading turbo-list-comments-btn"></div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body">
								{foreach $callbacks as $callback}
									<div class="js-row turbo-list-body-item {if !$callback->processed}unapproved{/if}">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$callback->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-comments-name">
												<div class="mb-0">
													<span class="fw-bold text-secondary">{$btr->global_name|escape}:</span>
													<span class="text-body">{$callback->name|escape}</span>
												</div>
												<div class="mb-0">
													<span class="fw-bold text-secondary">{$btr->global_phone|escape}:</span>
													<span class="text-body">{$callback->phone|escape}</span>
												</div>
												{if $callback->message}
													<div class="mb-0">
														<span class="fw-bold text-body">{$btr->global_message|escape} </span>
														{$callback->message|escape|nl2br}
													</div>
												{/if}
												<span class="text-secondary">{$btr->global_request_sent|escape}:</span>
												<span class="badge badge-secondary-light">{$callback->date|time} | {$callback->date|date}</span>
												{if !$callback->processed}
													<div class="d-block d-md-none mt-1">
														<button type="button" class="btn btn-outline-secondary js-ajax-action {if $callback->processed}js-active-class{/if}" data-module="callback" data-action="processed" data-id="{$callback->id}" onclick="$(this).hide();">
															{$btr->global_process|escape}
														</button>
													</div>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-comments-btn">
												{if !$callback->processed}
													<button type="button" class="btn unapproved btn-outline-secondary js-ajax-action {if $callback->processed}js-active-class{/if}" data-module="callback" data-action="processed" data-id="{$callback->id}" onclick="$(this).hide();">
														{$btr->global_process|escape}
													</button>
												{/if}
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
											<option value="processed">{$btr->global_process|escape}</option>
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
			<div class="row">
				<div class="col-12">
					{include file='pagination.tpl'}
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->global_no_request|escape}</h5>
		{/if}
	</div>
</div>