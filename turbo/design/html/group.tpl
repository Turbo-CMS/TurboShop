{if $group->id}
	{$meta_title = $group->name scope=global}
{else}
	{$meta_title = $btr->user_group_new scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if !$group->id}
			{$btr->user_group_add|escape}
		{else}
			{$group->name|escape}
		{/if}
	</h1>
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success=='added'}
						{$btr->global_group_added|escape}
					{elseif $message_success=='updated'}
						{$btr->user_group_updated|escape}
					{else}
						{$message_success|escape}
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
					{if $message_error=='empty_name'}
						{$btr->global_enter_name|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<div class="mb-3">
								<div class="form-label">{$btr->user_group_name|escape}</div>
								<input class="form-control" name="name" type="text" value="{$group->name|escape}">
								<input name="id" type="hidden" value="{$group->id|escape}">
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_discount|escape}</div>
								<input name="discount" class="form-control" type="text" value="{$group->discount|escape}">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="d-grid d-sm-block mt-1">
				<button type="submit" class="btn btn-primary float-end">
					<i class="align-middle" data-feather="check"></i>
					<span>{$btr->global_apply|escape}</span>
				</button>
			</div>
		</div>
	</div>
</form>