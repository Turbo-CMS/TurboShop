{if $cart->total_products > 0}
	<a href="{$lang_link}cart" class="btn btn-link text-decoration-none position-relative">
		<i class="fal fa-shopping-bag text-muted fs-4"></i>
		<span class="badge bg-primary rounded-pill ms-1 mt-n1 align-middle d-inline-block">{$cart->total_products}</span>
	</a>
{else}
	<a href="{$lang_link}cart" class="btn btn-link text-decoration-none position-relative">
		<i class="fal fa-shopping-bag text-muted fs-4"></i>
		<span class="badge bg-primary rounded-pill ms-1 mt-n1 align-middle d-inline-block">0</span>
	</a>
{/if}