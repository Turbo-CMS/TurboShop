{if $wishlist_products > 0}
	<div class="list-inline-item me-3 d-none d-lg-inline">
		<a href="{$lang_link}wishlist" class="text-white position-relative text-decoration-none">
			<i class="fal fa-heart"></i>
			<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
				{$wishlist_products|count}
			</span>
		</a>
	</div>
{/if}