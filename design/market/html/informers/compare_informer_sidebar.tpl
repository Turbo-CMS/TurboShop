{if $compare_products > 0}
	<a href="{$lang_link}compare" class="nav-link d-flex align-items-center justify-content-between px-0">
		<span class="d-flex align-items-center">
			<i class="fal fa-scale-balanced"></i>
			<span class="ms-2">{$lang->compare|escape}</span>
		</span>
		<span class="badge rounded-pill bg-secondary">{$compare_products}</span>
	</a>
{else}
	<a href="{$lang_link}compare" class="nav-link d-flex align-items-center justify-content-between px-0">
		<span class="d-flex align-items-center">
			<i class="fal fa-scale-balanced"></i>
			<span class="ms-2">{$lang->compare|escape}</span>
		</span>
	</a>
{/if}