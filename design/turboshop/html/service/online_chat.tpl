<div id="chaty-widget" class="chaty-widget desktop_active mobile_active none-widget-show" dir="ltr">
	<div class="chaty-widget-is">
		{if $settings->chat_viber}
			<div class="chaty-widget-i chaty-widget-social" data-title="{$settings->chat_viber}">
				<a href="viber://chat?number={$settings->chat_viber}" target="_blank">
					{include file='service/svg_icon.tpl' svgId='viber'}
				</a>
				<div class="chaty-widget-i-title">
					<p>Viber</p>
				</div>
			</div>
		{/if}
		{if $settings->chat_whats_app}
			<div class="chaty-widget-i chaty-widget-social" data-title="{$settings->chat_whats_app}">
				<a href=" https://api.whatsapp.com/send?phone={$settings->chat_whats_app}" target="_blank">
					{include file='service/svg_icon.tpl' svgId='whats_app'}
				</a>
				<div class="chaty-widget-i-title">
					<p>Whatsapp</p>
				</div>
			</div>
		{/if}
		{if $settings->chat_telegram}
			<div class="chaty-widget-i chaty-widget-social" data-title="{$settings->chat_telegram}">
				<a href="http://t.me/{$settings->chat_telegram}" target="_blank">
					{include file='service/svg_icon.tpl' svgId='telegram'}
				</a>
				<div class="chaty-widget-i-title">
					<p>Telegram</p>
				</div>
			</div>
		{/if}
		{if $settings->chat_facebook}
			<div class="chaty-widget-i chaty-widget-social" data-title="{$settings->chat_facebook}">
				<a href="https://m.me/{$settings->chat_facebook}" target="_blank">
					{include file='service/svg_icon.tpl' svgId='facebook_messenger'}
				</a>
				<div class="chaty-widget-i-title">
					<p>Messenger</p>
				</div>
			</div>
		{/if}
	</div>
	<div class="i-trigger">
		<div class="chaty-widget-i i-trigger-open">
			{include file='service/svg_icon.tpl' svgId='messanger'}
			<div class="chaty-widget-i-title">
				{$lang->contact_us}
			</div>
		</div>
		<div class="chaty-widget-i i-trigger-close" data-title="Hide">
			{include file='service/svg_icon.tpl' svgId='messanger_close'}
			<div class="chaty-widget-i-title">
				{$lang->close}
			</div>
		</div>
	</div>
</div>