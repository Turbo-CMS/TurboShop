{* Title *}
{$meta_title = $btr->faq_title scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			{if $faqs}
				<div class="box_heading heading_page">
					{$btr->faq_title|escape}
				</div>
			{else}
				<div class="box_heading heading_page">{$btr->no_faqs|escape}</div>
			{/if}
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="{url module=FAQAdmin return=$smarty.server.REQUEST_URI}">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->faq_add|escape}</span>
				</a>
			</div>
		</div>
	</div>

	<div class="col-lg-5 col-md-5 col-xs-12 float-xs-right">
		<div class="boxed_search">
			<form class="search" method="get">
				<input type="hidden" name="module" value="FAQsAdmin">
				<div class="input-group">
					<input name="keyword" class="form-control" placeholder="{$btr->faq_search|escape}" type="text" value="{$keyword|escape}">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary">{include file='svg_icon.tpl' svgId='search'} <span class="hidden-md-down"></span></button>
					</span>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="boxed fn_toggle_wrap">
	{if $faqs}
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<form method="post" class="fn_form_list">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<div class="turbo_list products_list fn_sort_list">
						<div class="turbo_list_head">
							<div class="turbo_list_boding turbo_list_drag"></div>
							<div class="turbo_list_heading turbo_list_check">
								<label class="form-check">
									<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo_list_heading turbo_list_name turbo_list_faq_name">{$btr->general_name|escape}</div>
							<div class="turbo_list_heading turbo_list_status">{$btr->general_enable|escape}</div>
							<div class="turbo_list_heading turbo_list_close"></div>
						</div>
						<div id="" class="turbo_list_body sortable">
							{foreach $faqs as $faq}
								<div class="fn_row turbo_list_body_item fn_sort_item">
									<div class="turbo_list_row">
										<input type="hidden" name="positions[{$faq->id}]" value="{$faq->position}">

										<div class="turbo_list_boding turbo_list_drag move_zone">
											{include file='svg_icon.tpl' svgId='drag_vertical'}
										</div>

										<div class="turbo_list_boding turbo_list_check">
											<label class="form-check">
												<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$faq->id}">
											</label>
										</div>
										<div class="turbo_list_boding turbo_list_name turbo_list_faq_name">
											<a class="link" href="{url module=FAQAdmin id=$faq->id return=$smarty.server.REQUEST_URI}">{$faq->name|escape}</a>
										</div>
										{*visible*}
										<div class="turbo_list_boding turbo_list_status">
											<div class="form-check form-switch">
												<input class="form-check-input fn_ajax_action {if $faq->visible}fn_active_class{/if}" id="id_{$faq->id}" data-module="faq" data-action="visible" data-id="{$faq->id}" name="visible" value="1" type="checkbox" {if $faq->visible}checked="" {/if}>
												<label class="form-check-label" for="id_{$faq->id}"></label>
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
									<select name="action" class="selectpicker products_action">
										<option value="enable">{$btr->general_do_enable|escape}</option>
										<option value="disable">{$btr->general_do_disable|escape}</option>
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
			<div class="text_grey">{$btr->blog_no_post|escape}</div>
		</div>
	{/if}
</div>