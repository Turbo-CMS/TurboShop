{$meta_title=$btr->global_backup scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->global_backup|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<button id="create-backup" type="button" class="btn btn-primary"><i data-feather="plus"></i> {$btr->create_backup|escape}</button>
	</div>
</div>

<form id="hidden" method="post">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<input type="hidden" name="action" value="">
	<input type="hidden" name="name" value="">
</form>

<div class="card">
	<div class="card-body">
		{if $backups}
			<form method="post" class="js-form-list">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="turbo-list">
					<div class="turbo-list-head">
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-backup-name">{$btr->global_backup|escape}</div>
						<div class="turbo-list-heading">{$btr->global_activities|escape}</div>
					</div>
					<div class="turbo-list-body">
						{foreach $backups as $backup}
							<div class="js-row turbo-list-body-item">
								<div class="turbo-list-row">
									<div class="turbo-list-boding turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$backup->name}">
										</label>
									</div>
									<div class="turbo-list-boding turbo-list-backup-name">
										<a href="files/backup/{$backup->name}" class="fw-bold text-body text-decoration-none">
											{$backup->name}
										</a>
										({if $backup->size>1024*1024}{($backup->size/1024/1024)|round:2} {$btr->global_mb|escape}{else}{($backup->size/1024)|round:2} {$btr->global_kb|escape}{/if})
									</div>
									<div class="turbo-list-boding d-flex">
										<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->restore_backup|escape}">
											<button type="button" class="btn-restore restore">
												<i class="align-middle" data-feather="rotate-cw"></i>
											</button>
										</div>
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
						<button type="submit" class="btn btn-primary">
							<i class="align-middle" data-feather="check"></i>
							{$btr->global_apply|escape}
						</button>
					</div>
				</div>
			</form>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->no_backups|escape}</h5>
		{/if}
	</div>
</div>

<div class="modal fade" id="js-restore-backup" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$btr->global_confirm|escape}</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body text-center">
				<div class="d-grid gap-2 d-sm-block">
					<button type="button" class="btn btn-success js-restore-confirm me-sm-1"><i class="align-middle" data-feather="check"></i> {$btr->global_yes|escape}</button>
					<button type="button" class="btn btn-danger js-restore-dismiss" data-bs-dismiss="modal"><i class="align-middle" data-feather="x"></i> {$btr->global_no|escape}</button>
				</div>
			</div>
		</div>
	</div>
</div>

{literal}
	<script>
		$(window).on("load", function() {
			$("button.restore").click(function() {
				file = $(this).closest(".js-row").find('[name*="check"]').val();
				$('form#hidden input[name="action"]').val('restore');
				$('form#hidden input[name="name"]').val(file);
				$('form#hidden').submit();
				return false;
			});

			$("#create-backup").click(function() {
				$('form#hidden input[name="action"]').val('create');
				$('form#hidden').submit();
				return false;
			});

			$(document).on("click", ".js-restore-confirm", function() {
				confirm = false;
				$('form#hidden').submit();
			});

			$(document).on("click", ".js-restore-dismiss", function() {
				return false;
			});

			$("form#hidden").submit(function() {
				if ($('input[name="action"]').val() == 'restore' && confirm) {
					$('#js-restore-backup').modal('show');
					return false;
				}
			});
		});
	</script>
{/literal}