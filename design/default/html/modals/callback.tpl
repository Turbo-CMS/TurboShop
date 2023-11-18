{* Callback Modal *}
<div class="modal fade fade bd-example-modal-sm" id="callbackModal" tabindex="-1" role="dialog" aria-labelledby="callbackModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title" id="callbackModalLabel">{$lang->request_a_call}</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form class="needs-validation" method="post" novalidate>
				<div class="modal-body">
					{if isset($call_error)}
						<div class="alert alert-danger" role="alert">
							{if $call_error == 'empty_name'}
								{$lang->enter_your_name}
							{elseif $call_error == 'empty_phone'}
								{$lang->enter_phone_number}
							{elseif $call_error == 'captcha'}
								{$lang->captcha_incorrect}
							{else}
								{$call_error}
							{/if}
						</div>
					{/if}
					<div class="input-group mb-3">
						<div class="input-group-text"><i class="fal fa-user"></i></div>
						<input type="text" class="form-control" name="name" value="{if isset($callname)}{$callname|escape}{elseif isset($user->name)}{$user->name|escape}{/if}" placeholder="{$lang->name}" required>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-text"><i class="fal fa-phone"></i></div>
						<input type="text" class="form-control" name="phone" id="call-mask" value="{if isset($callphone)}{$callphone|escape}{elseif isset($user->phone)}{$user->phone|escape}{/if}" placeholder="{$lang->phone}" maxlength="255" required>
					</div>
					{if $settings->captcha_callback}
						<div class="row">
							<div class="form-group col-sm-6 pb-3">
								{get_captcha var="captcha_callback"}
								<div class="secret-number">{$captcha_callback[0]|escape} + ? = {$captcha_callback[1]|escape}</div>
							</div>
							<div class="form-group col-sm-6">
								<input type="text" class="form-control" name="captcha_code" value="" placeholder="{$lang->captcha}" autocomplete="off" required>
							</div>
						</div>
					{/if}
					<div class="text-center">
						<input type="submit" class="btn btn-primary d-block w-100" name="callback" value="{$lang->send}">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>