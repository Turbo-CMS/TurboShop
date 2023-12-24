{$meta_title=$btr->global_languages scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->languages_site|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=LanguageAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->languages_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $languages}
			<form method="post" class="js-form-list">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="turbo-list">
					<div class="turbo-list-head">
						<div class="turbo-list-boding turbo-list-drag"></div>
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-photo">{$btr->global_photo|escape}</div>
						<div class="turbo-list-heading turbo-list-languages-name">{$btr->global_title|escape}</div>
						<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="turbo-list-body sortable">
						{foreach $languages as $language}
							<div class="js-row turbo-list-body-item js-sort-item">
								<div class="turbo-list-row">
									<input type="hidden" name="positions[]" value="{$language->id}">
									<div class="turbo-list-boding turbo-list-drag move-zone">
										<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
									</div>
									<div class="turbo-list-boding turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$language->id}" {if $language@first}disabled{/if}>
										</label>
									</div>
									<div class="turbo-list-boding turbo-list-photo turbo-list-languages-photo">
										<a href="{url module=LanguageAdmin id=$language->id return=$smarty.server.REQUEST_URI}">
											<img height="40" width="40" src="design/flags/4x3/{$language->label}.svg">
										</a>
									</div>
									<div class="turbo-list-boding turbo-list-languages-name">
										<a href="{url module=LanguageAdmin id=$language->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">
											{$language->name|escape} [{$language->label|escape}]
										</a>
									</div>
									<div class="turbo-list-boding turbo-list-status">
										<div class="form-check form-switch">
											<input class="form-check-input js-ajax-action {if $language->enabled}js-active-class{/if}" id="id-{$language->id}" data-module="language" data-action="enabled" data-id="{$language->id}" name="enabled" value="1" type="checkbox" {if $language->enabled}checked=""{/if}>
											<label class="form-check-label" for="id-{$language->id}"></label>
										</div>
									</div>
									{if !$language@first}
										<div class="turbo-list-boding turbo-list-delete">
											<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
												<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
													<i class="align-middle" data-feather="trash-2"></i>
												</button>
											</div>
										</div>
									{/if}
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
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->languages_no_list|escape}</h5>
		{/if}
	</div>
</div>