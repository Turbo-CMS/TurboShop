{* Password Recovery Email *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->password_reminder scope=global}

	{* Canonical *}
	{$canonical="/user/password_remind" scope=global}
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
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}user/password_remind">
					<span itemprop="name">{$lang->password_reminder}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
	</ol>
</nav>

{if isset($email_sent)}
	<h1 class="my-4">{$lang->email_sent}</h1>
	<div class="alert alert-success" role="alert">
		{$email|escape} - {$lang->password_recovery_email}
	</div>
{else}
	{* Page Title *}
	{if isset($page->name)}
		<h1 class="my-4">
			<span data-page="{$page->id}">{$page->name|escape}</span>
		</h1>
	{else}
		<h1 class="my-4">{$lang->password_reminder}</h1>
	{/if}
	{if isset($error)}
		<div class="alert alert-danger" role="alert">
			{if $error == 'user_not_found'}
				{$lang->user_not_found}
			{else}
				{$error}
			{/if}
		</div>
	{/if}
	<div class="col-md-6 offset-md-3">
		<span class="anchor" id="formResetPassword"></span>
		<div class="card card-outline-secondary">
			<div class="card-header">
				<h3 class="mb-0">{$lang->password_reminder}</h3>
			</div>
			<div class="card-body">
				<form class="needs-validation" method="post" role="form" autocomplete="off" novalidate>
					<div class="mb-3">
						<label for="inputResetPasswordEmail" class="form-label">Email</label>
						<input type="text" class="form-control" name="email" id="inputResetPasswordEmail" value="{if isset($email)}{$email|escape}{/if}" placeholder="{$lang->enter_your_email}" maxlength="255" required>
						<div class="invalid-feedback">{$lang->enter_your_email}</div>
						<span class="form-text small text-muted">{$lang->enter_email_registration}</span>
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