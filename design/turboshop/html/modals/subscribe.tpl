<span class="jqmClose top-close fill-theme-hover fill-use-svg-999" title="{$lang->close}">
	<i class="svg inline" aria-hidden="true">
		<svg width="14" height="14">
			<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-14-14"></use>
		</svg>
	</i>
</span>
<div class="flexbox scrollbar">
	<div id="popup_subscribe_container" class="form popup">
		<form name="form_popup_subscribe" method="post" novalidate="novalidate">
			<div class="form-header">
				<div class="text">
					<div class="title font_24 color_222">{$lang->subscribe_newsletter}</div>
				</div>
			</div>
			<div class="form-body">
				<div class="error-container"></div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label class="font_14"><span>Email&nbsp;<span class="star">*</span></span></label>
							<div class="input">
								<input type="email" class="form-control inputtext input-filed" required="" name="email" value="{if isset($email)}{$email|escape}{/if}" aria-required="true">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="form-footer clearfix">
				<div>
					<button type="submit" name="subscribe" value="{$lang->subscribe}" class="btn btn-default btn-lg has-ripple">{$lang->subscribe}</button>
				</div>
				<div class="licence_block">
					<span>{$lang->licenses_text} <a href="{$lang_link}licenses" target="_blank">{$lang->licenses_link}</a></span>
				</div>
			</div>
		</form>
		{literal}
			<script>
				$(document).ready(function() {
					$('#popup_subscribe_container form[name="form_popup_subscribe"]').validate({
						submitHandler: function(form) {
							if ($('.popup form[name="form_popup_subscribe"]').valid()) {
								$('.popup form[name="form_popup_subscribe"]').addClass('sending');
								$.ajax({
									type: "POST",
									url: "ajax/subscribe.php",
									data: $(form).serialize(),
									dataType: 'json',
									success: function(response) {
										if (response.condition === 'success') {
											$('.popup form[name="form_popup_subscribe"]').removeClass('sending').addClass('success');
											$('.popup form[name="form_popup_subscribe"]').html(response.message);
										} else {
											$('.popup form[name="form_popup_subscribe"]').removeClass('sending').addClass('error');
											$('.popup form[name="form_popup_subscribe"] .error-container').html(response.message);
										}
									}
								});
							}
						},
					});

					$(document).on("click", ".jqmClose", function(e) {
						e.preventDefault();
						$(this).closest(".jqmWindow").jqmHide();
					});
				});
			</script>
		{/literal}
	</div>
</div>