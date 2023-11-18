{$meta_title = $btr->global_faq scope=global}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-3">
				{$btr->global_faq|escape}
			</h1>
			<div class="d-grid d-sm-block mt-2 mt-md-0">
				<a class="btn btn-primary" href="{url module=FAQAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->faq_add|escape}</a>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-xs-12 float-sm-end">
		<form class="search mb-3" method="get">
			<input type="hidden" name="module" value="FAQsAdmin">
			<div class="input-group">
				<input name="keyword" class="form-control" placeholder="{$btr->faq_search|escape}" type="text" value="{if isset($keyword)}{$keyword|escape}{/if}">
				<button class="btn btn-primary" type="submit"><i class="align-middle mt-n1" data-feather="search"></i></button>
			</div>
		</form>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $faqs}
			<div class="row">
				<div class="col-12">
					<form method="post" class="js-form-list">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">
						<div class="turbo-list ">
							<div class="turbo-list-head">
								<div class="turbo-list-boding turbo-list-drag"></div>
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-name turbo-list-faq-name">{$btr->global_title|escape}</div>
								<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div id="" class="turbo-list-body sortable">
								{foreach $faqs as $faq}
									<div class="js-row turbo-list-body-item js-sort-item">
										<div class="turbo-list-row">
											<input type="hidden" name="positions[{$faq->id}]" value="{$faq->position}">
											<div class="turbo-list-boding turbo-list-drag move-zone">
												<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
											</div>
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$faq->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-name turbo-list-faq-name">
												<a class="fw-bold text-body text-decoration-none" href="{url module=FAQAdmin id=$faq->id return=$smarty.server.REQUEST_URI}">{$faq->name|escape}</a>
											</div>
											<div class="turbo-list-boding turbo-list-status">
												<div class="form-check form-switch">
													<input class="form-check-input js-ajax-action {if $faq->visible}js-active-class{/if}" id="id-{$faq->id}" data-module="faq" data-action="visible" data-id="{$faq->id}" name="visible" value="1" type="checkbox" {if $faq->visible}checked="" {/if}>
													<label class="form-check-label" for="id-{$faq->id}"></label>
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
									<div class="turbo-list-boding turbo-list-drag"></div>
									<div class="turbo-list-heading turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
										</label>
									</div>
									<div class="turbo-list-option">
										<select name="action" class="selectpicker">
											<option value="enable">{$btr->global_do_enable|escape}</option>
											<option value="disable">{$btr->global_do_disable|escape}</option>
											<option value="delete">{$btr->global_delete|escape}</option>
										</select>
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
			<h5 class="card-title ms-1 my-3">{$btr->faqs_no|escape}</h5>
		{/if}
	</div>
</div>