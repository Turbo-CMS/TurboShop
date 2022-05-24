{* Chosen informer (given by ajax) *}

{if $compare_products>0}
    <a href="{$lang_link}compare/"><i class="fal fa-sync text-primary"></i><span class="badge text-primary card-link">{$compare_products}</span></a>
{else}
    <a href="{$lang_link}compare/"><i class="fal fa-sync text-secondary"></i><span class="badge text-secondary card-link">0</span></a>
{/if}