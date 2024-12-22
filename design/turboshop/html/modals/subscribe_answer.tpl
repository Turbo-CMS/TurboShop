{if $condition == 'success'}
    <div class="form-body">
        <div class="form-inner form-inner--popup">
            <div class="form-send">
                <div class="flexbox flexbox--direction-column flexbox--align-center">
                    <div class="form-send__icon">
                        <i class="svg inline fill-more-theme" aria-hidden="true">
                            <svg width="80" height="80">
                                <use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/form_icons.svg#success-80-80"></use>
                            </svg>
                        </i>
                    </div>
                    <div class="form-send__info">
                        <div class="form-send__info-title switcher-title font_24">{$lang->thank_you|escape}</div>
                        <div class="form-send__info-text">
                            {$lang->success_subscribe|escape}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-footer">
        <div class="btn btn-transparent-border btn-lg jqmClose btn-wide has-ripple">{$lang->close|escape}</div>
    </div>
{elseif $condition == 'empty_email'}
    <div class="text-danger">{$lang->enter_your_email|escape}</div>
{elseif $condition == 'wrong_email'}
    <div class="text-danger">{$lang->error_format|escape}</div>
{elseif $condition == 'email_exists'}
    <div class="text-danger">{$lang->already_subscribe|escape}</div>
{/if}