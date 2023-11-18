{$meta_title = $btr->currency_currencies scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->currency_currencies|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<button type="button" id="add-currency" class="btn btn-primary"><i data-feather="plus"></i> {$btr->currency_add|escape}</button>
	</div>
</div>

{if isset($message_error)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'wrong_iso'}
						{$btr->invalid_iso_code|escape}
						{foreach $wrong_iso as $w_iso}
							{$w_iso|escape}
						{/foreach}
					{else}
						{$message_error|escape}
					{/if}
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
					<input type="hidden" name="lang_id" value="{$lang_id}">
					<div class="turbo-list">
						<div class="currencies-wrap clearfix">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-drag"></div>
								<div class="turbo-list-heading turbo-list-currency-num">ID</div>
								<div class="turbo-list-heading turbo-list-currency-name">{$btr->currency_name|escape}</div>
								<div class="turbo-list-heading turbo-list-currency-sign">{$btr->global_symbol|escape}</div>
								<div class="turbo-list-heading turbo-list-currency-iso">{$btr->currency_iso|escape}</div>
								<div class="turbo-list-heading turbo-list-currency-exchange">{$btr->currency_rate|escape}</div>
								<div class="turbo-list-heading turbo-list-status hidden-md-down">{$btr->global_enable|escape}</div>
								<div class="turbo-list-heading cur-settings">{$btr->global_activities|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body sortable">
								{foreach $currencies as $c}
									<div class="turbo-list-body-item">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-drag move-zone">
												<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
											</div>
											<div class="turbo-list-boding turbo-list-currency-num">
												<span>{$c->id}</span>
											</div>
											<div class="turbo-list-boding turbo-list-currency-name">
												<input class="form-control" name="currency[id][{$c->id}]" type="hidden" value="{$c->id|escape}">
												<input name="currency[name][{$c->id}]" class="form-control" type="text" value="{$c->name|escape}">

												{if $c@first}
													<span class="text-success position-absolute bottom-0 end-0 me-3 mb-3" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->currency_base|escape}"><i class="align-middle" data-feather="check"></i></span>
												{/if}
												<div class="d-block d-md-none">
													{if !$c@first}
														<div class="row gx-0 mt-2">
															<div class="col-5">
																<div class="mb-0">
																	<div class="input-group">
																		<input class="form-control" name="currency[rate_from][{$c->id}]" type="text" value="{$c->rate_from|escape}">
																		<div class="input-group-text">{$c->sign}</div>
																	</div>
																</div>
															</div>
															<div class="col-2">
																<div class="mb-0 mt-1 h3 text-center">=</div>
															</div>
															<div class="col-5">
																<div class="mb-0">
																	<div class="input-group">
																		<input class="form-control" name="currency[rate_to][{$c->id}]" type="text" value="{$c->rate_to|escape}">
																		<div class="input-group-text">{$currency->sign}</div>
																	</div>
																</div>
															</div>
														</div>
													{else}
														<input name="currency[rate_from][{$c->id}]" type="hidden" value="{$c->rate_from|escape}">
														<input name="currency[rate_to][{$c->id}]" type="hidden" value="{$c->rate_to|escape}">
													{/if}
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-currency-iso">
												<input class="form-control" name="currency[sign][{$c->id}]" type="text" value="{$c->sign|escape}">
											</div>
											<div class="turbo-list-boding turbo-list-currency-sign">
												<input class="form-control" name="currency[code][{$c->id}]" type="text" value="{$c->code|escape}">
											</div>
											<div class="turbo-list-boding turbo-list-currency-exchange">
												<div class="turbo-list-currency-exchange-item">
													{if !$c@first}
														<div class="row gx-1">
															<div class="col-5">
																<div class="mb-0">
																	<div class="input-group">
																		<input class="form-control" name="currency[rate_from][{$c->id}]" type="text" value="{$c->rate_from|escape}">
																		<div class="input-group-text">{$c->sign}</div>
																	</div>
																</div>
															</div>
															<div class="col-2">
																<div class="mb-0 mt-1 h3 text-center">=</div>
															</div>
															<div class="col-5">
																<div class="mb-0">
																	<div class="input-group">
																		<input class="form-control" name="currency[rate_to][{$c->id}]" type="text" value="{$c->rate_to|escape}">
																		<div class="input-group-text">{$currency->sign}</div>
																	</div>
																</div>
															</div>
														</div>
													{else}
														<input name="currency[rate_from][{$c->id}]" type="hidden" value="{$c->rate_from|escape}">
														<input name="currency[rate_to][{$c->id}]" type="hidden" value="{$c->rate_to|escape}">
													{/if}
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-status">
												<div class="form-check form-switch">
													<input class="form-check-input js-ajax-action {if $c->enabled}js-active-class{/if}" id="id-{$c->id}" data-module="currency" data-action="enabled" data-id="{$c->id}" name="enabled" value="1" type="checkbox" {if $c->enabled}checked="" {/if}>
													<label class="form-check-label" for="id-{$c->id}"></label>
												</div>
											</div>
											<div class="turbo-list-boding cur-settings">
												<button type="button" class="setting-icon setting-icon-currency js-ajax-action {if $c->cents}js-active-class{/if}" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->currency_cents_display|escape}" data-module="currency" data-action="cents" data-id="{$c->id}" name="cents">
													<i class="align-middle" data-feather="database"></i>
												</button>
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												{if !$c@first}
													<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->currency_delete|escape}">
														<button type="button" class="btn-delete js-remove-currency" data-bs-toggle="modal" data-id="{$c->id}" data-bs-target="#js-currency-delete" onclick="success_action($(this));">
															<i class="align-middle" data-feather="trash-2"></i>
														</button>
													</div>
												{/if}
											</div>
										</div>
									</div>
								{/foreach}
								<div id="new-currency" class="turbo-list-body-item" style="display: none">
									<div class="turbo-list-row">
										<div class="turbo-list-boding turbo-list-drag move-zone">
											<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
										</div>
										<div class="turbo-list-boding turbo-list-currency-num"></div>
										<div class="turbo-list-boding turbo-list-currency-name">
											<input name="currency[id][]" type="hidden" value="">
											<input name="currency[name][]" class="form-control" type="text" value="">
										</div>
										<div class="turbo-list-boding turbo-list-currency-iso">
											<input class="form-control" name="currency[sign][]" type="text" value="">
										</div>
										<div class="turbo-list-boding turbo-list-currency-sign">
											<input class="form-control" name="currency[code][]" type="text" value="">
										</div>
										<div class="turbo-list-boding turbo-list-currency-exchange">
											<div class="turbo-list-currency-exchange-item">
												<div class="row gx-1">
													<div class="col-5">
														<div class="mb-0">
															<div class="input-group">
																<input class="form-control" name="currency[rate_from][]" type="text" value="">
																<div class="input-group-text">&nbsp;&nbsp;</div>
															</div>
														</div>
													</div>
													<div class="col-2">
														<div class="mb-0 mt-1 h3 text-center">=</div>
													</div>
													<div class="col-5">
														<div class="mb-0">
															<div class="input-group">
																<input class="form-control" name="currency[rate_to][]" type="text" value="">
																<div class="input-group-text">{$currency->sign}</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="turbo-list-boding turbo-list-status"></div>
										<div class="turbo-list-boding cur-settings"></div>
										<div class="turbo-list-boding turbo-list-delete">
											<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
												<button type="button" class="btn-delete js-remove-new-currency">
													<i class="align-middle" data-feather="trash-2"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="action" class="turbo-list-footer">
								<div class="turbo-list-foot-left"></div>
								<input type="hidden" name="recalculate" value="0">
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

<div class="modal fade" id="js-currency-delete" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$btr->global_confirm_delete|escape}</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body text-center">
				<div class="d-grid gap-2 d-sm-block">
					<button type="button" class="btn btn-success js-delete-currency-confirm"><i class="align-middle" data-feather="check"></i> {$btr->global_yes|escape}</button>
					<button type="button" class="btn btn-danger js-dismiss-currency" data-bs-dismiss="modal"><i class="align-middle" data-feather="x"></i> {$btr->global_no|escape}</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="js-currency-recalculate" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body text-center">
				<div class="d-grid gap-2 d-sm-block">
					<button type="button" class="btn btn-success js-recalculate-currency-confirm"><i class="align-middle" data-feather="check"></i> {$btr->global_yes|escape}</button>
					<button type="button" class="btn btn-danger js-recalculate-currency-dismiss" data-bs-dismiss="modal"><i class="align-middle" data-feather="x"></i> {$btr->global_no|escape}</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var сurrency_recalculate = '{$btr->currency_recalculate|escape}';
	var сurrency_recalculate_rate = '{$btr->currency_recalculate_rate|escape}';
</script>

{literal}
	<script>
		$(window).on("load", function() {
			var confirm = true;
			var curr = $('#new-currency').clone(true);
			$('#new-currency').remove().removeAttr('id');
			$('#add-currency').click(function() {
				$(curr).clone(true).appendTo('.turbo-list-body').fadeIn('slow').find("input[name*=currency][name*=name]").focus();
				return false;
			});

			$(document).on("click", ".js-remove-new-currency", function() {
				$(this).closest(".turbo-list-body-item").fadeOut(200);
				$(this).closest(".turbo-list-body-item").remove();
			});

			var currency_to_delete;
			$(document).on("click", ".js-remove-currency", function() {
				currency_to_delete = $(this).data("id");
			});

			$(document).on("click", ".js-delete-currency-confirm", function() {
				$('input[type="hidden"][name="action"]').val('delete');
				$('input[type="hidden"][name="action_id"]').val(currency_to_delete);
				$(".js-form-list").submit();
			});

			$(document).on("click", ".js-recalculate-currency-confirm", function() {
				$('input[name="recalculate"]').val(1);
				confirm = false;
				$(".js-form-list").submit();
			});

			$(document).on("click", ".js-recalculate-currency-dismiss", function() {
				$('input[name="recalculate"]').val(0);
				confirm = false;
				$(".js-form-list").submit();
			});

			var base_currency_id = $('input[name*="currency[id]"]').val();

			$(".js-form-list").submit(function() {
				if (base_currency_id != $('input[name*="currency[id]"]:first').val() && confirm) {
					$('#js-currency-recalculate .modal-title').text(сurrency_recalculate + ' ' + $('input[name*="name"]:first').val() + ' ' + сurrency_recalculate_rate);
					$('#js-currency-recalculate').modal('show');
					return false;
				}
			});
		});
	</script>
{/literal}