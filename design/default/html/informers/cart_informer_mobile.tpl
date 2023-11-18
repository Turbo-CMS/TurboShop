{if $cart->total_products > 0}
	<a class="text-muted position-relative" href="{$lang_link}cart">
		<i class="fal fa-shopping-bag fs-5"></i>
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
			{$cart->total_products}
		</span>
	</a>
{else}
	<a class="text-muted position-relative" href="{$lang_link}cart">
		<i class="fal fa-shopping-bag fs-5"></i>
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
			0
		</span>
	</a>
{/if}