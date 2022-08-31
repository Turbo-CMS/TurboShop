{if $comments}
	<!-- Single Comment -->
	{foreach $comments as $comment}
		<a name="comment_{$comment->id}"></a>
		<p><span>{$comment->text|escape|nl2br}</span></p>
		<small class="text-muted"><b><span>{$comment->name|escape}</span></b> {$comment->date|date} {$lang->at} {$comment->date|time} {if !$comment->approved}<span class="text-danger">{$lang->awaiting_moderation}</span>{/if}</small>
		<div class="rating-wrap mb-1">
			<ul class="rating-stars">
				<li style="width:{$comment->rating*100/5|string_format:"%.0f"}%" class="stars-active">
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
				</li>
				<li>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				</li>
			</ul>
		</div>
		<hr class="text-black-50">
	{/foreach}
	<!-- Single Comment (The End)-->
{else}
	<p>
		{$lang->no_comments}
	</p>
{/if}
<!-- Comments Form -->
<a class="btn btn-success mb-4" data-bs-toggle="collapse" href="#CommentForm" role="button" aria-expanded="false" aria-controls="CommentForm">{$lang->comment_on}</a>
<div class="collapse" id="CommentForm">
	{if $error}
		<div class="alert alert-danger" role="alert">
			{if $error=='captcha'}
				{$lang->captcha_incorrect}
			{elseif $error=='empty_name'}
				{$lang->enter_your_name}
			{elseif $error=='empty_comment'}
				{$lang->enter_a_comment}
			{/if}
		</div>
	{/if}
	<form class="form-horizontal mt-4" id="FormValidation" role="form" method="post">
		<div class="row mb-1">
			<div class="col-12 col-md-6" style="font-size: 1em;">
				<div id="review"></div>
			</div>
			<input type="hidden" name="rating" value="{$comment_rating}" id="starsInput">
		</div>
		<div class="mb-3">
			<label for="comment">{$lang->comment}</label>
			<textarea class="form-control" name="text" id="comment" placeholder="{$lang->enter_a_comment}" rows="4" required>{$comment_text}</textarea>
			<div class="invalid-feedback">{$lang->enter_a_comment}</div>
		</div>
		<div class="mb-3">
			<label for="comment_name">{$lang->name}</label>
			<input type="text" class="form-control" name="name" id="comment_name" value="{$comment_name|escape}" placeholder="{$lang->enter_your_name}" required>
			<div class="invalid-feedback">{$lang->name}</div>
		</div>
		{if $settings->captcha_review}
			<div class="row mt-4">
				<div class="col-md-2 pb-3">
					{get_captcha var="captcha_review"}
					<div class="secret-number">{$captcha_review[0]|escape} + ? = {$captcha_review[1]|escape}</div>
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