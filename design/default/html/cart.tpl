{* Cart Template *}

{* Canonical *}
{$meta_title = $lang->global_cart scope=global}

{* Breadcrumb *}
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="https://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}">
				<span itemprop="name" title="{$lang->home}"><i class="fal fa-house me-2"></i>{$lang->home}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}cart/">
				<span itemprop="name">{$lang->global_cart}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
	</ol>
</nav>

<div class="row my-4">
	<div class="col-lg-12 mt-2">
		{* Page title *}
		<h1>{$lang->global_cart} ({$cart->total_products})</h1>
	</div>
	{if $cart->purchases}
		<div class="col-lg-12 mt-2">
			<div class="float-end">
				<a class="btn btn-primary btn-sm" href="{url empty=1}">
					<i class="fal fa-trash"></i>
					{$lang->empty_trash}
				</a>
			</div>
		</div>
	{/if}
</div>

<fieldset>
	{if $cart->purchases}
		<form class="cart needs-validation" method="post" name="cart" novalidate>
			{* Purchases *}
			<table class="table cart-table">
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th>{$lang->general_name}</th>
						<th>{$lang->general_price}</th>
						<th>{$lang->number}</th>
						<th>{$lang->sum}</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					{foreach $cart->purchases as $purchase}
						<tr>
							<td class="text-center">
								{if isset($purchase->product->images)}
									{$img_flag=0}
									{$image_array=","|explode:$purchase->variant->images_ids}
									{foreach $purchase->product->images as $image}
										{if $image->id|in_array:$image_array}
											{if $img_flag==0}{$image_toshow=$image}{/if}
											{$img_flag=1}
										{/if}
									{/foreach}
									{if $img_flag ne 0}
										<a href="{$lang_link}products/{$purchase->product->url}">
											<img src="{$image_toshow->filename|resize:116:116}" alt="{$purchase->product->name|escape}">
										</a>
									{else}
										{$image = $purchase->product->images|first}
										{if $image}
											<a href="{$lang_link}products/{$purchase->product->url}">
												<img src="{$image->filename|resize:116:116}" alt="{$purchase->product->name|escape}">
											</a>
										{else}
											<a href="{$lang_link}products/{$purchase->product->url}">
												<img style="width: 116px; height: 116px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$purchase->product->name|escape}">
											</a>
										{/if}
									{/if}
								{/if}
							</td>
							<td data-title="{$lang->general_name}">
								<a href="{$lang_link}products/{$purchase->product->url}" class="text-decoration-none">{$purchase->product->name|escape}</a></br>
								{if $purchase->variant->color}{$purchase->variant->color|escape} / {/if}{$purchase->variant->name|escape}
							</td>
							<td data-title="{$lang->general_price}">{($purchase->variant->price)|convert} {$currency->sign}</td>
							<td data-title="{$lang->number}">
								<select role="button" class="form-select no-validate" name="amounts[{$purchase->variant->id}]" onchange="document.cart.submit();">
									{section name=amounts start=1 loop=$purchase->variant->stock+1 step=1}
										<option value="{$smarty.section.amounts.index}" {if $purchase->amount==$smarty.section.amounts.index}selected{/if}>{$smarty.section.amounts.index} {$settings->units}</option>
									{/section}
								</select>
							</td>
							<td data-title="{$lang->sum}"><strong>{($purchase->variant->price*$purchase->amount)|convert}&nbsp;{$currency->sign}</strong></td>
							<td data-title="{$lang->delete}">
								<a href="{$lang_link}cart/remove/{$purchase->variant->id}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->delete}">
									<i class="fal fa-trash text-muted"></i>
								</a>
							</td>
						</tr>
					{/foreach}
				</tbody>
			</table>

			{* Coupon *}
			{if isset($coupon_error)}
				<div class="alert alert-danger" role="alert">
					{if $coupon_error == 'invalid'}{$lang->coupon_is_invalid}{/if}
				</div>
			{/if}

			{if isset($cart->coupon->min_order_price) && $cart->coupon->min_order_price>0}
				<div class="alert alert-info" role="alert">
					{$lang->coupon} {$cart->coupon->code|escape} {$lang->coupon_valid} {$cart->coupon->min_order_price|convert} {$currency->sign}
				</div>
			{/if}

			<div class="row">
				<div class="col-lg-6">
					<div class="input-group mb-3">
						<input class="form-control no-validate" placeholder="{$lang->enter_coupon_code}" type="text" name="coupon_code" value="{if isset($cart->coupon->code)}{$cart->coupon->code|escape}{/if}">
						<input type="button" class="btn btn-primary" name="apply_coupon" value="{$lang->apply_coupon}" onclick="document.cart.submit();">
					</div>
				</div>
			</div>

			{* Weight *}
			{if $cart->total_weight}
				<div class="cart-foot text-end">
					<div class="cart-total">
						<div class="order-total">
							<strong>{$lang->weight}:</strong>
							<strong>{$cart->total_weight} {$settings->weight_units}</strong>
						</div>
					</div>
				</div>
			{/if}

			{* Sum *}
			<div class="cart-foot text-end">
				<div class="cart-total">
					<div class="order-total">
						<strong>{$lang->sum}:</strong>
						<strong>{$cart->total_cart|convert}&nbsp;{$currency->sign}</strong>
					</div>
				</div>
			</div>

			{* Discount *}
			{if isset($user->discount)}
				<div class="cart-foot text-end">
					<div class="cart-total">
						<div class="order-total">
							<strong>{$lang->discount}:</strong>
							<strong>{$user->discount}&nbsp;%</strong>
						</div>
					</div>
				</div>
			{/if}

			{* Coupon Sum *}
			{if $cart->coupon_discount>0}
				<div class="cart-foot text-end">
					<div class="cart-total">
						<div class="order-total">
							<strong>{$lang->coupon}:</strong>
							<strong>&minus;{$cart->coupon_discount|convert}&nbsp;{$currency->sign}</strong>
						</div>
					</div>
				</div>
			{/if}

			{* Delivery Sum *}
			<div class="cart-foot text-end">
				<div class="cart-total">
					<div class="order-total">
						<strong>{$lang->global_delivery}:</strong>
						<strong data-delivery-cost="{$lang->free}" data-delivery-separate="{$lang->paid_separate}" id="cart-delivery-cost"></strong>
					</div>
				</div>
			</div>

			{* Total *}
			<div class="cart-foot text-end">
				<div class="cart-total">
					<div class="order-total h5">
						<strong id="cart-produts-cost" data-cost="{$cart->total_price|convert}">{$lang->total}:</strong>
						<strong id="cart-total-cost">{$cart->total_price|convert}&nbsp;{$currency->sign}</strong>
					</div>
				</div>
			</div>

			{* Delivery *}
			{if $deliveries}
				<h3 class="my-4">{$lang->select_delivery_method}:</h3>
				<div id="accordionDelivery">
					{foreach $deliveries as $delivery}
						<div class="card my-2">
							<div class="card-header">
								<h5 class="mb-0">
									<div class="form-check">
										<label role="button" class="form-check-label">
											<input role="button" type="radio" class="{$delivery->module} form-check-input no-validate" onclick="change_payment_method({$delivery->id})" name="delivery_id" value="{$delivery->id}" data-bs-toggle="collapse" data-bs-target="#collapseDelivery-{$delivery->id}" aria-expanded="true" aria-controls="collapseDelivery-{$delivery->id}" {if isset($delivery_id) && $delivery_id==$delivery->id}checked{elseif $delivery@first}checked{/if} id="deliveries-{$delivery->id}">
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
														({$lang->paid_separate})
													{else}
														({$lang->free})
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
										{if isset($delivery->description)}
											{$delivery->description}
										{/if}
										{* Module *}
										{if isset($delivery->ext_module_form)}
											{$delivery->ext_module_form}
										{/if}
									</div>
								{/if}
							</div>
						</div>
					{/foreach}
				</div>
				{* Payments *}
				<h3 class="my-4">{$lang->select_payment_method}:</h3>
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
														{$payment_method->name}, {$lang->to_pay_small}
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
			<h3 class="my-3">{$lang->address_recipient}</h3>
			{if isset($error)}
				<div class="alert alert-danger" role="alert">
					{if $error == 'empty_name'}{$lang->enter_your_name}{/if}
					{if $error == 'empty_email'}{$lang->enter_your_email}{/if}
					{if $error == 'captcha'}{$lang->captcha_incorrect}{/if}
				</div>
			{/if}
			<div class="mb-3">
				<label for="cart-name" class="form-label">{$lang->general_full_name}<span class="text-danger">*</span></label>
				<input type="text" class="form-control" name="name" id="cart-name" value="{if isset($name)}{$name|escape}{/if}" placeholder="{$lang->enter_your_name}" required>
				<div class="invalid-feedback">{$lang->enter_your_name}</div>
			</div>
			<div class="mb-3">
				<label for="cart-email" class="form-label">Email<span class="text-danger">*</span></label>
				<input type="text" class="form-control" name="email" id="cart-email" value="{if isset($email)}{$email|escape}{/if}" placeholder="{$lang->enter_your_email}" required>
				<div class="invalid-feedback">{$lang->enter_your_email}</div>
			</div>
			<div class="mb-3">
				<label for="cart-phone" class="form-label">{$lang->phone}</label>
				<input type="text" class="form-control" name="phone" id="cart-phone" value="{if isset($phone)}{$phone|escape}{/if}" placeholder="{$lang->enter_phone_number}">
			</div>
			<div class="mb-3">
				<label for="cart-address" class="form-label">{$lang->delivery_address}</label>
				<input type="text" class="form-control" name="address" id="cart-address" value="{if isset($address)}{$address|escape}{/if}" placeholder="{$lang->enter_the_address}">
			</div>
			<div class="mb-3">
				<label for="cart-comment" class="form-label">{$lang->comment}</label>
				<textarea class="form-control" name="comment" id="cart-comment" placeholder="{$lang->enter_a_comment}" rows="4">{if isset($comment)}{$comment|escape}{/if}</textarea>
				<div class="invalid-feedback">{$lang->enter_a_comment}</div>
			</div>
			{if $settings->captcha_cart}
				<div class="row">
					<label for="cart-captcha" class="form-label">{$lang->captcha}<span class="text-danger">*</span></label>
					<div class="col-md-2 pb-3">
						{get_captcha var="captcha_cart"}
						<div class="secret-number">{$captcha_cart[0]|escape} + ? = {$captcha_cart[1]|escape}</div>
					</div>
					<div class="col-md-10">
						<input type="text" id="cart-captcha" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha}" autocomplete="off" required>
						<div class="invalid-feedback">{$lang->enter_captcha}</div>
					</div>
				</div>
			{/if}
			<div class="pt-1">
				<button type="submit" class="btn btn-primary btn-lg float-end" name="checkout">{$lang->checkout}<i class="fal fa-chevron-right ms-2"></i></button>
			</div>
		</form>
	{else}
		<div class="my-1">
			{$lang->cart_no_products}
		</div>
	{/if}
</fieldset>