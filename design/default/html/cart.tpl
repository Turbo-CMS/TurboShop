{* Cart template *}

{$meta_title = $lang->global_cart scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="https://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}cart/"><span itemprop="name">{$lang->global_cart}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
	</ol>
</nav>
<!-- Breadcrumb #End /-->

<div class="row my-4">
	<div class="col-lg-12 mt-2">
		{* Page title *}
		<h1 class="">{$lang->global_cart} ({$cart->total_products})</h1>
	</div>
	{if $cart->purchases}
		<div class="col-lg-12 mt-2">
			<div class="float-end">
				<a class="btn btn-primary btn-sm" href="{url empty=1}"><i class="fal fa-trash-alt"></i> <span>{$lang->empty_trash}</span></a>
			</div>
		</div>
	{/if}
</div>
<fieldset>
	{if $cart->purchases}
		<form method="post" id="FormValidation" name="cart">
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
							<td>
								{$img_flag=0}
								{$image_array=","|explode:$purchase->variant->images_ids}
								{foreach $purchase->product->images as $image}
									{if $image->id|in_array:$image_array}
										{if $img_flag==0}{$image_toshow=$image}{/if}
										{$img_flag=1}
									{/if}
								{/foreach}
								{if $img_flag ne 0}
									<a href="{$lang_link}products/{$purchase->product->url}"><img src="{$image_toshow->filename|resize:116:116}" alt="{$product->name|escape}"></a>
								{else}
									{$image = $purchase->product->images|first}
									{if $image}
										<a href="{$lang_link}products/{$purchase->product->url}"><img src="{$image->filename|resize:116:116}" alt="{$product->name|escape}"></a>
									{else}
										<a href="{$lang_link}products/{$purchase->product->url}"><img style="width: 116px; height: 116px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}"></a>
									{/if}
								{/if}
							</td>
							<td data-title="{$lang->general_name}">
								<a href="{$lang_link}products/{$purchase->product->url}" class="text-decoration-none">{$purchase->product->name|escape}</a></br>
								{if $purchase->variant->color}{$purchase->variant->color|escape} / {/if}{$purchase->variant->name|escape}
							</td>
							<td data-title="{$lang->general_price}">{($purchase->variant->price)|convert} {$currency->sign}</td>
							<td data-title="{$lang->number}">
								<select class="form-select" name="amounts[{$purchase->variant->id}]" onchange="document.cart.submit();">
									{section name=amounts start=1 loop=$purchase->variant->stock+1 step=1}
										<option value="{$smarty.section.amounts.index}" {if $purchase->amount==$smarty.section.amounts.index}selected{/if}>{$smarty.section.amounts.index} {$settings->units}</option>
									{/section}
								</select>
							</td>
							<td data-title="{$lang->sum}"><b>{($purchase->variant->price*$purchase->amount)|convert}&nbsp;{$currency->sign}</b></td>
							<td data-title="{$lang->delete}"><a href="{$lang_link}cart/remove/{$purchase->variant->id}"><i class="fal fa-trash-alt"></i></a></td>
						</tr>
					{/foreach}
				</tbody>
			</table>
			{if $coupon_error}
				<div class="alert alert-danger" role="alert">
					{if $coupon_error == 'invalid'}{$lang->coupon_is_invalid}{/if}
				</div>
			{/if}
			{if $cart->coupon->min_order_price>0}
				<div class="alert alert-primary" role="alert">
					{$lang->coupon} {$cart->coupon->code|escape} {$lang->coupon_valid} {$cart->coupon->min_order_price|convert} {$currency->sign}
				</div>
			{/if}
			<div class="row">
				<div class="col-lg-6">
					<div class="input-group mb-3">
						<input class="form-control" placeholder="{$lang->enter_coupon_code}" type="text" name="coupon_code" value="{$cart->coupon->code|escape}">
						<input type="button" class="btn btn-primary" name="apply_coupon" value="{$lang->apply_coupon}" onclick="document.cart.submit();">
					</div>
				</div>
			</div>

			{if $user->discount}
				<div class="cart-foot text-end">
					<div class="cart-total">
						<div class="order-total">
							<strong>{$lang->discount}:</strong>
							<strong>{$user->discount}&nbsp;%</strong>
						</div>
					</div>
				</div>
			{/if}
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
			<div class="cart-foot text-end">
				<div class="cart-total">
					<div class="order-total">
						<strong>{$lang->total}:</strong>
						<strong>{$cart->total_price|convert}&nbsp;{$currency->sign}</strong>
					</div>
				</div>
			</div>
			{* Delivery *}
			{if $deliveries}
				<h3 class="my-4">{$lang->select_delivery_method}:</h3>
				<div id="accordion">
					{foreach $deliveries as $delivery name=foo}
						<div class="card my-2">
							<div class="card-header" id="headingOne">
								<h5 class="mb-0">
									<div class="form-check">
										<label class="form-check-label">
											<input type="radio" class="form-check-input {if !$smarty.foreach.foo.first}collapsed{/if}" name="delivery_id" value="{$delivery->id}" data-bs-toggle="collapse" data-bs-target="#collapse{$delivery->id}" aria-expanded="true" aria-controls="collapse{$delivery->id}" {if $delivery_id==$delivery->id}checked{elseif $delivery@first}checked{/if} id="deliveries_{$delivery->id}">
											{$delivery->name}
											{if $cart->total_price < $delivery->free_from && $delivery->price>0}
												({$delivery->price|convert}&nbsp;{$currency->sign})
											{elseif $cart->total_price>= $delivery->free_from}
												({$lang->free})
											{/if}
										</label>
									</div>
								</h5>
							</div>
							<div id="collapse{$delivery->id}" class="collapse {if $smarty.foreach.foo.first}show{/if}" aria-labelledby="heading{$delivery->id}" data-parent="#accordion">
								{if $delivery->description}
									<div class="card-body">
										{$delivery->description}
									</div>
								{/if}
							</div>
						</div>
					{/foreach}
				</div>
			{/if}
			<h3 class="my-3">{$lang->address_recipient}</h3>
			{if $error}
				<div class="alert alert-danger" role="alert">
					{if $error == 'empty_name'}{$lang->enter_your_name}{/if}
					{if $error == 'empty_email'}{$lang->enter_your_email}{/if}
					{if $error == 'captcha'}{$lang->captcha_incorrect}{/if}
				</div>
			{/if}
			<div class="mb-3">
				<label for="order-name">{$lang->general_full_name}</label>
				<input type="text" class="form-control" name="name" id="order-name" value="{$name|escape}" placeholder="{$lang->enter_your_name}" required>
				<div class="invalid-feedback">{$lang->enter_your_name}</div>
			</div>
			<div class="mb-3">
				<label for="order-email">Email</label>
				<input type="text" class="form-control" name="email" id="order-email" value="{$email|escape}" placeholder="{$lang->enter_your_email}" required>
				<div class="invalid-feedback">{$lang->enter_your_email}</div>
			</div>
			<div class="mb-3">
				<label for="order-phone">{$lang->phone}</label>
				<input type="text" class="form-control" name="phone" id="order-phone" value="{$phone|escape}" placeholder="{$lang->enter_phone_number}">
			</div>
			<div class="mb-3">
				<label for="order-address">{$lang->delivery_address}</label>
				<input type="text" class="form-control" name="address" id="order-address" value="{$address|escape}" placeholder="{$lang->enter_the_address}">
			</div>
			<div class="mb-3">
				<label for="order-comment">{$lang->comment}</label>
				<textarea class="form-control" name="comment" id="order-comment" placeholder="{$lang->enter_a_comment}" rows="4">{$comment|escape}</textarea>
				<div class="invalid-feedback">{$lang->enter_a_comment}</div>
			</div>
			{if $settings->captcha_cart}
				<div class="row mt-4">
					<div class="col-md-2 pb-3">
						{get_captcha var="captcha_cart"}
						<div class="secret-number">{$captcha_cart[0]|escape} + ? = {$captcha_cart[1]|escape}</div>
					</div>
					<div class="col-md-10">
						<input type="text" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha}" autocomplete="off" required>
						<div class="invalid-feedback">{$lang->enter_captcha}</div>
					</div>
				</div>
			{/if}
			<div class="mt-3">
				<button type="submit" class="btn btn-primary btn-lg float-end" name="checkout" id="btnValidation">{$lang->checkout}</button>
			</div>
		</form>
	{else}
		<p>
			{$lang->cart_no_products}
		</p>
	{/if}
</fieldset>