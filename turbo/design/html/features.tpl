{$meta_title=$btr->features_features scope=global}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-3">
				{$btr->features_features|escape}
			</h1>
			<div class="d-grid d-sm-block mt-2 mt-md-0">
				<a class="btn btn-primary" href="{url module=FeatureAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->features_add|escape}</a>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-xs-12 float-sm-end">
		<form class="search mb-3" method="get">
			<input type="hidden" name="module" value="FeaturesAdmin">
			<div class="input-group">
				<input name="keyword" class="form-control" placeholder="{$btr->features_search|escape}" type="text" value="{if isset($keyword)}{$keyword|escape}{/if}">
				<button class="btn btn-primary" type="submit"><i class="align-middle mt-n1" data-feather="search"></i></button>
			</div>
		</form>
	</div>
</div>

<div class="card">
	<div class="card-header d-block d-lg-none">
		<div class="card-actions float-end">
			<div class="position-relative collapse-icon">
				<a href="javascript:;" class="collapse-chevron">
					<i class="align-middle" data-feather="chevron-down"></i>
				</a>
			</div>
		</div>
		<h5 class="card-title mb-0">{$btr->global_filter|escape}</h5>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="collapse-card boxed-sorting">
					<div class="row">
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3">
							<select id="id_categories" name="categories_filter" title="{$btr->global_category_filter|escape}" class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url keyword=null brand_id=null page=null limit=null category_id=null}" {if !isset($category)}selected{/if}>{$btr->global_all_categories|escape}</option>
								{function name=category_select level=0}
									{foreach $categories as $c}
										<option value="{url category_id=$c->id}" {if isset($category) && $category->id == $c->id}selected{/if}>
											{section sp $level}--{/section} {$c->name|escape}
										</option>
										{if isset($c->subcategories)}
											{category_select categories=$c->subcategories level=$level+1}
										{/if}
									{/foreach}
								{/function}
								{category_select categories=$categories}
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		{if $features}
			<form method="post" class="js-form-list">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="turbo-list ">
					<div class="turbo-list-head">
						<div class="turbo-list-heading turbo-list-drag"></div>
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-features-name">{$btr->global_title|escape}</div>
						<div class="turbo-list-heading turbo-list-url-status">{$btr->feature_url_in_product_short|escape}</div>
						<div class="turbo-list-heading turbo-list-status">{$btr->feature_filter|escape}</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="turbo-list-body features-wrap sortable">
						{foreach $features as $feature}
							<div class="js-row turbo-list-body-item js-sort-item body-narrow">
								<div class="turbo-list-row narrow">
									<input type="hidden" name="positions[{$feature->id}]" value="{$feature->position}">
									<div class="turbo-list-boding turbo-list-drag move-zone">
										<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
									</div>
									<div class="turbo-list-boding turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$feature->id}">
										</label>
									</div>
									<div class="turbo-list-boding turbo-list-features-name">
										<a href="{url module=FeatureAdmin id=$feature->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">
											{$feature->name|escape}
										</a>
									</div>
									<div class="turbo-list-boding turbo-list-url-status">
										<div class="form-check form-switch">
											<input class="form-check-input js-ajax-action {if $feature->url_in_product}js-active-class{/if}" id="id-{$feature->id}" data-module="feature" data-action="url_in_product" data-id="{$feature->id}" name="url_in_product" value="1" type="checkbox" {if $feature->url_in_product}checked="" {/if}>
											<label class="form-check-label" for="id-{$feature->id}"></label>
										</div>
									</div>
									<div class="turbo-list-boding turbo-list-status">
										<div class="form-check form-switch">
											<input class="form-check-input js-ajax-action {if $feature->in_filter}js-active-class{/if}" id="id-{$feature->id}" data-module="feature" data-action="in_filter" data-id="{$feature->id}" name="in_filter" value="1" type="checkbox" {if $feature->in_filter}checked="" {/if}>
											<label class="form-check-label" for="id-{$feature->id}"></label>
										</div>
									</div>
									<div class="turbo-list-boding turbo-list-delete">
										<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->features_delete|escape}">
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
							<div class="turbo-list-heading turbo-list-drag"></div>
							<div class="turbo-list-heading turbo-list-check">
								<label class="form-check">
									<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
								</label>
							</div>
							<div class="turbo-list-option">
								<select name="action" class="selectpicker">
									<option value="set_in_filter">{$btr->features_in_filter|escape}</option>
									<option value="unset_in_filter">{$btr->features_not_in_filter|escape}</option>
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
			<div class="row">
				<div class="col-12">
					{include file='pagination.tpl'}
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->features_no|escape}</h5>
		{/if}
	</div>
</div>