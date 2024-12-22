{* Password Recovery Email *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->password_reminder scope=global}

	{* Canonical *}
	{$canonical="/user/password_remind" scope=global}
{/if}

{if $email_sent}
	<h1 class="my-4">{$lang->email_sent|escape}</h1>
	<div class="alert alert-success" role="alert">
		{$email|escape} - {$lang->password_recovery_email|escape}
	</div>
{else}
	{* Page Title *}
	{if $page}
		<h1 class="my-4">
			<span data-page="{$page->id}">{$page->name|escape}</span>
		</h1>
	{else}
		<h1 class="my-4">{$lang->password_reminder|escape}</h1>
	{/if}
	{if $error}
		<div class="alert alert-danger" role="alert">
			{if $error == 'user_not_found'}
				{$lang->user_not_found|escape}
			{else}
				{$error}
			{/if}
		</div>
	{/if}
	<div class="col-md-6 offset-md-3">
		<span class="anchor" id="formResetPassword"></span>
		<div class="card card-outline-secondary">
			<div class="card-header">
				<h3 class="mb-0">{$lang->password_reminder|escape}</h3>
			</div>
			<div class="card-body">
				<form class="needs-validation" method="post" role="form" autocomplete="off" novalidate>
					<div class="mb-3">
						<label for="inputResetPasswordEmail" class="form-label">Email</label>
						<input type="text" class="form-control" name="email" id="inputResetPasswordEmail" value="{$email|escape}" placeholder="{$lang->enter_your_email|escape}" maxlength="255" required>
						<div class="invalid-feedback">{$lang->enter_your_email|escape}</div>
						<span class="form-text small text-muted">{$lang->enter_email_registration|escape}</span>
					</div>
					<div class="mt-3">
						<button type="submit" class="btn btn-success btn-lg float-end" name="login" value="{$lang->send|escape}">
							<i class="fa-light fa-envelope me-1"></i>
							{$lang->send|escape}
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
{/if}