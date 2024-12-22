{* User Login Page *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->login scope=global}

	{* Canonical *}
	{$canonical="/user/login" scope=global}
{/if}

{* Page Title *}
{if $page}
	<h1 class="my-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-4">{$lang->login|escape}</h1>
{/if}

{* Page Body *}
{if $page}
	{$page->body}
{/if}

{if $error}
	<div class="alert alert-danger" role="alert">
		{if $error == 'login_incorrect'}
			{$lang->wrong_login_password|escape}
		{elseif $error == 'user_disabled'}
			{$lang->not_activated|escape}
		{else}
			{$error}
		{/if}
	</div>
{/if}

<div class="col-md-6 offset-md-3">
	<span class="anchor" id="formLogin"></span>
	<div class="card card-outline-secondary">
		<div class="card-header">
			<h3 class="mb-0">{$lang->login|escape}</h3>
		</div>
		<div class="card-body">
			<form class="needs-validation" role="form" autocomplete="off" method="post" novalidate>
				<div class="mb-3">
					<label for="login-email" class="form-label">Email<span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="email" id="login-email" value="{$email|escape}" placeholder="{$lang->enter_your_email|escape}" maxlength="255" required>
					<div class="invalid-feedback">{$lang->enter_your_email|escape}</div>
				</div>
				<div class="mb-3">
					<label for="login-password" class="form-label">{$lang->password|escape}<span class="text-danger">*</span></label>
					<input type="password" class="form-control" name="password" id="login-password" value="" placeholder="{$lang->enter_password|escape}" autocomplete="off" required>
					<div class="invalid-feedback">{$lang->enter_password|escape}</div>
				</div>
				<div class="d-flex flex-wrap justify-content-between mb-3">
					<a class="text-decoration-none" href="{$lang_link}user/password_remind">{$lang->forgot_password|escape}</a>
					<a class="text-decoration-none" href="{$lang_link}user/register">{$lang->registration|escape}</a>
				</div>
				<button type="submit" class="btn btn-success btn-lg float-end" name="login" value="{$lang->login|escape}">
					<i class="fa-light fa-arrow-right-to-bracket me-2"></i>
					{$lang->login|escape}
				</button>
			</form>
		</div>
	</div>
</div>