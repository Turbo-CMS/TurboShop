{* Title *}
{$meta_title=$btr->general_comments scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if !$type}
					{$btr->general_comments} - {$comments_count}
				{elseif $type=='product'}
					{$btr->general_comments} {$btr->comments_to_products|escape} - {$comments_count}
				{elseif $type=='blog'}
					{$btr->general_comments} {$btr->comments_to_articles|escape} - {$comments_count}
				{elseif $type=='article'}
					{$btr->general_comments} {$btr->comments_to_articles|escape} - {$comments_count}
				{elseif $type=='review'}
					{$btr->general_review} - {$comments_count}
				{/if}
			</div>
		</div>
	</div>
	<div class="col-lg-5 col-md-5 col-xs-12 float-xs-right">
		<div class="boxed_search">
			<form class="search" method="get">
				<input type="hidden" name="module" value="CommentsAdmin">
				<div class="input-group">
					<input name="keyword" class="form-control" placeholder="{$btr->comments_search|escape}" type="text" value="{$keyword|escape}">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary">{include file='svg_icon.tpl' svgId='search'} <span class="hidden-md-down"></span></button>
					</span>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="boxed fn_toggle_wrap">
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed_sorting">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-12">
						<select class="selectpicker form-control" onchange="location = this.value;">
							<option value="{url type=null}" {if !$type}selected{/if}>{$btr->comments_all|escape}</option>
							<option value="{url keyword=null type=product}" {if $type == 'product'}selected{/if}>{$btr->comments_to_products|escape}</option>
							<option value="{url keyword=null type=blog}" {if $type == 'blog'}selected{/if}>{$btr->comments_to_news|escape}</option>
							<option value="{url keyword=null type=article}" {if $type == 'article'}selected{/if}>{$btr->comments_to_articles|escape}</option>
							<option value="{url keyword=null type=review}" {if $type == 'review'}selected{/if}>{$btr->general_review|escape}</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	{if $comments}
		<div class="row">
			{* Main form *}
			<div class="col-lg-12 col-md-12 col-sm-12">
				<form class="fn_form_list" method="post">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<div class="post_wrap turbo_list">
						<div class="turbo_list_head">
							<div class="turbo_list_heading turbo_list_check">
								<label class="form-check">
									<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo_list_heading turbo_list_comments_name">{$btr->general_comments|escape}</div>
							<div class="turbo_list_heading turbo_list_comments_btn"></div>
							<div class="turbo_list_heading turbo_list_close"></div>
						</div>
						<div class="turbo_list_body">
							{function name=comments_tree level=0}
								{foreach $comments as $comment}
									<div class="fn_row turbo_list_body_item {if !$comment->approved}unapproved{/if} {if $level > 0}subcomments_level_{$level}{/if}">
										<div class="turbo_list_row">

											{if $level > 0}<div class="turbo_list_heading turbo_list_subcomment"></div>{/if}
											<div class="turbo_list_boding turbo_list_check">
												<label class="form-check">
													<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$comment->id}">
												</label>
											</div>

											<div class="turbo_list_boding turbo_list_comments_name {if $level > 0}admin_note{/if}">
												<div class="turbo_list_text_inline mb-q mr-1 {if !$comment->admin}admin{/if}">
													<span class="text_dark text_bold text_spacing">{$btr->index_name|escape}: </span> <a href="{url module=CommentAdmin id=$comment->id return=$smarty.server.REQUEST_URI}">{$comment->name|escape}</a>
												</div>
												{if $comment->email}
													<div class="turbo_list_text_inline mb-q">
														<span class="text_dark text_bold text_spacing">Email: </span> {$comment->email|escape}
													</div>
												{/if}
												<div class="mb-q">
													<span class="text_dark text_bold text_spacing">{$btr->general_message|escape}:</span>
													<span class="text_spacing">{$comment->text|escape|nl2br}</span>
												</div>
												<div class="">
													<span class="text_spacing">{$btr->comments_left|escape}</span> <span class="tag tag-default">{$comment->date|date} | {$comment->date|time}</span>
													{if $level == 0}
														{$btr->comments_to_the|escape}
														{if $comment->type == 'product'}
															{$btr->comments_product|escape} <a target="_blank" href="{$config->root_url}/products/{$comment->product->url}#comment_{$comment->id}">{$comment->product->name}</a>
														{elseif $comment->type == "blog"}
															{$btr->comments_blog|escape} <a href="{$config->root_url}/blog/{$comment->post->url|escape}#comment_{$comment->id}" target="_blank">{$comment->post->name|escape}</a>
														{elseif $comment->type == 'article'}
															{$btr->comments_article|escape} <a target="_blank" href="{$config->root_url}/article/{$comment->article->url}#comment_{$comment->id}">{$comment->article->name}</a>
														{elseif $comment->type == 'review'}
															<a target="_blank" href="{$config->root_url}/reviews/#comment_{$comment->id}">{$btr->general_review|escape}</a>
														{/if}
													{/if}
												</div>

												<div class="hidden-md-up mt-q">
													{if !$comment->approved}
														<button type="button" class="btn btn_small btn-outline-secondary fn_ajax_action {if $comment->approved}fn_active_class{/if}" data-module="comment" data-action="approved" data-id="{$comment->id}" onclick="$(this).hide();">
															{$btr->general_process|escape}
														</button>
													{/if}
													<div class="answer_wrap {if !$comment->approved}hidden{/if}">
														<button type="button" data-parent_id="{$comment->id}" data-user_name="{$comment->name|escape}" data-toggle="modal" data-target="#answer_popup" class="btn btn_small btn-outline-primary fn_answer">
															{$btr->general_answer|escape}
														</button>
													</div>
												</div>
											</div>

											<div class="turbo_list_boding turbo_list_comments_btn">
												{if !$comment->approved}
													<button type="button" class="btn btn_small btn-outline-secondary fn_ajax_action {if $comment->approved}fn_active_class{/if}" data-module="comment" data-action="approved" data-id="{$comment->id}" onclick="$(this).hide();">
														{$btr->general_process|escape}
													</button>
												{/if}
												<div class="answer_wrap fn_answer_btn" {if !$comment->approved}style="display: none;" {/if}>
													<button type="button" data-parent_id="{$comment->id}" data-user_name="{$comment->name|escape}" data-toggle="modal" data-target="#answer_popup" class="btn btn_small btn-outline-primary fn_answer">
														{$btr->general_answer|escape}
													</button>
												</div>
											</div>

											<div class="turbo_list_boding turbo_list_close">
												{*delete*}
												<button data-hint="{$btr->comments_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
													{include file='svg_icon.tpl' svgId='delete'}
												</button>
											</div>

										</div>

									</div>
									{comments_tree comments = $comment->subcomments level=$level+1}
								{/foreach}
							{/function}
							{comments_tree comments = $comments}
						</div>

						<div class="turbo_list_footer fn_action_block">
							<div class="turbo_list_foot_left">
								<div class="turbo_list_heading turbo_list_check">
									<label class="form-check">
										<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo_list_option">
									<select name="action" class="selectpicker">
										<option value="approve">{$btr->general_process|escape}</option>
										<option value="delete">{$btr->general_delete|escape}</option>
									</select>
								</div>
							</div>
							<button type="submit" class="btn btn_small btn-primary">
								{include file='svg_icon.tpl' svgId='checked'}
								<span>{$btr->general_apply|escape}</span>
							</button>
						</div>
					</div>

				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm 12 txt_center">
				{include file='pagination.tpl'}
			</div>
		</div>
	{else}
		<div class="heading_box mt-1">
			<div class="text_grey">{$btr->comments_no|escape}</div>
		</div>
	{/if}
</div>

{* Message reply form *}
<div id="answer_popup" class="modal fade show" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="card-header">
				<div class="heading_modal">{$btr->general_answer|escape}</div>
			</div>
			<div class="modal-body">
				<form class="form-horizontal " method="post">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<input id="fn_parent_id" type="hidden" name="parent_id" value="" />
					<div class="form-group">
						<textarea id="fn_comment_area" class="form-control turbo_textarea" placeholder="{$btr->general_enter_answer|escape}" name="text" rows="10" cols="50"></textarea>
					</div>
					<button type="submit" name="comment_answer" value="1" class="btn btn_small btn-success mx-h">
						{include file='svg_icon.tpl' svgId='checked'}
						<span>{$btr->general_answer|escape}</span>
					</button>

					<button type="button" class="btn btn_small btn-danger mx-h" data-dismiss="modal">
						{include file='svg_icon.tpl' svgId='close'}
						<span>{$btr->general_cancel|escape}</span>
					</button>
				</form>
			</div>
		</div>
	</div>
</div>

{literal}
	<script>
		$(function() {
			$('.fn_answer').on('click', function() {
				$('#fn_parent_id').val($(this).data('parent_id'));
				$('#fn_comment_area').html($(this).data('user_name') + ', ');
			});
		});
	</script>
{/literal}