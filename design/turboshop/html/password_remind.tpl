{* Password Recovery *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->password_recovery scope=global}

	{* Canonical *}
	{$canonical="/user/password_remind" scope=global}
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
							<a class="breadcrumbs__link" href="{if $lang_link}{$lang_link}{else}/{/if}" title="{$lang->home|escape}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->home|escape}</span>
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
							<a class="breadcrumbs__link" href="{$lang_link}user/login" title="{$lang->authorization|escape}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->authorization|escape}</span>
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
						{if $page}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}{$page->url}" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$page->header|escape}</span>
									<meta itemprop="position" content="{$level++}">
								</span>
							</span>
						{else}
							<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
								<link href="{$lang_link}user/password_remind" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->password_recovery|escape}</span>
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
						{if $page}
							<h1 id="pagetitle" class="switcher-title"><span data-page="{$page->id}">{$page->name|escape}</span></h1>
						{else}
							<h1 id="pagetitle" class="switcher-title">{$lang->password_recovery|escape}</h1>
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
					<div class="forgotpasswd-page pk-page">
						<div class="form">
							{if $email_sent}
								<div class="alert alert-success" role="alert">
									{$email|escape} - {$lang->password_recovery_email|escape}
								</div>
							{/if}
							{if $error}
								<div class="alert alert-danger" role="alert">
									{if $error == 'user_not_found'}
										{$lang->user_not_found|escape}
									{else}
										{$error}
									{/if}
								</div>
							{/if}
							<form id="forgotpasswd-page-form" class="validate" method="post" novalidate="novalidate">
								<div class="top-text font_16">
									{$lang->password_recovery_text|escape}
								</div>
								<div class="form-body">
									<div class="form-group fill-animate">
										<label for="FORGOTPASSWD_USER_LOGIN" class="font_14"><span>Email:&nbsp;<span class="required-star">*</span></span></label>
										<div class="input">
											<input id="FORGOTPASSWD_USER_LOGIN" class="form-control required" type="text" name="email" value="{$email|escape}" required="" maxlength="255" autocomplete="off" aria-required="true">
										</div>
										<div class="text_block font_13">{$lang->recovery_text|escape}</div>
									</div>
								</div>
								<div class="form-footer">
									<button class="btn btn-default btn-lg btn-wide has-ripple" type="submit" name="login" value="{$lang->restore|escape}"><span>{$lang->restore|escape}</span></button>
									<div class="clearboth"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>