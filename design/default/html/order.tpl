{* Order page *}

{$meta_title = "`$lang->email_order_title` `$order->id`" scope=global}

<!-- Breadcrumb /-->
<nav class="mt-4" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="{if $lang_link}{$lang_link}{else}/{/if}">{$lang->home}</a></li>
		<li class="breadcrumb-item active" aria-current="page">{$lang->order_page}</li>
	</ol>
</nav>
<!-- Breadcrumb #End /-->

{* Page title *}
<h1 class="my-4">
	{$lang->email_order_title}{$order->id}
	{if $order->status == 0}
		{$lang->accepted}
	{/if}
	{if $order->status == 1}
		{$lang->in_processing}
	{elseif $order->status == 2}
		{$lang->completed}
	{/if}
	{if $order->paid == 1}
		, {$lang->paid}
	{else}
	{/if}
</h1>

<fieldset>
	<table class="table cart-table">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th>{$lang->general_name}</th>
				<th>{$lang->general_price}</th>
				<th>{$lang->number}</th>
				<th>{$lang->sum}</th>
			</tr>
		</thead>
		<tbody>
			{foreach $purchases as $purchase}
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
						<a class="text-decoration-none" href="{$lang_link}products/{$purchase->product->url}">{$purchase->product->name|escape}</a></br>
						{if $purchase->variant->color}{$purchase->variant->color|escape} / {/if}{$purchase->variant->name|escape}
					</td>
					<td data-title="{$lang->general_price}">{($purchase->price)|convert}&nbsp;{$currency->sign}</td>
					<td data-title="{$lang->number}">
						&times; {$purchase->amount}&nbsp;{$settings->units}
					</td>
					<td data-title="{$lang->sum}"><b>{($purchase->price*$purchase->amount)|convert}&nbsp;{$currency->sign}</b></td>
				</tr>
			{/foreach}
		</tbody>
	</table>
	{* Discount if available *}
	{if $order->discount> 0}
		<div class="cart-foot text-end">
			<div class="cart-total">
				<div class="order-total">
					<strong>{$lang->discount}:</strong>
					<strong>{$order->discount}&nbsp;%</strong>
				</div>
			</div>
		</div>
	{/if}
	{* Weight *}
	{if $order->weight> 0}
		<div class="cart-foot text-end">
			<div class="cart-total">
				<div class="order-total">
					<strong>{$lang->weight}:</strong>
					<strong>{$order->weight} {$settings->weight_units}</strong>
				</div>
			</div>
		</div>
	{/if}
	{* Coupon if any *}
	{if $order->coupon_discount> 0}
		<div class="cart-foot text-end">
			<div class="cart-total">
				<div class="order-total">
					<strong>{$lang->coupon}:</strong>
					<strong>&minus;{$order->coupon_discount|convert}&nbsp;{$currency->sign}</strong>
				</div>
			</div>
		</div>
	{/if}
	{* If the shipping cost is included in the order amount *}
	{if !$order->separate_delivery && $order->delivery_price>0}
		<div class="cart-foot text-end">
			<div class="cart-total">
				<div class="order-total">
					<strong>{$delivery->name|escape}:</strong>
					<strong>{$order->delivery_price|convert}&nbsp;{$currency->sign}</strong>
				</div>
			</div>
		</div>
	{/if}
	{* Total *}
	<div class="cart-foot text-end">
		<div class="cart-total">
			<div class="order-total">
				<strong>{$lang->total}:</strong>
				<strong>{$order->total_price|convert}&nbsp;{$currency->sign}</strong>
			</div>
		</div>
	</div>
	{* If the shipping cost is not included in the order amount *}
	{if $order->separate_delivery}
		<div class="cart-foot text-end">
			<div class="cart-total">
				<div class="order-total">
					<strong>{$delivery->name|escape}:</strong>
					<strong>{$order->delivery_price|convert}&nbsp;{$currency->sign}</strong>
				</div>
			</div>
		</div>
	{/if}
	{* Order details *}
	<h2>{$lang->order_details}</h2>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<td scope="row">
					{$lang->order_date}
				</td>
				<td>
					{$order->date|date} {$lang->at}
					{$order->date|time}
				</td>
			</tr>
			{if $order->name}
				<tr>
					<td scope="row">
						{$lang->name}
					</td>
					<td>
						{$order->name|escape}
					</td>
				</tr>
			{/if}
			{if $order->email}
				<tr>
					<td scope="row">
						Email
					</td>
					<td>
						{$order->email|escape}
					</td>
				</tr>
			{/if}
			{if $order->phone}
				<tr>
					<td scope="row">
						{$lang->phone}
					</td>
					<td>
						{$order->phone|escape}
					</td>
				</tr>
			{/if}
			{if $order->address}
				<tr>
					<td scope="row">
						{$lang->delivery_address}
					</td>
					<td>
						{$order->address|escape}
					</td>
				</tr>
			{/if}
			{if $order->comment}
				<tr>
					<td scope="row">
						{$lang->comment}
					</td>
					<td>
						{$order->comment|escape|nl2br}
					</td>
				</tr>
			{/if}
		</tbody>
	</table>
	{if !$order->paid}
		{* Choosing a payment method *}
		{if $payment_methods && !$payment_method && $order->total_price>0}
			<form method="post">
				<h2>{$lang->select_a_payment_method}</h2>
				<div id="accordion">
					{foreach $payment_methods as $payment_method name=foo}
						<div class="card my-2">
							<div class="card-header" id="headingOne">
								<h5 class="mb-0">
									<div class="form-check">
										<label for="payment_{$payment_method->id}" class="form-check-label">
											<input type="radio" class="form-check-input {if !$smarty.foreach.foo.first}collapsed{/if}" name="payment_method_id" value="{$payment_method->id}" data-bs-toggle="collapse" data-bs-target="#collapse{$payment_method->id}" aria-expanded="true" aria-controls="collapse{$payment_method->id}" {if $payment_method@first}checked{/if} id="payment_{$payment_method->id}">
											{$payment_method->name}, {$lang->to_pay_small} {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}
										</label>
									</div>
								</h5>
							</div>
							<div id="collapse{$payment_method->id}" class="collapse {if $smarty.foreach.foo.first}show{/if}" aria-labelledby="heading{$payment_method->id}" data-parent="#accordion">
								{if $payment_method->description}
									<div class="card-body">
										{$payment_method->description}
									</div>
								{/if}
							</div>
						</div>
					{/foreach}
				</div>
				<div class="mt-3">
					<input type="submit" class="btn btn-success btn-lg float-end" value="{$lang->finish_order}">
				</div>
			</form>
			{* Selected payment method *}
		{elseif $payment_method}
			<h2>{$lang->payment_method} &mdash; {$payment_method->name}</h2>
			<form method="post"><input type="submit" class="btn btn-primary" name="reset_payment_method" value="{$lang->choose_payment}"></form>
			<p>
				{$payment_method->description}
			</p>
			<h2>
				{$lang->to_pay} {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}
			</h2>
			{* Payment form generated by the payment module *}
			{checkout_form order_id=$order->id module=$payment_method->module}
		{/if}
	{/if}
</fieldset>