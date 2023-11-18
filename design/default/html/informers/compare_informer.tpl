{if $compare_products > 0}
	<a href="{$lang_link}compare" class="text-decoration-none"><i class="fal fa-sync text-primary"></i><span class="badge text-primary">{$compare_products}</span></a>
{else}
	<a href="{$lang_link}compare" class="text-decoration-none"><i class="fal fa-sync text-muted"></i><span class="badge text-muted">0</span></a>
{/if}