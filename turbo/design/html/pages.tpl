{$meta_title = {$menu->name} scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$menu->name}</h1>
	<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
		<a class="btn btn-primary" href="{url module=PageAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->pages_add|escape}</a>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $pages}
			<form method="post" class="js-form-list">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="turbo-list ">
					<div class="turbo-list-head">
						<div class="turbo-list-heading turbo-list-subicon"></div>
						<div class="turbo-list-heading turbo-list-drag"></div>
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-categories-name">{$btr->pages_name|escape}</div>
						<div class="turbo-list-heading turbo-list-photo hidden-sm-down"></div>
						<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
						<div class="turbo-list-heading turbo-list-setting">{$btr->global_activities|escape}</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="turbo-list-body categories-wrap sortable">
						{function name=pages_tree level=1}
							{if $pages}
								{foreach $pages as $page}
									{if $level > 1}
										<div class="js-row row-narrow">
										{/if}
										<div class="js-row {if $level == 1}turbo-list-body-item{/if} js-sort-item body-narrow row-narrow">
											<div class="turbo-list-row {if $level > 1}js-sort-item{/if} narrow">
												<input type="hidden" name="positions[{$page->id}]" value="{$page->position}">
												{if $page->subpages}
													<div class="turbo-list-heading turbo-list-subicon">
														<a href="javascript:;" class="js-ajax-toggle" data-toggle="0" data-category_id="{$page->id}">
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
														<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$page->id}">
													</label>
												</div>
												<div class="turbo-list-boding turbo-list-categories-name">
													<a href="{url module=PageAdmin id=$page->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">
														{$page->name|escape}
													</a>
												</div>
												<div class="turbo-list-boding turbo-list-photo hidden-sm-down"></div>
												<div class="turbo-list-boding turbo-list-status">
													<div class="form-check form-switch">
														<input class="form-check-input js-ajax-action {if $page->visible}js-active-class{/if}" id="id_{$page->id}" data-module="page" data-action="visible" data-id="{$page->id}" name="visible" value="1" type="checkbox" {if $page->visible}checked="" {/if}>
														<label class="form-check-label" for="id_{$page->id}"></label>
													</div>
												</div>
												<div class="turbo-list-setting">
													<a href="/{$lang_link}{$page->url}" target="_blank" class="setting-icon setting-icon-open" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_view|escape}">
														<i class="align-middle" data-feather="external-link"></i>
													</a>
												</div>
												<div class="turbo-list-boding turbo-list-delete">
													<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->pages_delete|escape}">
														<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
															<i class="align-middle" data-feather="trash-2"></i>
														</button>
													</div>
												</div>
											</div>
											{if $page->subpages}
												<div class="js-ajax-categories categories-sub-block subcategories-level-{$level} sortable" style="display: none;">
													{pages_tree pages=$page->subpages level=$level+1}
												</div>
											{/if}
										</div>
										{if $level > 1}
										</div>
									{/if}
								{/foreach}
							{/if}
						{/function}
						{pages_tree pages=$pages}
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
			<h5 class="card-title ms-1 my-3">{$btr->pages_no|escape}</h5>
		{/if}
	</div>
</div>
<script>
	$(document).on("click", ".js-ajax-toggle", function() {
		elem = $(this);
		var el = document.querySelectorAll("div.sortable , .js-ajax-categories.sortable");
		for (i = 0; i < el.length; i++) {
			var sortable = Sortable.create(el[i], {
				handle: ".move-zone", // Drag handle selector within list items
				sort: true, // sorting inside list
				animation: 150, // ms, animation speed moving items when sorting, `0` — without animation
				scroll: true, // or HTMLElement
				ghostClass: "sortable-ghost", // Class name for the drop placeholder
				chosenClass: "sortable-chosen", // Class name for the chosen item
				dragClass: "sortable-drag", // Class name for the dragging item
				scrollSensitivity: 30, // px, how near the mouse must be to an edge to start scrolling.
				scrollSpeed: 10, // px
			});
		}
		elem.closest(".js-row").children(".js-ajax-categories").slideToggle(500);
		elem.find("i").toggleClass("minus-category");
	});
</script>