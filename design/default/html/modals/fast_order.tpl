{* Fast Order Modal *}
<div class="modal fade" id="fastOrder" tabindex="-1" role="dialog" aria-labelledby="modalFastOrder" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<h5 class="modal-title" id="modalFastOrder">{$lang->fast_order}</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form class="needs-validation" method="post" novalidate>
				<input type="hidden" class="fast-order-inputarea" name="variant_id" id="fast-order-product-id" value="">
				<input type="hidden" name="IsFastOrder" value="true">
				<div class="modal-body">
					{if isset($fastorder_error)}
						<div class="alert alert-danger" role="alert">
							{if $fastorder_error == 'empty_name'}
								{$lang->enter_your_name}
							{elseif $fastorder_error == 'empty_phone'}
								{$lang->enter_phone_number}
							{elseif $fastorder_error == 'captcha'}
								{$lang->captcha_incorrect}
							{else}
								{$fastorder_error}
							{/if}
						</div>
					{/if}
					<div id="fast-order-product-name" class="form-label modal-caption mb-3"></div>
					<div class="form-group has-feedback">
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fv-icon-no-has fal fa-user"></i></div>
							<input type="text" class="form-control" name="name" value="{if isset($user->name)}{$user->name|escape}{elseif isset($name)}{$name|escape}{/if}" placeholder="{$lang->name}" required>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fv-icon-no-has fal fa-phone"></i></div>
							<input type="text" class="form-control" name="phone" id="fastorder-mask" value="{if isset($user->phone)}{$user->phone|escape}{elseif isset($phone)}{$phone|escape}{/if}" placeholder="{$lang->phone}" maxlength="255" required>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fv-icon-no-has fal fa-at"></i></div>
							<input type="text" class="form-control" name="email" value="{if isset($user->email)}{$user->email|escape}{elseif isset($email)}{$email|escape}{/if}" placeholder="Email" maxlength="255" required>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="input-group-text"><i class="fv-icon-no-has fal fa-map-marker-alt"></i></div>
							<input type="text" class="form-control" name="address" value="{if isset($user->address)}{$user->address|escape}{elseif isset($address)}{$address|escape}{/if}" placeholder="{$lang->address}" maxlength="255">
						</div>
					</div>
					{if $settings->captcha_fastorder}
						<div class="row">
							<div class="form-group col-sm-6 pb-3">
								{get_captcha var="captcha_fastorder"}
								<div class="secret-number">{$captcha_fastorder[0]|escape} + ? = {$captcha_fastorder[1]|escape}</div>
							</div>
							<div class="form-group col-sm-6">
								<input type="text" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha}" autocomplete="off" required>
							</div>
						</div>
					{/if}
					<div class="еуче-сутеук">
						<input type="submit" class="btn btn-success d-block w-100" name="checkout" value="{$lang->send}">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>