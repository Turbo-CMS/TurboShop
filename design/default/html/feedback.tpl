{* Feedback form page *}

{* Canonical page address *}
{$canonical="/{$page->url}" scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="{$level++}" />
		</li>
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}"><span itemprop="name">{$page->header|escape}</span></a>
			<meta itemprop="position" content="{$level++}" />
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
	<form class="form-horizontal mt-4" role="form" id="FormValidation" method="post">
		<div class="mb-3">
			<label for="feedback_name">{$lang->name}</label>
			<input class="form-control" type="text" id="feedback_name" name="name" placeholder="{$lang->enter_your_name}" required="" value="{$name|escape}" data-format=".+" data-notice="{$lang->enter_your_name}" />
			<div class="invalid-feedback">{$lang->enter_your_name}</div>
		</div>
		<div class="mb-3">
			<label for="feedback_email">Email</label>
			<input type="email" class="form-control" id="feedback_email" placeholder="{$lang->enter_your_email}" value="{$email|escape}" name="email" maxlength="255" required="" data-format="email" data-notice="{$lang->enter_your_email}">
			<div class="invalid-feedback">{$lang->enter_your_email}</div>
		</div>
		<div class="mb-3">
			<label for="feedback_message">{$lang->message}</label>
			<textarea class="form-control" rows="4" id="feedback_message" name="message" placeholder="{$lang->enter_your_message}" required="" data-format=".+" data-notice="{$lang->enter_your_message}">{$message|escape}</textarea>
			<div class="invalid-feedback">{$lang->enter_your_message}</div>
		</div>
		{if $settings->captcha_feedback}
			<div class="row mt-4">
				<div class="col-md-2">
					{get_captcha var="captcha_feedback"}
					<div class="secret-number">{$captcha_feedback[0]|escape} + ? = {$captcha_feedback[1]|escape}</div>
				</div>
				<div class="col-md-10">
					<input class="form-control" type="text" name="captcha_code" placeholder="{$lang->enter_captcha}" required="" autocomplete="off" value="" data-format=".+" data-notice="{$lang->enter_captcha}" />
					<div class="invalid-feedback">{$lang->enter_captcha}</div>
				</div>
			</div>
		{/if}
		<div class="mt-3">
			<div class="col-sm-offset-2">
				<input class="btn btn-primary" type="submit" id="btnValidation" name="feedback" value="{$lang->send}" />
			</div>
		</div>
	</form>
{/if}