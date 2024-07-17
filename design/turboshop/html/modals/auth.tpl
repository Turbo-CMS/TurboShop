<span class="jqmClose top-close fill-theme-hover fill-use-svg-999" title="{$lang->close}">
	<i class="svg inline" aria-hidden="true">
		<svg width="14" height="14">
			<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-14-14"></use>
		</svg>
	</i>
</span>
<div class="scrollbar">
	<div class="auth-page pk-page">
		<div class="auth form-block">
			<div class="form popup ">
				<div class="form-header">
					<div class="text">
						<div class="title switcher-title font_24 color_222">{$lang->login_account}</div>
					</div>
				</div>
				<form id="auth-page-form" method="post" target="_top" action="{$lang_link}user/login" novalidate="novalidate">
					<div class="form-body">
						<div class="form-group fill-animate" data-sid="USER_LOGIN_POPUP">
							<label class="font_14" for="USER_LOGIN_POPUP"><span>Email <span class="required-star">*</span></span></label>
							<div class="input">
								<input type="text" name="email" id="USER_LOGIN_POPUP" class="form-control required input-filed" maxlength="50" value="{if isset($email)}{$email|escape}{/if}" autocomplete="on" tabindex="1" aria-required="true" aria-invalid="false">
							</div>
						</div>
						<div class="form-group fill-animate" data-sid="USER_PASSWORD_POPUP">
							<label class="font_14" for="USER_PASSWORD_POPUP"><span>{$lang->password} <span class="required-star">*</span></span></label>
							<div class="input eye-password">
								<input type="password" name="password" id="USER_PASSWORD_POPUP" class="form-control required" maxlength="50" value="" autocomplete="on" tabindex="2" aria-required="true">
							</div>
						</div>
					</div>
					<div class="form-footer auth__bottom ">
						<div class="auth__bottom-action">
							<div class="line-block line-block--20 flexbox--wrap flexbox--justify-beetwen">
								<div class="line-block__item font_14">
									<a class="forgot" href="{$lang_link}user/password_remind" tabindex="3">{$lang->forgot_password}</a>
								</div>
							</div>
						</div>
						<div class="auth__bottom-btns">
							<div class="line-block line-block--align-normal line-block--16-vertical flexbox--direction-column flexbox--justify-beetwen">
								<div class="line-block__item">
									<button type="submit" class="btn btn-default btn-lg btn-wide auth__bottom-btn has-ripple" name="login" value="{$lang->login}" tabindex="4">
										<span>{$lang->login}</span>
									</button>
								</div>
								<div class="line-block__item">
									<a href="{$lang_link}user/register" rel="nofollow" class="btn btn-default btn-transparent btn-lg btn-wide auth__bottom-btn has-ripple" tabindex="6">
										{$lang->registration}
									</a>
								</div>
							</div>
							<div class="clearboth"></div>
						</div>
						<div class="licence_block">
							<span>{$lang->licenses_text} <a href="{$lang_link}licenses" target="_blank">{$lang->licenses_link}</a></span>
						</div>
					</div>
				</form>
			</div>
			{literal}
				<script>
					$(document).ready(function() {
						$('#auth-page-form').validate({
							submitHandler: function(form) {
								var $form = $(form);
								if ($form.valid()) {
									var $button = $form.find('button[type=submit]:visible');
									if ($button.length) {
										if (!$button.hasClass('loadings')) {
											$button.addClass('loadings');
											$form.closest('.form').addClass('sending');
											form.submit();
										}
									}
								}
							},
						});
					});
				</script>
			{/literal}
		</div>
	</div>
</div>