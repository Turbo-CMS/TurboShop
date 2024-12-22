{if $compare_products > 0}
	<div class="list-inline-item me-3 d-none d-lg-inline">
		<a href="{$lang_link}compare" class="text-white position-relative text-decoration-none">
			<i class="fal fa-scale-balanced"></i>
			<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
				{$compare_products}
			</span>
		</a>
	</div>
{/if}