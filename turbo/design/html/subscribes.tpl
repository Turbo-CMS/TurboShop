{$meta_title=$btr->global_subscribes_email scope=global}

<div class="row">
	<div class="col-12">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-3">
				{$btr->global_subscribes_email|escape} - {$subscribes_count}
			</h1>
			{if $subscribes_count > 0}
				<div class="d-inline-block heading-block text-dark mb-3 mt-1" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_export|escape}">
					<i class="align-middle cursor-pointer" data-feather="file-text"></i>
				</div>
			{/if}
		</div>
	</div>
</div>

{if $subscribes_count > 0}
	<div class="position-relative mb-4 mt-n4">
		<div class="progress position-absolute w-100" style="display: none;">
			<div id="progressbar" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
		</div>
	</div>
{/if}

<div class="card">
	<div class="card-body">
		{if $subscribes}
			<div class="row">
				<div class="col-12">
					<form class="js-form-list" method="post">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">
						<div class="users-wrap turbo-list">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-subscribe-name">Email</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body sortable">
								{foreach $subscribes as $subscribe}
									<div class="js-row turbo-list-body-item {if !$subscribe->processed}unapproved{/if} body-narrow">
										<div class="turbo-list-row narrow">
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$subscribe->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-subscribe-name">
												<a class="fw-bold text-body text-decoration-none" href="mailto:{$subscribe->email|escape}">
													{$subscribe->email|escape}
												</a>
												<div class="mb-0">
													<span class="text-secondary">{$btr->global_request_sent|escape}:</span>
													<span class="badge badge-secondary-light">{$subscribe->date|time} | {$subscribe->date|date}</span>
												</div>
												{if !$subscribe->processed}
													<div class="d-block d-md-none mt-1">
														<button type="button" class="btn btn-outline-secondary js-ajax-action {if $subscribe->processed}js-active-class{/if}" data-module="subscribe" data-action="processed" data-id="{$subscribe->id}" onclick="$(this).hide();">
															{$btr->global_process|escape}
														</button>
													</div>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-comments-btn">
												{if !$subscribe->processed}
													<button type="button" class="btn unapproved btn-outline-secondary js-ajax-action {if $subscribe->processed}js-active-class{/if}" data-module="subscribe" data-action="processed" data-id="{$subscribe->id}" onclick="$(this).hide();">
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
			<h5 class="card-title ms-1 my-3">{$btr->subscribe_mailing_mo|escape}</h5>
		{/if}
	</div>
</div>

{* Piecon *}
{js id="piecon" priority=99 include=["turbo/design/js/piecon/piecon.min.js"]}{/js}
{javascript minify=true}

<script>
	var in_process = false;
	var keyword='{$keyword|escape}';
	var sort='{$sort|escape}';

	{literal}
		$(function() {

			$(document).on('click', '.feather-file-text', function() {
				Piecon.setOptions({fallback: 'force'});
				Piecon.setProgress(0);
				var progress_item = $("#progressbar");
				$(".progress").show();
				do_export('', progress_item);
			});

			function do_export(page, progress) {
				page = typeof(page) != 'undefined' ? page : 1;
				$.ajax({
					url: "ajax/export_subscribes.php",
					data: {page:page, keyword:keyword, sort:sort},
					dataType: 'json',
					success: function(data) {
						if (data && !data.end) {
							Piecon.setProgress(Math.round(100 * data.page / data.totalpages));
							progress.css('width', 100 * data.page / data.totalpages + '%');
							do_export(data.page * 1 + 1, progress);
						} else {
							Piecon.setProgress(100);
							progress.css('width', '100%');
							window.location.href = 'files/export_users/subscribes.csv';
							$(".progress").fadeOut(500);
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