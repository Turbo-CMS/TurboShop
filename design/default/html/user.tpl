{* Registered User Page Template *}

<!-- Breadcrumb /-->
<nav class="mt-4" aria-label="breadcrumb">
    <ol class="breadcrumb bg-light">
        <li class="breadcrumb-item"><a href="{if $lang_link}{$lang_link}{else}/{/if}">{$lang->home}</a></li>
        <li class="breadcrumb-item active" aria-current="page">{$user->name|escape}</li>
    </ol>
</nav>
<!-- Breadcrumb #End /-->

<h1 class="mt-4">{$user->name|escape}</h1>

<h5>{if $group->discount>0}{$lang->your_discount} &mdash; {$group->discount}%{/if}</h5>

{if $error}
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

<div class="col-md-6 offset-md-3">
    <form class="form-horizontal mt-4" role="form" method="post">
        <div class="form-group">
            <label for="comment_name">{$lang->name}</label>
            <input class="form-control" data-format=".+" data-notice="{$lang->enter_your_name}" placeholder="{$lang->enter_your_name}" value="{$name|escape}" name="name" maxlength="255" type="text" />
        </div>
        <div class="form-group">
            <label for="comment_name">Email</label>
            <input data-format="email" class="form-control" data-notice="{$lang->enter_your_email}" placeholder="{$lang->enter_your_email}" value="{$email|escape}" name="email" maxlength="255" type="text" />
        </div>
        <div class="form-group">
            <label for="comment_name">{$lang->phone}</label>
            <input class="form-control" data-notice="{$lang->enter_phone_number}" placeholder="{$lang->enter_phone_number}" value="{$phone|escape}" name="phone" maxlength="255" type="text" />
        </div>
        <div class="form-group">
            <label for="comment_name">{$lang->address}</label>
            <input class="form-control" data-notice="{$lang->enter_the_address}" placeholder="{$lang->enter_the_address}" value="{$address|escape}" name="address" maxlength="255" type="text" />
        </div>
        <div class="form-group">
            <label for="comment_name"><a href='#' onclick="$('#password').show();return false;">{$lang->change_password}</a></label>
            <input id="password" class="form-control" value="" name="password" type="password" style="display:none;" />
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2">
                <input class="btn btn-primary" type="submit" value="{$lang->save}" />
            </div>
        </div>
    </form>
</div>

{if $orders}
    <h4 class="mt-5">{$lang->your_orders}</h4>
    <ul class="list-group list-group-flush">
        {foreach $orders as $order}
            <li class="list-group-item">
                {$order->date|date} <a href='{$lang_link}order/{$order->url}'>{$lang->index_order}{$order->id}</a>
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