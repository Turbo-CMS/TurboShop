{* Feedback form page *}

{* Canonical page address *}
{$canonical="/{$page->url}" scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}"><span itemprop="name">{$page->header|escape}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
	</ol>
</nav>
<!-- Breadcrumb #End /-->

<!-- Page title -->
<h1 data-page="{$page->id}" class="mt-4">{$page->name|escape}</h1>

{$page->body}

<h2>{$lang->index_feedback}</h2>
{if $message_sent}
	<div class="alert alert-success" role="alert">
		{$name|escape}, {$lang->feedback_message_sent}
	</div>
{else}
	{if $error}
		<div class="alert alert-danger" role="alert">
			{if $error=='captcha'}
				{$lang->captcha_incorrect}
			{elseif $error=='empty_name'}
				{$lang->enter_your_name}
			{elseif $error=='empty_email'}
				{$lang->enter_your_email}
			{elseif $error=='empty_text'}
				{$lang->enter_your_message}
			{/if}
		</div>
	{/if}
	<form class="form-horizontal mt-4" id="FormValidation" role="form" method="post">
		<div class="mb-3">
			<label for="feedback_name">{$lang->name}</label>
			<input type="text" class="form-control" name="name" id="feedback_name" value="{$name|escape}" placeholder="{$lang->enter_your_name}" required>
			<div class="invalid-feedback">{$lang->enter_your_name}</div>
		</div>
		<div class="mb-3">
			<label for="feedback_email">Email</label>
			<input type="email" class="form-control" name="email" id="feedback_email" value="{$email|escape}" placeholder="{$lang->enter_your_email}" maxlength="255" required>
			<div class="invalid-feedback">{$lang->enter_your_email}</div>
		</div>
		<div class="mb-3">
			<label for="feedback_message">{$lang->message}</label>
			<textarea class="form-control" name="message" id="feedback_message" placeholder="{$lang->enter_your_message}" rows="4" required>{$message|escape}</textarea>
			<div class="invalid-feedback">{$lang->enter_your_message}</div>
		</div>
		{if $settings->captcha_feedback}
			<div class="row mt-4">
				<div class="col-md-2 pb-3">
					{get_captcha var="captcha_feedback"}
					<div class="secret-number">{$captcha_feedback[0]|escape} + ? = {$captcha_feedback[1]|escape}</div>
				</div>
				<div class="col-md-10">
					<input type="text" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha}" autocomplete="off" required>
					<div class="invalid-feedback">{$lang->enter_captcha}</div>
				</div>
			</div>
		{/if}
		<div class="mt-3">
			<div class="col-sm-offset-2">
				<input type="submit" class="btn btn-primary" name="feedback" id="btnValidation" value="{$lang->send}">
			</div>
		</div>
	</form>
{/if}