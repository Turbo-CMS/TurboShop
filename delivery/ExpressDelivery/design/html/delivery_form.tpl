{if $delivery->module}
	<div class="row g-3">
		<div class="col-12">
			<label for="ex-city" class="form-label">{$translate->city}<span class="text-danger">*</span></label>
			<input type="text" class="form-control" id="ex-city" value="" required>
			<div class="invalid-feedback">
				{$translate->invalid}
			</div>
		</div>
		<div class="col-md-6">
			<label for="ex-street" class="form-label">{$translate->street}<span class="text-danger">*</span></label>
			<input type="text" class="form-control" id="ex-street" required>
			<div class="invalid-feedback">
				{$translate->invalid}
			</div>
		</div>
		<div class="col-md-3">
			<label for="ex-house" class="form-label">{$translate->house}<span class="text-danger">*</span></label>
			<input type="text" class="form-control" id="ex-house" required>
			<div class="invalid-feedback">
				{$translate->invalid}
			</div>
		</div>
		<div class="col-md-3">
			<label for="ex-apartment" class="form-label">{$translate->apartment}</label>
			<input type="text" class="form-control" id="ex-apartment">
		</div>
	</div>
{/if}

{* JS *}
{js id="ex" priority=10 include=["delivery/{$delivery->module}/design/js/ex.js"]}{/js}
{javascript minify=true}