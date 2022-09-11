{if $brand->id}
	{$meta_title = $brand->name scope=global}
{else}
	{$meta_title = $btr->brand_new scope=global}
{/if}

<div class="row">
	<div class="col-lg-12 col-md-12">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if !$brand->id}
					{$btr->brand_add|escape}
				{else}
					{$brand->name|escape}
				{/if}
			</div>
			{if $brand->id}
				<div class="box_btn_heading">
					<a class="btn btn_small btn-primary add" target="_blank" href="../{$lang_link}brands/{$brand->url}">
						{include file='svg_icon.tpl' svgId='icon_desktop'}
						<span>{$btr->general_open|escape}</span>
					</a>
				</div>
			{/if}
		</div>
	</div>
	<div class="col-md-12 col-lg-12 col-sm-12 float-xs-right"></div>
</div>

{if $message_success}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_success">
				<div class="heading_box">
					{if $message_success=='added'}
						{$btr->brand_added|escape}
					{elseif $message_success=='updated'}
						{$btr->brand_updated|escape}
					{else}
						{$message_success|escape}
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
					{if $message_error=='url_exists'}
						{$btr->brand_exists|escape}
					{elseif $message_error=='empty_name'}
						{$btr->general_enter_title|escape}
					{elseif $message_error == 'url_exists'}
						{$btr->general_enter_url|escape}
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
			<div class="boxed match_matchHeight_true">
				<div class="row d_flex">
					<div class="col-lg-10 col-md-9 col-sm-12">
						<div class="heading_label">
							{$btr->general_name|escape}
						</div>
						<div class="form-group">
							<input class="form-control" name="name" type="text" value="{$brand->name|escape}">
							<input name="id" type="hidden" value="{$brand->id|escape}">
						</div>
						<div class="heading_label">
							{$btr->page_h1|escape}
						</div>
						<div class="form-group">
							<input name="name_h1" class="form-control" type="text" value="{$brand->name_h1|escape}">
						</div>
						<div class="row">
							<div class="col-xs-12 col-lg-6 col-md-10">
								<div class="">
									<div class="input-group">
										<span class="input-group-addon input-group-addon-left">URL</span>
										<input name="url" class="fn_meta_field form-control fn_url {if $brand->id}fn_disabled{/if}" {if $brand->id}readonly="" {/if} type="text" value="{$brand->url|escape}">
										<input type="checkbox" id="block_translit" class="hidden" value="1" {if $brand->id}checked="" {/if}>
										<span class="input-group-addon fn_disable_url">
											{if $brand->id}
												<i class="url-lock"></i>
											{else}
												<i class="url-lock url-unlock"></i>
											{/if}
										</span>
									</div>
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
										<input class="form-check-input" id="visible_checkbox" name="visible" value="1" type="checkbox" {if $brand->visible}checked="" {/if}>
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
		<div class="col-lg-4 col-md-12 pr-0">
			<div class="boxed fn_toggle_wrap min_height_230px">
				<div class="heading_box">
					{$btr->general_image|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<ul class="brand_images_list">
						<li class="brand_image_item border_image_item {if $brand->image}border{/if}">
							{if $brand->image}
								<input type="hidden" class="fn_accept_delete" name="delete_image" value="">
								<div class="fn_parent_image">
									<div class="brand_image image_wrapper fn_image_wrapper text-xs-center">
										<a href="javascript:;" class="fn_delete_item remove_image"></a>
										<img src="{$brand->image|resize_brands:180:100}" alt="">
									</div>
								</div>
							{else}
								<div class="fn_parent_image"></div>
							{/if}
							<div class="fn_upload_image dropzone_block_image {if $brand->image} hidden{/if}">
								{include file='svg_icon.tpl' svgId='plus_big'}
								<input class="dropzone_image" name="image" type="file">
							</div>
							<div class="brand_image image_wrapper fn_image_wrapper fn_new_image text-xs-center">
								<a href="javascript:;" class="fn_delete_item remove_image"></a>
								<img src="" alt="">
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-8 col-md-12">
			<div class="boxed fn_toggle_wrap min_height_230px">
				<div class="heading_box">
					{$btr->general_metatags|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>

				<div class="toggle_body_wrap on fn_card row">
					<div class="col-lg-6 col-md-6">
						<div class="heading_label">Meta-title <span id="fn_meta_title_counter"></span></div>
						<input name="meta_title" class="form-control fn_meta_field mb-h" type="text" value="{$brand->meta_title|escape}">
						<div class="heading_label">Meta-keywords</div>
						<input name="meta_keywords" class="form-control fn_meta_field mb-h" type="text" value="{$brand->meta_keywords|escape}">
					</div>
					<div class="col-lg-6 col-md-6 pl-0">
						<div class="heading_label">Meta-description <span id="fn_meta_description_counter"></span></div>
						<textarea name="meta_description" class="form-control turbo_textarea fn_meta_field">{$brand->meta_description|escape}</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed match fn_toggle_wrap tabs">
				<div class="heading_box">
					{$btr->general_description|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<textarea name="description" id="fn_editor" class="editor_large fn_editor_class">{$brand->description|escape}</textarea>
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 mt-1">
						<button type="submit" class="btn btn_small btn-primary float-md-right">
							{include file='svg_icon.tpl' svgId='checked'}
							<span>{$btr->general_apply|escape}</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

{* Tiny MCE *}
{include file='tinymce_init.tpl'}