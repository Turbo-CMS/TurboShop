{if $banners_image->id}
	{$meta_title = $banners_image->name scope=global}
{else}
	{$meta_title = $btr->banners_image_new_banner scope=global}
{/if}

<h1 class="mb-3">
	{if !$banners_image->id}
		{$btr->banners_image_add_banner|escape}
	{else}
		{$banners_image->name|escape}
	{/if}
</h1>

{if $message_success}
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

<form method="post" enctype="multipart/form-data" class="js-fast-button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="translate-container-banner mb-3">
								<div class="form-label">{$btr->global_title|escape} <span class="translate-button-banner" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
								<input class="form-control translate-input-banner" name="name" type="text" value="{$banners_image->name|escape}">
								<input name="id" type="hidden" value="{$banners_image->id|escape}">
							</div>
							<div class="row">
								<div class="col-xs-12 col-lg-6 col-md-12">
									<div class="mb-3">
										<div class="form-label">{$btr->global_banner_group|escape}</div>
										<select name="banner_id" class="selectpicker">
											{foreach $banners as $banner}
												<option value="{$banner->id}" {if $banners_image->banner_id == $banner->id}selected{/if}>{$banner->name|escape}</option>
											{/foreach}
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="visible" name="visible" value="1" type="checkbox" {if $banners_image->visible}checked=""{/if}>
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
									<input name="url" class="form-control" type="text" value="{$banners_image->url|escape}">
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->global_background_color|escape}</div>
									<div id="cp" class="input-group colorpicker-component">
										<input type="text" name="color" value="{$banners_image->color|escape}" class="form-control">
										<span class="input-group-text add-on"><i></i></span>
									</div>
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->global_color_mode|escape}</div>
									<select name="style" class="selectpicker">
										<option value="" {if $banners_image->style == ""}selected{/if}>{$btr->global_default|escape}</option>
										<option value="light" {if $banners_image->style == "light"}selected{/if}>{$btr->global_light|escape}</option>
										<option value="dark" {if $banners_image->style == "dark"}selected{/if}>{$btr->global_dark|escape}</option>
									</select>
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->global_position|escape}</div>
									<select name="side" class="selectpicker">
										<option value="left" {if $banners_image->side == "left"}selected{/if}>{$btr->global_left|escape}</option>
										<option value="right" {if $banners_image->side == "right"}selected{/if}>{$btr->global_right|escape}</option>
									</select>
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->global_code|escape}</div>
									<input name="code" class="form-control" type="text" value="{$banners_image->code|escape}">
								</div>
							</div>
							<div class="col-md-6">
							<div class="translate-container-banner mb-3">
								<div class="form-label">{$btr->banners_image_button|escape} <span class="translate-button-banner" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<input name="button" class="form-control translate-input-banner" type="text" value="{$banners_image->button|escape}">
								</div>
								<div class="translate-container-banner mb-3">
									<div class="form-label">{$btr->banners_image_alt|escape} <span class="translate-button-banner" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<input name="alt" class="form-control translate-input-banner" type="text" value="{$banners_image->alt|escape}">
								</div>
								<div class="translate-container-banner mb-3">
									<div class="form-label">{$btr->banners_image_title|escape} <span class="translate-button-banner" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<input name="title" class="form-control translate-input-banner" type="text" value="{$banners_image->title|escape}">
								</div>
								<div class="translate-container-banner mb-3">
									<div class="form-label translate-button-banner">{$btr->global_description|escape} <span role="button" class="translate-button-banner" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<textarea name="description" class="form-control textarea turbo-textarea translate-input-banner">{$banners_image->description|escape}</textarea>
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
							<li class="banner-image-item border-image-item {if $banners_image->image}border{/if}">
								{if $banners_image->image}
									<input type="hidden" class="js-accept-delete" name="delete_image" value="">
									<div class="js-parent-image">
										<div class="banner-image image-wrapper js-image-wrapper text-xs-center">
											<a href="javascript:;" class="js-delete-item remove-image"></a>
											{assign var="image" value="{$banners_image->image}"}
											{if $image|is_svg}
												<img src="../{$config->banners_images_dir}{$image}" alt="">
											{else} 
												<img src="{$image|resize_banners:800:400}" alt="">
											{/if} 
										</div>
									</div>
								{else}
									<div class="js-parent-image"></div>
								{/if}
								<div class="js-upload-image dropzone-block-image {if $banners_image->image}d-none{/if}">
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
							<li class="banner-image-item border-image-item-two {if $banners_image->background}border{/if}">
								{if $banners_image->background}
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
								<div class="js-upload-image-two dropzone-block-image {if $banners_image->background}d-none{/if}">
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
{css id="colorpicker" include=["turbo/design/js/colorpicker/css/bootstrap-colorpicker.min.css"]}{/css}
{stylesheet minify=true}

{js id="colorpicker" priority=99 include=["turbo/design/js/colorpicker/js/bootstrap-colorpicker.min.js"]}{/js}
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

		$(document).ready(function() {
			var targetLang = '{/literal}{if $lang_label == 'ua'}uk{else}{$lang_label}{/if}{literal}';

			$('.translate-button-banner').on('click', function() {
				var inputElement = $(this).closest('.translate-container-banner').find('.translate-input-banner');
				var text = inputElement.val();

				if (text.trim() !== '') {
					$.post('ajax/translate.php', {
						'source_lang': 'auto',
						'target_lang': targetLang,
						'text': text
					}, function(data) {
						inputElement.val(data);
						set_banner(); 
					});
				}
			});

			$('input[name="name"]').on('keyup change', function() {
				name_touched = true;
				set_banner(); 
			});

			$(window).on("load", function() {
				init_touch_flags();
				set_touch_events();
				set_banner(); 
			});
		});

		var name_touched = true;
		var title_touched = true;
		var alt_touched = true;

		function init_touch_flags() {
			if ($('input[name="name"]').val() == generate_name() || $('input[name="name"]').val() == '')
				name_touched = false;
			if ($('input[name="title"]').val() == generate_title() || $('input[name="title"]').val() == '')
				title_touched = false;
			if ($('input[name="alt"]').val() == generate_alt() || $('input[name="alt"]').val() == '')
				alt_touched = false;
		}

		function set_touch_events() {
			$('input[name="name"]').change(function() { name_touched = true; });
			$('input[name="title"]').change(function() { title_touched = true; });
			$('input[name="alt"]').change(function() { alt_touched = true; });
		}

		function set_banner() {
			if (!name_touched)
				$('input[name="name"]').val(generate_name());
			if (!title_touched)
				$('input[name="title"]').val(generate_title());
			if (!alt_touched)
				$('input[name="alt"]').val(generate_alt());
		}

		function generate_name() {
			return $('input[name="name"]').val();
		}

		function generate_title() {
			return $('input[name="name"]').val();
		}

		function generate_alt() {
			return $('input[name="name"]').val();
		}
	</script>
	<style>
		.colorpicker-element .add-on i:before {
			content: "";
			position: absolute;
			width: 16px;
			height: 16px;
			display: inline-block;
			vertical-align: text-top;
			margin-left: -8px;
			background: linear-gradient(45deg, rgba(0, 0, 0, 0.1) 25%, transparent 25%, transparent 75%, rgba(0, 0, 0, 0.1) 75%, rgba(0, 0, 0, 0.1) 0), linear-gradient(45deg, rgba(0, 0, 0, 0.1) 25%, transparent 25%, transparent 75%, rgba(0, 0, 0, 0.1) 75%, rgba(0, 0, 0, 0.1) 0), white;
			background-size: 10px 10px;
			background-position: 0 0, 5px 5px;
		}

		.colorpicker-element .add-on i[style*="background-color"]::before {
			content: none;
		}
	</style>
{/literal}
