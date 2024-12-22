{if $banner->id}
	{$meta_title = $banner->name scope=global}
{else}
	{$meta_title = $btr->banner_new_group scope=global}
{/if}

<h1 class="mb-3">
	{if !$banner->id}
		{$btr->banners_add|escape}
	{else}
		{$banner->name|escape}
	{/if}
</h1>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'added'}
						{$btr->global_group_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->banner_updated|escape}
					{/if}
					{if $smarty.get.return}
						<a class="alert-link fw-normal btn-return text-decoration-none me-5" href="{$smarty.get.return}">
							<i class="align-middle mt-n1" data-feather="corner-up-left"></i>
							{$btr->global_back|escape}
						</a>
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'group_id_exists'}
						{$btr->banner_id_exists|escape}
					{elseif $message_error == 'empty_group_id'}
						{$btr->banner_enter_id|escape}
					{else}
						{$message_error|escape}
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
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_title|escape}</div>
								<input class="form-control mb-h" name="name" type="text" value="{$banner->name|escape}">
								<input name="id" type="hidden" value="{$banner->id|escape}">
							</div>
							<div class="row">
								<div class="col-lg-2 col-sm-12">
									<div class="mt-2 mb-3">
										<div class="input-group">
											<span class="input-group-text">ID</span>
											<input name="group_id" class="form-control" type="text" value="{$banner->group_id|escape}">
										</div>
									</div>
								</div>
								<div class="col-lg-10 col-sm-12">
									<div class="d-flex justify-content-center align-content-start flex-wrap flex-md-column h-100">
										<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
											<input class="form-check-input ms-2" type="checkbox" id="show-all-pages" name="show_all_pages" value="1" type="checkbox" {if $banner->show_all_pages}checked=""{/if}>
											<label class="form-check-label ms-2" for="show-all-pages">{$btr->banner_show_group|escape}</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="visible" name="visible" value="1" type="checkbox" {if $banner->visible}checked=""{/if}>
									<label class="form-check-label ms-2" for="visible">{$btr->global_enable|escape}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->banner_show_banner|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row mb-1">
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<label class="form-label">{$btr->global_pages|escape}</label>
									<select name="pages[]" class="js-action-select selectpicker d-none" multiple="multiple" data-live-search="true" data-size="10" data-selected-text-format="count">
										<option value="0" {if !isset($banner->page_selected) || 0|in_array:$banner->page_selected}selected{/if}>{$btr->banner_hide|escape}</option>
										{function name=page_select level=0 selected=null}
											{foreach from=$pages item=page}
												<option value="{$page->id}" {if $selected && $page->id|in_array:$selected}selected{/if}>{section name=sp loop=$level}--{/section}{$page->header|escape}</option>
												{if isset($page->subpages)}
													{page_select pages=$page->subpages selected=$selected level=$level+1}
												{/if}
											{/foreach}
										{/function}
										{page_select pages=$pages selected=$banner->page_selected ?? null}
									</select>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<label class="form-label">{$btr->global_categories|escape}</label>
									<select name="categories[]" class="js-action-select selectpicker d-none" multiple="multiple" data-live-search="true" data-size="10" data-selected-text-format="count">
										<option value="0" {if !isset($banner->category_selected) || 0|in_array:$banner->category_selected}selected{/if}>{$btr->banner_hide|escape}</option>
										{function name=category_select level=0 selected=null}
											{foreach from=$categories item=category}
												<option value="{$category->id}" {if $selected && $category->id|in_array:$selected}selected{/if}>{section name=sp loop=$level}--{/section}{$category->name|escape}</option>
												{if $category->subcategories}
													{category_select categories=$category->subcategories selected=$selected level=$level+1}
												{/if}
											{/foreach}
										{/function}
										{category_select categories=$categories selected=$banner->category_selected ?? null}
									</select>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<label class="form-label">{$btr->global_brands|escape}</label>
									<select name="brands[]" class="js-action-select selectpicker d-none" multiple="multiple" data-live-search="true" data-size="10" data-selected-text-format="count">
										<option value="0" {if !isset($banner->brand_selected) || 0|in_array:$banner->brand_selected}selected{/if}>{$btr->banner_hide|escape}</option>
										{foreach from=$brands item=brand}
											<option value="{$brand->id}" {if isset($banner->brand_selected) && $brand->id|in_array:$banner->brand_selected}selected{/if}>{$brand->name|escape}</option>
										{/foreach}
									</select>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="mb-3">
									<label class="form-label">{$btr->article_categories|escape}</label>
									<select name="articles_categories[]" class="js-action-select selectpicker d-none" multiple="multiple" data-live-search="true" data-size="10" data-selected-text-format="count">
										<option value="0" {if !isset($banner->articles_category_selected) || 0|in_array:$banner->articles_category_selected}selected{/if}>{$btr->banner_hide|escape}</option>
										{function name=articles_category_selected level=0 selected=null}
											{foreach from=$articles_categories item=articles_category}
												<option value="{$articles_category->id}" {if $selected && $articles_category->id|in_array:$selected}selected{/if}>{section name=sp loop=$level}&nbsp;{/section}{$articles_category->name|escape}</option>
												{if $articles_category->subcategories}
													{articles_category_selected articles_categories=$articles_category->subcategories selected=$banner->articles_category_selected level=$level+1}
												{/if}
											{/foreach}
										{/function}
										{articles_category_selected articles_categories=$articles_categories selected=$banner->articles_category_selected ?? null}
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="d-grid d-sm-block mt-2">
				<button type="submit" class="btn btn-primary float-end">
					<i class="align-middle" data-feather="check"></i>
					{$btr->global_apply|escape}
				</button>
			</div>
		</div>
	</div>
</form>

{literal}
	<script>
		$(window).on("load", function() {
			$('.js-action-select').removeClass('d-none');
		});
	</script>
{/literal}