{* User Login Page *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->login scope=global}

	{* Canonical *}
	{$canonical="/user/login" scope=global}
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
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}user/login">
					<span itemprop="name">{$lang->login}</span>
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
	<h1 class="my-4">{$lang->login}</h1>
{/if}

{* Page Body *}
{if isset($page->body)}
	{$page->body}
{/if}

{if isset($error)}
	<div class="alert alert-danger" role="alert">
		{if $error == 'login_incorrect'}
			{$lang->wrong_login_password}
		{elseif $error == 'user_disabled'}
			{$lang->not_activated}
		{else}
			{$error}
		{/if}
	</div>
{/if}

<div class="col-md-6 offset-md-3">
	<span class="anchor" id="formLogin"></span>
	<div class="card card-outline-secondary">
		<div class="card-header">
			<h3 class="mb-0">{$lang->login}</h3>
		</div>
		<div class="card-body">
			<form class="needs-validation" role="form" autocomplete="off" method="post" novalidate>
				<div class="mb-3">
					<label for="login-email" class="form-label">Email<span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="email" id="login-email" value="{if isset($email)}{$email|escape}{/if}" placeholder="{$lang->enter_your_email}" maxlength="255" required>
					<div class="invalid-feedback">{$lang->enter_your_email}</div>
				</div>
				<div class="mb-3">
					<label for="login-password" class="form-label">{$lang->password}<span class="text-danger">*</span></label>
					<input type="password" class="form-control" name="password" id="login-password" value="" placeholder="{$lang->enter_password}" autocomplete="off" required>
					<div class="invalid-feedback">{$lang->enter_password}</div>
				</div>
				<div class="d-flex flex-wrap justify-content-between mb-3">
					<a class="text-decoration-none" href="{$lang_link}user/password_remind">{$lang->forgot_password}</a>
					<a class="text-decoration-none" href="{$lang_link}user/register">{$lang->registration}</a>
				</div>
				<button type="submit" class="btn btn-success btn-lg float-end" name="login" value="{$lang->login}">
					<i class="fa-light fa-arrow-right-to-bracket me-2"></i>
					{$lang->login}
				</button>
			</form>
		</div>
	</div>
</div>