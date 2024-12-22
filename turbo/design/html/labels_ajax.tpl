{if isset($smarty.get.module) && $smarty.get.module == "OrderAdmin"}
	{if $labels}
		{foreach $labels as $l}
			{if in_array($l->id, $order_labels)}
				<span class="badge me-1" style="background-color:{$l->color};">{$l->name|escape}</span>
				<input type="hidden" name="order_labels[]" value="{$l->id}">
			{/if}
		{/foreach}
	{/if}
{else}
	{if isset($order->labels)}
		{foreach $order->labels as $l}
			<span class="badge me-1" style="background-color:{$l->color};">{$l->name|escape}</span>
		{/foreach}
	{/if}
{/if}