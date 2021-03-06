{if $comments}
    <!-- Single Comment -->
    {foreach $comments as $comment}
        <a name="comment_{$comment->id}"></a>
        <p><span>{$comment->text|escape|nl2br}</span></p>
        <small class="text-muted"><b><span>{$comment->name|escape}</span></b> {$comment->date|date} {$lang->at} {$comment->date|time} {if !$comment->approved}<span class="text-danger">{$lang->awaiting_moderation}</span>{/if}</small>
        <hr>
    {/foreach}
    <!-- Single Comment (The End)-->
{else}
    <p>
        {$lang->no_comments}
    </p>
{/if}
<!-- Comments Form -->
<a class="btn btn-success mb-4" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">{$lang->comment_on}</a>
<div class="collapse" id="collapseExample">
    {if $error}
        <div class="alert alert-danger" role="alert">
            {if $error=='captcha'}
                {$lang->captcha_entered_incorrectly}
            {elseif $error=='empty_name'}
                {$lang->enter_your_name}
            {elseif $error=='empty_comment'}
                {$lang->enter_a_comment}
            {/if}
        </div>
    {/if}
    <form class="form-horizontal mt-4" id="loginForm" role="form" method="post">
        <div class="form-group">
            <label for="comment">{$lang->comment}</label>
            <textarea class="form-control" rows="4" name="text" placeholder="{$lang->enter_a_comment}" data-format=".+" required="" data-notice="{$lang->enter_a_comment}">{$comment_text}</textarea>
            <div class="invalid-feedback">{$lang->enter_a_comment}</div>
        </div>
        <div class="form-group">
            <label for="comment_name">{$lang->name}</label>
            <input class="form-control" type="text" id="comment_name" name="name" placeholder="{$lang->enter_your_name}" required="" value="{$comment_name}" data-format=".+" data-notice="{$lang->enter_your_name}" />
            <div class="invalid-feedback">{$lang->name}</div>
        </div>
        {if $settings->captcha_article}
            <div class="form-row mt-4">
                <div class="form-group col-md-2">
                    {get_captcha var="captcha_article"}
                    <div class="secret_number">{$captcha_article[0]|escape} + ? = {$captcha_article[1]|escape}</div>
                </div>
                <div class="form-group col-md-10">
                    <input class="form-control" type="text" autocomplete="off" name="captcha_code" required="" placeholder="{$lang->enter_captcha}" value="" data-format=".+" data-notice="{$lang->enter_captcha}" />
                    <div class="invalid-feedback">{$lang->enter_captcha}</div>
                </div>
            </div>
        {/if}
        <div class="form-group">
            <div class="col-sm-offset-2">
                <input class="btn btn-primary" type="submit" id="btnLogin" name="comment" value="{$lang->send}" />
            </div>
        </div>
    </form>
</div>