{* Feedback Page *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->contacts scope=global}

	{* Canonical *}
	{$canonical="/contact" scope=global}
{/if}

<div class="row justify-content-center">
	<div class="col-md-12 col-lg-9 col-xl-8">

		{* Page Title *}
		{if $page}
			<h1 class="my-4">
				<span data-page="{$page->id}">{$page->name|escape}</span>
			</h1>
		{else}
			<h1 class="my-4">{$lang->contacts|escape}</h1>
		{/if}

		{* Page Body *}
		{if $page}
			{$page->body}
		{/if}

		{* Address *}
		<p><i class="fal fa-location-dot"></i> <span class="fw-bold">{$lang->address|escape}:</span> {$lang->contact_details|escape}</class=>

			{* Phone *}
		<p><i class="fal fa-mobile"></i> <span class="fw-bold">{$lang->phone|escape}:</span>: {$lang->phone_number|escape}</p>

		{* Map *}
		{if $theme_settings->map}
			<div class="mb-3">
				<iframe style="border: 0;" tabindex="0" src="{$theme_settings->map|escape}" width="100%" height="450" frameborder="0" allowfullscreen="allowfullscreen" aria-hidden="false"></iframe>
			</div>
		{/if}

		<h2>{$lang->global_feedback|escape}</h2>

		{if $message_sent}
			<div class="alert alert-success" role="alert">
				{$name|escape}, {$lang->feedback_message_sent|escape}
			</div>
		{else}
			{if $error}
				<div class="alert alert-danger" role="alert">
					{if $error=='captcha'}
						{$lang->captcha_incorrect|escape}
					{elseif $error=='empty_name'}
						{$lang->enter_your_name|escape}
					{elseif $error=='empty_email'}
						{$lang->enter_your_email|escape}
					{elseif $error=='empty_text'}
						{$lang->enter_your_message|escape}
					{/if}
				</div>
			{/if}
			<form class="form-horizontal needs-validation mt-4" role="form" method="post" novalidate>
				<div class="mb-3">
					<label for="feedback-name" class="form-label">{$lang->name|escape}<span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="name" id="feedback-name" value="{$name|escape}" placeholder="{$lang->enter_your_name|escape}" required>
					<div class="invalid-feedback">{$lang->enter_your_name|escape}</div>
				</div>
				<div class="mb-3">
					<label for="feedback-email" class="form-label">Email<span class="text-danger">*</span></label>
					<input type="email" class="form-control" name="email" id="feedback-email" value="{$email|escape}" placeholder="{$lang->enter_your_email|escape}" maxlength="255" required>
					<div class="invalid-feedback">{$lang->enter_your_email|escape}</div>
				</div>
				<div class="mb-3">
					<label for="feedback-message" class="form-label">{$lang->message|escape}<span class="text-danger">*</span></label>
					<textarea class="form-control" name="message" id="feedback-message" placeholder="{$lang->enter_your_message|escape}" rows="4" required>{$message|escape}</textarea>
					<div class="invalid-feedback">{$lang->enter_your_message|escape}</div>
				</div>
				{if $settings->captcha_feedback}
					<div class="row">
						<label for="captcha" class="form-label">{$lang->captcha|escape}<span class="text-danger">*</span></label>
						<div class="col-md-2 pb-3">
							{get_captcha var="captcha_feedback"}
							<div class="secret-number">{$captcha_feedback[0]|escape} + ? = {$captcha_feedback[1]|escape}</div>
						</div>
						<div class="col-md-10">
							<input type="text" id="captcha" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha|escape}" autocomplete="off" required>
							<div class="invalid-feedback">{$lang->enter_captcha|escape}</div>
						</div>
					</div>
				{/if}
				<div class="mt-3">
					<div class="col-sm-offset-2">
						<input type="submit" class="btn btn-primary" name="feedback" value="{$lang->send|escape}">
					</div>
				</div>
			</form>
		{/if}
	</div>
</div>