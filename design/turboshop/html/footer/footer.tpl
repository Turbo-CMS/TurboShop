{* Footer Type 1 *}
{if $theme_settings->footer_type == '1'}
	<footer id="footer" class="footer-1 {if $theme_settings->footer_color == '1'}footer footer--color-dark{else}footer footer--color-light{/if}">
		<div class="footer__main-part">
			<div class="maxwidth-theme">
				<div class="footer__main-part-inner">
					<div class="footer__part footer__part--left flex-100-991 flex-100-767 flex-1">
						{* Subscribe *}
						<div class="footer__top-part">
							<div class="subscribe-edit">
								<div class="subscribe-block">
									<div class="subscribe-block__part--left">
										<div class="subscribe-block__text">
											<div class="font_short font_weight--600">{$lang->subscribe_text|escape}</div>
										</div>
									</div>
									<div class="subscribe-block__part--right">
										<form method="post" class="subscribe-form">
											<input type="email" class="form-control subscribe-input required" id="subscribe_email" name="subscribe_email" value="{$email|escape}" placeholder="E-mail" size="30" maxlength="255">
											{if $subscribe_error}
												<label class="error" for="subscribe_email">
													{if $subscribe_error == 'email_exist'}
														{$lang->already_subscribe|escape}
													{/if}
													{if $subscribe_error == 'empty_email'}
														{$lang->enter_your_email|escape}
													{/if}
												</label>
											{/if}
											{if $subscribe_success}
												<label class="success" for="subscribe_email">
													{$lang->success_subscribe|escape}
												</label>
											{/if}
											<div class="subscribe-form__save stroke-dark-light-block">
												<button type="submit" name="subscribe" value="{$lang->subscribe|escape}" class="btn btn-lg subscribe-btn">{$lang->subscribe|escape}</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="footer__main-part-menu flexbox flexbox--direction-row">
							<div class="footer__part-item flex-50-991">
								<div class="bottom-menu">
									<div class="items">
										<div class="item-link accordion-close items-child item-link" data-parent="#bottom1" data-target="#bottom1">
											<div class="item">
												<div class="title font_weight--600 font_short">
													<a class="dark_link" href="{$lang_link}shop">{$lang->online_store|escape}</a>
												</div>
											</div>
											<span class="item-link-arrow">
												<i class="svg inline" aria-hidden="true">
													<svg width="7" height="5">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
													</svg>
												</i>
											</span>
										</div>
										<div id="bottom1" class="wrap wrap_menu_compact_mobile">
											{foreach $pages as $p}
												{if $p->menu_id == $theme_settings->id_menu_footer_1}
													<div class="item-link accordion-close items-child item-link" data-parent="#bottom1" data-target="#bottom1">
														<div class="item {if $page && $page->id == $p->id}active{/if}">
															<div class="title font_weight--600 font_short">
																<a class="dark_link" href="{$lang_link}{$p->url}"><span data-page="{$p->id}">{$p->header|escape}</span></a>
															</div>
														</div>
													</div>
												{/if}
											{/foreach}
										</div>
									</div>
								</div>
							</div>
							<div class="footer__part-item flex-50-991"> 
								<div class="bottom-menu">
									<div class="items">
										<div class="item-link accordion-close items-child item-link" data-parent="#bottom2" data-target="#bottom2">
											<div class="item">
												<div class="title font_weight--600 font_short">
													<a class="dark_link" href="{$lang_link}catalog">{$lang->catalog|escape}</a>
												</div>
											</div>
											<span class="item-link-arrow">
												<i class="svg inline" aria-hidden="true">
													<svg width="7" height="5">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
													</svg>
												</i>
											</span>
										</div>
										<div id="bottom2" class="wrap wrap_menu_compact_mobile">
											{foreach $pages as $p}
												{if $p->menu_id == $theme_settings->id_menu_footer_2}
													<div class="item-link accordion-close items-child item-link" data-parent="#bottom1" data-target="#bottom1">
														<div class="item {if $page && $page->id == $p->id}active{/if}">
															<div class="title font_weight--600 font_short">
																<a class="dark_link" href="{$lang_link}{$p->url}"><span data-page="{$p->id}">{$p->header|escape}</span></a>
															</div>
														</div>
													</div>
												{/if}
											{/foreach}
										</div>
									</div>
								</div>
							</div>
							<div class="footer__part-item flex-50-991">
								<div class="bottom-menu">
									<div class="items">
										<div class="item-link accordion-close  items-child item-link" data-parent="#bottom3" data-target="#bottom3">
											<div class="item">
												<div class="title font_weight--600 font_short">
													<a class="dark_link" href="{$lang_link}info">{$lang->information|escape}</a>
												</div>
											</div>
											<span class="item-link-arrow">
												<i class="svg inline" aria-hidden="true">
													<svg width="7" height="5">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
													</svg>
												</i>
											</span>
										</div>
										<div id="bottom3" class="wrap wrap_menu_compact_mobile">
											{foreach $pages as $p}
												{if $p->menu_id == $theme_settings->id_menu_footer_3}
													<div class="item-link accordion-close items-child item-link" data-parent="#bottom1" data-target="#bottom1">
														<div class="item {if $page && $page->id == $p->id}active{/if}">
															<div class="title font_weight--600 font_short">
																<a class="dark_link" href="{$lang_link}{$p->url}"><span data-page="{$p->id}">{$p->header|escape}</span></a>
															</div>
														</div>
													</div>
												{/if}
											{/foreach}
										</div>
									</div>
								</div>
							</div>
							<div class="footer__part-item flex-50-991">
								<div class="bottom-menu">
									<div class="items">
										<div class="item-link accordion-close items-child item-link" data-parent="#bottom4" data-target="#bottom4">
											<div class="item">
												<div class="title font_weight--600 font_short">
													<a class="dark_link" href="{$lang_link}help">{$lang->help|escape}</a>
												</div>
											</div>
											<span class="item-link-arrow">
												<i class="svg inline " aria-hidden="true">
													<svg width="7" height="5">
														<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
													</svg>
												</i>
											</span>
										</div>
										<div id="bottom4" class="wrap wrap_menu_compact_mobile">
											{foreach $pages as $p}
												{if $p->menu_id == $theme_settings->id_menu_footer_4}
													<div class="item-link accordion-close items-child item-link" data-parent="#bottom1" data-target="#bottom1">
														<div class="item">
															<div class="title font_weight--600 font_short">
																<a class="dark_link" href="{$lang_link}{$p->url}"><span data-page="{$p->id}">{$p->header|escape}</span></a>
															</div>
														</div>
													</div>
												{/if}
											{/foreach}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="footer__part footer__part--right footer--mw318 flex-100-767">
						<div class="footer__title font_weight--600 font_short">{$lang->contacts|escape}</div>
						<div class="footer__info">
							<div class="footer__phone footer__info-item">
								{* Phones *}
								{include file='footer/phones.tpl'}
							</div>
							<div class="footer__info-item">
								{* Email *}
								{include file='footer/email.tpl'}
							</div>
							<div class="footer__address footer__info-item">
								{* Address *}
								{include file='footer/address.tpl'}
							</div>
							<div class="footer__social footer__info-item">
								{* Social *}
								{include file='includes/social.tpl'}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer__bottom-part">
			<div class="maxwidth-theme">
				<div class="footer__bottom-part-inner">
					<div class="footer__bottom-part-items-wrapper">
						{* Copyright *}
						{include file='footer/copyright.tpl'}
						{* Payment *}
						{include file='footer/payment.tpl'}
						{* Confidentiality *}
						{include file='footer/confidentiality.tpl'}
						{* Langs *}
						{include file='footer/lang.tpl'}
						{* Developer *}
						{include file='footer/developer.tpl'}
					</div>
				</div>
			</div>
		</div>
	</footer>
{/if}

{* Footer Type 2 *}
{if $theme_settings->footer_type == '2'}
	<footer id="footer" class="footer-2 {if $theme_settings->footer_color == '1'}footer footer--color-dark{else}footer footer--color-light{/if}">
		<div class="footer__main-part">
			<div class="maxwidth-theme">
				<div class="footer__main-part-inner">
					<div class="footer__part footer__part--left flex-100-991 flex-100-767 flex-1">
						<div class="footer__main-part-menu flexbox flexbox--direction-row">
							<div class="footer__part-item flex-50-991">
								<div class="bottom-menu">
									<div class="items">
										<div class="line-block line-block--gap line-block--gap-40 line-block--align-normal line-block--flex-wrap">
											{foreach $pages as $p}
												{if $p->menu_id == 2}
													<div class="item-link line-block__item item-link">
														<div class="item {if $page && $page->id == $p->id}active{/if}">
															<div class="title font_weight--600 font_short">
																<a class="dark_link" href="{$lang_link}{$p->url}"><span data-page="{$p->id}">{$p->header|escape}</span></a>
															</div>
														</div>
													</div>
												{/if}
											{/foreach}
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="footer__part footer__part-bottom flexbox flexbox--direction-row">
							{* Subscribe *}
							<div class="footer__subscribe">
								<div class="subscribe-edit">
									<div class="subscribe-block subscribe-block--compact">
										<div class="subscribe-block__part--right">
											<form method="post" class="subscribe-form" novalidate="novalidate">
												<input type="email" name="subscribe_email" class="form-control subscribe-input required" placeholder="{$lang->subscribe_newsletter|escape}" value="{$email|escape}" name="subscribe_email" size="30" maxlength="255" aria-required="true">
												{if $subscribe_error}
													<label class="error" for="subscribe_email">
														{if $subscribe_error == 'email_exist'}
															{$lang->already_subscribe|escape}
														{/if}
														{if $subscribe_error == 'empty_email'}
															{$lang->enter_your_email|escape}
														{/if}
													</label>
												{/if}
												{if $subscribe_success}
													<label class="success" for="subscribe_email">
														{$lang->success_subscribe|escape}
													</label>
												{/if}
												<div class="subscribe-form__save stroke-dark-light-block">
													<button type="submit" title="{$lang->subscribe|escape}" name="subscribe" value="{$lang->subscribe|escape}" class="btn btn-lg subscribe-btn">
														<i class="svg inline subscribe-btn__icon" aria-hidden="true">
															<svg width="18" height="12">
																<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-18-12"></use>
															</svg>
														</i>
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="footer__social flex-1">
								{include file='includes/social.tpl'}
							</div>
						</div>
					</div>
					<div class="footer__part footer__part--right footer--mw318 flex-100-767">
						<div class="footer__info">
							<div class="footer__phone footer__info-item">
								{* Phones *}
								{include file='footer/phones.tpl'}
							</div>
							<div class="footer__info-item">
								{* Email *}
								{include file='footer/email.tpl'}
							</div>
							<div class="footer__address footer__info-item">
								{* Address *}
								{include file='footer/address.tpl'}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer__bottom-part">
			<div class="maxwidth-theme">
				<div class="footer__bottom-part-inner">
					<div class="footer__bottom-part-items-wrapper">
						{* Copyright *}
						{include file='footer/copyright.tpl'}
						{* Payment *}
						{include file='footer/payment.tpl'}
						{* Confidentiality *}
						{include file='footer/confidentiality.tpl'}
						{* Langs *}
						{include file='footer/lang.tpl'}
						{* Developer *}
						{include file='footer/developer.tpl'}
					</div>
				</div>
			</div>
		</div>
	</footer>
{/if}