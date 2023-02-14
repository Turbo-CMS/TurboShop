{$meta_title=$btr->global_comment scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{$btr->edit_comment|escape}
	</h1>
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'updated'}
						{$btr->comment_updated|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{$message_error|escape}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data" class="js-fast-button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_name|escape}</div>
								<input class="form-control" name="name" type="text" value="{$comment->name|escape}">
								<input name="id" type="hidden" value="{$comment->id|escape}">
								<input name="type" type="hidden" value="{$comment->type}">
								<input name="object_id" type="hidden" value="{$comment->object_id|escape}">
								<input name="parent_id" type="hidden" value="{$comment->parent_id|escape}">
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="approved" name="approved" value="1" type="checkbox" {if $comment->approved}checked="" {/if}>
									<label class="form-check-label ms-2" for="approved">{$btr->email_comments_approved|escape}</label>
								</div>
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="admin" name="admin" value="1" type="checkbox" {if $comment->admin}checked="" {/if}>
									<label class="form-check-label ms-2" for="admin">{$btr->comment_from_admin|escape}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_parameters|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-4">
								<div class="mb-3">
									<div class="form-label">{$btr->global_time|escape}</div>
									<input name="time" class="form-control flatpickr-time text-start" type="text" value="{$comment->date|time}">
								</div>
							</div>
							<div class="col-md-4">
								<div class="mb-3">
									<div class="form-label">{$btr->global_date|escape}</div>
									<input name="date" class="form-control flatpickr" type="text" value="{$comment->date|date}">
								</div>
							</div>
							<div class="col-md-4">
								<div class="mb-3">
									<div class="form-label">IP</div>
									<input name="ip" class="form-control" type="text" value="{$comment->ip}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card mh-210px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_comment|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<textarea name="text" class="form-control mb-3" rows="7">{$comment->text|escape}</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12">
			<div class="d-grid d-sm-block">
				<button type="submit" class="btn btn-primary float-end mt-2">
					<i class="align-middle" data-feather="check"></i>
					{$btr->global_apply|escape}
				</button>
			</div>
		</div>
	</div>
</form>

{literal}
	<script>
		$(window).on("load", function() {
			flatpickr(".flatpickr", {
				dateFormat: "d.m.Y",
				locale: "{/literal}{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}{literal}"
			});
			
			flatpickr(".flatpickr-time", {
				enableTime: true,
				noCalendar: true,
				dateFormat: "H:i",
				locale: "{/literal}{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}{literal}"
			});
		});
	</script>
{/literal}