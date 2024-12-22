{if $wishlist_products > 0}
	<a href="{$lang_link}wishlist" class="nav-link d-flex align-items-center justify-content-between px-0">
		<span class="d-flex align-items-center">
			<i class="fal fa-heart"></i>
			<span class="ms-2">{$lang->wishlist|escape}</span>
		</span>
		<span class="badge rounded-pill bg-secondary">{$wishlist_products|count}</span>
	</a>
{else}
	<a href="{$lang_link}wishlist" class="nav-link d-flex align-items-center justify-content-between px-0">
		<span class="d-flex align-items-center">
			<i class="fal fa-heart"></i>
			<span class="ms-2">{$lang->wishlist|escape}</span>
		</span>
	</a>
{/if}