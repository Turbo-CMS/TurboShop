{* Login *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->login scope=global}

	{* Canonical *}
	{$canonical="/user/login" scope=global}
{/if}

{* Modals *}
{if isset($smarty.server.HTTP_X_REQUESTED_WITH) && $smarty.server.HTTP_X_REQUESTED_WITH == 'XMLHttpRequest'}
	{$wrapper='modals/auth.tpl' scope=global}
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
								<link href="{$lang_link}user/login" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->authorization}</span>
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
							<h1 id="pagetitle" class="switcher-title">{$lang->authorization}</h1>
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
					<div class="pk-page">
						<div class="form">
							<div class="top-text">
								{$lang->authorization_text}
							</div>
						</div>
					</div>
					<div class="auth-page pk-page">
						<div class="auth form-block">
							<div class="form">
								{if isset($error)}
									<div class="alert alert-danger" role="alert">
										{if $error == 'login_incorrect'}
											{$lang->wrong_login_password}
										{elseif $error == 'user_disabled'}
											{$lang->not_activated}
										{else}
											{$error}
										{/if}
									</div>
								{/if}
								<form id="auth-page-form" class="validate" method="post" target="_top" novalidate="novalidate">
									<div class="form-body">
										<div class="form-group fill-animate" data-sid="USER_LOGIN_POPUP">
											<label class="font_14" for="USER_LOGIN_POPUP"><span>{$lang->login} <span class="required-star">*</span></span></label>
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
									<div class="form-footer auth__bottom">
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
													<!--noindex-->
													<a href="{$lang_link}user/register" rel="nofollow" class="btn btn-default btn-transparent btn-lg btn-wide auth__bottom-btn has-ripple" tabindex="6">
														{$lang->registration}
													</a>
													<!--/noindex-->
												</div>
											</div>
											<div class="clearboth"></div>
										</div>
										<div class="licence_block">
											<label for="licenses_auth">
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
</div>