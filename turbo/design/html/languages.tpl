{* Title *}
{$meta_title=$btr->general_languages scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{$btr->languages_site|escape}
			</div>
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="{url module=LanguageAdmin return=$smarty.server.REQUEST_URI}">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->languages_add|escape}</span>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="boxed fn_toggle_wrap">
	{if $languages}
		<form method="post" class="fn_form_list">
			<input type="hidden" name="session_id" value="{$smarty.session.id}" />
			<div class="turbo_list products_list fn_sort_list">
				<div class="turbo_list_head">
					<div class="turbo_list_boding turbo_list_drag"></div>
					<div class="turbo_list_heading turbo_list_check">
						<label class="form-check">
							<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
						</label>
					</div>
					<div class="turbo_list_heading turbo_list_photo">{$btr->general_photo|escape}</div>
					<div class="turbo_list_heading turbo_list_languages_name">{$btr->general_name|escape}</div>
					<div class="turbo_list_heading turbo_list_status">{$btr->general_enable|escape}</div>
					<div class="turbo_list_heading turbo_list_close"></div>
				</div>
				<div class="turbo_list_body sortable">
					{foreach $languages as $language}
						<div class="fn_row turbo_list_body_item fn_sort_item">
							<div class="turbo_list_row">
								<input type="hidden" name="positions[]" value="{$language->id}">

								<div class="turbo_list_boding turbo_list_drag move_zone">
									{include file='svg_icon.tpl' svgId='drag_vertical'}
								</div>
								<div class="turbo_list_boding turbo_list_check">
									<label class="form-check">
										<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$language->id}">
									</label>
								</div>
								<div class="turbo_list_boding turbo_list_photo turbo_list_languages_photo">
									<a>
										<img height="40" width="40" src="design/flags/4x3/{$language->label}.svg" />
									</a>
								</div>
								<div class="turbo_list_boding turbo_list_languages_name">
									<a>
										{$language->name|escape} [{$language->label|escape}]
									</a>
								</div>

								<div class="turbo_list_boding turbo_list_status">
									{*visible*}
									<div class="form-check form-switch">
										<input class="form-check-input fn_ajax_action {if $language->enabled}fn_active_class{/if}" id="id_{$language->id}" data-module="language" data-action="enabled" data-id="{$language->id}" name="enabled" value="1" type="checkbox" {if $language->enabled}checked="" {/if}>
										<label class="form-check-label" for="id_{$language->id}"></label>
									</div>
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
						<div class="turbo_list_boding turbo_list_drag"></div>
						<div class="turbo_list_heading turbo_list_check">
							<label class="form-check">
								<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo_list_option">
							<select name="action" class="selectpicker">
								<option value="enable">{$btr->languages_enable|escape}</option>
								<option value="disable">{$btr->languages_disable|escape}</option>
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
	{else}
		<div class="heading_box mt-1">
			<div class="text_grey"> {$btr->languages_no_list|escape}</div>
		</div>
	{/if}
</div>