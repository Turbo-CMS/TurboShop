{if $cart->total_products > 0}
	<a class="text-muted position-relative" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" href="#offcanvasCart" role="button" aria-controls="offcanvasCart">
		<i class="fal fa-shopping-bag fs-5"></i>
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
			{$cart->total_products}
		</span>
	</a>
{else}
	<a class="text-muted position-relative" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" href="#offcanvasCart" role="button" aria-controls="offcanvasCart">
		<i class="fal fa-shopping-bag fs-5"></i>
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">0</span>
	</a>
{/if}

{* Order Products *}
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasCart" aria-labelledby="offcanvasCartLabel">
	<div class="offcanvas-header border-bottom">
		<div class="text-start">
			<h5 id="offcanvasCartLabel" class="mb-0 fs-4">{$lang->global_cart}</h5>
		</div>
		<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		{include file='informers/products_cart_informer.tpl'}
	</div>
</div>