{if $theme->name}
	{$meta_title = "`$btr->global_theme` {$theme->name}" scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->theme_current|escape} &mdash; {$theme->name}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<button type="button" class="js-clone-theme btn btn-primary"><i data-feather="plus"></i> {$btr->theme_copy|escape} {$settings->theme}</button>
	</div>
</div>

{if $theme->locked}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{$btr->theme_close|escape}
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
					{if $message_error == 'permissions'}
						{$btr->global_permissionse|escape} {$themes_dir}
					{elseif $message_error == 'name_exists'}
						{$btr->theme_exists|escape}
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
	<input type="hidden" name="action">
	<input type="hidden" name="theme">
	<div class="row gx-2">
		{foreach $themes as $t}
			<div class="col-12 col-md-6 col-lg-4">
				<div class="card mh-250px">
					<div class="card-header px-4 pt-4">
						<div class="card-actions float-end">
							{if !$t->locked}
								<span class="btn-edit" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_edit|escape}">
									<i class="js-rename-theme align-middle cursor-pointer me-1" data-feather="edit-2" data-old-name="{$t->name|escape}"></i>
								</span>
								<div class="btn-delete float-end js-remove-theme" data-theme-name="{$t->name|escape}" data-bs-toggle="modal" data-bs-target="#js-delete-theme">
									<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
										<i class="align-middle" data-feather="trash-2"></i>
									</span>
								</div>
							{else}
								<span class="btn-delete" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->theme_close|escape}">
									<i class="align-middle" data-feather="lock"></i>
								</span>
							{/if}
						</div>
						<input type="text" class="d-none" name="old_name[]" value="{$t->name|escape}">
						<div class="js-rename-value d-none position-absolute w-auto mt-n2">
							<input type="text" class="form-control" name="new_name[]" value="{$t->name|escape}">
						</div>
						<h5 class="card-title mb-0">{$t->name|escape} {if  $t->name == $theme->name}<span class="text-success">- {$btr->theme_current_item|escape}</span>{/if}</h5>
					</div>
					<div class="card-body px-4 pt-2">
						<div class="text-center">
							<img class="{if $theme->name != $t->name}gray-filter{/if}" src="../design/{$t->name}/preview.png" alt="{$t->name|escape}">
						</div>
						{if $theme->name != $t->name}
							<button type="button" class="js-set-theme btn btn-secondary position-absolute bottom-0 end-0 me-3 mb-3" data-set-name="{$t->name|escape}">
								<i class="align-middle" data-feather="check"></i>
								{$btr->global_select|escape}
							</button>
						{/if}
					</div>
				</div>
			</div>
		{/foreach}
		<div class="col-12">
			<button type="submit" name="save" class="btn btn-primary js-chek-all float-end">
				<i class="align-middle" data-feather="check"></i>
				{$btr->global_apply|escape}
			</button>
		</div>
	</div>
</form>
<div class="modal fade" id="js-delete-theme" tabindex="-1" style="display: none;" aria-hidden="true">
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

<script>
	{literal}
		$(window).on("load", function() {
			$('.js-rename-theme').on('click', function() {
				$(this).closest('.card-header').find('.js-rename-value').toggleClass('d-none');
				$(this).closest('.card-header').find('.card-title').toggleClass('d-none');
				$(this).parent().find('.js-set-theme').toggleClass('opacity-toggle');
				$(this).parent().find('.js-rename-value > input').val($(this).data('old-name'))
			});

			$('.js-set-theme').on('click', function() {
				$("input[name=action]").val('set_main_theme');
				$("input[name=theme]").val($(this).data('set-name'));
				$("form").submit();
			});

			$('.js-clone-theme').on('click', function(e) {
				e.preventDefault();
				$("input[name=action]").val('clone_theme');
				$("form").submit();
			});

			$(".js-remove-theme").on("click", function() {
				action = "delete_theme";
				theme_name = $(this).data("theme-name");
			});

			$(".js-submit-delete").on("click", function() {
				$("form input[name=action]").val(action);
				$("form input[name=theme]").val(theme_name);
				$("form").submit();
			});

			$(".js-dismiss-delete").on("click", function() {
				$("form input[name=action]").val("");
				$("form input[name=theme]").val("");
			});
		});
	{/literal}
</script>