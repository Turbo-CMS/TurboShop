{if $banner->id}
	{$meta_title = $banner->name scope=global}
{else}
	{$meta_title = $btr->banner_new_group scope=global}
{/if}

<div class="row">
	<div class="col-lg-12 col-md-12">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if !$banner->id}
					{$btr->banner_new_group|escape}
				{else}
					{$banner->name|escape}
				{/if}
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-12 col-sm-12 float-xs-right"></div>
</div>

{if $message_success}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_success">
				<div class="heading_box">
					{if $message_success == 'added'}
						{$btr->general_group_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->banner_updated|escape}
					{/if}
					{if $smarty.get.return}
						<a class="btn btn_return float-xs-right" href="{$smarty.get.return}">
							{include file='svg_icon.tpl' svgId='return'}
							<span>{$btr->general_back|escape}</span>
						</a>
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}

{if $message_error}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_warning">
				<div class="heading_box">
					{if $message_error == 'group_id_exists'}
						{$btr->banner_id_exists|escape}
					{elseif $message_error == 'empty_group_id'}
						{$btr->banner_enter_id|escape}
					{else}
						{$message_error|escape}
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data" class="fn_fast_button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-xs-12">
			<div class="boxed">
				<div class="row d_flex">
					<div class="col-lg-10 col-md-9 col-sm-12">
						<div class="heading_label">
							{$btr->general_name|escape}
						</div>
						<div class="form-group">
							<input class="form-control mb-h" name="name" type="text" value="{$banner->name|escape}">
							<input name="id" type="hidden" value="{$banner->id|escape}">
						</div>
						<div class="row">
							<div class="col-lg-6 col-sm-12">
								<div class="mt-h">
									<span class="boxes_inline">
										<div class="form-check form-switch">
											<input class="form-check-input" id="show_all_pages" name="show_all_pages" value="1" type="checkbox" {if $banner->show_all_pages}checked=""{/if}>
											<label class="form-check-label" for="show_all_pages"></label>
										</div>
									</span>
									<span class="boxes_inline heading_label">{$btr->banner_show_group|escape}</span>
								</div>
							</div>
							<div class="col-lg-6 col-sm-12">
								<div class="input-group">
									<span class="boxes_inline heading_label">{$btr->banner_id_enter|escape}</span>
									<span class="boxes_inline bnr_id_grup">
										<input name="group_id" class="form-control" type="text" value="{$banner->group_id|escape}">
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-sm-12">
						<div class="activity_of_switch">
							<div class="activity_of_switch_item">
								<div class="turbo_switch clearfix">
									<label class="switch_label">{$btr->general_enable|escape}</label>
									<div class="form-check form-switch">
										<input class="form-check-input" id="visible_checkbox" name="visible" value="1" type="checkbox" {if $banner->visible}checked=""{/if}>
										<label class="form-check-label" for="visible_checkbox"></label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="boxed fn_toggle_wrap min_height_230px">
				<div class="heading_box">
					{$btr->banner_show_banner|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap fn_card on">
					<div class="row">
						<div class="col-lg-3 col-md-6 pr-0 pr-lg-0">
							<div class="banner_card">
								<div class="banner_card_header">
									<span class="font-weight-bold">{$btr->general_pages|escape}</span>
								</div>
								<div class="banner_card_block">
									<select name="pages[]" class="selectpicker fn_action_select" multiple="multiple" data-live-search="true" data-size="10" data-selected-text-format="count">
										<option value="0" {if !$banner->page_selected || 0|in_array:$banner->page_selected}selected{/if}>{$btr->banner_hide|escape}</option>
										{foreach from=$pages item=page}
											{if $page->name != ''}
												<option value="{$page->id}" {if $banner->page_selected && $page->id|in_array:$banner->page_selected}selected{/if}>{$page->name|escape}</option>
											{/if}
										{/foreach}
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 pr-0">
							<div class="banner_card">
								<div class="banner_card_header">
									<span class="font-weight-bold">{$btr->general_categories|escape}</span>
								</div>
								<div class="banner_card_block">
									<select name="categories[]" class="selectpicker" multiple="multiple" data-live-search="true" data-size="10" data-selected-text-format="count">
										<option value='0' {if !$banner->category_selected || 0|in_array:$banner->category_selected}selected{/if}>{$btr->banner_hide|escape}</option>
										{function name=category_select level=0}
											{foreach from=$categories item=category}
												<option value="{$category->id}" {if $selected && $category->id|in_array:$selected}selected{/if}>{section name=sp loop=$level}&nbsp;{/section}{$category->name|escape}</option>
												{category_select categories=$category->subcategories selected=$banner->category_selected  level=$level+1}
											{/foreach}
										{/function}
										{category_select categories=$categories selected=$banner->category_selected}
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 pr-0 pr-lg-0">
							<div class="banner_card">
								<div class="banner_card_header">
									<span class="font-weight-bold">{$btr->general_brands|escape}</span>
								</div>
								<div class="banner_card_block">
									<select name="brands[]" class="selectpicker" multiple="multiple" data-live-search="true" data-size="10" data-selected-text-format="count">
										<option value='0' {if !$banner->brand_selected || 0|in_array:$banner->brand_selected}selected{/if}>{$btr->banner_hide|escape}</option>
										{foreach from=$brands item=brand}
											<option value='{$brand->id}' {if $banner->brand_selected && $brand->id|in_array:$banner->brand_selected}selected{/if}>{$brand->name|escape}</option>
										{/foreach}
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="banner_card">
								<div class="banner_card_header">
									<span class="font-weight-bold">{$btr->article_categories|escape}</span>
								</div>
								<div class="banner_card_block">
									<select name="articles_categories[]" class="selectpicker" multiple="multiple" data-live-search="true" data-size="10" data-selected-text-format="count">
										<option value='0' {if !$banner->articles_category_selected || 0|in_array:$banner->articles_category_selected}selected{/if}>{$btr->banner_hide|escape}</option>
										{function name=articles_category_selected level=0}
											{foreach from=$articles_categories item=articles_category}
												<option value="{$articles_category->id}" {if $selected && $articles_category->id|in_array:$selected}selected{/if}>{section name=sp loop=$level}&nbsp;{/section}{$articles_category->name|escape}</option>
												{articles_category_selected articles_categories=$articles_category->subcategories selected=$banner->articles_category_selected  level=$level+1}
											{/foreach}
										{/function}
										{articles_category_selected articles_categories=$articles_categories selected=$banner->articles_category_selected}
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12">
							<button type="submit" class="btn btn_small btn-primary float-md-right">
								{include file='svg_icon.tpl' svgId='checked'}
								<span>{$btr->general_apply|escape}</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>