{if $comments}
	<!-- Single Comment -->
	{foreach $comments as $comment}
		<span itemprop="review" itemscope itemtype="http://schema.org/Review">
			<meta itemprop="datePublished" content="{$comment->date|date}">
			<meta itemprop="name" content="{$product->name|escape}">
			<meta itemprop="itemreviewed" content="{$product->name|escape}">
			<a name="comment_{$comment->id}"></a>
			<p><span itemprop="description">{$comment->text|escape|nl2br}</span></p>
			<small class="text-muted"><b><span itemprop="author">{$comment->name|escape}</span></b> {$comment->date|date} {$lang->at} {$comment->date|time} {if !$comment->approved}<span class="text-danger">{$lang->awaiting_moderation}</span>{/if}</b></small>
			<hr class="text-black-50">
		</span>
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
		{if $settings->captcha_product}
			<div class="row mt-4">
				<div class="col-md-2 pb-3">
					{get_captcha var="captcha_product"}
					<div class="secret-number">{$captcha_product[0]|escape} + ? = {$captcha_product[1]|escape}</div>
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