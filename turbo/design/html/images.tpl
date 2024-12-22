{$meta_title = $btr->images_images scope=global}

<h1 class="mb-3">{$btr->images_theme|escape} {$theme|escape}</h1>

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'permissions'}
						{$btr->global_permissions|escape} {$images_dir|escape}
					{elseif $message_error == 'name_exists'}
						{$btr->images_exists|escape}
					{elseif $message_error == 'theme_locked'}
						{$btr->global_protected|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if $folders}
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb mb-3">
			<li class="breadcrumb-item">
				<a href="{url module=ImagesAdmin file=null dir=null}" class="text-decoration-none text-muted">
					<i class="align-middle text-warning mt-n1" data-feather="folder"></i>
					images
				</a>
			</li>
			{if isset($smarty.get.dir)}
				<li class="breadcrumb-item active">
					<i class="align-middle text-warning mt-n1" data-feather="folder"></i>
					{$smarty.get.dir}
				</li>
			{/if}
		</ol>
	</nav>

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
					<h5 class="card-title mb-0">{$btr->global_folders|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<ul class="nav nav-pills">
							{foreach $folders as $f}
								<li class="nav-item">
									<a class="nav-link text-decoration-none {if $f == $dir}active text-white{else}text-muted{/if}" aria-current="page" href="{url module=ImagesAdmin file=null dir=$f}">
										<i class="align-middle {if $f != $dir}text-warning{/if}  mt-n1" data-feather="folder"></i>
										{$f|escape}
									</a>
								</li>
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<input type="hidden" name="delete_image" value="">
	<div class="row gx-2">
		{foreach $images as $image}
			<div class="col-12 col-md-6 col-lg-4 col-xl-3">
				<div class="card">
					<div class="card-header px-4 pt-4">
						<div class="card-actions float-end">
							{if isset($message_error) && $message_error == 'theme_locked'}
								<span class="btn-delete" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->theme_close|escape}">
									<i class="align-middle" data-feather="lock"></i>
								</span>
							{else}
								<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_edit|escape}">
									<i class="js-rename-image align-middle cursor-pointer me-1" data-feather="edit-2" data-old-name="{$image->name|escape}"></i>
								</span>
								<div class="btn-delete float-end js-delete-img" data-name="{$image->name}" data-bs-toggle="modal" data-bs-target="#js-delete-image">
									<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
										<i class="align-middle" data-feather="trash-2"></i>
									</span>
								</div>
							{/if}
						</div>
						<input type="text" class="d-none" name="old_name[]" value="{$image->name|escape}">
						<div class="js-rename-value d-none position-absolute w-auto mt-n2">
							<input type="text" class="form-control" name="new_name[]" value="{$image->name|escape}">
						</div>
						<h5 class="card-title mb-0">{$image->name|escape|truncate:33:'...'}</h5>
					</div>
					<div class="card-body px-4 pt-2">
						<a class="theme-image-item" href="../{$images_dir}{$image->name|escape}" data-fancybox="gallery">
							<img class="" src="../{$images_dir}{$image->name|escape}" alt="{$image->name|escape}">
						</a>
						<div class="badge badge-secondary-light mt-1">
							{if $image->size>1024*1024}
								{($image->size/1024/1024)|round:2} {$btr->global_mb|escape}
							{elseif $image->size>1024}
								{($image->size/1024)|round:2} {$btr->global_kb|escape}
							{else}
								{$image->size} {$btr->global_byte|escape}
								{/if}{if $image->width || $image->height}, {$image->width}&times;{$image->height} px{/if}
							</div>
						</div>
					</div>
				</div>
			{/foreach}
		</div>
		{if !$locked}
			<div class="row mt-2">
				<div class="col-12">
					<div class="upload-image"></div>
				</div>
				<div class="col-12 col-lg-6 col-md-6 mb-3 d-grid gap-2 d-sm-block">
					<button type="button" class="btn btn-success js-add-image">
						<i class="align-middle" data-feather="plus"></i>
						{$btr->images_add|escape}
					</button>
				</div>
				<div class="col-12 col-lg-6 col-md-6 d-grid gap-2 d-sm-block">
					<button type="submit" name="save" class="btn btn-primary js-chek-all float-end">
						<i class="align-middle" data-feather="check"></i>
						{$btr->global_apply|escape}
					</button>
				</div>
			</div>
		{/if}
	</form>

	<div class="modal fade" id="js-delete-image" tabindex="-1" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">{$btr->global_confirm|escape}</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<div class="d-grid gap-2 d-sm-block">
						<button type="submit" class="btn btn-success js-submit-delete me-sm-1"><i class="align-middle" data-feather="check"></i> {$btr->global_yes|escape}</button>
						<button type="button" class="btn btn-danger js-dismiss-delete" data-bs-dismiss="modal"><i class="align-middle" data-feather="x"></i> {$btr->global_no|escape}</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	{* Fancybox *}
	{css id="fancybox" include=["turbo/design/js/fancybox/fancybox.css"]}{/css}
	{stylesheet minify=true}

	{js id="fancybox" priority=99 include=["turbo/design/js/fancybox/fancybox.umd.js"]}{/js}
	{javascript minify=true}

	<script>
		Fancybox.bind("[data-fancybox]", {
			Thumbs: {
				type: false,
			},
		});
	</script>

	{literal}
		<script>
			$(window).on("load", function() {
				$('.js-rename-image').on('click', function() {
					$(this).closest('.card-header').find('.js-rename-value').toggleClass('d-none');
					$(this).closest('.card-header').find('.card-title').toggleClass('d-none');
					$(this).parent().find('.js-rename-value > input').val($(this).data('old-name'))
				});

				$(".js-delete-img").on("click", function() {
					image_name = $(this).data("name");
				});

				$('.js-submit-delete').on('click', function() {
					$('input[name=delete_image]').val(image_name);
					$('form').submit();
				});

				$('.js-dismiss-delete').on('click', function() {
					$('input[name=delete_image]').val("");
				});

				$('.js-add-image').on('click', function() {
					$('.upload-image').append($('<div class="mb-3"><input class="form-control" type="file" name="upload_images[]"></div>'));
				});
			});
		</script>
	{/literal}