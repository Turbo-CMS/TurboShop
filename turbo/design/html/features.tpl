{* Title *}
{$meta_title=$btr->features_features scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{$btr->features_features|escape}
			</div>
			<div class="box_btn_heading">
				<a class="btn btn_small btn-primary" href="{url module=FeatureAdmin return=$smarty.server.REQUEST_URI}">
					{include file='svg_icon.tpl' svgId='plus'}
					<span>{$btr->features_add|escape}</span>
				</a>
			</div>
		</div>
	</div>
	<div class="col-lg-5 col-md-5 col-xs-12 float-xs-right">
		<div class="boxed_search">
			<form class="search" method="get">
				<input type="hidden" name="module" value="FeaturesAdmin">
				<div class="input-group">
					<input name="keyword" class="form-control" placeholder="{$btr->features_search|escape}" type="text" value="{$keyword|escape}">
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
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="fn_toggle_wrap">
				<div class="heading_box visible_md">
					{$btr->general_filter|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="boxed_sorting toggle_body_wrap off fn_card">
					<div class="row">
						<div class="col-md-3 col-lg-3 col-sm-12">
							<select id="id_categories" name="categories_filter" title="{$btr->general_category_filter|escape}" class="selectpicker form-control" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url keyword=null brand_id=null page=null limit=null category_id=null}" {if !$category}selected{/if}>{$btr->general_all_categories|escape}</option>
								{function name=category_select level=0}
									{foreach $categories as $c}
										<option value='{url category_id=$c->id}' {if $category->id == $c->id}selected{/if}>
											{section sp $level}-{/section}{$c->name|escape}
										</option>
										{category_select categories=$c->subcategories level=$level+1}
									{/foreach}
								{/function}
								{category_select categories=$categories}
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	{if $features}
		<form method="post" class="fn_form_list">
			<input type="hidden" name="session_id" value="{$smarty.session.id}" />
			<div class="turbo_list fn_sort_list">
				<div class="turbo_list_head">
					<div class="turbo_list_heading turbo_list_drag"></div>
					<div class="turbo_list_heading turbo_list_check">
						<label class="form-check">
							<input class="form-check-input fn_check_all fn_check_all_single" type="checkbox" value="">
						</label>
					</div>
					<div class="turbo_list_heading turbo_list_features_name">{$btr->general_name|escape}</div>
					<div class="turbo_list_heading turbo_list_features_tag"></div>
					<div class="turbo_list_heading turbo_list_url_status">{$btr->feature_url_in_product_short|escape}</div>
					<div class="turbo_list_heading turbo_list_status">{$btr->feature_filter|escape}</div>
					<div class="turbo_list_heading turbo_list_close"></div>
				</div>
				<div class="turbo_list_body features_wrap sortable">
					{foreach $features as $feature}
						<div class="fn_row turbo_list_body_item fn_sort_item body_narrow">
							<div class="turbo_list_row narrow">
								<input type="hidden" name="positions[{$feature->id}]" value="{$feature->position}" />
								<div class="turbo_list_boding turbo_list_drag move_zone">
									{include file='svg_icon.tpl' svgId='drag_vertical'}
								</div>
								<div class="turbo_list_boding turbo_list_check">
									<label class="form-check">
										<input class="form-check-input fn_check_all_single" type="checkbox" name="check[]" value="{$feature->id}">
									</label>
								</div>
								<div class="turbo_list_boding turbo_list_features_name">
									<a class="link" href="{url module=FeatureAdmin id=$feature->id return=$smarty.server.REQUEST_URI}">
										{$feature->name|escape}
									</a>
								</div>
								<div class="turbo_list_boding turbo_list_features_tag"></div>
								<div class="turbo_list_boding turbo_list_url_status">
									{*url_in_product*}
									<div class="form-check form-switch">
										<input class="form-check-input fn_ajax_action {if $feature->url_in_product}fn_active_class{/if}" id="id_{$feature->id}" data-module="feature" data-action="url_in_product" data-id="{$feature->id}" name="url_in_product" value="1" type="checkbox" {if $feature->url_in_product}checked="" {/if}>
										<label class="form-check-label" for="id_{$feature->id}"></label>
									</div>
								</div>
								<div class="turbo_list_boding turbo_list_status">
									{*visible*}
									<div class="form-check form-switch">
										<input class="form-check-input fn_ajax_action {if $feature->in_filter}fn_active_class{/if}" id="id_{$feature->id}" data-module="feature" data-action="in_filter" data-id="{$feature->id}" name="in_filter" value="1" type="checkbox" {if $feature->in_filter}checked="" {/if}>
										<label class="form-check-label" for="id_{$feature->id}"></label>
									</div>
								</div>
								<div class="turbo_list_boding turbo_list_close">
									{*delete*}
									<button data-hint="{$btr->features_delete|escape}" type="button" class="btn_close fn_remove hint-bottom-right-t-info-s-small-mobile  hint-anim" data-toggle="modal" data-target="#fn_action_modal" onclick="success_action($(this));">
										{include file='svg_icon.tpl' svgId='delete'}
									</button>
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
							<select name="action" class="selectpicker">
								<option value="set_in_filter">{$btr->features_in_filter|escape}</option>
								<option value="unset_in_filter">{$btr->features_not_in_filter|escape}</option>
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
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm 12 txt_center">
				{include file='pagination.tpl'}
			</div>
		</div>
	{else}
		<div class="heading_box mt-1">
			<div class="text_grey">{$btr->features_no|escape}</div>
		</div>
	{/if}
</div>