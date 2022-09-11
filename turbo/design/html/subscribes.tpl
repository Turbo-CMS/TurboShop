{* Title *}
{$meta_title=$btr->subscribe_mailing_subscribes scope=global}

<div class="row">
	<div class="col-lg-12 col-md-12">
		<div class="heading_page">
			{if $keyword && $subscribes_count>0}
				{$btr->subscribe_mailing_subscribes|escape} - {$subscribes_count}
			{elseif $subscribes_count>0}
				{$btr->subscribe_mailing_subscribes|escape} - {$subscribes_count}
			{/if}

			{if $subscribes_count>0}
				<div class="export_block export_subscribes hint-bottom-middle-t-info-s-small-mobile  hint-anim" data-hint="{$btr->subscribe_mailing_export|escape}">
					{include file='svg_icon.tpl' svgId='file_export'}
				</div>
			{/if}
		</div>
	</div>
</div>

<div class="boxed fn_toggle_wrap">
	{if $subscribes}
		<div class="row">
			{if $subscribes_count>0}
				<div class="col-lg-12 col-md-12">
					<div class="progress mb-1" style="display: none;">
						<div id="progressbar" class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
					</div>
				</div>
			{/if}
			<div class="col-lg-12 col-md-12 col-sm-12">
				<form class="fn_form_list" method="post">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<div class="users_wrap turbo_list">
						<div class="turbo_list_head">
							<div class="turbo_list_heading turbo_list_check">
								<label class="form-check">
									<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo_list_heading turbo_list_subscribe_name">Email</div>
							<div class="turbo_list_heading turbo_list_close"></div>
						</div>
						<div class="turbo_list_body sortable">
							{foreach $subscribes as $subscribe}
								<div class="fn_row turbo_list_body_item {if !$subscribe->processed}unapproved{/if} body_narrow">
									<div class="turbo_list_row narrow">
										<div class="turbo_list_boding turbo_list_check">
											<label class="form-check">
												<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$subscribe->id}">
											</label>
										</div>

										<div class="turbo_list_boding turbo_list_subscribe_name">
											<a class="link" href="mailto:{$subscribe->email|escape}">
												{$subscribe->email|escape}
											</a>
											<div>
												<span class="text_spacing">{$btr->general_request_sent|escape}:</span> <span class="tag tag-default">{$subscribe->date|date} | {$subscribe->date|time}</span>
											</div>
											{if !$subscribe->processed}
												<div class="hidden-md-up mt-q">
													<button type="button" class="btn btn_small btn-outline-secondary fn_ajax_action {if $subscribe->processed}fn_active_class{/if}" data-module="subscribe" data-action="processed" data-id="{$subscribe->id}" onclick="$(this).hide();">
														{$btr->general_process|escape}
													</button>
												</div>
											{/if}
										</div>
										<div class="turbo_list_boding turbo_list_comments_btn">
											{if !$subscribe->processed}
												<button type="button" class="btn btn_small unapproved btn-outline-secondary fn_ajax_action {if $subscribe->processed}fn_active_class{/if}" data-module="subscribe" data-action="processed" data-id="{$subscribe->id}" onclick="$(this).hide();">
													{$btr->general_process|escape}
												</button>
											{/if}
										</div>
										<div class="turbo_list_boding turbo_list_close">
											{*delete*}
											<button data-hint="{$btr->general_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
												{include file='svg_icon.tpl' svgId='delete'}
											</button>
										</div>
									</div>
								</div>
							{/foreach}
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
										<option value="processed">{$btr->general_process|escape}</option>
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
			<div class="text_grey">{$btr->subscribe_mailing_mo|escape}</div>
		</div>
	{/if}
</div>
{* Piecon *}
{js id="piecon" priority=99 include=[
"turbo/design/js/piecon/piecon.min.js"
]}{/js}
{javascript minify=true}
<script>
	var in_process = false;
	var keyword='{$keyword|escape}';
	var sort='{$sort|escape}';

	{literal}
		$(function() {

			$(document).on('click', '.feather-file-text', function() {
				Piecon.setOptions({fallback: 'force'});
				Piecon.setProgress(0);
				var progress_item = $("#progressbar"); //specify an element selector with animation
				$(".progress").show();
				do_export('', progress_item);
			});

			function do_export(page, progress) {
				page = typeof(page) != 'undefined' ? page : 1;
				$.ajax({
					url: "ajax/export_subscribes.php",
					data: {page:page, keyword:keyword, sort:sort},
					dataType: 'json',
					success: function(data) {
						if (data && !data.end) {
							Piecon.setProgress(Math.round(100 * data.page / data.totalpages));
							progress.css('width', 100 * data.page / data.totalpages + '%');
							do_export(data.page * 1 + 1, progress);
						} else {
							Piecon.setProgress(100);
							progress.css('width', '100%');
							window.location.href = 'files/export_users/subscribes.csv';
							$(".progress").fadeOut(500);
						}
					},
					error: function(xhr, status, errorThrown) {
						alert(errorThrown + '\n' + xhr.responseText);
					}

				});
			}
		});
	</script>
{/literal}