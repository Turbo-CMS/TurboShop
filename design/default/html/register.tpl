{* Registration Page *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->registration scope=global}

	{* Canonical *}
	{$canonical="/user/register" scope=global}
{/if}

{* Breadcrumb *}
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}">
				<span itemprop="name" title="{$lang->home}"><i class="fal fa-house me-2"></i>{$lang->home}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
		{if isset($page)}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}">
					<span itemprop="name">{$page->header|escape}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{else}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}user/register">
					<span itemprop="name">{$lang->registration}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
	</ol>
</nav>

{* Page Title *}
{if isset($page->name)}
	<h1 class="my-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-4">{$lang->registration}</h1>
{/if}

{* Page Body *}
{if isset($page->body)}
	{$page->body}
{/if}

{* Error *}
{if isset($error)}
	<div class="alert alert-danger" role="alert">
		{if $error == 'empty_name'}
			{$lang->enter_your_name}
		{elseif $error == 'empty_email'}
			{$lang->enter_your_email}
		{elseif $error == 'empty_password'}
			{$lang->enter_password}
		{elseif $error == 'user_exists'}
			{$lang->email_already_registered}
		{elseif $error == 'captcha'}
			{$lang->captcha_incorrect}
		{else}
			{$error}
		{/if}
	</div>
{/if}

<div class="col-md-6 offset-md-3">
	<span class="anchor" id="formRegister"></span>
	<div class="card card-outline-secondary">
		<div class="card-header">
			<h3 class="mb-0">{$lang->registration}</h3>
		</div>
		<div class="card-body">
			<form class="needs-validation" role="form" autocomplete="off" method="post" novalidate>
				<div class="mb-3">
					<label for="name" class="form-label">{$lang->name}<span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="name" id="name" value="{if isset($name)}{$name|escape}{/if}" placeholder="{$lang->enter_your_name}" maxlength="255" required>
					<div class="invalid-feedback">{$lang->enter_your_name}</div>
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email<span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="email" id="email" value="{if isset($email)}{$email|escape}{/if}" placeholder="{$lang->enter_your_email}" maxlength="255" required>
					<div class="invalid-feedback">{$lang->enter_your_email}</div>
				</div>
				<div class="mb-3">
					<label for="phone" class="form-label">{$lang->phone}</label>
					<input type="text" class="form-control" name="phone" id="phone" value="{if isset($phone)}{$phone|escape}{/if}" placeholder="{$lang->enter_phone_number}" maxlength="255">
				</div>
				<div class="mb-3">
					<label for="address" class="form-label">{$lang->address}</label>
					<input type="text" class="form-control" name="address" id="address" value="{if isset($address)}{$address|escape}{/if}" placeholder="{$lang->enter_the_address}" maxlength="255">
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">{$lang->password}<span class="text-danger">*</span></label>
					<input type="password" class="form-control" name="password" id="password" value="" placeholder="{$lang->enter_password}" autocomplete="new-password" required>
					<div class="invalid-feedback">{$lang->enter_password}</div>
				</div>
				{if $settings->captcha_register}
					<div class="row">
						<label for="captcha" class="form-label">{$lang->captcha}<span class="text-danger">*</span></label>
						<div class="col-sm-6 pb-3">
							{get_captcha var="captcha_register"}
							<div class="secret-number">{$captcha_register[0]|escape} + ? = {$captcha_register[1]|escape}</div>
						</div>
						<div class="col-sm-6 pb-3">
							<input type="text" id="captcha" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha}" autocomplete="off" required>
							<div class="invalid-feedback">{$lang->enter_captcha}</div>
						</div>
					</div>
				{/if}
				<div class="mt-1">
					<a class="text-decoration-none" href="{$lang_link}user/login">{$lang->login}</a>
					<button type="submit" class="btn btn-success btn-lg float-end" name="register" value="{$lang->send}"><i class="fa-light fa-user me-2"></i>{$lang->send}</button>
				</div>
			</form>
		</div>
	</div>
</div>