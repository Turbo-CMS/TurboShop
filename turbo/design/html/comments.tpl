{$meta_title=$btr->global_comments scope=global}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-3">
				{if !isset($type)}
					{$btr->global_comments} - {$comments_count}
				{elseif isset($type) && $type=='product'}
					{$btr->global_comments} {$btr->comments_to_product_small|escape} - {$comments_count}
				{elseif isset($type) && $type=='blog'}
					{$btr->global_comments} {$btr->comments_to_news_small|escape} - {$comments_count}
				{elseif isset($type) && $type=='article'}
					{$btr->global_comments} {$btr->comments_to_article_small|escape} - {$comments_count}
				{elseif isset($type) && $type=='review'}
					{$btr->global_review} - {$comments_count}
				{/if}
			</h1>
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-xs-12 float-sm-end">
		<form class="search mb-3" method="get">
			<input type="hidden" name="module" value="CommentsAdmin">
			<div class="input-group">
				<input name="keyword" class="form-control" placeholder="{$btr->global_search|escape}" type="text" value="{if isset($keyword)}{$keyword|escape}{/if}">
				<button class="btn btn-primary" type="submit"><i class="align-middle mt-n1" data-feather="search"></i></button>
			</div>
		</form>
	</div>
</div>

<div class="card">
	<div class="card-header d-block d-lg-none">
		<div class="card-actions float-end">
			<div class="position-relative collapse-icon">
				<a href="javascript:;" class="collapse-chevron">
					<i class="align-middle" data-feather="chevron-down"></i>
				</a>
			</div>
		</div>
		<h5 class="card-title mb-0">{$btr->global_filter|escape}</h5>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="collapse-card boxed-sorting">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-12 mb-3">
							<select class="selectpicker" onchange="location = this.value;">
								<option value="{url type=null item_id=null}" {if !isset($type)}selected{/if}>{$btr->comments_all|escape}</option>
								<option value="{url keyword=null item_id=null page=null type=product}" {if isset($type) && $type == 'product'}selected{/if}>{$btr->comments_to_products|escape}</option>
								<option value="{url keyword=null item_id=null page=null type=blog}" {if isset($type) && $type == 'blog'}selected{/if}>{$btr->comments_to_news|escape}</option>
								<option value="{url keyword=null item_id=null page=null type=article}" {if isset($type) && $type == 'article'}selected{/if}>{$btr->comments_to_articles|escape}</option>
								<option value="{url keyword=null item_id=null page=null type=review}" {if isset($type) && $type == 'review'}selected{/if}>{$btr->global_review|escape}</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		{if $comments}
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<form class="js-form-list" method="post">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">
						<div class="post-wrap turbo-list">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-comments-name">{$btr->global_comments|escape}</div>
								<div class="turbo-list-heading turbo-list-comments-btn"></div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body">
								{function name=comments_tree level=0}
									{foreach $comments as $comment}
										<div class="js-row turbo-list-body-item {if !$comment->approved}unapproved{/if} {if $level > 0}subcomments-level-{$level}{/if}">
											<div class="turbo-list-row">
												{if $level > 0}<div class="turbo-list-heading turbo-list-subcomment"></div>{/if}
												<div class="turbo-list-boding turbo-list-check">
													<label class="form-check">
														<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$comment->id}">
													</label>
												</div>
												<div class="turbo-list-boding turbo-list-comments-name {if $level > 0}admin-note{/if}">
													<div class="me-1 {if !$comment->admin}admin{/if}">
														<span class="fw-bold text-secondary">{$btr->global_name|escape}: </span>
														<a href="{url module=CommentAdmin id=$comment->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$comment->name|escape} </a>
														{if $comment->admin}<span class="badge badge-danger-light align-top">Admin</span>{/if}
													</div>
													{if isset($comment->email)}
														<div class="mb-0">
															<span class="fw-bold text-secondary">Email: </span> {$comment->email|escape}
														</div>
													{/if}
													<div class="mb-0">
														<span class="fw-bold text-secondary">{$btr->global_message|escape}</span>
														<span class="text-body">{$comment->text|escape|nl2br}</span>
													</div>
													<div class="mb-0">
														<span class="text-secondary">{$btr->comments_left|escape}</span>
														<span class="badge badge-secondary-light">{$comment->date|time} | {$comment->date|date}</span>
														{if $level == 0}
															<span class="text-secondary">{$btr->comments_to_the|escape}</span>
															{if $comment->type == 'product'}
																{$btr->comments_product|escape}<a target="_blank" href="{$config->root_url}/products/{$comment->product->url}#comment_{$comment->id}" class="fw-bold text-body text-decoration-none ms-1">{$comment->product->name}</a>
															{elseif $comment->type == "blog"}
																{$btr->comments_blog|escape}<a target="_blank" href="{$config->root_url}/blog/{$comment->post->url|escape}#comment_{$comment->id}" class="fw-bold text-body text-decoration-none ms-1">{$comment->post->name|escape}</a>
															{elseif $comment->type == 'article'}
																{$btr->comments_article|escape}<a target="_blank" href="{$config->root_url}/article/{$comment->article->url}#comment_{$comment->id}" class="fw-bold text-body text-decoration-none ms-1">{$comment->article->name}</a>
															{elseif $comment->type == 'review'}<a target="_blank" href="{$config->root_url}/reviews/#comment_{$comment->id}" class="fw-bold text-body text-decoration-none ms-1">{$btr->global_review|escape}</a>
															{/if}
														{/if}
													</div>
													{if $level == 0}<a href="index.php?module=CommentsAdmin&item_id={$comment->object_id}&type={$comment->type}" class="comment-object fw-bold text-body text-decoration-none">{$btr->all_comments_to_object|escape} <i class="align-middle" data-feather="arrow-right"></i></a>{/if}
													<div class="d-block d-md-none mt-1">
														{if !$comment->approved}
															<button type="button" class="btn btn-outline-secondary js-ajax-action {if $comment->approved}js-active-class{/if}" data-module="comment" data-action="approved" data-id="{$comment->id}" onclick="$(this).hide();">
																{$btr->global_process|escape}
															</button>
														{/if}
														{if $level == 0}
															<div class="answer-wrap {if !$comment->approved}d-none{/if}">
																<button type="button" data-parent-id="{$comment->id}" data-user-name="{$comment->name|escape}" data-bs-toggle="modal" data-bs-target="#answer-popup" class="btn btn-outline-primary js-answer">
																	{$btr->global_answer|escape}
																</button>
															</div>
														{/if}
													</div>
												</div>
												<div class="turbo-list-boding turbo-list-comments-btn">
													{if !$comment->approved}
														<button type="button" class="btn btn-outline-secondary js-ajax-action {if $comment->approved}js-active-class{/if}" data-module="comment" data-action="approved" data-id="{$comment->id}" onclick="$(this).hide();">
															{$btr->global_process|escape}
														</button>
													{/if}
													{if $level == 0}
														<div class="answer-wrap js-answer_btn" {if !$comment->approved}style="display: none;" {/if}>
															<button type="button" data-parent-id="{$comment->id}" data-user-name="{$comment->name|escape}" data-bs-toggle="modal" data-bs-target="#answer-popup" class="btn btn-outline-primary js-answer">
																{$btr->global_answer|escape}
															</button>
														</div>
													{/if}
												</div>

												<div class="turbo-list-boding turbo-list-delete">
													<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
														<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
															<i class="align-middle" data-feather="trash-2"></i>
														</span>
													</button>
												</div>
											</div>
										</div>
										{if isset($children[$comment->id])}
											{comments_tree comments=$children[$comment->id] level=$level+1}
										{/if}
									{/foreach}
								{/function}
								{comments_tree comments=$comments}
							</div>
							<div class="turbo-list-footer js-action-block">
								<div class="turbo-list-foot-left">
									<div class="turbo-list-heading turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
										</label>
									</div>
									<div class="turbo-list-option">
										<select name="action" class="selectpicker">
											<option value="approve">{$btr->global_process|escape}</option>
											<option value="delete">{$btr->global_delete|escape}</option>
										</select>
									</div>
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="align-middle" data-feather="check"></i>
									{$btr->global_apply|escape}
								</button>
							</div>
						</div>

					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					{include file='pagination.tpl'}
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->comments_no|escape}</h5>
		{/if}
	</div>
</div>

<div class="modal fade" id="answer-popup" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$btr->global_answer|escape}</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form method="post">
				<div class="modal-body">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<input id="js-parent-id" type="hidden" name="parent_id" value="">
					<textarea id="js-comment-area" class="form-control turbo-textarea" placeholder="{$btr->global_enter_answer|escape}" name="text" rows="10" cols="50"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="align-middle" data-feather="x"></i> {$btr->global_cancel|escape}</button>
					<button type="submit" name="comment_answer" value="1" class="btn btn-success"><i class="align-middle" data-feather="check"></i> {$btr->global_answer|escape}</button>
				</div>
			</form>
		</div>
	</div>
</div>

{literal}
	<script>
		$(function() {
			$('.js-answer').on('click', function() {
				$('#js-parent-id').val($(this).data('parent-id'));
				$('#js-comment-area').html($(this).data('user-name') + ', ');
			});
		});
	</script>
{/literal}