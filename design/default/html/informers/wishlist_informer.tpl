{if isset($wishlist_products) && $wishlist_products>0}
	<a href="{$lang_link}wishlist" class="text-decoration-none"><i class="fal fa-heart text-danger"></i><span class="badge text-danger">{$wishlist_products|count}</span></a>
{else}
	<a href="{$lang_link}wishlist" class="text-decoration-none"><i class="fal fa-heart text-muted"></i><span class="badge text-muted">0</span></a>
{/if}