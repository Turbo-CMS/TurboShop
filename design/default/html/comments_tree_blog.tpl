{if $comments}
    <div class="btn-toolbar justify-content-between mb-4" role="toolbar" aria-label="Toolbar with button groups">
        <span>{$comments_count} {$comments_count|plural:$lang->comment_1:$lang->comment_2:$lang->comment_3}</span>
        <div class="btn-group" role="group" aria-label="First group">
            <a href="{url sort=rate page=null}" class="card-link {if $sort=='rate'}active{/if}">{$lang->popular}</a>
            <a href="{url sort=date page=null}" class="card-link {if $sort=='date'}active{/if}">{$lang->in_order}</a>
        </div>
    </div>
    <hr>
    {if $error}
        <div class="alert alert-danger my-4" role="alert">
            {if $error=='captcha'}
                {$lang->captcha_incorrect}
            {elseif $error=='empty_name'}
                {$lang->enter_your_name}
            {elseif $error=='empty_comment'}
                {$lang->enter_a_comment}
            {/if}
        </div>
    {/if}
    {function name=comments_tree}
        {foreach $comments as $comment}
            <!-- Single Comment -->
            <a name="comment_{$comment->id}"></a>
            <div class="media comments my-4">
                {if $comment->admin == 1}
                    <i class="fal fa-user-headset fa-2x d-flex mr-3 text-primary"></i>
                {else}
                    <i class="fal fa-user fa-2x d-flex mr-3 text-secondary"></i>
                {/if}
                <div class="media-body">
                    <h5 class="mt-0 {if $comment->admin == 1}admin{/if}">{$comment->name|escape}</h5>
                    <small class="text-muted">{$comment->date|date} {$lang->at} {$comment->date|time} {if !$comment->approved}<span class="text-danger">{$lang->awaiting_moderation}</span>{/if}</small>
                    <p>{$comment->text|escape|nl2br}</p>
                    <span class="float-right btn-group vote">
                        <a class="btn vote__button--plus" href="ajax/comment.rate.php?id={$comment->id}&rate=up"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
                        {if $comment->rate>0}
                            <span class="btn vote__value pos">{$comment->rate}</span>
                        {elseif $comment->rate == 0}
                            <span class="btn text-muted vote__value">{$comment->rate}</span>
                        {else}
                            <span class="btn vote__value neg">{$comment->rate}</span>
                        {/if}
                        <a class="btn vote__button--minus" href="ajax/comment.rate.php?id={$comment->id}&rate=down"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
                    </span>
                    <div id="{$comment->id}" class="comments__item__reply comment"><span data-close-text="{$lang->close}" data-reply-text="{$lang->reply}">{$lang->reply}</span></div>
                    {comments_tree comments = $comment->subcomments}
                </div>
            </div>
        {/foreach}
    {/function}
    {comments_tree comments = $comments}
{else}
    <p>
        {$lang->no_comments}
    </p>
{/if}
<a class="btn btn-success mb-4 comments__reply_form" href="#collapseExample" role="button" data-close-text="{$lang->close}" data-comment-text="{$lang->comment_on}">{$lang->comment_on}</a>
<div class="collapse" id="collapseExample">
    <form class="form-horizontal mt-4" id="loginForm" role="form" method="post">
        <input type="hidden" id="hidden">
        <input type="hidden" id="parent" name="parent_id" value="0" />
        <input type="hidden" id="admin" name="admin" value="{if $smarty.session.admin == 'admin'}1{else}0{/if}" />
        <div class="form-group">
            <label for="comment">{$lang->comment}</label>
            <textarea class="form-control" rows="4" name="text" placeholder="{$lang->enter_a_comment}" data-format=".+" required="" data-notice="{$lang->enter_a_comment}">{$comment_text}</textarea>
            <div class="invalid-feedback">{$lang->enter_a_comment}</div>
        </div>
        <div class="form-group">
            <label for="comment_name">{$lang->name}</label>
            <input class="form-control" type="text" id="comment_name" name="name" placeholder="{$lang->enter_your_name}" required="" value="{$comment_name|escape}" data-format=".+" data-notice="{$lang->enter_your_name}" />
            <div class="invalid-feedback">{$lang->enter_your_name}</div>
        </div>
        {if $settings->captcha_post}
            <div class="form-row mt-4">
                <div class="form-group col-md-2">
                    {get_captcha var="captcha_post"}
                    <div class="secret_number">{$captcha_post[0]|escape} + ? = {$captcha_post[1]|escape}</div>
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