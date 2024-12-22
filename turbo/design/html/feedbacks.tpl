{$meta_title=$btr->global_feedback scope=global}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-3">
				{$btr->global_feedback|escape} - {$feedbacks_count}
			</h1>
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-12 float-end">
		<form class="search mb-3" method="get">
			<input type="hidden" name="module" value="CommentsAdmin">
			<div class="input-group">
				<input name="keyword" class="form-control" placeholder="{$btr->global_search|escape}" type="text" value="{$keyword|escape}">
				<button class="btn btn-primary" type="submit"><i class="align-middle mt-n1" data-feather="search"></i></button>
			</div>
		</form>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $feedbacks}
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<form method="post" class="js-form-list">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">

						<div class="post-wrap turbo-list">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-comments-name">{$btr->global_messages|escape}</div>
								<div class="turbo-list-heading turbo-list-comments-btn"></div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body">
								{foreach $feedbacks as $feedback}
									<div class="js-row turbo-list-body-item {if !$feedback->processed}unapproved{/if}">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$feedback->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-comments-name">
												<div class="mb-0">
													<span class="fw-bold text-secondary">{$btr->global_name|escape}: </span>
													<a href="mailto:{$feedback->name|escape}<{$feedback->email|escape}>?subject={$btr->email_request_from|escape} {$feedback->name|escape}" class="fw-bold text-body text-decoration-none">{$feedback->name|escape}</a>
												</div>
												<div class="mb-0">
													<span class="fw-bold text-secondary">Email:</span> <span class="text-body">{$feedback->email|escape}</span>
												</div>
												<div class="mb-0">
													<span class="fw-bold text-secondary">{$btr->global_message|escape}</span>
													<span class="text-body">{$feedback->message|escape|nl2br}</span>
												</div>
												<span class="text-secondary">{$btr->global_request_sent|escape}</span>
												<span class="badge badge-secondary-light">{$feedback->date|time} | {$feedback->date|date}</span>
												{if !$feedback->processed}
													<div class="d-block d-md-none mt-1">
														<button type="button" class="btn btn-outline-secondary js-ajax-action {if $feedback->processed}js-active-class{/if}" data-module="feedback" data-action="processed" data-id="{$feedback->id}" onclick="$(this).hide();">
															{$btr->global_process|escape}
														</button>
													</div>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-comments-btn">
												{if !$feedback->processed}
													<button type="button" class="btn btn-outline-secondary js-ajax-action {if $feedback->processed}js-active-class{/if}" data-module="feedback" data-action="processed" data-id="{$feedback->id}" onclick="$(this).hide();">
														{$btr->global_process|escape}
													</button>
												{/if}
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
			<h5 class="card-title ms-1 my-3">{$btr->feedbacks_no|escape}</h5>
		{/if}
	</div>
</div>