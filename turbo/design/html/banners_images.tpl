{if isset($banner)}
	{$meta_title=$banner->name scope=global}
{else}
	{$meta_title=$btr->global_banners   scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if $banners_images_count}
			{$btr->global_banners} - {$banners_images_count}
		{elseif isset($keyword)}
			{$btr->global_banners} - {$banners_images_count}
		{else}
			{$btr->banners_images_none|escape}
		{/if}
	</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=BannersImageAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->banners_images_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-header d-block d-lg-none">
		<div class="card-actions float-end">
			<div class="position-relative collapse-icon">
				<a href="javascript:;" class="collapse-chevron">
					<i class="align-middle" data-feather="chevron-down"></i>
				</a>
			</div>
		</div>
		<h5 class="card-title mb-0">{$btr->global_filter|escape}</h5>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-12">
				<div class="collapse-card boxed-sorting">
					<div class="row">
						<div class="col-md-4 col-lg-4 col-sm-12 mb-3">
							<select class="selectpicker" onchange="location = this.value;">
								<option value="{url banner_id=null filter=null}" {if !isset($filter)}{/if}>{$btr->banners_images_all|escape}</option>
								<option value="{url banner_id=null filter='visible'}" {if isset($filter) && $filter == 'visible'}selected{/if}>{$btr->banners_images_enable|escape}</option>
								<option value="{url banner_id=null filter='hidden'}" {if isset($filter) && $filter == 'hidden'}selected{/if}>{$btr->banners_images_disable|escape}</option>
							</select>
						</div>
						{if $banners}
							<div class="col-md-4 col-lg-4 col-sm-12 mb-3">
								<select class="selectpicker" onchange="location = this.value;">
									<option value="{url banner_id=null}" {if !isset($banner->id)}selected{/if}>{$btr->all_groups|escape}</option>
									{foreach $banners as $b}
										<option value="{url keyword=null page=null banner_id=$b->id}" {if isset($banner) && $banner->id == $b->id}selected{/if}>{$b->name|escape}</option>
									{/foreach}
								</select>
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
		{if $banners_images}
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<form class="js-form-list" method="post">
						<div id="main-list" class="turbo-list">
							<input type="hidden" name="session_id" value="{$smarty.session.id}">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-drag"></div>
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-banners-photo">{$btr->global_image|escape}</div>
								<div class="turbo-list-heading turbo-list-banners-images-name">{$btr->global_title|escape}</div>
								<div class="turbo-list-heading turbo-list-banners-group">{$btr->global_banner_group|escape}</div>
								<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>

							<div class="banners-wrap turbo-list-body features-wrap sortable">
								{foreach $banners_images as $banners_image}
									<div class="js-row turbo-list-body-item js-sort-item">
										<div class="turbo-list-row">
											<input type="hidden" name="positions[{$banners_image->id}]" value="{$banners_image->position}">

											<div class="turbo-list-boding turbo-list-drag move-zone">
												<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
											</div>
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$banners_image->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-banners-photo">
												{if $banners_image->image}
													<a href="{url module=BannersImageAdmin id=$banners_image->id return=$smarty.server.REQUEST_URI}">
														<img src="{$banners_image->image|resize_banners:90:60}">
													</a>
												{else}
													<a href="{url module=BannersImageAdmin id=$banners_image->id return=$smarty.server.REQUEST_URI}">
														<i class="align-middle" data-feather="camera"></i>
													</a>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-banners-images-name">
												<a class="fw-bold text-body text-decoration-none" href="{url module=BannersImageAdmin id=$banners_image->id return=$smarty.server.REQUEST_URI}">
													{$banners_image->name|escape}
												</a>
												<div class="turbo-list-banners-info text-muted">
													{$img_url=$config->root_url|cat:'/'|cat:$config->banners_images_dir|cat:$banners_image->image}
													{assign var="info" value=$img_url|getimagesize}
													{if isset($info.0) && isset($info.1)}
														{$info.0} X {$info.1} px
													{/if}
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-banners-group">
												{if $banners}
													<select class="selectpicker" name="image_banners[{$banners_image->id}]">
														{foreach $banners as $b}
															<option value="{$b->id}" {if $b->id == $banners_image->banner_id}selected{/if}>{$b->name}</option>
														{/foreach}
													</select>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-status">
												<div class="form-check form-switch">
													<input class="form-check-input js-ajax-action {if $banners_image->visible}js-active-class{/if}" id="id-{$banners_image->id}" data-module="banners_image" data-action="visible" data-id="{$banners_image->id}" name="visible" value="1" type="checkbox" {if $banners_image->visible}checked="" {/if}>
													<label class="form-check-label" for="id-{$banners_image->id}"></label>
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
													<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
														<i class="align-middle" data-feather="trash-2"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								{/foreach}
							</div>
							<div class="turbo-list-footer js-action-block">
								<div class="turbo-list-foot-left">
									<div class="turbo-list-heading turbo-list-drag"></div>
									<div class="turbo-list-heading turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
										</label>
									</div>
									<div class="turbo-list-option">
										<select name="action" class="selectpicker banners-action">
											<option value="enable">{$btr->global_do_enable|escape}</option>
											<option value="disable">{$btr->global_do_disable|escape}</option>
											{if $banners > 1}
												<option value="move_to_banner">{$btr->banners_images_move|escape}</option>
											{/if}
											<option value="delete">{$btr->global_delete|escape}</option>
										</select>
									</div>
									<div id="move_to_banner" class="row row-cols-md-auto align-items-center ms-3 d-none js-hide-block">
										<div class="col-12">
											<select name="target_banner" class="selectpicker">
												{foreach $banners as $b}
													<option value="{$b->id}">{$b->name|escape}</option>
												{/foreach}
											</select>
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="align-middle" data-feather="check"></i>
									{$btr->global_apply|escape}
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					{include file='pagination.tpl'}
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->banners_images_none|escape}</h5>
		{/if}
	</div>
</div>

{literal}
	<script>
		$(function() {
			$(document).on('change', '.js-action-block select.banners-action', function() {
				var elem = $(this).find('option:selected').val();
				$('.js-hide-block').addClass('d-none');
				if ($('#' + elem).size() > 0) {
					$('#' + elem).removeClass('d-none');
				}
			});
		});
	</script>
{/literal}