{* Order Page *}

{* Meta Title *}
{$meta_title = "`$lang->email_order_title` `$order->id`" scope=global}

{* Page Title *}
<h1 class="my-4">
	{$lang->email_order_title|escape}{$order->id}
	{if $order->status == 0}
		{$lang->accepted|escape}
	{/if}
	{if $order->status == 1}
		{$lang->in_processing|escape}
	{elseif $order->status == 2}
		{$lang->completed|escape}
	{/if}
	{if $order->paid == 1}
		(<span class="text-success">{$lang->paid|escape}</span>)
	{/if}
</h1>

<fieldset>
	{* Purchases *}
	<table class="table cart-table">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th>{$lang->global_name|escape}</th>
				<th>{$lang->global_price|escape}</th>
				<th>{$lang->number|escape}</th>
				<th>{$lang->sum|escape}</th>
			</tr>
		</thead>
		<tbody>
			{foreach $purchases as $purchase}
				<tr>
					<td class="text-center">
						<a href="{$lang_link}products/{$purchase->product->url}">
							{if $purchase->product->images}
								{$image = $purchase->product->images|first}
								<img src="{$image->filename|resize:116:116}" alt="{$purchase->product->name|escape}">
							{else}
								<img style="width: 116px; height: 116px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$purchase->product->name|escape}">
							{/if}
						</a>
					</td>
					<td data-title="{$lang->global_name|escape}">
						<a class="text-decoration-none" href="{$lang_link}products/{$purchase->product->url}">{$purchase->product->name|escape}</a></br>
						{$purchase->variant->color|escape} {if $purchase->variant->color && $purchase->variant->name}/{/if} {$purchase->variant->name|escape}
						{if $order->paid && $purchase->variant->attachment}
							<a class="btn btn-success btn-sm mt-3" href="{$lang_link}order/{$order->url}/{$purchase->variant->attachment}"><i class="fal fa-arrow-down-to-square me-1"></i>{$lang->download|escape}</a>
						{/if}
						{if $order->paid && $purchase->variant->attachment_url}
							<a class="btn btn-primary btn-sm mt-3" href="{$purchase->variant->attachment_url}" target="_blank"><i class="fal fa-arrow-up-right-from-square me-1"></i>{$lang->download|escape}</a>
						{/if}
					</td>
					<td data-title="{$lang->global_price|escape}">{($purchase->price)|convert}&nbsp;{$currency->sign}</td>
					<td data-title="{$lang->number|escape}">&times; {$purchase->amount}&nbsp;{$settings->units}</td>
					<td data-title="{$lang->sum|escape}"><strong>{($purchase->price*$purchase->amount)|convert}&nbsp;{$currency->sign}</strong></td>
				</tr>
			{/foreach}
		</tbody>
	</table>

	{* Weight *}
	{if $order->weight> 0}
		<div class="cart-foot text-end">
			<div class="cart-total">
				<div class="order-total">
					<strong>{$lang->weight|escape}:</strong>
					<strong>{$order->weight} {$settings->weight_units}</strong>
				</div>
			</div>
		</div>
	{/if}

	{* Sum *}
	<div class="cart-foot text-end">
		<div class="cart-total">
			<div class="order-total">
				<strong>{$lang->sum|escape}:</strong>
				{$total_sum = $order->total_price - $order->delivery_price + $order->coupon_discount + $order->discount}
				<strong>{$total_sum|convert}&nbsp;{$currency->sign}</strong>
			</div>
		</div>
	</div>

	{* Discount *}
	{if $order->discount> 0}
		<div class="cart-foot text-end">
			<div class="cart-total">
				<div class="order-total">
					<strong>{$lang->discount|escape}:</strong>
					<strong>{$order->discount}&nbsp;%</strong>
				</div>
			</div>
		</div>
	{/if}

	{* Coupon *}
	{if $order->coupon_discount> 0}
		<div class="cart-foot text-end">
			<div class="cart-total">
				<div class="order-total">
					<strong>{$lang->coupon|escape}:</strong>
					<strong>&minus;{$order->coupon_discount|convert}&nbsp;{$currency->sign}</strong>
				</div>
			</div>
		</div>
	{/if}

	{* Delivery *}
	{if $order->total_price < $delivery->free_from && $delivery->price > 0}
		<div class="cart-foot text-end">
			<div class="cart-total">
				<div class="order-total">
					<strong>{$lang->global_delivery|escape}:</strong>
					<strong>{$order->delivery_price|convert}&nbsp;{$currency->sign}</strong>
				</div>
			</div>
		</div>
	{elseif $order->total_price >= $delivery->free_from}
		{if $delivery->separate_payment}
			{* Separate Delivery *}
			<div class="cart-foot text-end">
				<div class="cart-total">
					<div class="order-total">
						<strong>{$lang->global_delivery|escape}:</strong>
						<strong>{$lang->paid_separate|escape}</strong>
					</div>
				</div>
			</div>
		{else}
			{* Delivery Free *}
			<div class="cart-foot text-end">
				<div class="cart-total">
					<div class="order-total">
						<strong>{$lang->global_delivery|escape}:</strong>
						<strong>{$lang->free|escape}</strong>
					</div>
				</div>
			</div>
		{/if}
	{/if}

	{* Total *}
	<div class="cart-foot text-end">
		<div class="cart-total">
			<div class="order-total h5">
				<strong>{$lang->total|escape}:</strong>
				<strong>{$order->total_price|convert}&nbsp;{$currency->sign}</strong>
			</div>
		</div>
	</div>

	{* Order Details *}
	<h2>{$lang->order_details|escape}</h2>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<td scope="row">
					{$lang->order_date|escape}
				</td>
				<td>
					{$order->date|date} {$lang->at|escape}
					{$order->date|time}
				</td>
			</tr>
			{if $order->name}
				<tr>
					<td scope="row">
						{$lang->name|escape}
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
						{$lang->phone|escape}
					</td>
					<td>
						{$order->phone|escape}
					</td>
				</tr>
			{/if}
			{if $delivery}
				<tr>
					<td scope="row">
						{$lang->delivery_method|escape}
					</td>
					<td>
						{$delivery->name|escape}
					</td>
				</tr>
			{/if}
			{if $order->address}
				<tr>
					<td scope="row">
						{$lang->delivery_address|escape}
					</td>
					<td>
						{$order->address|escape}
					</td>
				</tr>
			{/if}
			{if $order->comment}
				<tr>
					<td scope="row">
						{$lang->comment|escape}
					</td>
					<td>
						{$order->comment|escape|nl2br}
					</td>
				</tr>
			{/if}
		</tbody>
	</table>

	{if !$order->paid}
		{* Choosing Payment Method *}
		{if !$payment_method && $order->total_price > 0}
			<form method="post">
				<h2>{$lang->select_a_payment_method|escape}</h2>
				<div id="accordion">
					{foreach $payment_methods as $payment_method}
						<div class="card my-2">
							<div class="card-header">
								<h5 class="mb-0">
									<div class="form-check">
										<label role="button" for="payment-{$payment_method->id}" class="form-check-label">
											<input role="button" type="radio" class="form-check-input {if $payment_method@first}collapsed{/if}" name="payment_method_id" value="{$payment_method->id}" data-bs-toggle="collapse" data-bs-target="#collapse-{$payment_method->id}" aria-expanded="true" aria-controls="collapse{$payment_method->id}" {if $payment_method@first}checked{/if} id="payment-{$payment_method->id}">
											{if $payment_method->icon}
												<img class="mt-n1 me-1 align-middle" style="width: 21px; height: 21px;" src="{$config->payment_images_dir}{$payment_method->icon}" alt="{$payment_method->name|escape}">
											{elseif $payment_method->code}
												<i class="fal fa-{$payment_method->code|escape} me-1 align-middle"></i>
											{/if}
											{$payment_method->name}, {$lang->to_pay_small|escape} {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}
										</label>
									</div>
								</h5>
							</div>
							<div id="collapse-{$payment_method->id}" class="collapse {if $payment_method@first}show{/if}" aria-labelledby="heading-{$payment_method->id}" data-bs-parent="#accordion">
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
					<input type="submit" class="btn btn-success btn-lg float-end" value="{$lang->finish_the_order|escape}">
				</div>
			</form>
			{* Selected Payment Method *}
		{elseif $payment_method}
			<h2 class="mb-3">
				{$lang->payment_method|escape} &mdash;
				{if $payment_method->icon}
					<img class="mt-n1 align-middle" style="width: 32px; height: 32px;" src="{$config->payment_images_dir}{$payment_method->icon}" alt="{$payment_method->name|escape}">
				{elseif $payment_method->code}
					<i class="fad fa-{$payment_method->code|escape} align-middle"></i>
				{/if}
				{$payment_method->name}
			</h2>
			<form method="post">
				<input type="submit" class="btn btn-primary mb-3" name="reset_payment_method" value="{$lang->choose_payment|escape}">
			</form>
			<div class="mb-3">{$payment_method->description}</div>
			<h2 class="mb-3">
				{$lang->to_pay|escape} {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}
			</h2>
			{* Payment Module *}
			{checkoutForm order_id=$order->id module=$payment_method->module}
		{/if}
	{/if}
</fieldset>