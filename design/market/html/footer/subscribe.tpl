{* Subscribe *}

<div class="container-fluid bg-success mt-auto">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <form class="form-group needs-validation py-4" method="post" novalidate>

                {* Error *}
                {if $subscribe_error}
                    <label class="error text-danger">
                        {if $subscribe_error == 'email_exist'}
                            {$lang->already_subscribe|escape}
                        {/if}
                        {if $subscribe_error == 'empty_email'}
                            {$lang->enter_your_email|escape}
                        {/if}
                    </label>
                {/if}

                {* Success *}
                {if $subscribe_success}
                    <label class="success text-success">
                        {$lang->success_subscribe|escape}
                    </label>
                {/if}

                <div class="d-flex align-items-center">
                    <span class="me-3 text-white fw-medium">{$lang->subscribe_newsletter|escape}</span>
                    <div class="input-group">
                        <input type="email" class="form-control {if $subscribe_error}border-danger{/if} {if $subscribe_success}border-success{/if}" name="subscribe_email" value="{$email|escape}" placeholder="{$lang->enter_your_email|escape}" size="20" required>
                        <button type="submit" class="btn btn-dark" name="subscribe" value="{$lang->subscribe|escape}"><i class="far fa-envelope"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>