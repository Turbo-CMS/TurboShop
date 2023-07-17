{if isset($banners_image->id)}
	{$meta_title = $banners_image->name scope=global}
{else}
	{$meta_title = $btr->banners_image_add_banner  scope=global}
{/if}

<h1 class="mb-3">
	{if !isset($banners_image->id)}
		{$btr->banners_image_add_banner|escape}
	{else}
		{$banners_image->name|escape}
	{/if}
</h1>

{if isset($message_success)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success=='added'}
						{$btr->banners_image_added|escape}
					{elseif $message_success=='updated'}
						{$btr->banners_image_updated|escape}
					{else}
						{$message_success|escape}
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
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_title|escape}</div>
								<input class="form-control" name="name" type="text" value="{if isset($banners_image->name)}{$banners_image->name|escape}{/if}">
								<input name="id" type="hidden" value="{if isset($banners_image->id)}{$banners_image->id|escape}{/if}">
							</div>
							<div class="row">
								<div class="col-xs-12 col-lg-6 col-md-12">
									<div class="mb-3">
										<div class="form-label">{$btr->global_banner_group|escape}</div>
										<select name="banner_id" class="selectpicker">
											{foreach $banners as $banner}
												<option value="{$banner->id}" {if isset($banners_image->banner_id) && $banners_image->banner_id == $banner->id}selected{/if}>{$banner->name|escape}</option>
											{/foreach}
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="visible" name="visible" value="1" type="checkbox" {if isset($banners_image->visible) && $banners_image->visible}checked=""{/if}>
									<label class="form-check-label ms-2" for="visible">{$btr->global_enable|escape}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->banners_image_param|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->banners_image_url|escape}</div>
									<input name="url" class="form-control" type="text" value="{if isset($banners_image->url)}{$banners_image->url|escape}{/if}">
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->global_background_color}</div>
									<div id="cp" class="input-group colorpicker-component">
										<input type="text" name="color" value="{if isset($banners_image->color) && $banners_image->color}{$banners_image->color|escape}{else}fffff{/if}" class="form-control">
										<span class="input-group-text add-on"><i></i></span>
									</div>
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->global_color_mode|escape}</div>
									<select name="style" class="selectpicker">
										<option value="light" {if isset($banners_image->style) && $banners_image->style == "light"}selected{/if}>{$btr->global_light|escape}</option>
										<option value="dark" {if isset($banners_image->style) && $banners_image->style == "dark"}selected{/if}>{$btr->global_dark|escape}</option>
									</select>
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->banners_image_button|escape}</div>
									<input name="button" class="form-control" type="text" value="{if isset($banners_image->button)}{$banners_image->button|escape}{/if}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<div class="form-label">{$btr->banners_image_alt|escape}</div>
									<input name="alt" class="form-control" type="text" value="{if isset($banners_image->alt)}{$banners_image->alt|escape}{/if}">
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->banners_image_title|escape}</div>
									<input name="title" class="form-control" type="text" value="{if isset($banners_image->title)}{$banners_image->title|escape}{/if}">
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->global_description|escape}</div>
									<textarea name="description" class="form-control turbo-textarea">{if isset($banners_image->description)}{$banners_image->description|escape}{/if}</textarea>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row gx-2">
		<div class="col-lg-6 col-md-12">
			<div class="card mh-230px">
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
						<ul class="banner-images-list">
							<li class="banner-image-item border-image-item {if isset($banners_image->image) && $banners_image->image}border{/if}">
								{if isset($banners_image->image) && $banners_image->image}
									<input type="hidden" class="js-accept-delete" name="delete_image" value="">
									<div class="js-parent-image">
										<div class="banner-image image-wrapper js-image-wrapper text-xs-center">
											<a href="javascript:;" class="js-delete-item remove-image"></a>
											<img src="{$banners_image->image|resize_banners:800:400}" alt="">
										</div>
									</div>
								{else}
									<div class="js-parent-image"></div>
								{/if}
								<div class="js-upload-image dropzone-block-image {if isset($banners_image->image) && $banners_image->image}d-none{/if}">
									<i class="align-middle" data-feather="plus"></i>
									<input class="dropzone-image" name="image" type="file">
								</div>
								<div class="banner-image image-wrapper js-image-wrapper js-new-image text-xs-center">
									<a href="javascript:;" class="js-delete-item remove-image"></a>
									<img src="" alt="">
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="card mh-230px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_background|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<ul class="banner-images-list">
							<li class="banner-image-item border-image-item-two {if isset($banners_image->background) && $banners_image->background}border{/if}">
								{if isset($banners_image->background) && $banners_image->background}
									<input type="hidden" class="js-accept-delete-two" name="delete_background" value="">
									<div class="js-parent-image-two">
										<div class="banner-image image-wrapper js-image-wrapper-two text-xs-center">
											<a href="javascript:;" class="js-delete-item-two remove-image"></a>
											<img src="{$banners_image->background|resize_banners:800:400}" alt="">
										</div>
									</div>
								{else}
									<div class="js-parent-image-two"></div>
								{/if}
								<div class="js-upload-image-two dropzone-block-image {if isset($banners_image->background) && $banners_image->background}d-none{/if}">
									<i class="align-middle" data-feather="plus"></i>
									<input class="dropzone-image-two" name="background" type="file">
								</div>
								<div class="banner-image image-wrapper js-image-wrapper-two js-new-image-two text-xs-center">
									<a href="javascript:;" class="js-delete-item-two remove-image"></a>
									<img src="" alt="">
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
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
</form>

{* Colorpicker *}
{css id="colorpicker" include=[
	"turbo/design/js/colorpicker/css/bootstrap-colorpicker.min.css"
]}{/css}
{stylesheet minify=true}

{js id="colorpicker" priority=99 include=[
	"turbo/design/js/colorpicker/js/bootstrap-colorpicker.min.js"
]}{/js}
{javascript minify=true}

{literal}
	<script>
		$(function() {
			$('#cp').colorpicker({
				colorSelectors: {
					"black": "#000000",
					"blue": "#0000ff",
					"brown": "#a52a2a",
					"gray": "#808080",
					"green": "#008000",
					"red": "#ff0000",
					"orange": "#ffa500",
					"yellow": "#ffff00",
					"white": "#ffffff"
				},
				format: "hex"
			});
		});
	</script>
{/literal}