{* Title *}
{$meta_title=$btr->users_users scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="heading_page">
			{if $keyword && $users_count>0}
				{$btr->users_users|escape} ({$users_count})
			{elseif $users_count>0}
				{$btr->users_users|escape} ({$users_count})
			{else}
				{$btr->users_no|escape}
			{/if}
			{if $users_count>0}
				<div class="export_block export_users hint-bottom-middle-t-info-s-small-mobile  hint-anim" data-hint="{$btr->users_export|escape}">
					{include file='svg_icon.tpl' svgId='file_export'}
				</div>
			{/if}
		</div>
	</div>

	<div class="col-lg-5 col-md-5 col-xs-12 float-xs-right">
		<div class="boxed_search">
			<form class="search" method="get">
				<input type="hidden" name="module" value="UsersAdmin">
				<div class="input-group">
					<input name="keyword" class="form-control" placeholder="{$btr->users_search|escape}" type="text" value="{$keyword|escape}">
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
		{if $users_count>0}
			<div class="col-lg-12 col-md-12">
				<div class="progress mb-1" style="display: none;">
					<div id="progressbar" class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
				</div>
			</div>
		{/if}
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="fn_toggle_wrap">
				<div class="heading_box visible_md">
					{$btr->general_filter|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="boxed_sorting action_options toggle_body_wrap off fn_card">
					<div class="row">
						<div class="col-md-3 col-lg-3 col-sm-12">
							<select class="selectpicker" onchange="location = this.value;">
								<option value="{url group_id=null}">{$btr->general_filter|escape}</option>
								{foreach $groups as $g}
									<option value="{url group_id=$g->id}" {if $group->id == $g->id}selected{/if}>{$g->name|escape}</option>
								{/foreach}
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	{if $users}
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<form class="fn_form_list" method="post">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">

					<div class="users_wrap turbo_list products_list fn_sort_list">
						<div class="turbo_list_head">
							<div class="turbo_list_heading turbo_list_check">
								<label class="form-check">
									<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo_list_heading turbo_list_users_name">
								<span>{$btr->index_name|escape}</span>
								<a href="{url sort=name}" {if $sort == 'name'}class="active" {/if}>{include file='svg_icon.tpl' svgId='sorts'}</a>
							</div>
							<div class="turbo_list_heading turbo_list_users_email">
								<span>Email</span>
								<a href="{url sort=email}" {if $sort == 'email'}class="active" {/if}>{include file='svg_icon.tpl' svgId='sorts'}</a>
							</div>
							<div class="turbo_list_heading turbo_list_users_date">
								<span>{$btr->general_registration_date|escape}</span>
								<a href="{url sort=date}" {if $sort == 'date'}class="active" {/if}>{include file='svg_icon.tpl' svgId='sorts'}</a>
							</div>
							<div class="turbo_list_heading turbo_list_users_group">{$btr->general_group|escape}</div>

							<div class="turbo_list_heading turbo_list_count">{$btr->users_orders|escape}</div>

							<div class="turbo_list_heading turbo_list_status">{$btr->general_activities|escape}</div>
							<div class="turbo_list_heading turbo_list_close"></div>
						</div>
						<div class="turbo_list_body sortable">
							{foreach $users as $user}
								<div class="fn_row turbo_list_body_item fn_sort_item body_narrow">
									<div class="turbo_list_row narrow">
										<div class="turbo_list_boding turbo_list_check">
											<label class="form-check">
												<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$user->id}">
											</label>
										</div>

										<div class="turbo_list_boding turbo_list_users_name">
											<a href="{url module=UserAdmin id=$user->id}">
												{$user->name|escape}
											</a>
										</div>

										<div class="turbo_list_boding turbo_list_users_email">
											<a href="mailto:{$user->name|escape}<{$user->email|escape}>">
												{$user->email|escape}
											</a>
										</div>

										<div class="turbo_list_boding turbo_list_users_date">
											<span class="text_spacing">{$user->created|date} | {$user->created|time}</span>
										</div>

										<div class="turbo_list_boding turbo_list_users_group">
											{if $groups[$user->group_id]}
												<span class="text_spacing">{$groups[$user->group_id]->name|escape}</span>
											{else}
												<span>—</span>
											{/if}
										</div>

										<div class="turbo_list_boding turbo_list_count">
											{$user->orders|count}
										</div>

										<div class="turbo_list_boding turbo_list_status">
											{*visible*}
											<div class="form-check form-switch">
												<input class="form-check-input fn_ajax_action {if $user->enabled}fn_active_class{/if}" id="id_{$user->id}" data-module="user" data-action="enabled" data-id="{$user->id}" name="enabled" value="1" type="checkbox" {if $user->enabled}checked="" {/if}>
												<label class="form-check-label" for="id_{$user->id}"></label>
											</div>
										</div>

										<div class="turbo_list_boding turbo_list_close">
											<button data-hint="{$btr->users_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
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
									<select name="action" class="selectpicker fn_user_select">
										<option value="0">{$btr->general_select_action|escape}</option>
										<option value="enable">{$btr->general_do_enable|escape}</option>
										<option value="disable">{$btr->general_do_disable|escape}</option>
										<option value="move_to">{$btr->users_move|escape}</option>
										<option value="delete">{$btr->general_delete|escape}</option>
									</select>
								</div>
								<div id="move_to" class="turbo_list_option hidden fn_hide_block">
									<select name="move_group" class="selectpicker">
										{if $groups}
											{foreach $groups as $group}
												<option value="{$group->id}">{$group->name|escape}</option>
											{/foreach}
										{/if}
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
			<div class="col-lg-12 col-md-12 col-sm 12 txt_center">
				{include file='pagination.tpl'}
			</div>
		</div>
	{else}
		<div class="heading_box mt-1">
			<div class="text_grey">{$btr->users_no|escape}</div>
		</div>
	{/if}
</div>

{* Piecon *}
{js id="piecon" priority=99 include=[
"turbo/design/js/piecon/piecon.min.js"
]}{/js}
{javascript minify=true}
<script>
	var group_id='{$group_id|escape}';
	var keyword='{$keyword|escape}';
	var sort='{$sort|escape}';
</script>

{literal}
	<script>
		$(function() {

			$(document).on('change', 'select.fn_user_select', function() {
				var elem = $(this).find('option:selected').val();
				$('.fn_hide_block').addClass('hidden');
				if ($('#' + elem).size() > 0) {
					$('#' + elem).removeClass('hidden');
				}
			});

			// On document load
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
					url: "ajax/export_users.php",
					data: {page:page, group_id:group_id, keyword:keyword, sort:sort},
					dataType: 'json',
					success: function(data) {
						if (data && !data.end) {
							Piecon.setProgress(Math.round(100 * data.page / data.totalpages));
							progress.css('width', 100 * data.page / data.totalpages + '%');
							do_export(data.page * 1 + 1, progress);
						} else {
							Piecon.setProgress(100);
							progress.css('width', '100%');
							window.location.href = 'files/export_users/users.csv';
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