{if $cart->total_products > 0}
	<a href="{$lang_link}cart" class="btn btn-link text-decoration-none position-relative">
		<i class="fal fa-shopping-bag text-muted fs-4"></i>
		<span class="badge bg-primary rounded-pill position-absolute py-1 top-0 end-0">{$cart->total_products}</span>

	</a>
{else}
	<a href="{$lang_link}cart" class="btn btn-link text-decoration-none position-relative">
		<i class="fal fa-shopping-bag text-muted fs-4"></i>
		<span class="badge bg-primary rounded-pill position-absolute py-1 top-0 end-0">0</span>
	</a>
{/if}