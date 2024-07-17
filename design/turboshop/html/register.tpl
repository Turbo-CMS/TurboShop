{* Registration *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->registration scope=global}

	{* Canonical *}
	{$canonical="/user/register" scope=global}
{/if}

<!--title_content-->
<div class="page-top-info">
	<div class="page-top-wrapper page-top-wrapper--white">
		<section class="page-top maxwidth-theme center">
			<div class="cowl">
				{$level = 1}
				<div id="navigation">
					<div class="breadcrumbs swipeignore" itemscope="" itemtype="http://schema.org/BreadcrumbList">
						<div class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a class="breadcrumbs__link" href="{if $lang_link}{$lang_link}{else}/{/if}" title="{$lang->home}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->home}</span>
								<meta itemprop="position" content="{$level++}">
							</a>
						</div>
						<span class="breadcrumbs__separator">
							<i class="svg inline muted-use fill-dark-light" aria-hidden="true">
								<svg width="7" height="5">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
								</svg>
							</i>
						</span>
						<div class="breadcrumbs__item" id="tb_breadcrumb_1" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a class="breadcrumbs__link" href="{$lang_link}user/login" title="{$lang->authorization}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->authorization}</span>
								<meta itemprop="position" content="{$level++}">
							</a>
						</div>
						<span class="breadcrumbs__separator">
							<i class="svg inline muted-use fill-dark-light" aria-hidden="true">
								<svg width="7" height="5">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
								</svg>
							</i>
						</span>
						{if isset($page)}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}{$page->url}" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$page->header|escape}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{else}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}user/register" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->registration}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{/if}
					</div>
				</div>
			</div>
			<!--h1_content-->
			<div class="topic">
				<div class="topic__inner">
					<div class="topic__heading">
						{* Page Title *}
						{if isset($page->name)}
							<h1 id="pagetitle" class="switcher-title"><span data-page="{$page->id}">{$page->name|escape}</span></h1>
						{else}
							<h1 id="pagetitle" class="switcher-title">{$lang->registration}</h1>
						{/if}
					</div>
				</div>
			</div>
			<!--/h1_content-->
		</section>
	</div>
</div>
<!--end-title_content-->

<div class="container">
	<div class="row">
		<div class="maxwidth-theme">
			<div class="col-md-12 col-sm-12 col-xs-12 content-md">
				<div class="right_block narrow_N">
					<div class="registraion-page pk-page">
						<div class="form">
							{* Error *}
							{if isset($error)}
								<div class="alert alert-danger" role="alert">
									{if $error == 'empty_name'}
										{$lang->enter_your_name}
									{elseif $error == 'empty_email'}
										{$lang->enter_your_email}
									{elseif $error == 'empty_password'}
										{$lang->enter_password}
									{elseif $error == 'user_exists'}
										{$lang->email_already_registered}
									{elseif $error == 'captcha'}
										{$lang->captcha_incorrect}
									{else}
										{$error}
									{/if}
								</div>
							{/if}
							<form id="registraion-page-form" class="validate" method="post" name="regform" enctype="multipart/form-data" novalidate="novalidate">
								<div class="form-body">
									<div class="form-group fill-animate">
										<label class="font_14" for="input_NAME">{$lang->name} <span class="required-star">*</span></label>
										<div class="input">
											<input size="30" type="text" id="input_NAME" name="name" required="" value="{if isset($name)}{$name|escape}{/if}" class="form-control" maxlength="255" aria-required="true">
										</div>
									</div>
									<div class="form-group fill-animate">
										<label class="font_14" for="input_EMAIL">E-mail <span class="required-star">*</span></label>
										<div class="input">
											<input size="30" type="email" id="input_EMAIL" name="email" required="" value="{if isset($email)}{$email|escape}{/if}" class="form-control" aria-required="true">
										</div>
										<div class="text_block font_13">
											{$lang->registraion_login_text}
										</div>
									</div>
									<div class="form-group fill-animate">
										<label class="font_14" for="input_PERSONAL_PHONE">{$lang->phone}</label>
										<div class="input">
											<input size="30" type="text" id="input_PERSONAL_PHONE" name="phone" class="form-control phone_input" value="{if isset($phone)}{$phone|escape}{/if}">
										</div>
										<div class="text_block font_13"></div>
									</div>
									<div class="form-group fill-animate">
										<label class="font_14" for="input_PERSONAL_ADDRESS">{$lang->address}</label>
										<div class="input">
											<input size="30" type="text" id="input_PERSONAL_ADDRESS" name="address" class="form-control" value="{if isset($address)}{$address|escape}{/if}">
										</div>
										<div class="text_block font_13"></div>
									</div>
									<div class="form-group fill-animate ">
										<label class="font_14" for="input_PASSWORD">{$lang->password} <span class="required-star">*</span></label>
										<div class="input eye-password">
											<input size="30" type="password" id="input_PASSWORD" name="password" required="" value="" autocomplete="off" class="form-control password" aria-required="true">
										</div>
										<div class="text_block font_13">
											{$lang->registraion_password_text}
										</div>
									</div>
									{if $settings->captcha_register}
										<div class="clearfix fill-animate">
											<label class="font_14">
												<span>{$lang->captcha_label}&nbsp;<span class="required-star">*</span></span>
											</label>
										</div>
										<div class="row">
											<div class="form-group col-sm-6 pb-3">
												{get_captcha var="captcha_register"}
												<div class="secret-number">{$captcha_register[0]|escape} + ? = {$captcha_register[1]|escape}</div>
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
									<button class="btn btn-default btn-lg btn-wide" type="submit" name="register" value="{$lang->registration}">
										{$lang->register}
									</button>
									<div class="clearboth"></div>

									<div class="licence_block">
										<label for="licenses_reg">
											<span>{$lang->licenses_text} <a href="{$lang_link}licenses" target="_blank">{$lang->licenses_link}</a></span>
										</label>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		if (turboOptions["THEME"]["PHONE_MASK"].length) {
			var base_mask = turboOptions["THEME"]["PHONE_MASK"].replace(/(\d)/g, "_");
			$('form[name="regform"] input.phone_input').inputmask("mask", { mask: turboOptions["THEME"]["PHONE_MASK"], showMaskOnHover: false });
			$('form[name="regform"] input.phone_input').blur(function() {
				if ($(this).val() == base_mask || $(this).val() == "") {
					if ($(this).hasClass("required")) {
						$(this).parent().find("div.error").html(Turbo.message("JS_REQUIRED"));
					}
				}
			});
		}
	});
</script>