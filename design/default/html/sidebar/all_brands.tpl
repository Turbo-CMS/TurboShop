{get_brands var=all_brands}
{if $all_brands}
	<div class="mb-4">
		<h4 class="my-3">{$lang->all_brands|escape}:</h4>
		{foreach $all_brands as $b}
			<a class="btn btn-primary btn-sm mb-1" href="{$lang_link}brands/{$b->url}">{$b->name}</a>
		{/foreach}
	</div>
{/if}