{$meta_title = $btr->images_images scope=global}

<div class="row">
	<div class="col-lg-10 col-md-10">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{$btr->images_theme|escape} {$theme|escape}
			</div>
		</div>
	</div>
	<div class="col-md-2 col-lg-2 col-sm-12 float-xs-right"></div>
</div>

{if $message_error}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_warning">
				<div class="">
					{if $message_error == 'permissions'}
						{$btr->general_permissions|escape} {$images_dir|escape}
					{elseif $message_error == 'name_exists'}
						{$btr->images_exists|escape}
					{elseif $message_error == 'theme_locked'}
						{$btr->general_protected|escape}
					{else}
						{$message_error|escape}
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}

<div class="boxed fn_toggle_wrap">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<form method="post" enctype="multipart/form-data">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<input type="hidden" name="delete_image" value="">
				<div class="row">
					<div class="col-md-12">
						<div class="heading_box">
							{$btr->images_images|escape}
							<div class="toggle_arrow_wrap fn_toggle_card text-primary">
								<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
							</div>
						</div>
						<div class="toggle_body_wrap fn_card on">
							<div class="row">
								{foreach $images as $image}
									<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
										<div class="banner_card">
											<div class="banner_card_header">
												<input type="text" class="hidden" name="old_name[]" value="{$image->name|escape}">
												<div class="form-group col-lg-9 col-md-8 px-0 fn_rename_value hidden mb-0">
													<input type="text" class="form-control" name="new_name[]" value="{$image->name|escape}">
												</div>
												<span class="font-weight-bold">{$image->name|escape|truncate:15:'...'}</span>
												<i class="pencil-icon fn_rename_theme rename_theme p-h" data-old_name="{$image->name|escape}"></i>

												<button type="button" data-name="{$image->name}" class="btn_close float-xs-right fn_delete_img" data-toggle="modal" data-target="#fn_delete_image">
													{include file='svg_icon.tpl' svgId='delete'}
												</button>
											</div>
											<div class="banner_card_block">
												<div class="wrap_bottom_tag_images">
													<a class="theme_image_item" href='../{$images_dir}{$image->name|escape}'>
														<img src='../{$images_dir}{$image->name|escape}'>
													</a>
													<div class="tag tag-default">
														{if $image->size>1024*1024}
															{($image->size/1024/1024)|round:2} {$btr->general_mb|escape}
														{elseif $image->size>1024}
															{($image->size/1024)|round:2} {$btr->general_kb|escape}
														{else}
															{$image->size} {$btr->general_byte|escape}
														{/if},
														{$image->width}&times;{$image->height} px
													</div>
												</div>
											</div>
										</div>
									</div>
								{/foreach}
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-7 col-md-7">
						<div class="">
							<button type="button" class="fn_add_image btn btn_small btn-primary mb-1 btn_images_add">
								{include file='svg_icon.tpl' svgId='plus'}
								{$btr->images_add|escape}
							</button>
						</div>
					</div>
					<div class="col-lg-5 col-md-5 pull-right">
						<button type="submit" name="save" class="btn btn_small btn-primary float-md-right">
							{include file='svg_icon.tpl' svgId='checked'}
							<span>{$btr->general_apply|escape}</span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="fn_delete_image" class="modal fade show" role="document">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="card-header">
				<div class="heading_modal">{$btr->index_confirm|escape}</div>
			</div>
			<div class="modal-body">
				<button type="submit" class="btn btn_small btn-success fn_submit_delete mx-h">
					{include file='svg_icon.tpl' svgId='checked'}
					<span>{$btr->index_yes|escape}</span>
				</button>
				<button type="button" class="btn btn_small btn-danger fn_dismiss_delete mx-h" data-dismiss="modal">
					{include file='svg_icon.tpl' svgId='close'}
					<span>{$btr->index_no|escape}</span>
				</button>
			</div>
		</div>
	</div>
</div>

{* On document load *}
<script>
	var general_confirm_delete = '{$btr->general_confirm_delete|escape}';
</script>
{literal}
	<script>
		$(function() {

			$('.fn_rename_theme').on('click', function() {
				$(this).parent().find('.fn_rename_value').toggleClass('hidden');
				$(this).prev().toggleClass('hidden');
				$(this).parent().find('.fn_rename_value > input').val($(this).data('old_name'))
			});

			// Delete
			$(".fn_delete_img").on("click", function() {
				image_name = $(this).data("name");
			});

			$('.fn_submit_delete').on('click', function() {
				$('input[name=delete_image]').val(image_name);
				$('form').submit();
			});

			$('.fn_dismiss_delete').on('click', function() {
				$('input[name=delete_image]').val("");
			});

			// Upload
			$('.fn_add_image').on('click', function() {
				$(this).closest('div').append($('<input class="import_file" type="file" name="upload_images[]">'));
			});

		});
	</script>
{/literal}