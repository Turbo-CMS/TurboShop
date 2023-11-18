{if isset($compare_products) && $compare_products > 0}
	<a href="{$lang_link}compare" class="text-muted position-relative">
		<i class="fal fa-sync fs-5"></i>
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
			{$compare_products}
		</span>
	</a>
{else}
	<a href="{$lang_link}compare" class="text-muted position-relative">
		<i class="fal fa-sync fs-5"></i>
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
			0
		</span>
	</a>
{/if}