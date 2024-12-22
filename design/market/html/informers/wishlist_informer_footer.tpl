{if $wishlist_products > 0}
	<a href="{$lang_link}wishlist" class="btn btn-link text-decoration-none position-relative">
		<i class="fal fa-heart text-muted fs-4"></i>
		<span class="badge bg-secondary rounded-pill position-absolute py-1 top-0 end-0">{$wishlist_products|count}</span>
	</a>
{else}
	<a href="{$lang_link}wishlist" class="btn btn-link text-decoration-none position-relative">
		<i class="fal fa-heart text-muted fs-4"></i>
	</a>
{/if}