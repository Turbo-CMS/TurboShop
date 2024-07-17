<div class=footer__part-item-confidentiality>
	{foreach $pages as $p}
		{if $p->menu_id == 7}
			<div class="footer__part-item">
				<div class="footer__license font_14">
					<a class="color_999 dark_link" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
				</div>
			</div>
		{/if}
	{/foreach}
</div>