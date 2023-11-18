{* Registered User *}

{* Breadcrumb *}
<nav class="mt-4" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="{if $lang_link}{$lang_link}{else}/{/if}"><i class="fal fa-house me-2"></i>{$lang->home}</a>
		</li>
		<li class="breadcrumb-item active" aria-current="page">{$user->name|escape}</li>
	</ol>
</nav>

{* Page Title *}
<h1 class="mt-4">{$user->name|escape}</h1>

{* Discount *}
<h5>
	{if isset($group) && $group->discount > 0}
		{$lang->your_discount} &mdash; {$group->discount}%
	{/if}
</h5>

{* Error *}
{if isset($error)}
	<div class="alert alert-danger" role="alert">
		{if $error == 'empty_name'}
			{$lang->enter_your_name}
		{elseif $error == 'empty_email'}
			{$lang->enter_your_email}
		{elseif $error == 'empty_password'}
			{$lang->enter_password}
		{elseif $error == 'user_exists'}
			{$lang->email_already_registered}
		{else}
			{$error}
		{/if}
	</div>
{/if}

{* Success *}
{if isset($success)}
	<div class="alert alert-success" role="alert">
		{$lang->message_success}
	</div>
{/if}

<div class="col-md-6 offset-md-3">
	<form class="form-horizontal needs-validation mt-4" role="form" method="post" novalidate>
		<div class="mb-3">
			<label for="name" class="form-label">{$lang->name}<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="name" id="name" value="{if isset($name)}{$name|escape}{/if}" placeholder="{$lang->enter_your_name}" maxlength="255" required>
			<div class="invalid-feedback">{$lang->enter_your_name}</div>
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">Email<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="email" id="email" value="{if isset($email)}{$email|escape}{/if}" placeholder="{$lang->enter_your_email}" maxlength="255" required>
			<div class="invalid-feedback">{$lang->enter_your_email}</div>
		</div>
		<div class="mb-3">
			<label for="phone" class="form-label">{$lang->phone}</label>
			<input type="text" class="form-control" name="phone" id="phone" value="{if isset($phone)}{$phone|escape}{/if}" placeholder="{$lang->enter_phone_number}" maxlength="255">
		</div>
		<div class="mb-3">
			<label for="address" class="form-label">{$lang->address}</label>
			<input type="text" class="form-control" name="address" id="address" value="{if isset($address)}{$address|escape}{/if}" placeholder="{$lang->enter_the_address}" maxlength="255">
		</div>
		<div class="mb-3">
			<label for="password" class="form-label"><a class="text-decoration-none" data-bs-toggle="collapse" href="#collapsePassword" role="button" aria-expanded="false" aria-controls="collapsePassword">{$lang->change_password}</a></label>
			<div class="collapse" id="collapsePassword">
				<input type="password" class="form-control" name="password" id="password" value="">
			</div>
		</div>
		<div class="mt-3">
			<div class="col-sm-offset-2">
				<input type="submit" class="btn btn-primary" value="{$lang->save}">
			</div>
		</div>
	</form>
</div>

{* Orders *}
{if $orders}
	<h4 class="mt-5">{$lang->your_orders}</h4>
	<ul class="list-group list-group-flush">
		{foreach $orders as $order}
			<li class="list-group-item">
				{$order->date|date} <a href='{$lang_link}order/{$order->url}'>{$lang->global_order}{$order->id}</a>
				{if $order->paid == 1}{$lang->paid},{/if}
				{if $order->status == 0}
					{$lang->waiting_processing}
				{elseif $order->status == 1}
					{$lang->in_processing}
				{elseif $order->status == 2}
					{$lang->completed}
				{/if}
			</li>
		{/foreach}
	</ul>
{/if}