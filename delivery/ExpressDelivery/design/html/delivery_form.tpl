{if $delivery->module}
	<div id="expressDelivery" class="row">
		<div class="col-md-12 mb-3">
			<div class="form-group fill-animate">
				<label for="ex-city" class="form-label">{$translate->city}<span class="text-danger">*</span></label>
				<div class="input">
					<input type="text" class="form-control" id="ex-city" name="ex-city" value="" required="" aria-required="true">
					<div class="invalid-feedback">{$translate->invalid}</div>
				</div>
			</div>
		</div>
		<div class="col-md-6 mb-3">
			<div class="form-group fill-animate">
				<label for="ex-street" class="form-label">{$translate->street}<span class="text-danger">*</span></label>
				<div class="input">
					<input type="text" class="form-control" id="ex-street" name="ex-street" value="" required="" aria-required="true">
					<div class="invalid-feedback">{$translate->invalid}</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 mb-3">
			<div class="form-group fill-animate">
				<label for="ex-house" class="form-label">{$translate->house}<span class="text-danger">*</span></label>
				<div class="input">
					<input type="text" class="form-control" id="ex-house" name="ex-house" value="" required="" aria-required="true">
					<div class="invalid-feedback">{$translate->invalid}</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 mb-3">
			<div class="form-group fill-animate">
				<label for="ex-apartment" class="form-label">{$translate->apartment}</label>
				<input type="text" class="form-control" id="ex-apartment" name="ex-apartment" value="">
			</div>
		</div>
	</div>
{/if}

{* CSS *}
{css id="np" include=["delivery/{$delivery->module}/design/css/style.css"]}{/css}
{stylesheet minify=true}

{* JS *}
{js id="ex" priority=10 include=["delivery/{$delivery->module}/design/js/ex.js"]}{/js}
{javascript minify=true}