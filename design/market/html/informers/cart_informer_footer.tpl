{if $cart->total_products > 0}
	<a class="btn btn-link text-decoration-none position-relative" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" href="#offcanvasCart" role="button" aria-controls="offcanvasCart">
		<i class="fal fa-cart-shopping text-muted fs-4"></i>
		<span class="badge bg-success rounded-pill position-absolute py-1 top-0 end-0">{$cart->total_products}</span>
	</a>
{else}
	<a class="btn btn-link text-decoration-none position-relative" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" href="#offcanvasCart" role="button" aria-controls="offcanvasCart">
		<i class="fal fa-cart-shopping text-muted fs-4"></i>
	</a>
{/if}