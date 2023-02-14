{if $page->id}
	{$meta_title = $page->name scope=global}
{else}
	{$meta_title = $btr->page_new scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if !$page->id}
			{$btr->page_add|escape}
		{else}
			{$page->name|escape}
		{/if}
	</h1>
	{if $page->id}
		<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
			<a class="btn btn-primary" target="_blank" href="../{$lang_link}{$page->url}">
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
					{if $message_success == 'added'}
						{$btr->page_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->page_updated|escape}
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
					{if $message_error == 'url_exists'}
						{$btr->global_exists|escape}
					{elseif $message_error=='empty_name'}
						{$btr->global_enter_name|escape}
					{elseif $message_error == 'url_wrong'}
						{$btr->global_not_underscore|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_title|escape}</div>
								<input class="form-control" name="name" type="text" value="{$page->name|escape}">
								<input name="id" type="hidden" value="{$page->id|escape}">
							</div>
							<div class="mb-3">
								<div class="form-label">{$btr->page_menu_name|escape}</div>
								<input class="form-control" name="header" type="text" value="{$page->header|escape}">
							</div>
							<div class="row">
								<div class="col-xs-12 col-lg-6 col-md-10">
									<div class="mt-2 mb-3 mb-h">
										<div class="input-group">
											<span class="input-group-text">URL</span>
											<input name="url" class="js-meta-field form-control js-url {if $page->id}js-disabled{/if}" {if $page->id}readonly="" {/if} type="text" value="{$page->url|escape}">
											<input type="checkbox" id="block-translit" class="d-none" value="1" {if $page->id}checked="" {/if}>
											<span class="input-group-text js-disable-url">
												{if $page->id}
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
									<input class="form-check-input ms-2" type="checkbox" id="visible" name="visible" value="1" type="checkbox" {if $page->visible}checked="" {/if}>
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
			<div class="card mh-210px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->page_menu_options|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="mb-3">
							<div class="form-label">{$btr->global_menu|escape}:</div>
							<select name="menu_id" class="selectpicker mb-h" id="menu_id">
								{foreach $menus as $m}
									<option value="{$m->id}" {if $page->menu_id == $m->id}selected{/if}>{$m->name|escape}</option>
								{/foreach}
							</select>
						</div>
						<div class="mb-3">
							<div class="form-label">{$btr->page_root|escape}</div>
							<select name="parent_id" class="selectpicker" id="parent_id"></select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8 col-md-12">
			<div class="card mh-210px">
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
									<input name="meta_title" class="form-control js-meta-field mb-h" type="text" value="{$page->meta_title|escape}">
								</div>
								<div class="mb-3">
									<div class="form-label">Meta-keywords</div>
									<input name="meta_keywords" class="form-control js-meta-field mb-h" type="text" value="{$page->meta_keywords|escape}">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 pl-0">
								<div class="form-label">Meta-description <span id="js-meta-description-counter"></span></div>
								<textarea name="meta_description" class="form-control turbo-textarea js-meta-field">{$page->meta_description|escape}</textarea>
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
						<textarea name="body" id="js-editor" class="editor-small">{$page->body|escape}</textarea>
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

<script>
	$(document).ready(function() {
		$('#menu_id').trigger('change');
	});

	$('#menu_id').change(function() {
		$('#parent_id').html('');
		var option = $(this).find('option:selected');
		$.ajax({
			type: 'POST',
			url: 'ajax/get_pages.php',
			data: {
				'menu_id': option.val(),
				'exclude': {if $page->id}{$page->id}{else}0{/if},
				'session_id': '{$smarty.session.id}'
			},
			success: function(data) {
				if (data.success) {
					for (var index in data.data) {
						var row = data.data[index];
						var option = $('<option></option>');
						option.val(row.id);
						option.addClass(row.class);
						option.html(row.text);
						{if $page->id}if (row.id == {$page->parent_id})
						option.prop('selected', true);{/if}
						$('#parent_id').append(option);
						$('.selectpicker').selectpicker('refresh');
					}
				}
			}
		});
	});
</script>