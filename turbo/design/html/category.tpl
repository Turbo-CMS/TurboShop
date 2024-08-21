{if isset($category->id)}
	{$meta_title = $category->name scope=global}
{else}
	{$meta_title = $btr->category_new scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if !isset($category->id)}
			{$btr->category_add|escape}
		{else}
			{$category->name|escape}
		{/if}
	</h1>
	{if isset($category->id)}
		<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
			<a class="btn btn-primary" target="_blank" href="../{$lang_link}catalog/{$category->url}">
				<i class="align-middle mt-n1" data-feather="external-link"></i>
				{$btr->global_open|escape}
			</a>
		</div>
	{/if}
</div>

{if isset($message_success)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success=='added'}
						{$btr->category_added|escape}
					{elseif $message_success=='updated'}
						{$btr->category_updated|escape}
					{else}
						{$message_success|escape}
					{/if}
					{if $smarty.get.return}
						<a class="alert-link fw-normal btn-return text-decoration-none me-5" href="{$smarty.get.return}">
							<i class="align-middle mt-n1" data-feather="corner-up-left"></i>
							{$btr->global_back|escape}
						</a>
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if isset($message_error)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error=='url_exists'}
						{$btr->category_exists|escape}
					{elseif $message_error == 'name_empty'}
						{$btr->global_enter_name|escape}
					{elseif $message_error == 'url_empty'}
						{$btr->global_enter_url|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data" class="js-fast-button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="translate-container mb-3">
								<div class="form-label">{$btr->global_title|escape} <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
								<input class="form-control translate-input" name="name" type="text" value="{if isset($category->name)}{$category->name|escape}{/if}">
								<input name="id" type="hidden" value="{if isset($category->id)}{$category->id|escape}{/if}">
							</div>
							<div class="translate-container mb-3">
								<div class="form-label">{$btr->global_h1|escape} <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
								<input class="form-control translate-input" name="name_h1" type="text" value="{if isset($category->name_h1)}{$category->name_h1|escape}{/if}">
							</div>
							<div class="row">
								<div class="col-12 col-lg-6 col-md-12">
									<div class="mt-2 mb-3 mb-h">
										<div class="input-group">
											<span class="input-group-text">URL</span>
											<input name="url" class="js-meta-field form-control js-url" type="text" value="{if isset($category->url)}{$category->url|escape}{/if}" {if isset($category->id)}readonly=""{/if}>
											<input type="checkbox" id="block-translit" class="d-none" value="1" {if isset($category->id)}checked="" {/if}>
											<span class="input-group-text js-disable-url">
												{if isset($category->id)}
													<i class="url-lock"></i>
												{else}
													<i class="url-lock url-unlock"></i>
												{/if}
											</span>
										</div>
									</div>
								</div>
								<div class="col-12 col-lg-6 col-md-12">
									<div class="input-group mt-2 mb-3 mb-h">
										<span class="w-100">
											<select name="parent_id" class="selectpicker">
												<option value='0'>{$btr->category_root|escape}</option>
												{function name=category_select level=0}
													{foreach $categories as $cat}
														{if isset($category) || isset($cat) && $category->id != $cat->id}
															<option value="{$cat->id}" {if isset($category->parent_id) && $category->parent_id == $cat->id}selected{/if}>{section name=sp loop=$level}--{/section} {$cat->name}</option>
															{if isset($cat->subcategories)}
																{category_select categories=$cat->subcategories level=$level+1}
															{/if}
														{/if}
													{/foreach}
												{/function}
												{category_select categories=$categories}
											</select>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="visible" name="visible" value="1" type="checkbox" {if isset($category->visible) && $category->visible}checked="" {/if}>
									<label class="form-check-label ms-2" for="visible">{$btr->global_enable|escape}</label>
								</div>
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="featured" name="featured" value="1" type="checkbox" {if isset($category->featured) && $category->featured}checked="" {/if}>
									<label class="form-check-label ms-2" for="featured">{$btr->categories_featured|escape}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row gx-2">
		<div class="col-lg-3 col-md-12">
			<div class="card mh-250px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_image|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<ul class="category-images-list">
							<li class="category-image-item border-image-item {if isset($category->image) && $category->image}border{/if}">
								{if isset($category->image) && $category->image}
									<input type="hidden" class="js-accept-delete" name="delete_image" value="">
									<div class="js-parent-image">
										<div class="category-image image-wrapper js-image-wrapper text-xs-center">
											<a href="javascript:;" class="js-delete-item remove-image"></a>
											<img src="{$category->image|resize_catalog:180:100}" alt="">
										</div>
									</div>
								{else}
									<div class="js-parent-image"></div>
								{/if}
								<div class="js-upload-image dropzone-block-image {if isset($category->image) && $category->image}d-none{/if}">
									<i class="align-middle" data-feather="plus"></i>
									<input class="dropzone-image" name="image" type="file">
								</div>
								<div class="category-image image-wrapper js-image-wrapper js-new-image text-xs-center">
									<a href="javascript:;" class="js-delete-item remove-image"></a>
									<img src="" alt="">
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-12">
			<div class="card mh-250px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_icon|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<ul class="category-images-list mb-1">
							<li class="category-image-item border-image-item-two icons {if isset($category->icon) && $category->icon}border{/if}">
								{if isset($category->icon) && $category->icon}
									<input type="hidden" class="js-accept-delete-two" name="delete_icon" value="">
									<div class="js-parent-image-two">
										<div class="category-icon image-wrapper js-image-wrapper-two text-xs-center">
											<a href="javascript:;" class="js-delete-item-two remove-image"></a>
											<img src="../{$config->categories_images_dir}{$category->icon}" alt="">
										</div>
									</div>
								{else}
									<div class="js-parent-image-two"></div>
								{/if}
								<div class="js-upload-image-two dropzone-block-image {if isset($category->icon) && $category->icon}d-none{/if}">
									<i class="align-middle" data-feather="plus"></i>
									<input class="dropzone-image-two" name="icon" type="file">
								</div>
								<div class="category-icon image-wrapper js-image-wrapper-two js-new-image-two text-xs-center">
									<a href="javascript:;" class="js-delete-item-two remove-image"></a>
									<img src="" alt="">
								</div>
							</li>
						</ul>
						<div class="form-label">{$btr->icon_code|escape}</div>
						<input class="form-control" name="code" type="text" value="{if isset($category->code)}{$category->code|escape}{/if}">
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="card mh-250px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_metatags|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<div class="translate-container mb-3">
									<div class="form-label">Meta-title <span id="js-meta-title-counter"></span> <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<input name="meta_title" class="form-control js-meta-field mb-h translate-input" type="text" value="{if isset($category->meta_title)}{$category->meta_title|escape}{/if}">
								</div>
								<div class="translate-container mb-3">
									<div class="form-label">Meta-keywords <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<input name="meta_keywords" class="form-control js-meta-field mb-h translate-input" type="text" value="{if isset($category->meta_keywords)}{$category->meta_keywords|escape}{/if}">
								</div>
							</div>
							<div class="translate-container col-lg-6 col-md-6">
								<div class="form-label">Meta-description <span id="js-meta-description-counter"></span> <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
								<textarea name="meta_description" class="form-control turbo-textarea js-meta-field translate-input">{if isset($category->meta_description)}{$category->meta_description|escape}{/if}</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_description|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<textarea id="js-editor" name="description" class="editor js-editor-class">{if isset($category->description)}{$category->description|escape}{/if}</textarea>
						<div class="row">
							<div class="col-12">
								<div class="d-grid d-sm-block mt-3">
									<button type="submit" class="btn btn-primary float-end">
										<i class="align-middle" data-feather="check"></i>
										<span>{$btr->global_apply|escape}</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

{* TinyMCE *}
{include file='tinymce_init.tpl'}