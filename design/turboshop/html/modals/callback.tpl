{* Callback Modal *}
<span class="jqmClose top-close fill-theme-hover fill-use-svg-999" title="{$lang->close|escape}">
	<i class="svg inline" aria-hidden="true">
		<svg width="14" height="14">
			<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-14-14"></use>
		</svg>
	</i>
</span>
<div class="flexbox">
	<div class="form popup callback-form">
		<div class="form-header">
			<div class="text">
				<div class="title switcher-title font_24 color_222">{$lang->callback|escape}</div>
				<div class="form_desc font_16">{$lang->callback_text|escape}</div>
			</div>
		</div>
		<form name="callback_form" method="POST" enctype="multipart/form-data">
			<div class="form-body">
				<div class="error-container"></div>
				<div class="row" data-sid="NAME">
					<div class="col-md-12">
						<div class="form-group fill-animate">
							<label class="font_14" for="POPUP_NAME">
								<span>{$lang->name|escape}&nbsp;<span class="required-star">*</span></span>
							</label>
							<div class="input">
								<input type="text" id="POPUP_NAME" class="form-control required" name="name" value="{if $callname}{$callname|escape}{elseif $user && $user->name}{$user->name|escape}{/if}" aria-required="true">
							</div>
						</div>
					</div>
				</div>
				<div class="row" data-sid="PHONE">
					<div class="col-md-12">
						<div class="form-group fill-animate">
							<label class="font_14" for="POPUP_PHONE">
								<span>{$lang->phone|escape}&nbsp;<span class="required-star">*</span></span>
							</label>
							<div class="input">
								<input type="text" id="POPUP_PHONE" class="form-control required phone" name="phone" value="{if $callphone}{$callphone|escape}{elseif $user && $user->phone}{$user->phone|escape}{/if}" aria-required="true">
							</div>
						</div>
					</div>
				</div>
				{if $settings->captcha_callback}
					<div class="clearfix fill-animate">
						<label class="font_14">
							<span>{$lang->captcha_label|escape}&nbsp;<span class="required-star">*</span></span>
						</label>
					</div>
					<div class="row">
						<div class="form-group col-sm-6 pb-3">
							{get_captcha var="captcha_callback"}
							<div class="secret-number">{$captcha_callback[0]|escape} + ? = {$captcha_callback[1]|escape}</div>
						</div>
						<div class="form-group col-sm-6">
							<div class="input">
								<input type="text" class="form-control required" name="captcha_code" value="" autocomplete="off" required>
							</div>
						</div>
					</div>
				{/if}
			</div>
			<div class="form-footer">
				<div>
					<input type="submit" class="btn btn-default btn-lg btn-wide" value="{$lang->send|escape}" name="callback">
				</div>
				<div class="licence_block">
					<span>{$lang->licenses_text|escape} <a href="{$lang_link}licenses" target="_blank">{$lang->licenses_link|escape}</a></span>
				</div>
			</div>
		</form>
		<script>
			$(document).ready(function() {
				$('.popup form[name="callback_form"]').validate({
					submitHandler: function(form) {
						if ($('.popup form[name="callback_form"]').valid()) {
							$('.callback-form').addClass('sending');
							$.ajax({
								type: "POST",
								url: "ajax/callback.php",
								data: $(form).serialize(),
								dataType: 'json',
								success: function(response) {
									if (response.condition === 'success') {
										$('.callback-form').removeClass('sending').addClass('success');
										$('.callback-form').html(response.message);
									} else {
										$('.callback-form').removeClass('sending').addClass('error');
										$('.popup .error-container').html(response.message);
									}
								}
							});
						}
					},
				});

				if (turboOptions["THEME"]["PHONE_MASK"].length) {
					var base_mask = turboOptions["THEME"]["PHONE_MASK"].replace(/(\d)/g, "_");
					$('.popup form[name="callback_form"] input.phone').inputmask("mask", { mask: turboOptions["THEME"]["PHONE_MASK"], showMaskOnHover: false });
					$('.popup form[name="callback_form"] input.phone').blur(function() {
						if ($(this).val() == base_mask || $(this).val() == "") {
							if ($(this).hasClass("required")) {
								$(this).parent().find("div.error").html(Turbo.message("JS_REQUIRED"));
							}
						}
					});
				}

				$(document).on("click", ".jqmClose", function(e) {
					e.preventDefault();
					$(this).closest(".jqmWindow").jqmHide();
				});
			});
		</script>
	</div>
</div>