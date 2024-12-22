{* Callback Modal *}
<div class="modal fade fade" id="callbackModal" tabindex="-1" role="dialog" aria-labelledby="callbackModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="callbackModalLabel">{$lang->request_a_call|escape}</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form class="needs-validation" method="post" novalidate>
				<div class="modal-body">
					{if $call_error}
						<div class="alert alert-danger" role="alert">
							{if $call_error == 'empty_name'}
								{$lang->enter_your_name|escape}
							{elseif $call_error == 'empty_phone'}
								{$lang->enter_phone_number|escape}
							{elseif $call_error == 'captcha'}
								{$lang->captcha_incorrect|escape}
							{else}
								{$call_error}
							{/if}
						</div>
					{/if}
					<div class="input-group mb-3">
						<div class="input-group-text"><i class="fal fa-user"></i></div>
						<input type="text" class="form-control" name="name" value="{if $callname}{$callname|escape}{elseif $user}{$user->name|escape}{/if}" placeholder="{$lang->name|escape}" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-text"><i class="fal fa-phone"></i></div>
						<input type="text" class="form-control" name="phone" id="call-mask" value="{if $callphone}{$callphone|escape}{elseif $user}{$user->phone|escape}{/if}" placeholder="{$lang->phone|escape}" maxlength="255" required>
					</div>
					{if $settings->captcha_callback}
						<div class="row">
							<div class="form-group col-sm-6 pb-3">
								{get_captcha var="captcha_callback"}
								<div class="secret-number">{$captcha_callback[0]|escape} + ? = {$captcha_callback[1]|escape}</div>
							</div>
							<div class="form-group col-sm-6">
								<input type="text" class="form-control" name="captcha_code" value="" placeholder="{$lang->captcha|escape}" autocomplete="off" required>
							</div>
						</div>
					{/if}
					<div class="text-center">
						<input type="submit" class="btn btn-primary d-block w-100" name="callback" value="{$lang->send|escape}">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>