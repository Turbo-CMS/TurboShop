{* Registration page *}

{* Canonical page address *}
{$canonical="/user/register" scope=global}

{$meta_title = $lang->registration scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
    <ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb bg-light">
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
            <a itemprop="item" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
            <meta itemprop="position" content="{$level++}" />
        </li>
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
            <a itemprop="item" href="{$lang_link}user/register"><span itemprop="name">{$lang->registration}</span></a>
            <meta itemprop="position" content="{$level++}" />
        </li>
    </ol>
</nav>
<!-- Breadcrumb #End /-->

<h1 class="my-4">{$lang->registration}</h1>

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
        {elseif $error == 'captcha'}
            {$lang->captcha_incorrect}
        {else}
            {$error}
        {/if}
    </div>
{/if}

<div class="col-md-6 offset-md-3">
    <span class="anchor" id="formLogin"></span>
    <div class="card card-outline-secondary">
        <div class="card-header">
            <h3 class="mb-0">{$lang->registration}</h3>
        </div>
        <div class="card-body">
            <form class="form" role="form" autocomplete="off" id="loginForm" novalidate="" method="POST">
                <div class="form-group">
                    <label for="name">{$lang->name}</label>
                    <input type="text" class="form-control" id="name" name="name" data-format=".+" data-notice="{$lang->enter_your_name}" value="{$name|escape}" maxlength="255" id="uname1" required="">
                    <div class="invalid-feedback">{$lang->enter_your_name}</div>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" class="form-control" id="email" required="" name="email" data-format="email" data-notice="{$lang->enter_your_email}" value="{$email|escape}" maxlength="255">
                    <div class="invalid-feedback">{$lang->enter_your_email}</div>
                </div>
                <div class="form-group">
                    <label for="phone">{$lang->phone}</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="{$phone|escape}" maxlength="255">
                </div>
                <div class="form-group">
                    <label for="address">{$lang->address}</label>
                    <input type="text" class="form-control" id="address" name="address" value="{$address|escape}" maxlength="255">
                </div>
                <div class="form-group">
                    <label>{$lang->password}</label>
                    <input type="password" class="form-control" id="pwd1" required="" autocomplete="new-password" name="password" data-format=".+" data-notice="{$lang->enter_password}" value="">
                    <div class="invalid-feedback">{$lang->enter_password}</div>
                </div>
                {if $settings->captcha_register}
                    <div class="row mt-4">
                        <div class="col-sm-6 pb-3">
                            {get_captcha var="captcha_register"}
                            <div class="secret_number">{$captcha_register[0]|escape} + ? = {$captcha_register[1]|escape}</div>
                        </div>
                        <div class="col-sm-6 pb-3">
                            <input class="form-control" type="text" name="captcha_code" required="" placeholder="{$lang->enter_captcha}" value="" autocomplete="off" data-format=".+" data-notice="{$lang->enter_captcha}" />
                            <div class="invalid-feedback">{$lang->enter_captcha}</div>
                        </div>
                    </div>
                {/if}
                <a href="{$lang_link}user/login">{$lang->login}</a>
                <input type="submit" class="btn btn-success btn-lg float-right" id="btnLogin" name="register" value="{$lang->send}">
            </form>
        </div>
    </div>
</div>