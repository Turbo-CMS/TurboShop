{if $delivery->id}
	{$meta_title = $delivery->name scope=global}
{else}
	{$meta_title = $btr->delivery_new scope=global}
{/if}

<h1 class="mb-3">
	{if !$delivery->id}
		{$btr->delivery_add|escape}
	{else}
		{$delivery->name|escape}
	{/if}
</h1>

{if isset($message_success)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'added'}
						{$btr->delivery_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->delivery_updated|escape}
					{/if}
					{if $smarty.get.return}
						<a class="alert-link fw-normal btn-return text-decoration-none me-5" href="{$smarty.get.return}">
							<i class="align-middle mt-n1" data-feather="corner-up-left"></i>
							{$btr->global_back|escape}
						</a>
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if isset($message_error)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error=='empty_name'}
						{$btr->global_enter_name|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data" class="js-fast-button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<input type="hidden" name="lang_id" value="{$lang_id}">

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_title|escape}</div>
								<input class="form-control mb-h" name="name" type="text" value="{if isset($delivery->name)}{$delivery->name|escape}{/if}">
								<input name="id" type="hidden" value="{$delivery->id|escape}">
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="enabled" name="enabled" value="1" type="checkbox" {if isset($delivery->enabled) && $delivery->enabled}checked="" {/if}>
									<label class="form-check-label ms-2" for="enabled">{$btr->global_enable|escape}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_method_settings|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-12">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group clearfix">
											<div class="form-label">{$btr->global_method_type|escape}</div>
											<select name="module" class="selectpicker">
												<option value='null'>{$btr->global_method_manual|escape}</option>
												{foreach $delivery_modules as $delivery_module}
													<option value="{$delivery_module@key|escape}" {if isset($delivery->module) && $delivery->module == $delivery_module@key}selected{/if}>{$delivery_module->name|escape}</option>
												{/foreach}
											</select>
										</div>
									</div>
									<div class="col-12 mt-3">
										{foreach $delivery_modules as $delivery_module}
											<div class="row js-module-settings" {if $delivery->id}{if $delivery_module@key != $delivery->module}style="display:none;" {/if}{else}style="display:none;" {/if} module="{$delivery_module@key}">
												<h4>{$delivery_module->name|escape}</h4>
												{foreach $delivery_module->settings as $setting}
													{$variable_name = $setting->variable}
													{if !empty($setting->options) && $setting->options|@count>1}
														<div class="col-lg-6">
															<div class="mb-3">
																<div class="form-label">{$setting->name|escape}</div>
																<select name="delivery_settings[{$setting->variable}]" class="selectpicker">
																	{foreach $setting->options as $option}
																		<option value="{$option->value}" {if isset($delivery_settings[$setting->variable]) && $option->value == $delivery_settings[$setting->variable]}selected{/if}>{$option->name|escape}</option>
																	{/foreach}
																</select>
															</div>
														</div>
													{elseif !empty($setting->options) && $setting->options|@count==1}
														{$option = $setting->options|@first}
														<div class="col-lg-6">
															<div class="d-flex align-items-center mb-3">
																<div class="form-check">
																	<input class="form-check-input js-check-all-single me-2" type="checkbox" id="delivery-settings-{$option->value|escape}" name="delivery_settings[{$setting->variable}]" value="{$option->value|escape}" {if $option->value==$delivery_settings[$setting->variable]}checked{/if} id="{$setting->variable}">
																</div>
																<label class="form-check-label" for="delivery-settings-{$option->value|escape}">{$setting->name|escape}</label>
															</div>
														</div>
													{else}
														<div class="col-lg-6">
															<div class="mb-3">
																<div class="form-label" for="{$setting->variable}">{$setting->name|escape}</div>
																<input name="delivery_settings[{$setting->variable}]" class="form-control" type="text" value="{if isset($delivery_settings[$setting->variable])}{$delivery_settings[$setting->variable]|escape}{/if}" id="{$setting->variable}">
															</div>
														</div>
													{/if}
												{/foreach}
											</div>
										{/foreach}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row gx-2">
		<div class="col-lg-4 col-md-12">
			<div class="card mh-250px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_icon|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<ul class="checkout-images-list mb-1">
							<li class="checkout-image-item border-image-item-two {if isset($delivery->icon) && $delivery->icon}border{/if}">
								{if isset($delivery->icon) && $delivery->icon}
									<input type="hidden" class="js-accept-delete-two" name="delete_icon" value="">
									<div class="js-parent-image-two">
										<div class="checkout-image image-wrapper js-image-wrapper-two text-xs-center">
											<a href="javascript:;" class="js-delete-item-two remove-image"></a>
											<img src="../{$config->delivery_images_dir}{$delivery->icon}" alt="">
										</div>
									</div>
								{else}
									<div class="js-parent-image-two"></div>
								{/if}
								<div class="js-upload-image-two dropzone-block-image {if isset($delivery->icon) && $delivery->icon}d-none{/if}">
									<i class="align-middle" data-feather="plus"></i>
									<input class="dropzone-image-two" name="icon" type="file">
								</div>
								<div class="checkout-image image-wrapper js-image-wrapper-two js-new-image-two text-xs-center">
									<a href="javascript:;" class="js-delete-item-two remove-image"></a>
									<img src="" alt="">
								</div>
							</li>
						</ul>
						<div class="form-label">{$btr->icon_code|escape}</div>
						<input class="form-control" name="code" type="text" value="{if isset($delivery->code)}{$delivery->code|escape}{/if}">
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8 col-md-12">
			<div class="card mh-250px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->delivery_type|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="d-grid d-sm-block">
							<button type="button" class="btn btn-outline-primary js-type-delivery delivery-type mb-3 me-sm-2 {if isset($delivery->price) && $delivery->price > 0}active{/if}" data-type="paid">
								{$btr->delivery_paid|escape}
							</button>
							<button type="button" class="btn btn-outline-primary js-type-delivery delivery-type mb-3 me-sm-2 {if isset($delivery->price) && $delivery->price == 0 && !$delivery->separate_payment}active{/if}" data-type="free">
								{$btr->deliveries_free|escape}
							</button>
							<button type="button" class="btn btn-outline-primary js-type-delivery delivery-type mb-3 {if isset($delivery->separate_payment)}active{/if}" data-type="delivery">
								{$btr->global_paid_separately|escape}
							</button>
						</div>
						<div class="row row-cols-sm-auto align-items-center js-delivery-option gx-3 {if isset($delivery->price) && $delivery->price == 0}d-none{/if}">
							<div class="col-12">
								<label for="price" class="form-label">{$btr->delivery_cost|escape}</label>
								<div class="input-group mb-2 me-sm-2 dl-price">
									<input name="price" id="price" class="form-control" type="text" value="{if isset($delivery->price)}{$delivery->price|escape}{/if}">
									<div class="input-group-text">{$currency->sign|escape}</div>
								</div>
							</div>
							<div class="col-12">
								<label for="free-from" class="form-label">{$btr->deliveries_free_from|escape}</label>
								<div class="input-group mb-2 me-sm-2 dl-price">
									<input name="free_from" id="free-from" class="form-control" type="text" value="{if isset($delivery->free_from)}{$delivery->free_from|escape}{/if}">
									<div class="input-group-text">{$currency->sign|escape}</div>
								</div>
							</div>
						</div>
						<input class="d-none" name="separate_payment" type="checkbox" value="1" {if isset($delivery->separate_payment)}checked{/if}>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row gx-2">
		<div class="col-12">
			<div class="card mh-210px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->delivery_payments|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							{foreach $payment_methods as $payment_method}
								<div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 my-2">
									<div class="d-flex align-items-center">
										<div class="form-check">
											<input class="form-check-input me-2" type="checkbox" id="delivery-payments-{$payment_method->id}" name="delivery_payments[]" value="{$payment_method->id}" {if in_array($payment_method->id, $delivery_payments)}checked{/if}>
										</div>
										<label class="form-check-label" for="delivery-payments-{$payment_method->id}">{$payment_method->name|escape}</label>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_description|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<textarea name="description" id="js-editor" class="editor js-editor-class">{if isset($delivery->description)}{$delivery->description|escape}{/if}</textarea>
						<div class="row">
							<div class="col-12">
								<div class="d-grid d-sm-block mt-3">
									<button type="submit" class="btn btn-primary float-end">
										<i class="align-middle" data-feather="check"></i>
										{$btr->global_apply|escape}
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

{* TinyMCE *}
{include file='tinymce_init.tpl'}

<script>
	$(document).on("click", ".js-type-delivery", function() {
		var action = $(this).data("type");
		$(".delivery-type").removeClass("active");

		switch (action) {
			case 'paid':
				$(".js-delivery-option").removeClass("d-none");
				$("input[name=separate_payment]").removeAttr("checked");
				$(this).addClass("active");
				break;
			case 'free':
				$(".js-delivery-option").addClass("d-none");
				$(".js-delivery-option").find("input").val(0);
				$("input[name=separate_payment]").removeAttr("checked");
				$(this).addClass("active");
				break;
			case 'delivery':
				$(".js-delivery-option").addClass("d-none");
				$(".js-delivery-option").find("input").val(0);
				$("input[name=separate_payment]").trigger("click");
				$(this).addClass("active");
				break;
		}
	});

	$(function() {
		$('div.js-module-settings').filter(':hidden').find("input, select, textarea").attr("disabled", true);
		$('select[name=module]').on('change', function() {
			$('div.js-module-settings').hide().find("input, select, textarea").attr("disabled", true);
			$('div.js-module-settings[module=' + $(this).val() + ']').show().find("input, select, textarea").attr("disabled", false);
			$('div.js-module-settings[module=' + $(this).val() + ']').find('select').selectpicker('refresh');
		});
	});
</script>