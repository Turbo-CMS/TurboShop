{if $comments}
	{* Rating *}
	<div class="rating-wrap mb-2 ratings reviews">
		<ul class="rating-stars rater-starsOff" style="width:132px;">
			<li style="width:{$product->ratings*100/5|string_format:'%.0f'}%" class="stars-active rater-starsOn">
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
		{if $product->ratings > 0}
			<div class="label-rating" itemprop="aggregateRating" itemtype="https://schema.org/AggregateRating" itemscope>
				<meta itemprop="reviewCount" content="{$comments_count}" />
				<span class="rater-rating h3" itemprop="ratingValue" content="{$product->ratings|string_format:'%.1f'}">{$product->ratings|string_format:'%.1f'}</span>
			</div>
		{/if}
	</div>

	{* Sort *}
	<div class="btn-toolbar justify-content-between mb-4" role="toolbar" aria-label="sortComments">
		{if isset($comments_count)}
			{$comments_count} {$comments_count|plural:$lang->comment_1:$lang->comment_2:$lang->comment_3}
		{/if}
		<div class="btn-group" role="group" aria-label="btnGroup">
			<a href="{url sort=rate page=null}" class="sort-comments text-decoration-none me-3 {if isset($sort) && $sort=='rate'}active{/if}">{$lang->popular}</a>
			<a href="{url sort=date page=null}" class="sort-comments text-decoration-none {if isset($sort) && $sort=='date'}active{/if}">{$lang->in_order}</a>
		</div>
	</div>

	<hr class="text-black-50">

	{* Error *}
	{if isset($error)}
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

	{* Single Comment *}
	{function name=comments_tree level=0}
		{foreach $comments as $comment name=tree}
			<span itemprop="review" itemscope itemtype="http://schema.org/Review">
				<meta itemprop="datePublished" content="{$comment->date|date}">
				<meta itemprop="name" content="{$product->name|escape}">
				<meta itemprop="itemreviewed" content="{$product->name|escape}">
				<a name="comment_{$comment->id}"></a>
				<div class="media comments {if $level == 1 && $smarty.foreach.tree.first}mt-4{/if}">
					{if $comment->admin == 1}
						<i class="fal fa-user-headset fa-2x d-flex me-3 text-primary"></i>
					{else}
						<i class="fal fa-user fa-2x d-flex me-3 text-muted"></i>
					{/if}
					<div class="media-body">
						<h5 class="mt-0 {if $comment->admin == 1}admin text-primary{/if}">{$comment->name|escape}</h5>
						<div class="small text-muted">
							<strong itemprop="author">{$comment->name|escape}</strong>
							{$comment->date|date} {$lang->at} {$comment->date|time}
							{if !$comment->approved}
								<span class="text-danger">{$lang->awaiting_moderation}</span>
							{/if}
						</div>
						{if $comment->admin == 0 && $level == 0}
							<div class="rating-wrap mb-1">
								<ul class="rating-stars">
									<li style="width:{$comment->rating*100/5|string_format:'%.0f'}%" class="stars-active">
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
								<span itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating">
									<meta itemprop="ratingValue" content="{$comment->rating}">
								</span>
							</div>
						{/if}
						<div class="my-1">
							<span itemprop="description">{$comment->text|escape|nl2br}</span>
						</div>
						<div class="float-end btn-group vote">
							<a class="btn vote-button-plus" href="ajax/comment_rate.php?id={$comment->id}&rate=up">
								<i class="fa fa-chevron-up" aria-hidden="true"></i>
							</a>
							{if $comment->rate>0}
								<div class="btn vote-value pos">{$comment->rate}</div>
							{elseif $comment->rate == 0}
								<div class="btn text-muted vote-value">{$comment->rate}</div>
							{else}
								<div class="btn vote-value neg">{$comment->rate}</div>
							{/if}
							<a class="btn vote-button-minus" href="ajax/comment_rate.php?id={$comment->id}&rate=down">
								<i class="fa fa-chevron-down" aria-hidden="true"></i>
							</a>
						</div>
						{if $level == 0 && isset($smarty.session.admin) && $smarty.session.admin == 'admin'}
							<div id="{$comment->id}" class="comments-item-reply comment">
								<span data-close-text="{$lang->close}" data-reply-text="{$lang->reply}">{$lang->reply}</span>
							</div>
						{/if}
						{if isset($children[$comment->id])}
							{comments_tree comments=$children[$comment->id] level=$level+1}
						{/if}
					</div>
				</div>
			</span>
		{/foreach}
	{/function}
	{comments_tree comments = $comments}

	{* Paginations *}
	{include file='paginations/pagination.tpl'}
{else}
	<div class="my-1">
		{$lang->no_comments}
	</div>
{/if}

{* Coment Form *}
<a class="btn btn-success mt-2 comments-reply-form" href="#commentForm" role="button" data-close-text="<i class='fal fa-xmark me-2'></i>{$lang->close}" data-comment-text="<i class='fal fa-comment me-2'></i>{$lang->comment_on}"><i class="fa-light fa-comment me-2"></i>{$lang->comment_on}</a>
<div class="collapse mb-4" id="commentForm">
	<form class="form-horizontal needs-validation mt-4" role="form" method="post" novalidate>
		<input type="hidden" id="hidden">
		<input type="hidden" id="parent" name="parent_id" value="0">
		<input type="hidden" id="admin" name="admin" value="{if isset($smarty.session.admin) && $smarty.session.admin == 'admin'}1{else}0{/if}">
		{if !isset($smarty.session.admin) && !$smarty.session.admin == 'admin'}
			<span>
				<div id="rating" class="row mb-1">
					<div class="col-12 col-md-6" style="font-size: 1em;">
						<div id="review"></div>
					</div>
					<input type="hidden" name="rating" id="starsInput" value="{$comment_rating}">
				</div>
			</span>
		{/if}
		<div class="mb-3">
			<label for="comment" class="form-label">{$lang->comment}<span class="text-danger">*</span></label>
			<textarea class="form-control" name="text" id="comment" placeholder="{$lang->enter_a_comment}" rows="4" required>{if isset($comment_text)}{$comment_text}{/if}</textarea>
			<div class="invalid-feedback">{$lang->enter_a_comment}</div>
		</div>
		<div class="mb-3">
			<label for="comment-name" class="form-label">{$lang->name}<span class="text-danger">*</span></label>
			<input type="text" class="form-control" id="comment-name" name="name" value="{if isset($comment_text)}{$comment_name|escape}{/if}" placeholder="{$lang->enter_your_name}" required>
			<div class="invalid-feedback">{$lang->enter_your_name}</div>
		</div>
		{if $settings->captcha_product}
			<div class="row">
				<label for="captcha" class="form-label">{$lang->captcha}<span class="text-danger">*</span></label>
				<div class="col-md-2 mb-3">
					{get_captcha var="captcha_product"}
					<div class="secret-number">{$captcha_product[0]|escape} + ? = {$captcha_product[1]|escape}</div>
				</div>
				<div class="col-md-10">
					<input type="text" id="captcha" class="form-control" name="captcha_code" value="" placeholder="{$lang->enter_captcha}" autocomplete="off" required>
					<div class="invalid-feedback">{$lang->enter_captcha}</div>
				</div>
			</div>
		{/if}
		<div class="mt-md-0 mt-3">
			<div class="col-sm-offset-2">
				<input type="submit" class="btn btn-primary" name="comment" value="{$lang->send}">
			</div>
		</div>
	</form>
</div>