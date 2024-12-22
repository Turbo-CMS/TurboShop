<div class="phones">
	<div class="phones__phones-wrapper">
		<div class="phones__inner phones__inner--with_dropdown phones__inner--big fill-theme-parent">
			<a class="phones__phone-link phones__phone-first dark_link banner-light-text menu-light-text icon-block__name" href="tel:{$theme_settings->phone_1|regex_replace:'/[\s()-]/':''}">{$theme_settings->phone_1|escape}</a>
			<div class="phones__dropdown phones__dropdown--top">
				<div class="dropdown dropdown--relative">
					<div class="phones__phone-more dropdown__item color-theme-hover dropdown__item--first">
						<a class="phones__phone-link dark_link" rel="nofollow" href="tel:{$theme_settings->phone_1|regex_replace:'/[\s()-]/':''}">
							{$theme_settings->phone_1|escape}
							<span class="phones__phone-descript phones__dropdown-title">{$lang->sales_department|escape}</span>
						</a>
					</div>
					{if $theme_settings->phone_2}
						<div class="phones__phone-more dropdown__item color-theme-hover">
							<a class="phones__phone-link dark_link" rel="nofollow" href="tel:{$theme_settings->phone_2|regex_replace:'/[\s()-]/':''}">
								{$theme_settings->phone_2|escape}
								<span class="phones__phone-descript phones__dropdown-title">{$lang->accounting|escape}</span>
							</a>
						</div>
					{/if}
					{if $theme_settings->phone_3}
						<div class="phones__phone-more dropdown__item color-theme-hover dropdown__item--last">
							<a class="phones__phone-link dark_link" rel="nofollow" href="tel:{$theme_settings->phone_3|regex_replace:'/[\s()-]/':''}">
								{$theme_settings->phone_3|escape}
								<span class="phones__phone-descript phones__dropdown-title">{$lang->director|escape}</span>
							</a>
						</div>
					{/if}
					<div class="phones__dropdown-item callback-item">
						<div class="animate-load btn btn-default btn-wide btn-sm" data-event="jqm" data-url="{$lang_link}contact/?tpl=callback" data-name="callback">
							{$lang->callback|escape}
						</div>
					</div>
				</div>
				<div class="dropdown dropdown--relative">
					<div class="phones__dropdown-item">
						<div class="email__title phones__dropdown-title">E-mail</div>
						<div class="phones__dropdown-value">
							<div>
								<div>
									<a class="dark_link" href="mailto:{$theme_settings->email|escape}">{$theme_settings->email|escape}</a>
								</div>
							</div>
						</div>
					</div>
					<div class="phones__dropdown-item">
						<div class="address__title phones__dropdown-title">{$lang->address|escape}</div>
						<div class="phones__dropdown-value">
							<div class="address__text font_short address__text--large">{$lang->office|escape}</div>
						</div>
					</div>
					<div class="phones__dropdown-item">
						<div class="schedule__title phones__dropdown-title">{$lang->operating_mode|escape}</div>
						<div class="phones__dropdown-value">
							<div class="schedule__text">
								{$lang->operating_mode_text|escape}
							</div>
						</div>
					</div>
					<div class="phones__dropdown-item social-item">
						{include file='includes/social.tpl'}
					</div>
				</div>
			</div>
			<span class="more-arrow banner-light-icon-fill menu-light-icon-fill fill-dark-light-block">
				<i class="svg inline" aria-hidden="true">
					<svg width="7" height="5">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
					</svg>
				</i>
			</span>
		</div>
	</div>
</div>