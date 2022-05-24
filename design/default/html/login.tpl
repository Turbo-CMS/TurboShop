{* User login page *}

{* Canonical page address *}
{$canonical="/user/login" scope=global}

{$meta_title = $lang->login scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
    <ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb bg-light">
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
            <a itemprop="item" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
            <meta itemprop="position" content="{$level++}" />
        </li>
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
            <a itemprop="item" href="{$lang_link}user/login"><span itemprop="name">{$lang->login}</span></a>
            <meta itemprop="position" content="{$level++}" />
        </li>
    </ol>
</nav>
<!-- Breadcrumb #End /-->

<h1 class="my-4">{$lang->login}</h1>

{if $error}
    <div class="alert alert-danger" role="alert">
        {if $error == 'login_incorrect'}
            {$lang->wrong_login_password}
        {elseif $error == 'user_disabled'}
            {$lang->not_activated}
        {else}
            {$error}
        {/if}
    </div>
{/if}

<div class="col-md-6 offset-md-3">
    <span class="anchor" id="formLogin"></span>
    <div class="card card-outline-secondary">
        <div class="card-header">
            <h3 class="mb-0">{$lang->login}</h3>
        </div>
        <div class="card-body">
            <form class="form login_form" role="form" autocomplete="off" id="loginForm" novalidate="" method="POST">
                <div class="form-group">
                    <label for="login_email">Email</label>
                    <input type="text" class="form-control" id="login_email" name="email" data-format="email" data-notice="{$lang->enter_your_email}" value="{$email|escape}" maxlength="255" required="">
                    <div class="invalid-feedback">{$lang->enter_your_email}</div>
                </div>
                <div class="form-group">
                    <label for="login_password">{$lang->password}</label>
                    <input type="password" class="form-control" id="login_password" name="password" data-format=".+" data-notice="{$lang->enter_password}" value="" required="" autocomplete="off">
                    <div class="invalid-feedback">{$lang->enter_password}</div>
                </div>
                <a href="{$lang_link}user/password_remind">{$lang->forgot_password}</a>
                <input type="submit" class="btn btn-success btn-lg float-right" name="login" id="btnLogin" value="{$lang->login}">
            </form>
        </div>
    </div>
</div>