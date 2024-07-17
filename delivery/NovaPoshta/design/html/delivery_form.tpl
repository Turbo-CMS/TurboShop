{if $delivery->module}
	<div class="order-weight" style="display: none;" weight="{($cart->total_weight / 1000)}"></div>

	<div class="block-adress">
		<select name="recipient_city" class="npcity mb-3 no-validate" data-id="{$delivery->id}" disabled>
			<option>{$translate->load_city}</option>
		</select>

		<select name="recipient_warehouse" class="npstreet no-validate" style="display: none;" disabled>
			<option>{$translate->select_sender_city}</option>
		</select>
	</div>

	{* CSS *}
	{css id="np" include=[
		"delivery/{$delivery->module}/design/css/select2.css",
		"delivery/{$delivery->module}/design/css/select2-bootstrap-5-theme.css",
		"delivery/{$delivery->module}/design/css/style.css"
	]}{/css}
	{stylesheet minify=true}

	{* JS *}
	{js id="np" priority=10 include=[
		"delivery/{$delivery->module}/design/js/np.js",
		"delivery/{$delivery->module}/design/js/select2.js"
	]}{/js}
	{javascript minify=true}

	<script>
		{if isset($language->label) && $language->label == "ru"}
			var selectedLanguage = "ru";
		{elseif isset($language->label) && $language->label == "ua"}
			var selectedLanguage = "ua";
		{else}
			var selectedLanguage = "{$delivery_settings['np_language']}";
		{/if}

		var citySelectOption = "{$translate->select_city}";
		var warehouseLoadOption = "{$translate->load_warehouse}";
		var warehouseSelectOption = "{$translate->select_warehouse}";
	</script>

{/if}