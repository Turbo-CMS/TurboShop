{* Chosen informer (given by ajax) *}

{if $wishlist_products>0}
	<a href="{$lang_link}wishlist/"><i class="fal fa-heart text-danger"></i></i><span class="badge text-danger text-decoration-none">{$wishlist_products|count}</span></a>
{else}
	<a href="{$lang_link}wishlist/"><i class="fal fa-heart text-muted"></i><span class="badge text-muted text-decoration-none">0</span></a>
{/if}