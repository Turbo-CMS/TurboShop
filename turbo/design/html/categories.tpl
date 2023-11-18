{$meta_title=$btr->global_categories scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->global_categories|escape}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=CategoryAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->categories_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $categories}
			<form method="post" class="js-form-list">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="turbo-list">
					<div class="turbo-list-head">
						<div class="turbo-list-heading turbo-list-subicon"></div>
						<div class="turbo-list-heading turbo-list-drag"></div>
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-photo d-none d-md-block">{$btr->global_photo|escape}</div>
						<div class="turbo-list-heading turbo-list-categories-name">{$btr->global_title|escape}</div>
						<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
						<div class="turbo-list-heading turbo-list-setting">{$btr->global_activities|escape}</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="turbo-list-body categories-wrap sortable">
						{function name=categories_tree level=1}
							{if $categories}
								{foreach $categories as $category}
									{if $level > 1}
										<div class="js-row row-narrow">
										{/if}
										<div class="js-row {if $level == 1}turbo-list-body-item{/if} js-sort-item body-narrow row-narrow">
											<div class="turbo-list-row narrow {if $level > 1}js-sort-item{/if}">
												<input type="hidden" name="positions[{$category->id}]" value="{$category->position}">
												{if isset($category->subcategories)}
													<div class="turbo-list-heading turbo-list-subicon">
														<a href="javascript:;" class="js-ajax-toggle" data-toggle="0" data-category_id="{$category->id}">
															<i class="icon-category plus-category"></i>
														</a>
													</div>
												{else}
													<div class="turbo-list-heading turbo-list-subicon"></div>
												{/if}
												<div class="turbo-list-boding turbo-list-drag move-zone">
													<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
												</div>
												<div class="turbo-list-boding turbo-list-check">
													<label class="form-check">
														<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$category->id}">
													</label>
												</div>
												<div class="turbo-list-boding turbo-list-photo turbo-list-category-photo hidden-sm-down small-photo boding-small d-none d-md-block">
													{if $category->image}
														<a href="{url module=CategoryAdmin id=$category->id return=$smarty.server.REQUEST_URI}">
															<img src="{$category->image|resize_catalog:30:30}" alt="{$category->name|escape}">
														</a>
													{elseif $category->icon}
														<a href="{url module=CategoryAdmin id=$category->id return=$smarty.server.REQUEST_URI}">
															<img src="../{$config->categories_images_dir}{$category->icon}" alt="{$category->name|escape}">
														</a>
													{elseif $category->code}
														<a href="{url module=CategoryAdmin id=$category->id return=$smarty.server.REQUEST_URI}">
															<i class="align-middle" data-feather="code"></i>
														</a>
													{else}
														<a href="{url module=CategoryAdmin id=$category->id return=$smarty.server.REQUEST_URI}">
															<i class="align-middle" data-feather="camera"></i>
														</a>
													{/if}
												</div>
												<div class="turbo-list-boding turbo-list-categories-name">
													<a class="fw-bold text-body text-decoration-none" href="{url module=CategoryAdmin id=$category->id return=$smarty.server.REQUEST_URI}">
														{$category->name|escape}
													</a>
												</div>
												<div class="turbo-list-boding turbo-list-status">
													<div class="form-check form-switch">
														<input class="form-check-input js-ajax-action {if $category->visible}js-active-class{/if}" id="id-{$category->id}" data-module="category" data-action="visible" data-id="{$category->id}" name="visible" value="1" type="checkbox" {if $category->visible}checked="" {/if}>
														<label class="form-check-label" for="id-{$category->id}"></label>
													</div>
												</div>
												<div class="turbo-list-setting">
													<a href="../{$lang_link}catalog/{$category->url}" target="_blank" class="setting-icon setting-icon-open" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_view|escape}">
														<i class="align-middle" data-feather="external-link"></i>
													</a>
													<button type="button" class="setting-icon setting-icon-featured js-ajax-action {if $category->featured}js-active-class{/if}" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->categories_featured|escape}" data-module="category" data-action="featured" data-id="{$category->id}">
														<i class="align-middle" data-feather="star"></i>
													</button>
												</div>
												<div class="turbo-list-boding turbo-list-delete">
													<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->categories_delete|escape}">
														<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
															<i class="align-middle" data-feather="trash-2"></i>
														</button>
													</div>
												</div>
											</div>
											{if isset($category->subcategories)}
												<div class="js-ajax-categories categories-sub-block subcategories-level-{$level} sortable" style="display: none;">
													{categories_tree categories=$category->subcategories level=$level+1}
												</div>
											{/if}
										</div>
										{if $level > 1}
										</div>
									{/if}
								{/foreach}
							{/if}
						{/function}
						{categories_tree categories=$categories}
					</div>
					<div class="turbo-list-footer js-action-block">
						<div class="turbo-list-foot-left">
							<div class="turbo-list-heading turbo-list-subicon"></div>
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
									<option value="set_featured">{$btr->categories_mark_featured|escape}</option>
									<option value="unset_featured">{$btr->categories_unmark_featured|escape}</option>
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
			<h5 class="card-title ms-1 my-3">{$btr->categories_no|escape}</h5>
		{/if}
	</div>
</div>

<script>
	$(document).on("click", ".js-ajax-toggle", function() {
		elem = $(this);
		var el = document.querySelectorAll("div.sortable , .js-ajax-categories.sortable");
		for (i = 0; i < el.length; i++) {
			var sortable = Sortable.create(el[i], {
				handle: ".move-zone",
				sort: true,
				animation: 150,
				scroll: true,
				ghostClass: "sortable-ghost",
				chosenClass: "sortable-chosen",
				dragClass: "sortable-drag",
				scrollSensitivity: 30,
				scrollSpeed: 10,
			});
		}
		elem.closest(".js-row").children(".js-ajax-categories").slideToggle(500);
		elem.closest(".js-row").children(".js-ajax-categories").addClass("sortable");
		elem.find("i").toggleClass("minus-category");
	});
</script>