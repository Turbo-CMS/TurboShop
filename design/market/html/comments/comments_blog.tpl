{* Comments Blog *}

{if $comments}
	{* Error *}
	{if $error}
		<div class="alert alert-danger my-3" role="alert">
			{if $error=='captcha'}
				{$lang->captcha_incorrect|escape}
			{elseif $error=='empty_name'}
				{$lang->enter_your_name|escape}
			{elseif $error=='empty_comment'}
				{$lang->enter_a_comment|escape}
			{/if}
		</div>
	{/if}

	{* Sort *}
	<div class="d-flex justify-content-between align-items-center border-bottom">
		{if $comments_count}
			{$comments_count} {$comments_count|plural:$lang->comment_1:$lang->comment_2:$lang->comment_3}
		{/if}
		<ul class="nav nav-underline">
			<li class="nav-item">
				<a class="nav-link {if $sort=='rate'}active{/if}" aria-current="page" href="{url sort=rate page=null}">{$lang->popular|escape}</a>
			</li>
			<li class="nav-item">
				<a class="nav-link {if $sort=='date'}active{/if}" aria-current="page" href="{url sort=date page=null}">{$lang->in_order|escape}</a>
			</li>
		</ul>
	</div>

	{* Comment Button *}
	<button class="btn btn-gray w-100 d-md-none comment-button mt-3" data-bs-toggle="modal" data-bs-target="#commentForm" data-comment-id="0">
		{$lang->comment|escape}
	</button>

	<div class="card p-3 mt-3 d-none d-md-block">
		<div class="d-flex align-items-center">
			<div class="me-auto">
				<p class="card-text">{$lang->leave_comment|escape}</p>
			</div>
			<button class="btn btn-gray ms-auto comment-button" data-bs-toggle="modal" data-bs-target="#commentForm" data-comment-id="0">
				{$lang->comment|escape}
			</button>
		</div>
	</div>

	{* Single Comment *}
	{function name=comments_tree level=0}
		{foreach $comments as $comment name=tree}
			{if $level == 0}
				<div class="card p-3 my-3">
					<a name="comment_{$comment->id}"></a>
					<div class="d-flex justify-content-between align-items-center">
						<h6 class="mb-0 {if $comment->admin}text-success{/if}">{$comment->name|escape}</h6>
						<small class="text-muted">{$comment->date|date} {$lang->at|escape} {$comment->date|time}</small>
					</div>
					{if !$comment->approved}
						<small class="text-danger">{$lang->awaiting_moderation|escape}</small>
					{/if}

					<p class="mt-2 mb-3">
						{$comment->text|escape|nl2br}
					</p>

					<div class="d-flex justify-content-between align-items-center">
						<button class="btn btn-link p-0 text-decoration-none comment-button reply" data-bs-toggle="modal" data-bs-target="#commentForm" data-comment-id="{$comment->id}">
							<i class="far fa-arrow-turn-down-right me-1"></i>
							{$lang->reply|escape}
						</button>

						<div class="d-flex align-items-center vote">
							<a class="vote-button-plus" href="ajax/comment_rate.php?id={$comment->id}&rate=up">
								<i class="far fa-thumbs-up cursor-pointer"></i>
							</a>
							{if $comment->rate>0}
								<span class="vote-value mx-2 text-success">{$comment->rate}</span>
							{elseif $comment->rate == 0}
								<span class="vote-value mx-2">{$comment->rate}</span>
							{else}
								<span class="vote-value mx-2 text-danger">{$comment->rate}</span>
							{/if}
							<a class="vote-button-minus" href="ajax/comment_rate.php?id={$comment->id}&rate=down">
								<i class="far fa-thumbs-down cursor-pointer"></i>
							</a>
						</div>
					</div>
				</div>
				{if $children[$comment->id]}
					<div class="border-start">
						<ul class="list-group mt-3 ms-3">
							{comments_tree comments=$children[$comment->id] level=$level+1}
						</ul>
					</div>
				{/if}
			{else}
				<li class="list-group-item">
					<div class="d-flex justify-content-between align-items-center">
						<h6 class="mb-0 {if $comment->admin}text-success{/if}">{$comment->name|escape}</h6>
						<small class="text-muted">{$comment->date|date} {$lang->at|escape} {$comment->date|time}</small>
					</div>

					<p class="mt-2 mb-3">
						{$comment->text|escape|nl2br}
					</p>
				</li>
			{/if}
		{/foreach}
	{/function}
	{comments_tree comments=$comments}

	{* Paginations *}
	<div class="mt-3">
		{include file='paginations/pagination.tpl'}
	</div>
{else}
	{* Title *}
	<h2 class="h5 fw-bold my-3">{$lang->first_comment|escape}</h2>

	{* Comment Button *}
	<button class="btn btn-gray w-100 d-md-none comment-button mt-3" data-bs-toggle="modal" data-bs-target="#commentForm" data-comment-id="0">
		{$lang->comment|escape}
	</button>

	<div class="card p-3 mt-3 d-none d-md-block">
		<div class="d-flex align-items-center">
			<div class="me-auto">
				<p class="card-text">{$lang->leave_comment|escape}</p>
			</div>
			<button class="btn btn-gray ms-auto comment-button" data-bs-toggle="modal" data-bs-target="#commentForm" data-comment-id="0">
				{$lang->comment|escape}
			</button>
		</div>
	</div>

	{* Error *}
	{if $error}
		<div class="alert alert-danger my-4" role="alert">
			{if $error=='captcha'}
				{$lang->captcha_incorrect|escape}
			{elseif $error=='empty_name'}
				{$lang->enter_your_name|escape}
			{elseif $error=='empty_comment'}
				{$lang->enter_a_comment|escape}
			{/if}
		</div>
	{/if}

{/if}

{* Comment Form Modal *}
<div class="modal fade" id="commentForm" tabindex="-1" aria-labelledby="commentModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="commentModalLabel">{$lang->write_comment|escape}</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form class="form-horizontal needs-validation mt-1" role="form" method="post" novalidate>
					<input type="hidden" id="hidden">
					<input type="hidden" id="parent" name="parent_id" value="0">
					<input type="hidden" id="admin" name="admin" value="{if $smarty.session.admin == 'admin'}1{else}0{/if}">

					<div class="mb-3">
						<label for="comment" class="form-label">{$lang->comment|escape}<span class="text-danger">*</span></label>
						<textarea class="form-control" name="text" id="comment" placeholder="{$lang->enter_a_comment|escape}" rows="4" required>{$comment_text}</textarea>
						<div class="invalid-feedback">{$lang->enter_a_comment|escape}</div>
					</div>
					<div class="mb-3">
						<label for="comment-name" class="form-label">{$lang->name|escape}<span class="text-danger">*</span></label>
						<input type="text" class="form-control" id="comment-name" name="name" value="{$comment_name|escape}" placeholder="{$lang->enter_your_name|escape}" required>
						<div class="invalid-feedback">{$lang->enter_your_name|escape}</div>
					</div>
					{if $settings->captcha_post}
						<div class="row mb-3">
							<label for="captcha" class="form-label">{$lang->captcha|escape}<span class="text-danger">*</span></label>
							<div class="col-lg-2 mb-3">
								{get_captcha var="captcha_post"}
								<div class="secret-number">{$captcha_post[0]|escape} + ? = {$captcha_post[1]|escape}</div>
							</div>
							<div class="col-lg-10">
								<input type="text" id="captcha" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha|escape}" autocomplete="off" required>
								<div class="invalid-feedback">{$lang->enter_captcha|escape}</div>
							</div>
						</div>
					{/if}
					<div class="d-flex flex-column flex-md-row gap-2 w-100 mb-3">
						<button type="button" class="btn btn-gray w-100" data-bs-dismiss="modal">{$lang->cancel|escape}</button>
						<input type="submit" class="btn btn-primary w-100" name="comment" value="{$lang->leave_comment|escape}">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>