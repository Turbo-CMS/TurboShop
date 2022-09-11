{$meta_title = $btr->menus_menu scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{$btr->menus_menu|escape}
			</div>
			<div class="box_btn_heading">
				<a id="add_menu" class="btn btn_small btn-primary" href="#">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->menus_add|escape}</span>
				</a>
			</div>
		</div>
	</div>
</div>

{if $message_error}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_warning">
				<div class="heading_box">
					{$message_error|escape}
				</div>
			</div>
		</div>
	</div>
{/if}

<div class="boxed fn_toggle_wrap">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<form method="post" class="fn_form_list">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="turbo_list">
					<div class="currencies_wrap clearfix">
						<div class="turbo_list_head">
							<div class="turbo_list_heading turbo_list_drag"></div>
							<div class="turbo_list_heading turbo_list_menu_num">ID</div>
							<div class="turbo_list_heading turbo_list_menus_name">{$btr->menus_name|escape}</div>
							<div class="turbo_list_heading turbo_list_close"></div>
						</div>
						<div id="menu_block" class="turbo_list_body sortable">
							{foreach $menus as $m}
								<div class="turbo_list_body_item">
									<div class="turbo_list_row">
										<div class="turbo_list_boding turbo_list_drag move_zone">
											{include file='svg_icon.tpl' svgId='drag_vertical'}
										</div>
										<div class="turbo_list_boding turbo_list_menu_num">
											<span>{$m->id}</span>
										</div>
										<div class="turbo_list_boding turbo_list_menus_name">
											<input name="menu[id][{$m->id}]" type="hidden" value="{$m->id|escape}">
											<input name="menu[name][{$m->id}]" class="form-control" type="text" value="{$m->name|escape}">
										</div>
										<div class="turbo_list_boding turbo_list_close turbo_list_menus_close">
											{*delete*}
											<button data-hint="{$btr->general_delete|escape}" type="button" class=" btn_close fn_remove_menu hint-bottom-right-t-info-s-small-mobile hint-anim" data-id="{$m->id}" data-toggle="modal" data-target="#fn_menu_delete">
												{include file='svg_icon.tpl' svgId='delete'}
											</button>
										</div>
									</div>
								</div>
							{/foreach}
							<div id="new_menu" class="turbo_list_body sortable" style="display: none">
								<div class="turbo_list_body_item">
									<div class="turbo_list_row">
										<div class="turbo_list_boding turbo_list_drag move_zone">
											{include file='svg_icon.tpl' svgId='drag_vertical'}
										</div>
										<div class="turbo_list_boding turbo_list_menu_num"></div>
										<div class="turbo_list_boding turbo_list_menus_name">
											<input name="menu[id][]" type="hidden" value="">
											<input name="menu[name][]" class="form-control" type="text" value="">
										</div>
										<div class="turbo_list_boding turbo_list_close turbo_list_menus_close"></div>
									</div>
								</div>
							</div>
						</div>
						<div id="action" class="turbo_list_footer">
							<div class="turbo_list_foot_left"></div>
							<input type="hidden" name="action" value="">
							<input type="hidden" name="action_id" value="">
							<button id="apply_action" type="submit" class="btn btn_small btn-primary">
								{include file='svg_icon.tpl' svgId='checked'}
								<span>{$btr->general_apply|escape}</span>
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<div id="fn_menu_delete" class="modal fade show" role="document">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="card-header">
				<div class="heading_modal">{$btr->general_confirm_delete|escape}</div>
			</div>
			<div class="modal-body">
				<button type="submit" class="btn btn_small btn-success fn_delete_menu_confirm mx-h">
					{include file='svg_icon.tpl' svgId='checked'}
					<span>{$btr->index_yes|escape}</span>
				</button>

				<button type="button" class="btn btn_small btn-danger fn_dismiss_menu mx-h" data-dismiss="modal">
					{include file='svg_icon.tpl' svgId='close'}
					<span>{$btr->index_no|escape}</span>
				</button>
			</div>
		</div>
	</div>
</div>
{* On document load *}
{literal}
	<script>
		$(function() {
			// Add menu
			var curr = $('#new_menu').clone(true);
			$('#new_menu').remove().removeAttr('id');
			$('a#add_menu').click(function() {
				$(curr).clone(true).appendTo('#menu_block').fadeIn('slow').find("input[name*=name]").focus();
				return false;
			});
			var menu_to_delete;
			$(document).on("click", ".fn_remove_menu", function() {
				menu_to_delete = $(this).data("id");
			});
			$(document).on("click", ".fn_delete_menu_confirm", function() {
				$('input[type="hidden"][name="action"]').val('delete');
				$('input[type="hidden"][name="action_id"]').val(menu_to_delete);
				$(".fn_form_list").submit();
			});
			$(".fn_form_list").submit(function() {
				if ($('input[type="hidden"][name="action"]').val() == 'delete' && !confirm) {
					$('[data-target="#fn_menu_delete"]').trigger('click');
					return false;
				}
			});
		});
	</script>
{/literal}