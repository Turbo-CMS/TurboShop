{* Title *}
{$meta_title=$btr->user_groups_groups scope=global}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{$btr->user_groups_groups|escape} ({$groups|count})
			</div>
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="index.php?module=GroupAdmin">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->user_groups_add|escape}</span>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="boxed fn_toggle_wrap">
	{if $groups}
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<form class="fn_form_list" method="post">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">

					<div class="groups_wrap turbo_list">
						<div class="turbo_list_head">
							<div class="turbo_list_heading turbo_list_check">
								<label class="form-check">
									<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo_list_heading turbo_list_usergroups_name">{$btr->user_groups_name|escape}</div>
							<div class="turbo_list_heading turbo_list_usergroups_sale">{$btr->user_groups_discount|escape}</div>
							<div class="turbo_list_heading turbo_list_close"></div>
						</div>
						<div class="turbo_list_body">
							{foreach $groups as $group}
								<div class="fn_row turbo_list_body_item body_narrow">
									<div class="turbo_list_row narrow">
										<div class="turbo_list_boding turbo_list_check">
											<label class="form-check">
												<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$group->id}">
											</label>
										</div>
										<div class="turbo_list_boding turbo_list_usergroups_name">
											<a href="{url module=GroupAdmin id=$group->id}">
												{$group->name|escape}
											</a>
										</div>
										<div class="turbo_list_boding turbo_list_usergroups_sale">
											<span class="tag tag-danger">{$btr->general_discount|escape} {$group->discount} %</span>
										</div>
										<div class="turbo_list_boding turbo_list_close">
											{*delete*}
											<button data-hint="{$btr->user_groups_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
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
	{else}
		<div class="heading_box mt-1">
			<div class="text_grey">{$btr->user_groups_no|escape}</div>
		</div>
	{/if}
</div>