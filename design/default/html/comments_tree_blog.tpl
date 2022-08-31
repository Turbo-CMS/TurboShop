{if $comments}
	<div class="btn-toolbar justify-content-between mb-4" role="toolbar" aria-label="SortComments">
		<span>{$comments_count} {$comments_count|plural:$lang->comment_1:$lang->comment_2:$lang->comment_3}</span>
		<div class="btn-group" role="group" aria-label="First group">
			<a href="{url sort=rate page=null}" class="sort-comments text-decoration-none me-3 {if $sort=='rate'}active{/if}">{$lang->popular}</a>
			<a href="{url sort=date page=null}" class="sort-comments text-decoration-none {if $sort=='date'}active{/if}">{$lang->in_order}</a>
		</div>
	</div>
	<hr class="text-black-50">
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
					<i class="fal fa-user-headset fa-2x d-flex me-3 text-primary"></i>
				{else}
					<i class="fal fa-user fa-2x d-flex me-3 text-muted"></i>
				{/if}
				<div class="media-body">
					<h5 class="mt-0 {if $comment->admin == 1}admin text-primary{/if}">{$comment->name|escape}</h5>
					<small class="text-muted">{$comment->date|date} {$lang->at} {$comment->date|time} {if !$comment->approved}<span class="text-danger">{$lang->awaiting_moderation}</span>{/if}</small>
					<p>{$comment->text|escape|nl2br}</p>
					<span class="float-end btn-group vote">
						<a class="btn vote-button-plus" href="ajax/comment.rate.php?id={$comment->id}&rate=up"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
						{if $comment->rate>0}
							<span class="btn vote-value pos">{$comment->rate}</span>
						{elseif $comment->rate == 0}
							<span class="btn text-muted vote-value">{$comment->rate}</span>
						{else}
							<span class="btn vote-value neg">{$comment->rate}</span>
						{/if}
						<a class="btn vote-button-minus" href="ajax/comment.rate.php?id={$comment->id}&rate=down"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
					</span>
					<div id="{$comment->id}" class="comments-item-reply comment"><span data-close-text="{$lang->close}" data-reply-text="{$lang->reply}">{$lang->reply}</span></div>
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
<a class="btn btn-success mb-4 comments-reply-form" href="#CommentForm" role="button" data-close-text="{$lang->close}" data-comment-text="{$lang->comment_on}">{$lang->comment_on}</a>
<div class="collapse" id="CommentForm">
	<form class="form-horizontal mt-4" id="FormValidation" role="form" method="post">
		<input type="hidden" id="hidden">
		<input type="hidden" id="parent" name="parent_id" value="0">
		<input type="hidden" id="admin" name="admin" value="{if $smarty.session.admin == 'admin'}1{else}0{/if}">
		<div class="mb-3">
			<label for="comment">{$lang->comment}</label>
			<textarea class="form-control" name="text" id="comment" placeholder="{$lang->enter_a_comment}" rows="4" required>{$comment_text}</textarea>
			<div class="invalid-feedback">{$lang->enter_a_comment}</div>
		</div>
		<div class="mb-3">
			<label for="comment_name">{$lang->name}</label>
			<input type="text" class="form-control" name="name" id="comment_name" value="{$comment_name|escape}" placeholder="{$lang->enter_your_name}" required>
			<div class="invalid-feedback">{$lang->enter_your_name}</div>
		</div>
		{if $settings->captcha_post}
			<div class="row mt-4">
				<div class="col-md-2 pb-3">
					{get_captcha var="captcha_post"}
					<div class="secret-number">{$captcha_post[0]|escape} + ? = {$captcha_post[1]|escape}</div>
				</div>
				<div class="col-md-10">
					<input type="text" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha}" autocomplete="off" required>
					<div class="invalid-feedback">{$lang->enter_captcha}</div>
				</div>
			</div>
		{/if}
		<div class="mt-3">
			<div class="col-sm-offset-2">
				<input type="submit" class="btn btn-primary" name="comment" id="btnValidation" value="{$lang->send}">
			</div>
		</div>
	</form>
</div>