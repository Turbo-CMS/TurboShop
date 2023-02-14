{$meta_title = $btr->user_scripts scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->user_scripts|escape}</h1>
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'saved'}
						{$btr->global_settings_saved|escape}
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
					<div class="alert alert-primary alert-dismissible" role="alert">
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						<div class="alert-message">
							{$btr->counters_info|escape}
						</div>
					</div>
					<div class="js-counters-list">
						{if $counters}
							{foreach $counters as $c}
								<div class="js-row">
									<div class="row">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-12">
													<div class="mb-3">
														<div class="form-label">{$btr->counters_counter_name|escape}</div>
														<input name="counters[name][]" class="form-control" value="{$c->name|escape}">
													</div>
												</div>
												<div class="col-md-12">
													<div class="mb-3">
														<div class="form-label">{$btr->counters_counter_position|escape}</div>
														<select name="counters[position][]" class="selectpicker">
															<option value="head" {if $c->position == 'head'} selected{/if}>{$btr->counters_position_head|escape}</option>
															<option value="body_top" {if $c->position == 'body_top'} selected{/if}>{$btr->counters_position_body_top|escape}</option>
															<option value="body_bottom" {if $c->position == 'body_bottom'} selected{/if}>{$btr->counters_position_body_bottom|escape}</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-12">
													<div class="mb-3">
														<div class="form-label">{$btr->counters_counter_code|escape}</div>
														<textarea name="counters[code][]" class="form-control turbo-textarea">{$c->code|escape}</textarea>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<button type="button" class="btn btn-danger float-end js-delete-counter">
												<i class="align-middle" data-feather="trash-2"></i>
												{$btr->global_delete|escape}
											</button>
										</div>
									</div>
								</div>
							{/foreach}
						{/if}
					</div>
					<div class="js-new-counter d-none js-row">
						<div class="row">
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->counters_counter_name|escape}</div>
											<input name="counters[name][]" class="form-control mb-h" value="">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->counters_counter_position|escape}</div>
											<select name="counters[position][]" class="selectpicker">
												<option value="head" {if $c->position == 'head'} selected{/if}>{$btr->counters_position_head|escape}</option>
												<option value="body_top" {if $c->position == 'body_top'} selected{/if}>{$btr->counters_position_body_top|escape}</option>
												<option value="body_bottom" {if $c->position == 'body_bottom'} selected{/if}>{$btr->counters_position_body_bottom|escape}</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->counters_counter_code|escape}</div>
											<textarea name="counters[code][]" class="form-control turbo-textarea"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 mb-3 d-grid gap-2 d-sm-block">
								<button type="button" class="btn btn-danger float-end js-delete-counter">
									<i class="align-middle" data-feather="trash-2"></i>
									{$btr->global_delete|escape}
								</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 mb-3 d-grid gap-2 d-sm-block">
							<button type="button" class="btn btn-success js-add-counter">
								<i class="align-middle" data-feather="plus"></i>
								{$btr->counters_add_counter|escape}
							</button>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 mb-3 d-grid gap-2 d-sm-block">
							<button type="submit" class="btn btn_small btn-primary float-end">
								<i class="align-middle" data-feather="check"></i>
								<span>{$btr->global_apply|escape}</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

{literal}
	<script>
		$(document).on("click", ".js-delete-counter", function() {
			$(this).closest(".js-row").fadeOut(200, function() { $(this).remove(); });
			return false;
		});

		$(window).on("load", function() {
			var counter = $(".js-new-counter").clone(false);
			$(".js-new-counter").remove();
			counter.find('.bootstrap-select').replaceWith(function() { return $('select', this); });
			$(document).on("click", ".js-add-counter", function() {
				var counter_clone = counter.clone(true);
				counter_clone.find("select").selectpicker();
				counter_clone.removeClass("d-none").removeClass("js-new-counter");
				$(".js-counters-list").append(counter_clone);
				return false;
			});
		});
	</script>
{/literal}