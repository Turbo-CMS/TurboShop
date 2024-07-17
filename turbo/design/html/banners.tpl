{$meta_title=$btr->banners_groups_title scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->banners_groups_title|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=BannerAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->banners_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $banners}
			<div class="categories">
				<form class="js-form-list" method="post">
					<input type="hidden" name="session_id" value="{$smarty.session.id}">
					<div class="turbo-list ">
						<div class="turbo-list-head">
							<div class="turbo-list-heading turbo-list-drag"></div>
							<div class="turbo-list-heading turbo-list-check">
								<label class="form-check">
									<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo-list-heading turbo-list-banners-name">{$btr->banners_group_name|escape}</div>
							<div class="turbo-list-heading turbo-list-banners-tag">{$btr->banners_display|escape}</div>
							<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
							<div class="turbo-list-heading turbo-list-delete"></div>
						</div>
						<div class="banners-groups-wrap turbo-list-body features-wrap sortable">
							{foreach $banners as $banner}
								<div class="js-row turbo-list-body-item js-sort-item">
									<div class="turbo-list-row">
										<input type="hidden" name="positions[{$banner->id}]" value="{$banner->position}">
										<div class="turbo-list-boding turbo-list-drag move-zone">
											<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
										</div>
										<div class="turbo-list-boding turbo-list-check">
											<label class="form-check">
												<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$banner->id}">
											</label>
										</div>
										<div class="turbo-list-boding turbo-list-banners-name">
											<a href="{url module=BannerAdmin id=$banner->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">
												{$banner->name|escape}
											</a>
										</div>
										<div class="turbo-list-boding turbo-list-banners-tag">
											<div class="wrap_tags">
												{if $banner->show_all_pages}
													<span class="badge badge-success-light">{$btr->global_all_pages|escape}</span>
												{/if}
												{if !$banner->show_all_pages && isset($banner->articles_category_show)}
													<div class="mb-0">
														<span class="fw-bold text-muted">{$btr->article_categories|escape}:</span>
														{foreach $banner->articles_category_show as $cat_show}
															<span class="badge badge-info-light">{$cat_show->name|escape}</span>
														{/foreach}
													</div>
												{/if}
												{if !$banner->show_all_pages && isset($banner->category_show)}
													<div class="mb-0">
														<span class="fw-bold text-muted">{$btr->global_categories|escape}:</span>
														{foreach $banner->category_show as $cat_show}
															<span class="badge badge-primary-light">{$cat_show->name|escape}</span>
														{/foreach}
													</div>
												{/if}
												{if !$banner->show_all_pages && isset($banner->brands_show)}
													<div class="mb-0">
														<span class="fw-bold text-muted">{$btr->global_brands|escape}:</span>
														{foreach $banner->brands_show as $brand_show}
															<span class="badge badge-warning-light">{$brand_show->name|escape}</span>
														{/foreach}
													</div>
												{/if}
												{if !$banner->show_all_pages && isset($banner->page_show)}
													<div class="mb-0">
														<span class="fw-bold text-muted">{$btr->global_pages|escape}:</span>
														{foreach $banner->page_show as $page_show}
															<span class="badge badge-danger-light">{$page_show->header|escape}</span>
														{/foreach}
													</div>
												{/if}
											</div>
										</div>
										<div class="turbo-list-boding turbo-list-status">
											<div class="form-check form-switch">
												<input class="form-check-input js-ajax-action {if $banner->visible}js-active-class{/if}" id="id-{$banner->id}" data-module="banner" data-action="visible" data-id="{$banner->id}" name="visible" value="1" type="checkbox" {if $banner->visible}checked=""{/if}>
												<label class="form-check-label" for="id-{$banner->id}"></label>
											</div>
										</div>
										<div class="turbo-list-boding turbo-list-delete">
											<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
												<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
													<i class="align-middle" data-feather="trash-2"></i>
												</span>
											</button>
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
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->banners_no_groups|escape}</h5>
		{/if}
	</div>
</div>