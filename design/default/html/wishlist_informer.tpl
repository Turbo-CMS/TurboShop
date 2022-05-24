{* Chosen informer (given by ajax) *}

{if $wishlist_products>0}
    <a href="{$lang_link}wishlist/"><i class="fal fa-heart text-danger"></i><span class="badge text-danger card-link">{$wishlist_products|count}</span></a>
{else}
    <a href="{$lang_link}wishlist/"><i class="fal fa-heart text-secondary"></i><span class="badge text-secondary card-link">0</span></a>
{/if}