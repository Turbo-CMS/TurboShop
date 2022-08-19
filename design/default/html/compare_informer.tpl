{* Chosen informer (given by ajax) *}

{if $compare_products>0}
	<a href="{$lang_link}compare/"><i class="fal fa-sync text-primary"></i><span class="badge text-primary text-decoration-none">{$compare_products}</span></a>
{else}
	<a href="{$lang_link}compare/"><i class="fal fa-sync text-muted"></i><span class="badge text-muted text-decoration-none">0</span></a>
{/if}