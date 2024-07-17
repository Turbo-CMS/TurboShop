<footer id="footer" class="footer footer_simple footer_simple_1 {if $theme_settings->footer_color == '1'}footer footer--color-dark{else}footer footer--color-light{/if}">
	<div class="footer__bottom-part">
		<div class="maxwidth-theme">
			<div class="footer__bottom-part-inner">
				<div class="footer__bottom-part-items-wrapper">
					{* Copyright *}
					{include file='footer/copyright.tpl'}
					{* Payment *}
					{include file='footer/payment.tpl'}
				</div>
			</div>
		</div>
	</div>
</footer>