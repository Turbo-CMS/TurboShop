{if $compare_products > 0}
	<a href="{$lang_link}compare" class="btn btn-link text-decoration-none position-relative">
		<i class="fal fa-scale-balanced text-muted fs-4"></i>
		<span class="badge bg-secondary rounded-pill position-absolute py-1 top-0 end-0">{$compare_products}</span>
	</a>
{else}
	<a href="{$lang_link}compare" class="btn btn-link text-decoration-none position-relative">
		<i class="fal fa-scale-balanced text-muted fs-4"></i>
	</a>
{/if}