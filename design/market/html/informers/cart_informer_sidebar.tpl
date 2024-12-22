{if $cart->total_products > 0}
	<a class="nav-link d-flex align-items-center justify-content-between px-0" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" href="#offcanvasCart" role="button" aria-controls="offcanvasCart">
		<span class="d-flex align-items-center">
			<i class="fal fa-cart-shopping"></i>
			<span class="ms-2">{$lang->global_cart|escape}</span>
		</span>
		<span class="badge rounded-pill bg-success">{$cart->total_products}</span>
	</a>
{else}
	<a class="nav-link d-flex align-items-center justify-content-between px-0" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" href="#offcanvasCart" role="button" aria-controls="offcanvasCart">
		<span class="d-flex align-items-center">
			<i class="fal fa-cart-shopping"></i>
			<span class="ms-2">{$lang->global_cart|escape}</span>
		</span>
	</a>
{/if}