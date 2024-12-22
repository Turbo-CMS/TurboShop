{* Registration Page *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->registration scope=global}

	{* Canonical *}
	{$canonical="/user/register" scope=global}
{/if}

<div class="row justify-content-center">
	<div class="col-md-12 col-lg-9 col-xl-8">

		{* Page Title *}
		{if $page}
			<h1 class="my-4">
				<span data-page="{$page->id}">{$page->name|escape}</span>
			</h1>
		{else}
			<h1 class="my-4">{$lang->registration|escape}</h1>
		{/if}

		{* Page Body *}
		{if $page}
			{$page->body}
		{/if}

		{* Error *}
		{if $error}
			<div class="alert alert-danger" role="alert">
				{if $error == 'empty_name'}
					{$lang->enter_your_name|escape}
				{elseif $error == 'empty_email'}
					{$lang->enter_your_email|escape}
				{elseif $error == 'empty_password'}
					{$lang->enter_password|escape}
				{elseif $error == 'user_exists'}
					{$lang->email_already_registered|escape}
				{elseif $error == 'captcha'}
					{$lang->captcha_incorrect|escape}
				{else}
					{$error}
				{/if}
			</div>
		{/if}

		<div class="col-md-6 offset-md-3">
			<span class="anchor" id="formRegister"></span>
			<div class="card card-outline-secondary">
				<div class="card-header">
					<h3 class="mb-0">{$lang->registration|escape}</h3>
				</div>
				<div class="card-body">
					<form class="needs-validation" role="form" autocomplete="off" method="post" novalidate>
						<div class="mb-3">
							<label for="name" class="form-label">{$lang->name|escape}<span class="text-danger">*</span></label>
							<input type="text" class="form-control" name="name" id="name" value="{$name|escape}" placeholder="{$lang->enter_your_name|escape}" maxlength="255" required>
							<div class="invalid-feedback">{$lang->enter_your_name|escape}</div>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email<span class="text-danger">*</span></label>
							<input type="text" class="form-control" name="email" id="email" value="{$email|escape}" placeholder="{$lang->enter_your_email|escape}" maxlength="255" required>
							<div class="invalid-feedback">{$lang->enter_your_email|escape}</div>
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label">{$lang->phone|escape}</label>
							<input type="text" class="form-control" name="phone" id="phone" value="{$phone|escape}" placeholder="{$lang->enter_phone_number|escape}" maxlength="255">
						</div>
						<div class="mb-3">
							<label for="address" class="form-label">{$lang->address|escape}</label>
							<input type="text" class="form-control" name="address" id="address" value="{$address|escape}" placeholder="{$lang->enter_the_address|escape}" maxlength="255">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">{$lang->password|escape}<span class="text-danger">*</span></label>
							<input type="password" class="form-control" name="password" id="password" value="" placeholder="{$lang->enter_password|escape}" autocomplete="new-password" required>
							<div class="invalid-feedback">{$lang->enter_password|escape}</div>
						</div>
						{if $settings->captcha_register}
							<div class="row">
								<label for="captcha" class="form-label">{$lang->captcha|escape}<span class="text-danger">*</span></label>
								<div class="col-sm-6 pb-3">
									{get_captcha var="captcha_register"}
									<div class="secret-number">{$captcha_register[0]|escape} + ? = {$captcha_register[1]|escape}</div>
								</div>
								<div class="col-sm-6 pb-3">
									<input type="text" id="captcha" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha|escape}" autocomplete="off" required>
									<div class="invalid-feedback">{$lang->enter_captcha|escape}</div>
								</div>
							</div>
						{/if}
						<div class="mt-1">
							<a class="text-decoration-none" href="{$lang_link}user/login">{$lang->login|escape}</a>
							<button type="submit" class="btn btn-success float-end" name="register" value="{$lang->send|escape}"><i class="fa-light fa-user me-2"></i>{$lang->send|escape}</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>