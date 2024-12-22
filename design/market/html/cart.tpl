{* Cart Template *}

{* Wrapper *}
{$wrapper = 'index_cart.tpl' scope=global}

{* Canonical *}
{$meta_title = $lang->global_cart scope=global}

{if $cart->purchases}
	<form class="cart needs-validation" method="post" name="cart" novalidate>
		<div class="row position-relative">
			<div class="col-xl-9">
				{* Error *}
				{if $error}
					<div class="alert alert-danger" role="alert">
						{if $error == 'empty_name'}{$lang->enter_your_name|escape}{/if}
						{if $error == 'empty_email'}{$lang->enter_your_email|escape}{/if}
						{if $error == 'captcha'}{$lang->captcha_incorrect|escape}{/if}
					</div>
				{/if}
				<div class="row">
					<div class="col-lg-12">
						{* Page Title *}
						<h1 class="h3 mb-3">{$lang->placing_an_order|escape}</h1>
					</div>
					{if $cart->purchases}
						<div class="col-lg-12">
							<div class="d-flex justify-content-between align-items-center mb-3">
								<span class="h5">{$lang->global_cart|escape} {$cart->total_products} {$cart->total_products|plural:$lang->global_product_1:$lang->global_product_2:$lang->global_product_3}</span>
								<a class="btn btn-sm btn-link text-decoration-none" href="{url empty=1}">
									<i class="far fa-trash-can"></i>
									{$lang->empty_trash|escape}
								</a>
							</div>
						</div>
					{/if}
				</div>

				{* Purchases *}
				<div class="border rounded px-3">
					<table class="table cart-table table-borderless">
						<tbody>
							{foreach $cart->purchases as $purchase name=itemsLoop}
								<tr {if !$smarty.foreach.itemsLoop.last}class="border-bottom" {/if}>
									<td class="text-center">
										<a href="{$lang_link}products/{$purchase->product->url}">
											{if $purchase->product->images}
												{$image = $purchase->product->images|first}
												<img src="{$image->filename|resize:80:80}" alt="{$purchase->product->name|escape}">
											{else}
												<img style="width: 80px; height: 80px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$purchase->product->name|escape}">
											{/if}
										</a>
									</td>
									<td data-title="{$lang->global_name|escape}">
										<a href="{$lang_link}products/{$purchase->product->url}" class="text-decoration-none">{$purchase->product->name|escape}</a></br>
										{$purchase->variant->color|escape} {if $purchase->variant->color && $purchase->variant->name}/{/if} {$purchase->variant->name|escape}
									</td>
									<td data-title="{$lang->global_price|escape}">
										{if $purchase->variant->compare_price > 0}
											<div class="text-muted">
												<del>
													<small>
														{$purchase->variant->compare_price|convert} {$currency->sign|escape}
													</small>
												</del>
											</div>
										{/if}
										<div class="{if $purchase->variant->compare_price > 0}text-danger{/if}">{($purchase->variant->price)|convert} {$currency->sign}</div>
									</td>
									<td data-title="{$lang->number|escape}">
										<select role="button" class="form-select no-validate" name="amounts[{$purchase->variant->id}]" onchange="document.cart.submit();">
											{section name=amounts start=1 loop=$purchase->variant->stock+1 step=1}
												<option value="{$smarty.section.amounts.index}" {if $purchase->amount==$smarty.section.amounts.index}selected{/if}>{$smarty.section.amounts.index} {$settings->units}</option>
											{/section}
										</select>
									</td>
									<td data-title="{$lang->sum|escape}"><strong>{($purchase->variant->price*$purchase->amount)|convert}&nbsp;{$currency->sign}</strong></td>
									<td data-title="{$lang->delete|escape}" class="pe-3">
										<a href="{$lang_link}cart/remove/{$purchase->variant->id}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->delete|escape}">
											<i class="far fa-trash-can"></i>
										</a>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>

				{* Delivery *}
				{if $deliveries}
					<h2 class="my-4 h4">{$lang->select_delivery_method|escape}</h2>
					<div id="accordionDelivery">
						{foreach $deliveries as $delivery}
							<div id="delivery" class="card my-2">
								<div class="card-header">
									<h5 class="mb-0">
										<div class="form-check">
											<label role="button" class="form-check-label">
												<input role="button" type="radio" class="{$delivery->module} form-check-input no-validate" onclick="change_payment_method({$delivery->id})" name="delivery_id" value="{$delivery->id}" data-bs-toggle="collapse" data-bs-target="#collapseDelivery-{$delivery->id}" aria-expanded="true" aria-controls="collapseDelivery-{$delivery->id}" {if $delivery_id==$delivery->id}checked{elseif $delivery@first}checked{/if} id="deliveries-{$delivery->id}">
												{if $delivery->icon}
													<img class="mt-n1 me-1 align-middle" style="width: 21px; height: 21px;" src="{$config->delivery_images_dir}{$delivery->icon}" alt="{$delivery->name|escape}">
												{elseif $delivery->code}
													<i class="fad fa-{$delivery->code|escape} me-1 align-middle"></i>
												{/if}
												{$delivery->name}
												<span class="payment-price" data-separate="{if $delivery->separate_payment}1{else}0{/if}" data-cost="{if $cart->total_price < $delivery->free_from && $delivery->price > 0}{$delivery->price|convert}{elseif $cart->total_price >= $delivery->free_from}0{/if}" data-currency="{$currency->sign}">
													{if $cart->total_price < $delivery->free_from && $delivery->price > 0}
														({$delivery->price|convert}&nbsp;{$currency->sign})
													{elseif $cart->total_price >= $delivery->free_from}
														{if $delivery->separate_payment}
															({$lang->paid_separate|escape})
														{else}
															({$lang->free|escape})
														{/if}
													{/if}
												</span>
											</label>
										</div>
									</h5>
								</div>
								<div id="collapseDelivery-{$delivery->id}" class="collapse {if $delivery@first}show{/if}" aria-labelledby="heading-{$delivery->id}" data-bs-parent="#accordionDelivery">
									{if $delivery->description || $delivery->ext_module_form}
										<div class="card-body">
											{* Description *}
											{if $delivery->description}
												{$delivery->description}
											{/if}
											{* Module *}
											{if $delivery->ext_module_form}
												{$delivery->ext_module_form}
											{/if}
										</div>
									{/if}
								</div>
							</div>
						{/foreach}
					</div>

					{* Payments *}
					<h2 class="my-4 h4">{$lang->select_payment_method|escape}</h2>
					<div id="accordionPayment">
						{foreach $deliveries as $delivery}
							{if $delivery->payment_methods}
								<div class="delivery-payment" id="delivery-payment-{$delivery->id}" style="display:none">
									{foreach  $delivery->payment_methods as $payment_method}
										<div id="list_payment_{$payment_method->id}" class="card my-2">
											<div class="card-header">
												<h5 class="mb-0">
													<div class="form-check">
														<label role="button" for="payment-{$delivery->id}-{$payment_method->id}" class="form-check-label">
															<input role="button" type="radio" class="form-check-input no-validate" name="payment_method_id" value="{$payment_method->id}" data-bs-toggle="collapse" data-bs-target="#collapsePayment-{$payment_method->id}" aria-expanded="true" aria-controls="collapsePayment-{$payment_method->id}" {if $payment_method@first}checked{/if} id="payment-{$delivery->id}-{$payment_method->id}">
															{if $payment_method->icon}
																<img class="mt-n1 me-1 align-middle" style="width: 21px; height: 21px;" src="{$config->payment_images_dir}{$payment_method->icon}" alt="{$payment_method->name|escape}">
															{elseif $payment_method->code}
																<i class="fad fa-{$payment_method->code|escape} me-1 align-middle"></i>
															{/if}
															{$payment_method->name}, {$lang->to_pay_small|escape}
															{$total_price_with_delivery = $cart->total_price}
															{if !$delivery->separate_payment && $cart->total_price < $delivery->free_from}
																{$total_price_with_delivery = $cart->total_price + $delivery->price}
															{/if}
															<strong>{$total_price_with_delivery|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}</strong>
														</label>
													</div>
												</h5>
											</div>
											<div id="collapsePayment-{$payment_method->id}" class="collapse {if $payment_method@first}show{/if}" aria-labelledby="headingPayment-{$payment_method->id}" data-bs-parent="#accordionPayment">
												{if $payment_method->description}
													<div class="card-body">
														{$payment_method->description}
													</div>
												{/if}
											</div>
										</div>
									{/foreach}
								</div>
							{/if}
						{/foreach}
					</div>
				{/if}

				{* Form Data *}
				<div class="mb-3">
					<h2 class="my-4 h4">{$lang->address_recipient|escape}</h2>
					{if $error}
						<div class="alert alert-danger" role="alert">
							{if $error == 'empty_name'}{$lang->enter_your_name|escape}{/if}
							{if $error == 'empty_email'}{$lang->enter_your_email|escape}{/if}
							{if $error == 'captcha'}{$lang->captcha_incorrect|escape}{/if}
						</div>
					{/if}
					<div class="mb-3">
						<label for="cart-name" class="form-label">{$lang->global_full_name|escape}<span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="name" id="cart-name" value="{$name|escape}" placeholder="{$lang->enter_your_name|escape}" required>
						<div class="invalid-feedback">{$lang->enter_your_name|escape}</div>
					</div>
					<div class="mb-3">
						<label for="cart-email" class="form-label">Email<span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="email" id="cart-email" value="{$email|escape}" placeholder="{$lang->enter_your_email|escape}" required>
						<div class="invalid-feedback">{$lang->enter_your_email|escape}</div>
					</div>
					<div class="mb-3">
						<label for="cart-phone" class="form-label">{$lang->phone|escape}</label>
						<input type="text" class="form-control" name="phone" id="cart-phone" value="{$phone|escape}" placeholder="{$lang->enter_phone_number|escape}">
					</div>
					<div class="mb-3">
						<label for="cart-address" class="form-label">{$lang->delivery_address|escape}</label>
						<input type="text" class="form-control" name="address" id="cart-address" value="{$address|escape}" placeholder="{$lang->enter_the_address|escape}">
					</div>
					<div class="mb-3">
						<label for="cart-comment" class="form-label">{$lang->comment|escape}</label>
						<textarea class="form-control" name="comment" id="cart-comment" placeholder="{$lang->enter_a_comment|escape}" rows="4">{$comment|escape}</textarea>
						<div class="invalid-feedback">{$lang->enter_a_comment|escape}</div>
					</div>
					{if $settings->captcha_cart}
						<div class="row">
							<label for="cart-captcha" class="form-label">{$lang->captcha|escape}<span class="text-danger">*</span></label>
							<div class="col-md-2 pb-3">
								{get_captcha var="captcha_cart"}
								<div class="secret-number">{$captcha_cart[0]|escape} + ? = {$captcha_cart[1]|escape}</div>
							</div>
							<div class="col-md-10">
								<input type="text" id="cart-captcha" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha|escape}" autocomplete="off" required>
								<div class="invalid-feedback">{$lang->enter_captcha|escape}</div>
							</div>
						</div>
					{/if}
				</div>
			</div>

			<div class="col-xl-3">
				<div class="sticky">
					{* Coupon *}
					<div class="card mb-4">
						<div class="card-body d-flex justify-content-between align-items-center">
							<h6 class="card-title">{$lang->promo_codes|escape}</h6>
							<div class="btn btn-link text-decoration-none" data-bs-toggle="collapse" data-bs-target="#cardCollapse">
								<i class="far fa-plus-large me-2"></i>
								{$lang->global_show|escape}
							</div>
						</div>

						<div id="cardCollapse" class="collapse">
							<div class="card-body">
								<input class="form-control no-validate mb-3" placeholder="{$lang->enter_coupon_code|escape}" type="text" name="coupon_code" value="{$cart->coupon->code|default:''|escape}">
								<button class="btn btn-primary w-100" type="button" name="apply_coupon" value="{$lang->apply_coupon|escape}" onclick="document.cart.submit();">{$lang->apply_coupon|escape}</button>
							</div>
						</div>
					</div>

					{if $coupon_error}
						<div class="alert alert-danger" role="alert">
							{if $coupon_error == 'invalid'}{$lang->coupon_is_invalid|escape}{/if}
						</div>
					{/if}

					{if $cart->coupon && $cart->coupon->min_order_price > 0}
						<div class="alert alert-info" role="alert">
							{$lang->coupon|escape} {$cart->coupon->code|escape} {$lang->coupon_valid|escape} {$cart->coupon->min_order_price|convert} {$currency->sign}
						</div>
					{/if}

					<div class="card bg-body-emphasis">
						<div class="card-body">
							<h4 class="card-title">{$lang->total|escape}</h4>
							<ul class="list-unstyled mb-4">
								{* Weight *}
								{if $cart->total_weight}
									<li class="d-flex justify-content-between align-items-center">
										<span class="text-secondary">{$lang->weight|escape}</span>
										<strong>{$cart->total_weight} {$settings->weight_units}</strong>
									</li>
								{/if}

								{* Sum *}
								<li class="d-flex justify-content-between align-items-center">
									<span class="text-secondary">{$lang->sum|escape}</span>
									<strong>{$cart->total_cart|convert}&nbsp;{$currency->sign}</strong>
								</li>

								{* Discount *}
								{if $user && $user->discount}
									<li class="d-flex justify-content-between align-items-center">
										<span class="text-secondary">{$lang->discount|escape}</span>
										<strong>{$user->discount}&nbsp;%</strong>
									</li>
								{/if}

								{* Coupon Sum *}
								{if $cart->coupon_discount > 0}
									<li class="d-flex justify-content-between align-items-center">
										<span class="text-secondary">{$lang->coupon|escape}</span>
										<strong>&minus;{$cart->coupon_discount|convert}&nbsp;{$currency->sign}</strong>
									</li>
								{/if}

								{* Delivery Sum *}
								<li class="d-flex justify-content-between align-items-center">
									<span class="text-secondary">{$lang->global_delivery|escape}</span>
									<strong data-delivery-cost="{$lang->free|escape}" data-delivery-separate="{$lang->paid_separate|escape}" id="cart-delivery-cost"></strong>
								</li>
							</ul>
							{* Total *}
							<div class="d-flex justify-content-between align-items-center mb-3">
								<span id="cart-produts-cost" class="text-secondary" data-cost="{$cart->total_price|convert}">{$lang->for_payment|escape}</span>
								<strong id="cart-total-cost" class="fs-4">{$cart->total_price|convert}&nbsp;{$currency->sign}</strong>
							</div>
							<button class="btn btn-success w-100" type="submit" name="checkout">{$lang->confirm_order|escape}</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
{else}
	<div class="d-flex">
		<div class="m-auto text-center">
			<svg xmlns="http://www.w3.org/2000/svg" width="129.188" height="114.562" viewBox="0 0 129.188 114.562">
				<defs>
					<style>
						.cls-1 {
							fill-rule: evenodd;
							opacity: 0.3;
						}
					</style>
				</defs>
				<path class="cls-1" d="M710.628,516.914a12.689,12.689,0,0,0,0,25.378A12.689,12.689,0,1,0,710.628,516.914Zm67.374,0a12.689,12.689,0,1,0,0,25.378A12.689,12.689,0,0,0,778,516.914Zm19.942-70.42a5.206,5.206,0,0,0-4.068-1.949H698.271L693.3,431.107a5.206,5.206,0,0,0-4.88-3.4H675.11a5.206,5.206,0,0,0,0,10.411h9.683L709.557,505a5.2,5.2,0,0,0,4.88,3.389c0.207,0,.417-0.013.624-0.027l69.421-8.331a5.218,5.218,0,0,0,4.473-4.046l10.019-45.108A5.215,5.215,0,0,0,797.944,446.494Zm-14.018,24.079h-20.8V454.956H787.4Zm-46.826,0V454.956h20.825v15.617H737.1Zm20.825,5.205v16.953L737.1,495.225V475.771h20.825v0.007Zm-26.031-20.822v15.617H707.906l-5.781-15.617h29.769Zm-22.059,20.822h22.059v20.084l-14,1.681Zm53.3,16.329V475.778h19.643l-3.186,14.35Z" transform="translate(-669.906 -427.719)" />
			</svg>
			<p class="mt-4 fs-4 fw-bold">{$lang->cart_no_products|escape}</p>
			<a href="{if $lang_link}{$lang_link}{else}/{/if}" class="btn btn-link">{$lang->return_to_home|escape}</a>
		</div>
	</div>
{/if}