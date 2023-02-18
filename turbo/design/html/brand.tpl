{if $brand->id}
	{$meta_title = $brand->name scope=global}
{else}
	{$meta_title = $btr->brand_new scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if !$brand->id}
			{$btr->brand_add|escape}
		{else}
			{$brand->name|escape}
		{/if}
	</h1>
	{if $brand->id}
		<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
			<a class="btn btn-primary" target="_blank" href="../{$lang_link}brands/{$brand->url}">
				<i class="align-middle mt-n1" data-feather="external-link"></i>
				{$btr->global_open|escape}
			</a>
		</div>
	{/if}
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success=='added'}
						{$btr->brand_added|escape}
					{elseif $message_success=='updated'}
						{$btr->brand_updated|escape}
					{else}
						{$message_success|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error=='url_exists'}
						{$btr->brand_exists|escape}
					{elseif $message_error=='empty_name'}
						{$btr->global_enter_name|escape}
					{elseif $message_error == 'url_exists'}
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
							<div class="mb-3">
								<div class="form-label">{$btr->global_title|escape}</div>
								<input class="form-control" name="name" type="text" value="{$brand->name|escape}">
								<input name="id" type="hidden" value="{$brand->id|escape}">
							</div>
							<div class="mb-3">
								<div class="form-label">{$btr->global_h1|escape}</div>
								<input class="form-control" name="name_h1" type="text" value="{$brand->name_h1|escape}">
							</div>
							<div class="row">
								<div class="col-12 col-lg-6 col-md-10">
									<div class="mt-2 mb-3 mb-h">
										<div class="input-group">
											<span class="input-group-text">URL</span>
											<input name="url" class="js-meta-field form-control js-url" type="text" value="{$brand->url|escape}" {if $brand->id}readonly="" {/if}>
											<input type="checkbox" id="block-translit" class="d-none" value="1" {if $brand->id}checked="" {/if}>
											<span class="input-group-text js-disable-url">
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
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="visible" name="visible" value="1" type="checkbox" {if $brand->visible}checked="" {/if}>
									<label class="form-check-label ms-2" for="visible">{$btr->global_enable|escape}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row gx-2">
		<div class="col-lg-4 col-md-12">
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
						<ul class="brand-images-list">
							<li class="brand-image-item border-image-item {if $brand->image}border{/if}">
								{if $brand->image}
									<input type="hidden" class="js-accept-delete" name="delete_image" value="">
									<div class="js-parent-image">
										<div class="brand-image image-wrapper js-image-wrapper text-xs-center">
											<a href="javascript:;" class="js-delete-item remove-image"></a>
											<img src="{$brand->image|resize_brands:180:100}" alt="">
										</div>
									</div>
								{else}
									<div class="js-parent-image"></div>
								{/if}
								<div class="js-upload-image dropzone-block-image {if $brand->image}d-none{/if}">
									<i class="align-middle" data-feather="plus"></i>
									<input class="dropzone-image" name="image" type="file">
								</div>
								<div class="brand-image image-wrapper js-image-wrapper js-new-image text-xs-center">
									<a href="javascript:;" class="js-delete-item remove-image"></a>
									<img src="" alt="">
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8 col-md-12">
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
								<div class="mb-3">
									<div class="form-label">Meta-title <span id="js-meta-title-counter"></span></div>
									<input name="meta_title" class="form-control js-meta-field mb-h" type="text" value="{$brand->meta_title|escape}">
								</div>
								<div class="mb-3">
									<div class="form-label">Meta-keywords</div>
									<input name="meta_keywords" class="form-control js-meta-field mb-h" type="text" value="{$brand->meta_keywords|escape}">
								</div>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="form-label">Meta-description <span id="js-meta-description-counter"></span></div>
								<textarea name="meta_description" class="form-control turbo-textarea js-meta-field">{$brand->meta_description|escape}</textarea>
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
						<textarea name="description" id="js-editor" class="editor js-editor-class">{$brand->description|escape}</textarea>
						<div class="row">
							<div class="col-12">
								<div class="d-grid d-sm-block mt-3">
									<button type="submit" class="btn btn-primary float-end">
										<i class="align-middle" data-feather="check"></i>
										{$btr->global_apply|escape}
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