{if $wishlist_products > 0}
	<a href="{$lang_link}wishlist" class="text-muted position-relative">
		<i class="fal fa-heart fs-5"></i>
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
			{$wishlist_products|count}
		</span>
	</a>
{else}
	<a href="{$lang_link}wishlist" class="text-muted position-relative">
		<i class="fal fa-heart fs-5"></i>
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
			0
		</span>
	</a>
{/if}