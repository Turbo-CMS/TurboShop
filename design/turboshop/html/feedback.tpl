{* Feedback *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->contacts scope=global}

	{* Canonical *}
	{$canonical="/contact" scope=global}
{/if}

{* Modals *}
{if isset($smarty.server.HTTP_X_REQUESTED_WITH) && $smarty.server.HTTP_X_REQUESTED_WITH == 'XMLHttpRequest'}
	{assign var="cleanTpl" value=$smarty.get.tpl|replace:"?":""}
	{if $cleanTpl == 'callback'}
		{$wrapper='modals/callback.tpl' scope=global}
	{elseif $cleanTpl == 'feedback_modal'}
		{$wrapper = 'modals/feedback_modal.tpl' scope=global}
	{/if}
{/if}

<!--title_content-->
<div class="page-top-info">
	<div class="page-top-wrapper page-top-wrapper--white">
		<section class="page-top maxwidth-theme">
			<div class="cowl">
				{$level = 1}
				<div id="navigation">
					<div class="breadcrumbs swipeignore" itemscope="" itemtype="http://schema.org/BreadcrumbList">
						<div class="breadcrumbs__item" id="tb_breadcrumb_0" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
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
								<link href="{$lang_link}contact" itemprop="item">
								<span>
									<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->contacts}</span>
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
							<h1 id="pagetitle" class="switcher-title">
								<span data-page="{$page->id}">{$page->name|escape}</span>
							</h1>
						{else}
							<h1 id="pagetitle" class="switcher-title">{$lang->contacts}</h1>
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
					<div class="contacts-v2" itemscope="" itemtype="http://schema.org/Organization">
						<div class="hidden">
							<span itemprop="name">{$settings->company_name}</span>
						</div>
						<div class="contacts__row">
							<div class="contacts__col contacts__col--left flex-1">
								<div class="contacts__content-wrapper">
									<div class="contacts__panel-wrapper"></div>
									<div class="contacts__ajax_items">
										<div class="contacts__map-wrapper">
											<div class="contacts__map bordered outer-rounded-x">
												<div class="tb-map-view-layout tb-google-view-layout swipeignore">
													<div class="tb-google-view-map">
														<div class="tb-google-map" style="height: 500px; width: 100%;">
															<iframe style="border: 0;" tabindex="0" src="{$theme_settings->map|escape}" width="100%" height="500" frameborder="0" allowfullscreen="allowfullscreen" aria-hidden="false"></iframe>
														</div>
													</div>
												</div>
											</div>
										</div>
										{if isset($page->body)}
											<div class="contacts__desc" itemprop="description">
												{* Page Body *}
												{$page->body}
											</div>
										{/if}
										<div class="row">
											<div class="col-md-12">
												<h2 class="short">{$lang->global_feedback}</h2>
												<p>{$lang->feedback_message}</p>
												{if isset($message_sent)}
													<div class="alert alert-success" role="alert">
														{$name|escape}, {$lang->feedback_message_sent}
													</div>
												{/if}
												{if isset($error)}
													<div class="alert alert-danger" role="alert">
														{if $error=='captcha'}
															{$lang->captcha_incorrect}
														{elseif $error=='empty_name'}
															{$lang->enter_your_name}
														{elseif $error=='empty_email'}
															{$lang->enter_your_email}
														{elseif $error=='empty_text'}
															{$lang->enter_your_message}
														{/if}
													</div>
												{/if}
												<form method="post" class="validate" name="feedback" novalidate>
													<div class="row">
														<div class="form-group">
															<div class="col-md-6">
																<label for="feedback-name">{$lang->name} <span class="required-star">*</span></label>
																<div class="input">
																	<input type="text" value="{if isset($name)}{$name|escape}{/if}" maxlength="100" class="form-control required" name="name" id="feedback-name" required>
																</div>
															</div>
															<div class="col-md-6">
																<label for="feedback-email">Email <span class="required-star">*</span></label>
																<div class="input">
																	<input type="email" type="email" value="{if isset($email)}{$email|escape}{/if}" maxlength="255" class="form-control required" name="email" id="feedback-email" required>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="form-group">
															<div class="col-md-12">
																<label for="feedback-message">{$lang->message} <span class="required-star">*</span></label>
																<div class="input">
																	<textarea maxlength="5000" rows="10" class="form-control required" name="message" id="feedback-message" style="height: 138px;" required>{if isset($message)}{$message|escape}{/if}</textarea>
																</div>
															</div>
														</div>
													</div>
													{if $settings->captcha_feedback}
														<div class="clearfix fill-animate">
															<label class="font_14">
																<span>{$lang->captcha_label}&nbsp;<span class="required-star">*</span></span>
															</label>
														</div>
														<div class="row">
															<div class="form-group col-sm-6 pb-3">
																{get_captcha var="captcha_feedback"}
																<div class="secret-number">{$captcha_feedback[0]|escape} + ? = {$captcha_feedback[1]|escape}</div>
															</div>
															<div class="form-group col-sm-6">
																<div class="input">
																	<input type="text" class="form-control required" name="captcha_code" value="" autocomplete="off" required>
																</div>
															</div>
														</div>
													{/if}
													<div class="row">
														<div class="col-md-12">
															<input type="submit" class="btn btn-default btn-lg" name="feedback" value="{$lang->send}">
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="contacts__col contacts__col--right">
								<div class="contacts__sticky-panel sticky-block outer-rounded-x">
									<div class="contacts__sticky-panel__image dark-block-after outer-rounded-x">
										<div class="contact-property contact-property--image outer-rounded-x">
											<img class="lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/contacts.jpg" alt="{$settings->company_name}">
										</div>
										<div class="contact-property contact-property--address">
											<div class="contact-property__label font_13 color_999">{$lang->main_office}</div>
											<div itemprop="address" class="contact-property__value color_222">
												{$lang->office}
											</div>
										</div>
									</div>
									<div class="contacts__sticky-panel__info">
										<div class="contact-property contact-property--address">
											<div class="contact-property__label font_13 color_999">{$lang->main_office}</div>
											<div itemprop="address" class="contact-property__value font_18 color_222 switcher-title">
												{$lang->office}
											</div>
										</div>
										<div class="contacts__sticky-panel__properties">
											<div class="contacts__sticky-panel__property">
												<div class="contact-property contact-property--schedule">
													<div class="contact-property__label font_13 color_999">{$lang->operating_mode}</div>
													<div class="contact-property__value color_222">
														{$lang->operating_mode_text}
													</div>
												</div>
											</div>
											<div class="contacts__sticky-panel__property">
												<div class="contact-property contact-property--phones">
													<div class="contact-property__label font_13 color_999">{$lang->phone}</div>
													<div class="">
														<div class="contact-property__value dark_link" itemprop="telephone">
															<a title="{$lang->sales_department}" href="tel:{$theme_settings->phone_1|regex_replace:'/[\s()-]/':''}">{$theme_settings->phone_1|escape}</a>
														</div>
														{if $theme_settings->phone_2}
															<div class="contact-property__value dark_link" itemprop="telephone">
																<a title="{$lang->accounting}" href="tel:{$theme_settings->phone_2|regex_replace:'/[\s()-]/':''}">{$theme_settings->phone_2|escape}</a>
															</div>
														{/if}
														{if $theme_settings->phone_3}
															<div class="contact-property__value dark_link" itemprop="telephone">
																<a title="{$lang->director}" href="tel:{$theme_settings->phone_3|regex_replace:'/[\s()-]/':''}">{$theme_settings->phone_3|escape}</a>
															</div>
														{/if}
													</div>
												</div>
											</div>
											<div class="contacts__sticky-panel__property">
												<div class="contact-property contact-property--email">
													<div class="contact-property__label font_13 color_999">E-mail</div>
													<div class="">
														<div class="contact-property__value dark_link" itemprop="email">
															<a href="mailto:{$theme_settings->email|escape}">{$theme_settings->email|escape}</a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="contacts__sticky-panel__btn-wraper">
											<span class="">
												<span class="btn btn-default btn-wide btn-transparent-border bg-theme-target border-theme-target animate-load has-ripple" data-event="jqm" data-url="{$lang_link}contact/?tpl=callback" data-name="callback">{$lang->callback}</span>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>