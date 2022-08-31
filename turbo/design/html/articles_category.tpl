{if $category->id}
	{$meta_title = $category->name scope=global}
{else}
	{$meta_title = $btr->category_new scope=global}
{/if}

<div class="row">
	<div class="col-lg-12 col-md-12">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{if !$category->id}
					{$btr->category_add|escape}
				{else}
					{$category->name|escape}
				{/if}
			</div>
			{if $category->id}
				<div class="box_btn_heading">
					<a class="btn btn_small btn-primary add" target="_blank" href="../{$lang_link}articles/{$category->url}">
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
						{$btr->category_added|escape}
					{elseif $message_success=='updated'}
						{$btr->category_updated|escape}
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
						{$btr->category_exists|escape}
					{elseif $message_error == 'name_empty'}
						{$btr->general_enter_title|escape}
					{elseif $message_error == 'url_empty'}
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
		<div class="col-xs-12 ">
			<div class="boxed match_matchHeight_true">
				<div class="row d_flex">
					<div class="col-lg-10 col-md-9 col-sm-12">
						<div class="heading_label">
							{$btr->general_name|escape}
						</div>
						<div class="form-group">
							<input class="form-control" name="name" type="text" value="{$category->name|escape}" />
							<input name="id" type="hidden" value="{$category->id|escape}" />
						</div>
						<div class="heading_label">
							{$btr->category_h1|escape}
						</div>
						<div class="form-group">
							<input name="name_h1" class="form-control" type="text" value="{$category->name_h1|escape}" />
						</div>
						<div class="row">
							<div class="col-xs-12 col-lg-6 col-md-12">
								<div class="mt-h mb-h">
									<div class="input-group">
										<span class="input-group-addon input-group-addon-left">URL</span>
										<input name="url" class="fn_meta_field form-control fn_url {if $category->id}fn_disabled{/if}" {if $category->id}readonly="" {/if} type="text" value="{$category->url|escape}" />
										<input type="checkbox" id="block_translit" class="hidden" value="1" {if $category->id}checked="" {/if}>
										<span class="input-group-addon fn_disable_url">
											{if $category->id}
												<i class="url-lock"></i>
											{else}
												<i class="url-lock url-unlock"></i>
											{/if}
										</span>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-lg-6 col-md-12">
								<div class="input-group mt-h mb-h">
									<span class="boxes_inline pw_id_grup">
										<select name="parent_id" class="selectpicker">
											<option value='0'>{$btr->category_root|escape}</option>
											{function name=category_select level=0}
												{foreach $articles_categories as $cat}
													{if $category->id != $cat->id}
														<option value='{$cat->id}' {if $category->parent_id == $cat->id}selected{/if}>{section name=sp loop=$level}--{/section}{$cat->name}</option>
														{category_select articles_categories=$cat->subcategories level=$level+1}
													{/if}
												{/foreach}
											{/function}
											{category_select articles_categories=$articles_categories}
										</select>
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
										<input class="form-check-input" id="featured_checkbox" name="visible" value="1" type="checkbox" {if $category->visible}checked="" {/if}>
										<label class="form-check-label" for="featured_checkbox"></label>
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
					<ul class="category_images_list">
						<li class="category_image_item border_image_item {if $category->image}border{/if}">
							{if $category->image}
								<input type="hidden" class="fn_accept_delete" name="delete_image" value="">
								<div class="fn_parent_image">
									<div class="category_image image_wrapper fn_image_wrapper text-xs-center">
										<a href="javascript:;" class="fn_delete_item remove_image"></a>
										<img src="{$category->image|resize_catalog:180:100}" alt="" />
									</div>
								</div>
							{else}
								<div class="fn_parent_image"></div>
							{/if}
							<div class="fn_upload_image dropzone_block_image {if $category->image} hidden{/if}">
								{include file='svg_icon.tpl' svgId='plus_big'}
								<input class="dropzone_image" name="image" type="file" />
							</div>
							<div class="category_image image_wrapper fn_image_wrapper fn_new_image text-xs-center">
								<a href="javascript:;" class="fn_delete_item remove_image"></a>
								<img src="" alt="" />
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-8 col-md-12">
			<div class="boxed match fn_toggle_wrap min_height_230px">
				<div class="heading_box">
					{$btr->general_metatags|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card row">
					<div class="col-lg-6 col-md-6">
						<div class="heading_label">Meta-title <span id="fn_meta_title_counter"></span></div>
						<input name="meta_title" class="form-control fn_meta_field mb-h" type="text" value="{$category->meta_title|escape}" />
						<div class="heading_label">Meta-keywords</div>
						<input name="meta_keywords" class="form-control fn_meta_field mb-h" type="text" value="{$category->meta_keywords|escape}" />
					</div>
					<div class="col-lg-6 col-md-6 pl-0">
						<div class="heading_label">Meta-description <span id="fn_meta_description_counter"></span></div>
						<textarea name="meta_description" class="form-control turbo_textarea fn_meta_field">{$category->meta_description|escape}</textarea>
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
					<textarea id="fn_editor" name="description" class="editor_large fn_editor_class">{$category->description|escape}</textarea>
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