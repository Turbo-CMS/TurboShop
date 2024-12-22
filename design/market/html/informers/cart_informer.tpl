{if $cart->total_products > 0}
	<a class="text-white position-relative text-decoration-none" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" href="#offcanvasCart" role="button" aria-controls="offcanvasCart">
		<i class="fal fa-cart-shopping"></i>
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
			{$cart->total_products}
			<span class="visually-hidden">{$lang->global_cart|escape}</span>
		</span>
	</a>
{else}
	<a class="text-white position-relative text-decoration-none" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" href="#offcanvasCart" role="button" aria-controls="offcanvasCart">
		<i class="fal fa-cart-shopping"></i>
	</a>
{/if}

{* Order Products *}
<div class="offcanvas offcanvas-end p-0" tabindex="-1" id="offcanvasCart" aria-labelledby="offcanvasCartLabel">
	<div class="offcanvas-header border-bottom">
		<div class="text-start">
			<h5 id="offcanvasCartLabel" class="mb-0 fs-4">{$lang->global_cart|escape}</h5>
		</div>
		<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body p-0">
		{include file='informers/products_cart_informer.tpl'}
	</div>
</div>