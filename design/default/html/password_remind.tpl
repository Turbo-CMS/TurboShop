{* Password recovery email *}

{$meta_title = $lang->password_reminder scope=global}

{* Canonical page address *}
{$canonical="/user/password_remind" scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
    <ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb bg-light">
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
            <a itemprop="item" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
            <meta itemprop="position" content="{$level++}" />
        </li>
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
            <a itemprop="item" href="{$lang_link}{$page->url}"><span itemprop="name">{$lang->password_reminder}</span></a>
            <meta itemprop="position" content="{$level++}" />
        </li>
    </ol>
</nav>
<!-- Breadcrumb #End /-->

{if $email_sent}
    <h1 class="my-4">{$lang->email_sent}</h1>
    <div class="alert alert-success" role="alert">
        {$email|escape} - {$lang->password_recovery_email}
    </div>
{else}
    <h1 class="my-4">{$lang->password_reminder}</h1>
    {if $error}
        <div class="alert alert-danger" role="alert">
            {if $error == 'user_not_found'}
			{$lang->user_not_found}
            {else}
                {$error}
            {/if}
        </div>
    {/if}
    <div class="col-md-6 offset-md-3">
        <span class="anchor" id="formResetPassword"></span>
        <div class="card card-outline-secondary">
            <div class="card-header">
                <h3 class="mb-0">{$lang->password_reminder}</h3>
            </div>
            <div class="card-body">
                <form autocomplete="off" method="post" id="loginForm" class="form" role="form">
                    <div class="form-group">
                        <label for="inputResetPasswordEmail">Email</label>
                        <input type="text" class="form-control" id="inputResetPasswordEmail" required="" name="email" data-format="email" data-notice="{$lang->enter_your_email}" value="{$email|escape}" maxlength="255" />
                        <div class="invalid-feedback">{$lang->enter_your_email}</div>
                        <span class="form-text small text-muted" id="helpResetPasswordEmail">{$lang->enter_email_registration}</span>
                    </div>
                    <div class="form-group">
                        <input class="btn btn-success btn-lg float-right" type="submit" id="btnLogin" class="button_submit" value="{$lang->send|escape}" />
                    </div>
                </form>
            </div>
        </div>
    </div>
{/if}