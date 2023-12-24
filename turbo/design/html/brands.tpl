{$meta_title=$btr->global_brands scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->global_brands|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=BrandAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->brands_add_brand|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $brands}
			<form method="post" class="js-form-list">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="turbo-list">
					<div class="turbo-list-head">
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-photo">{$btr->global_photo|escape}</div>
						<div class="turbo-list-heading turbo-list-brands-name">{$btr->global_title|escape}</div>
						<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
						<div class="turbo-list-heading turbo-list-setting">{$btr->global_activities|escape}</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="turbo-list-body sortable">
						{foreach $brands as $brand}
							<div class="js-row turbo-list-body-item js-sort-item body-narrow">
								<div class="turbo-list-row narrow">
									<div class="turbo-list-boding turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$brand->id}">
										</label>
									</div>
									<div class="turbo-list-boding turbo-list-photo small-photo boding-small turbo-list-brand-photo">
										{if $brand->image}
											<a href="{url module=BrandAdmin id=$brand->id return=$smarty.server.REQUEST_URI}">
												<img src="{$brand->image|resize_brands:30:30}" alt="{$brand->name|escape}">
											</a>
										{else}
											<a href="{url module=BrandAdmin id=$brand->id return=$smarty.server.REQUEST_URI}">
												<i class="align-middle" data-feather="camera"></i>
											</a>
										{/if}
									</div>
									<div class="turbo-list-boding turbo-list-brands-name">
										<a href="{url module=BrandAdmin id=$brand->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">
											{$brand->name|escape}
										</a>
									</div>
									<div class="turbo-list-boding turbo-list-status">
										<div class="form-check form-switch">
											<input class="form-check-input js-ajax-action {if $brand->visible}js-active-class{/if}" id="id-{$brand->id}" data-module="brands" data-action="visible" data-id="{$brand->id}" name="visible" value="1" type="checkbox" {if $brand->visible}checked="" {/if}>
											<label class="form-check-label" for="id-{$brand->id}"></label>
										</div>
									</div>
									<div class="turbo-list-setting">
										<a href="../{$lang_link}brands/{$brand->url|escape}" target="_blank" class="setting-icon setting-icon-open" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_view|escape}">
											<i class="align-middle" data-feather="external-link"></i>
										</a>
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
							<div class="turbo-list-heading turbo-list-check">
								<label class="form-check">
									<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo-list-option">
								<select name="action" class="selectpicker">
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
			<h5 class="card-title ms-1 my-3">{$btr->brands_no|escape}</h5>
		{/if}
	</div>
</div>