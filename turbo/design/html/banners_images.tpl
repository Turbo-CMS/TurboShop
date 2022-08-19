{* Title *}
{if $banner}
	{$meta_title=$banner->name scope=global}
{else}
	{$meta_title=$btr->banners_images_banners   scope=global}
{/if}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if $banners_images_count}
					{$btr->banners_images_banners} - {$banners_images_count}
				{elseif $keyword}
					{$btr->banners_images_banners} - {$banners_images_count}
				{else}
					{$btr->banners_images_none|escape}
				{/if}
			</div>
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="{url module=BannersImageAdmin return=$smarty.server.REQUEST_URI}">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->banners_images_add|escape}</span>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="boxed fn_toggle_wrap">
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="fn_toggle_wrap">
				<div class="heading_box visible_md">
					{$btr->general_filter|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="boxed_sorting toggle_body_wrap off fn_card">
					<div class="row">
						<div class="col-md-4 col-lg-4 col-sm-12">
							<div>
								<select class="selectpicker" onchange="location = this.value;">
									<option value="{url banner_id=null filter=null}" {if !$filter}{/if}>{$btr->banners_images_all|escape}</option>
									<option value="{url banner_id=null filter='visible'}" {if $filter=='visible'}selected{/if}>{$btr->banners_images_enable|escape}</option>
									<option value="{url banner_id=null filter='hidden'}" {if $filter=='hidden'}selected{/if}>{$btr->banners_images_disable|escape}</option>
								</select>
							</div>
						</div>
						{if $banners}
							<div class="col-md-4 col-lg-4 col-sm-12">
								<select class="selectpicker" onchange="location = this.value;">
									<option value="{url banner_id=null}" {if !$banner->id}selected{/if}>{$btr->general_groups|escape}</option>
									{foreach $banners as $b}
										<option value="{url keyword=null page=null banner_id=$b->id}" {if $banner->id == $b->id}selected{/if}>{$b->name|escape}</option>
									{/foreach}
								</select>
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</div>
	{if $banners_images}
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<form class="fn_form_list" method="post">
					<div id="main_list" class=" turbo_list products_list fn_sort_list">
						<input type="hidden" name="session_id" value="{$smarty.session.id}" />
						<div class="turbo_list_head">
							<div class="turbo_list_heading turbo_list_drag"></div>
							<div class="turbo_list_heading turbo_list_check">
								<label class="form-check">
									<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo_list_heading turbo_list_banners_photo">{$btr->general_image|escape}</div>
							<div class="turbo_list_heading turbo_list_banners_images_name">{$btr->general_name|escape}</div>
							<div class="turbo_list_heading turbo_list_banners_group">{$btr->general_banner_group|escape}</div>
							<div class="turbo_list_heading turbo_list_status">{$btr->general_enable|escape}</div>
							<div class="turbo_list_heading turbo_list_close"></div>
						</div>

						<div class="banners_wrap turbo_list_body features_wrap sortable">
							{foreach $banners_images as $banners_image}
								<div class="fn_row turbo_list_body_item fn_sort_item">
									<div class="turbo_list_row">
										<input type="hidden" name="positions[{$banners_image->id}]" value="{$banners_image->position}">

										<div class="turbo_list_boding turbo_list_drag move_zone">
											{include file='svg_icon.tpl' svgId='drag_vertical'}
										</div>

										<div class="turbo_list_boding turbo_list_check">
											<label class="form-check">
												<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$banners_image->id}">
											</label>
										</div>

										<div class="turbo_list_boding turbo_list_banners_photo">
											{if $banners_image->image}
												<a href="{url module=BannersImageAdmin id=$banners_image->id return=$smarty.server.REQUEST_URI}">
													<img src="{$banners_image->image|resize_banners:90:60}" />
												</a>
											{else}
												<a href="{url module=BannersImageAdmin id=$banners_image->id return=$smarty.server.REQUEST_URI}">
													<img width="55" src="design/images/no_image.svg" alt="{$banners_image->name|escape}">
												</a>
											{/if}
										</div>

										<div class="turbo_list_boding turbo_list_banners_images_name">
											<a class="link" href="{url module=BannersImageAdmin id=$banners_image->id return=$smarty.server.REQUEST_URI}">
												{$banners_image->name|escape}
											</a>
											<div class="turbo_list_name_brand">
												{$img_url=$config->root_url|cat:'/'|cat:$config->banners_images_dir|cat:$banners_image->image}
												{assign var="info" value=$img_url|getimagesize}
												{$info.0} X {$info.1} px
											</div>
										</div>

										<div class="turbo_list_boding turbo_list_banners_group">
											{if $banners}
												<select class="selectpicker" name="image_banners[{$banners_image->id}]">
													{foreach $banners as $b}
														<option value="{$b->id}" {if $b->id == $banners_image->banner_id}selected{/if}>{$b->name}</option>
													{/foreach}
												</select>
											{/if}
										</div>

										<div class="turbo_list_boding turbo_list_status">
											{*visible*}
											<div class="form-check form-switch">
												<input class="form-check-input fn_ajax_action {if $banners_image->visible}fn_active_class{/if}" id="id_{$banners_image->id}" data-module="banners_image" data-action="visible" data-id="{$banners_image->id}" name="visible" value="1" type="checkbox" {if $banners_image->visible}checked="" {/if}>
												<label class="form-check-label" for="id_{$banners_image->id}"></label>
											</div>
										</div>
										<div class="turbo_list_boding turbo_list_close">
											{*delete*}
											<button data-hint="{$btr->banners_images_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">{include file='svg_icon.tpl' svgId='delete'}</button>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
						<div class="turbo_list_footer fn_action_block">
							<div class="turbo_list_foot_left">
								<div class="turbo_list_heading turbo_list_drag"></div>
								<div class="turbo_list_heading turbo_list_check">
									<label class="form-check">
										<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo_list_option">
									<select name="action" class="selectpicker banners_action">
										<option value="enable">{$btr->general_do_enable|escape}</option>
										<option value="disable">{$btr->general_do_disable|escape}</option>
										{if $banners|count>1}
											<option value="move_to_banner">{$btr->banners_images_move|escape}</option>
										{/if}
										<option value="delete">{$btr->general_delete|escape}</option>
									</select>
								</div>
								<div>
									<div id="move_to_banner" class="col-lg-12 col-md-12 col-sm-12 hidden fn_hide_block">
										<select name="target_banner" class="selectpicker" data-live-search="true" data-size="5">
											{foreach $banners as $b}
												<option value="{$b->id}">{$b->name|escape}</option>
											{/foreach}
										</select>
									</div>
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
			<div class="text_grey">{$btr->banners_images_none|escape}</div>
		</div>
	{/if}
</div>
{literal}
	<script>
		$(function() {
			$(document).on('change', '.fn_action_block select.banners_action', function() {
				var elem = $(this).find('option:selected').val();
				$('.fn_hide_block').addClass('hidden');
				if ($('#' + elem).size() > 0) {
					$('#' + elem).removeClass('hidden');
				}
			});
		});
	</script>
{/literal}