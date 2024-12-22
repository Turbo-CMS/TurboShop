<span class="jqmClose top-close fill-theme-hover fill-use-svg-999" title="{$lang->close|escape}">
	<i class="svg inline" aria-hidden="true">
		<svg width="14" height="14">
			<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-14-14"></use>
		</svg>
	</i>
</span>
<div id="one_click_buy" class="scrollbar">
	<div class="flexbox flexbox--direction-row-reverse">
		<div class="form popup flex-grow-1">
			<div class="form-header">
				<div class="text">
					<div class="title switcher-title font_24 color_222">{$lang->fast_order|escape}</div>
				</div>
			</div>
			<form method="post" id="one_click_buy_form" novalidate="novalidate">
				<input type="hidden" class="fast-order-inputarea" name="variant_id" id="fast-order-product-id" value="">
				<input type="hidden" name="IsFastOrder" value="true">
				<div class="form-body">
					<div class="error-container"></div>
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
					<div class="row" data-sid="FIO">
						<div class="col-md-12">
							<div class="form-group fill-animate">
								<label class="font_14" for="one_click_buy_id_FIO">
									<span>
										{$lang->name|escape}
										<span class="required-star">*</span>
									</span>
								</label>
								<div class="input">
									<input type="text" class="form-control required inputtext" name="name" value="{if $user && $user->name}{$user->name|escape}{elseif $name}{$name|escape}{/if}" id="one_click_buy_id_FIO">
								</div>
							</div>
						</div>
					</div>
					<div class="row" data-sid="PHONE">
						<div class="col-md-12">
							<div class="form-group fill-animate">
								<label class="font_14" for="one_click_buy_id_PHONE">
									<span>
										{$lang->phone|escape}
										<span class="required-star">*</span>
									</span>
								</label>
								<div class="input">
									<input type="text" class="form-control required inputtext phone phone" name="phone" value="{if $user && $user->phone}{$user->phone|escape}{elseif $phone}{$phone|escape}{/if}" id="one_click_buy_id_PHONE">
								</div>
							</div>
						</div>
					</div>
					<div class="row" data-sid="EMAIL">
						<div class="col-md-12">
							<div class="form-group fill-animate">
								<label class="font_14" for="one_click_buy_id_EMAIL">
									<span>
										E-Mail
										<span class="required-star">*</span>
									</span>
								</label>
								<div class="input">
									<input type="text" class="form-control required inputtext" name="email" value="{if $user && $user->email}{$user->email|escape}{elseif $email}{$email|escape}{/if}" id="one_click_buy_id_EMAIL">
								</div>
							</div>
						</div>
					</div>
					<div class="row" data-sid="ADDRESS">
						<div class="col-md-12">
							<div class="form-group fill-animate">
								<label class="font_14" for="one_click_buy_id_ADDRESS">
									<span>
										{$lang->address|escape}
									</span>
								</label>
								<div class="input">
									<input type="text" class="form-control inputtext" name="address" value="{if $user && $user->address}{$user->address|escape}{elseif $address}{$address|escape}{/if}" id="one_click_buy_id_ADDRESS">
								</div>
							</div>
						</div>
					</div>
					<div class="row" data-sid="COMMENT">
						<div class="col-md-12">
							<div class="form-group fill-animate">
								<label class="font_14" for="one_click_buy_id_COMMENT">
									<span>
										{$lang->comments_order|escape}
									</span>
								</label>
								<div class="input">
									<textarea name="comment" id="one_click_buy_id_COMMENT" class="form-control inputtextarea"></textarea>
								</div>
							</div>
						</div>
					</div>
					{if $settings->captcha_fastorder}
						<div class="clearfix fill-animate">
							<label class="font_14">
								<span>{$lang->captcha_label|escape}&nbsp;<span class="required-star">*</span></span>
							</label>
						</div>
						<div class="row">
							<div class="form-group col-sm-6 pb-3">
								{get_captcha var="captcha_fastorder"}
								<div class="secret-number">{$captcha_fastorder[0]|escape} + ? = {$captcha_fastorder[1]|escape}</div>
							</div>
							<div class="form-group col-sm-6">
								<div class="input">
									<input type="text" class="form-control required" name="captcha_code" value="" autocomplete="off" required>
								</div>
							</div>
						</div>
					{/if}
				</div>
				<div class="form-footer clearfix">
					<div>
						<button type="submit" id="one_click_buy_form_button" class="btn btn-default btn-lg btn-wide" value="{$lang->send|escape}" name="checkout">
							<span>{$lang->send|escape}</span>
						</button>
					</div>
					<div class="licence_block">
						<label for="licenses_popup_8">
							<span>{$lang->licenses_text|escape} <a href="{$lang_link}licenses" target="_blank">{$lang->licenses_link|escape}</a></span>
						</label>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
{literal}
	<script>
		$('#one_click_buy_form').validate({
			highlight: function(element) {
				$(element).parent().addClass("error");
			},
			unhighlight: function(element) {
				$(element).parent().removeClass("error");
			},
			submitHandler: function(form) {
				if ($('.popup #one_click_buy_form').valid()) {
					$('.popup .form').addClass('sending');
					$.ajax({
						type: "POST",
						url: "ajax/fast_order.php",
						data: $(form).serialize(),
						dataType: 'json',
						success: function(response) {
							if (response.condition === 'success') {
								$('.ocb_frame').addClass('compact');
								$('.popup .form').removeClass('sending').addClass('success');
								$('.popup .form').html(response.message);
								$('.flexbox .goods-popup').remove();
							} else {
								$('.popup .form').removeClass('sending').addClass('error');
								$('.popup .error-container').html(response.message);
							}
						}
					});
				}
			},
		});

		if (turboOptions['THEME']['PHONE_MASK'].length) {
			var base_mask = turboOptions['THEME']['PHONE_MASK'].replace(/(\d)/g, '_');
			$('.ocb_frame input.phone').inputmask('mask', {'mask': turboOptions['THEME']['PHONE_MASK'], 'showMaskOnHover': false });
			$('.ocb_frame input.phone').blur(function() {
				if ($(this).val() == base_mask || $(this).val() == '') {
					if ($(this).hasClass('required')) {
						$(this).parent().find('div.error').html(Turbo.message('JS_REQUIRED'));
					}
				}
			});
		}

		$(document).on("click", ".jqmClose", function(e) {
			e.preventDefault();
			$(this).closest(".jqmWindow").jqmHide();
		});
	</script>
{/literal}