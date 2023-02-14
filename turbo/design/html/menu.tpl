{$meta_title = $btr->global_menu scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->global_menu|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<button type="button" id="add-menu" class="btn btn-primary"><i data-feather="plus"></i> {$btr->menus_add|escape}</button>
	</div>
</div>

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{$message_error|escape}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<div class="card">
	<div class="card-body">
		<div class="row">
			<div class="col-12">
				<form method="post" class="js-form-list">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<div class="turbo-list">
						<div class="currencies-wrap clearfix">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-drag"></div>
								<div class="turbo-list-heading turbo-list-menu-num">ID</div>
								<div class="turbo-list-heading turbo-list-menus-name">{$btr->menus_name|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div id="menu-block" class="turbo-list-body sortable">
								{foreach $menus as $m}
									<div class="turbo-list-body-item">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-drag">
												<div class="move-zone">
													<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-menu-num">
												<span>{$m->id}</span>
											</div>
											<div class="turbo-list-boding turbo-list-menus-name">
												<input name="menu[id][{$m->id}]" type="hidden" value="{$m->id|escape}">
												<input name="menu[name][{$m->id}]" class="form-control" type="text" value="{$m->name|escape}">
											</div>
											<div class="turbo-list-boding turbo-list-delete turbo-list-menus-close">
												<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
													<button type="button" class="btn-delete js-remove-menu" data-bs-toggle="modal" data-id="{$m->id}" data-bs-target="#js-menu-delete" onclick="success_action($(this));">
														<i class="align-middle" data-feather="trash-2"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								{/foreach}
								<div id="new-menu" class="turbo-list-body-item" style="display: none">
									<div class="turbo-list-row">
										<div class="turbo-list-boding turbo-list-drag move-zone">
											<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
										</div>
										<div class="turbo-list-boding turbo-list-menu-num"></div>
										<div class="turbo-list-boding turbo-list-menus-name">
											<input name="menu[id][]" type="hidden" value="">
											<input name="menu[name][]" class="form-control" type="text" value="">
										</div>
										<div class="turbo-list-boding turbo-list-delete turbo-list-menus-close">
											<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
												<button type="button" class="btn-delete js-remove-new-menu">
													<i class="align-middle" data-feather="trash-2"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="action" class="turbo-list-footer">
								<div class="turbo-list-foot-left"></div>
								<input type="hidden" name="action" value="">
								<input type="hidden" name="action_id" value="">
								<button id="apply-action" type="submit" class="btn btn-primary">
									<i class="align-middle" data-feather="check"></i>
									{$btr->global_apply|escape}
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="js-menu-delete" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$btr->global_confirm_delete|escape}</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body text-center">
				<div class="d-grid gap-2 d-sm-block">
					<button type="button" class="btn btn-success js-delete-menu-confirm"><i class="align-middle" data-feather="check"></i> {$btr->global_yes|escape}</button>
					<button type="button" class="btn btn-danger js-dismiss-menu" data-bs-dismiss="modal"><i class="align-middle" data-feather="x"></i> {$btr->global_no|escape}</button>
				</div>
			</div>
		</div>
	</div>
</div>

{literal}
	<script>
		$(window).on("load", function() {
			// Add menu
			var curr = $('#new-menu').clone(true);
			$('#new-menu').remove().removeAttr('id');
			$('#add-menu').click(function() {
				$(curr).clone(true).appendTo('.turbo-list-body').fadeIn('slow').find("input[name*=name]").focus();
				return false;
			});
			$(document).on("click", ".js-remove-new-menu", function() {
				$(this).closest(".turbo-list-body-item").fadeOut(200);
				$(this).closest(".turbo-list-body-item").remove();
			});
			var menu_to_delete;
			$(document).on("click", ".js-remove-menu", function() {
				menu_to_delete = $(this).data("id");
			});
			$(document).on("click", ".js-delete-menu-confirm", function() {
				$('input[type="hidden"][name="action"]').val('delete');
				$('input[type="hidden"][name="action_id"]').val(menu_to_delete);
				$(".js-form-list").submit();
			});
			$(".js-form-list").submit(function() {
				if ($('input[type="hidden"][name="action"]').val() == 'delete' && !confirm) {
					$('[data-target="#js-menu-delete"]').trigger('click');
					return false;
				}
			});
		});
	</script>
{/literal}