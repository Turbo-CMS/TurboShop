<div class="social">
	<ul class="social__items social__items--md social__items--type-color social__items--grid">
		{if $theme_settings->twitterx}
			<li class="social__item grid-list__item hover_blink twitterx">
				<a class="social__link shine" href="{$theme_settings->twitterx|escape}" target="_blank" rel="nofollow" title="Twitter"></a>
			</li>
		{/if}
		{if $theme_settings->telegram}
			<li class="social__item grid-list__item hover_blink telegram">
				<a class="social__link shine" href="{$theme_settings->telegram|escape}" target="_blank" rel="nofollow" title="Telegram"></a>
			</li>
		{/if}
		{if $theme_settings->youtube}
			<li class="social__item grid-list__item hover_blink youtube">
				<a class="social__link shine" href="{$theme_settings->youtube|escape}" target="_blank" rel="nofollow" title="YouTube"></a>
			</li>
		{/if}
		{if $theme_settings->tiktok}
			<li class="social__item grid-list__item hover_blink tiktok">
				<a class="social__link shine" href="{$theme_settings->tiktok|escape}" target="_blank" rel="nofollow" title="TikTok"></a>
			</li>
		{/if}
		{if $theme_settings->whatsapp}
			<li class="social__item grid-list__item hover_blink whatsapp">
				<a class="social__link shine" href="{$theme_settings->whatsapp|escape}" target="_blank" rel="nofollow" title="Whats App"></a>
			</li>
		{/if}
		{if $theme_settings->viber}
			<li class="social__item grid-list__item hover_blink viber">
				<a class="social__link shine" href="{$theme_settings->viber|escape}" target="_blank" rel="nofollow" title="Viber"></a>
			</li>
		{/if}
		{if $theme_settings->instagram}
			<li class="social__item grid-list__item hover_blink instagram">
				<a class="social__link shine" href="{$theme_settings->instagram|escape}" target="_blank" rel="nofollow" title="Instagram"></a>
			</li>
		{/if}
		{if $theme_settings->facebook}
			<li class="social__item grid-list__item hover_blink facebook">
				<a class="social__link shine" href="{$theme_settings->facebook|escape}" target="_blank" rel="nofollow" title="Facebook"></a>
			</li>
		{/if}
		{if $theme_settings->linkedin}
			<li class="social__item grid-list__item hover_blink linkedin">
				<a class="social__link shine" href="{$theme_settings->linkedin|escape}" target="_blank" rel="nofollow" title="LinkedIn"></a>
			</li>
		{/if}
	</ul>
</div>