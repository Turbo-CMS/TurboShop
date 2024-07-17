{* Feedback Page *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->contacts scope=global}

	{* Canonical *}
	{$canonical="/contact" scope=global}
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
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}contact">
					<span itemprop="name">{$lang->contacts}</span>
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
	<h1 class="my-4">{$lang->contacts}</h1>
{/if}

{* Page Body *}
{if isset($page->body)}
	{$page->body}
{/if}

{* Address *}
<p><i class="fal fa-location-dot"></i> <span class="fw-bold">{$lang->address}:</span> {$lang->contact_details}</class=>

{* Phone *}
<p><i class="fal fa-mobile"></i> <span class="fw-bold">{$lang->phone}:</span>: {$lang->phone_number}</p>

{* Map *}
{if $theme_settings->map}
	<div class="mb-3">
		<iframe style="border: 0;" tabindex="0" src="{$theme_settings->map|escape}" width="100%" height="450" frameborder="0" allowfullscreen="allowfullscreen" aria-hidden="false"></iframe>
	</div>
{/if}

<h2>{$lang->global_feedback}</h2>

{if isset($message_sent)}
	<div class="alert alert-success" role="alert">
		{$name|escape}, {$lang->feedback_message_sent}
	</div>
{else}
	{if isset($error)}
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
	<form class="form-horizontal needs-validation mt-4" role="form" method="post" novalidate>
		<div class="mb-3">
			<label for="feedback-name" class="form-label">{$lang->name}<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="name" id="feedback-name" value="{if isset($name)}{$name|escape}{/if}" placeholder="{$lang->enter_your_name}" required>
			<div class="invalid-feedback">{$lang->enter_your_name}</div>
		</div>
		<div class="mb-3">
			<label for="feedback-email" class="form-label">Email<span class="text-danger">*</span></label>
			<input type="email" class="form-control" name="email" id="feedback-email" value="{if isset($email)}{$email|escape}{/if}" placeholder="{$lang->enter_your_email}" maxlength="255" required>
			<div class="invalid-feedback">{$lang->enter_your_email}</div>
		</div>
		<div class="mb-3">
			<label for="feedback-message" class="form-label">{$lang->message}<span class="text-danger">*</span></label>
			<textarea class="form-control" name="message" id="feedback-message" placeholder="{$lang->enter_your_message}" rows="4" required>{if isset($message)}{$message|escape}{/if}</textarea>
			<div class="invalid-feedback">{$lang->enter_your_message}</div>
		</div>
		{if $settings->captcha_feedback}
			<div class="row">
				<label for="captcha" class="form-label">{$lang->captcha}<span class="text-danger">*</span></label>
				<div class="col-md-2 pb-3">
					{get_captcha var="captcha_feedback"}
					<div class="secret-number">{$captcha_feedback[0]|escape} + ? = {$captcha_feedback[1]|escape}</div>
				</div>
				<div class="col-md-10">
					<input type="text" id="captcha" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha}" autocomplete="off" required>
					<div class="invalid-feedback">{$lang->enter_captcha}</div>
				</div>
			</div>
		{/if}
		<div class="mt-3">
			<div class="col-sm-offset-2">
				<input type="submit" class="btn btn-primary" name="feedback" value="{$lang->send}">
			</div>
		</div>
	</form>
{/if}