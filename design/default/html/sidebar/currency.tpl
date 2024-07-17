{if $currencies|count > 1}
	<div class="card mb-4">
		<div class="card-header fw-bold">{$lang->currency}</div>
		<div class="card-body">
			<select role="button" class="form-select" onchange="location.href=this.value" size="1" aria-label="Select currency">
				{foreach $currencies as $c}
					{if $c->enabled}
						<option value="{url currency_id=$c->id}" {if $c->id==$currency->id}selected="selected" {/if}>{$c->name|escape}</option>
					{/if}
				{/foreach}
			</select>
		</div>
	</div>
{/if}