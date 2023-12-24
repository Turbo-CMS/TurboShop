{if isset($category)}
	{$meta_title=$category->name scope=global}
{else}
	{$meta_title=$btr->global_products scope=global}
{/if}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-3">
				{if $products_count}
					{if isset($category->name) || isset($brand->name)}
						{if isset($category)}{$category->name|escape}{/if} {if isset($brand)}{$brand->name|escape}{/if} - {$products_count}
					{elseif isset($keyword)}
						{$btr->global_products|escape} - {$products_count}
					{else}
						{$btr->global_products|escape} - {$products_count}
					{/if}
				{else}
					{$btr->products_no|escape}
				{/if}
			</h1>
			<div class="d-grid d-sm-block mt-2 mt-md-0">
				<a class="btn btn-primary" href="{url module=ProductAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->products_add|escape}</a>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-xs-12 float-sm-end">
		<form class="search mb-3" method="get">
			<input type="hidden" name="module" value="ProductsAdmin">
			<div class="input-group">
				<input name="keyword" class="form-control" placeholder="{$btr->global_search|escape}" type="text" value="{if isset($keyword)}{$keyword|escape}{/if}">
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
			<div class="col-12">
				<div class="collapse-card boxed-sorting">
					<div class="row">
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3">
							<select id="id-filter" name="products_filter" class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url brand_id=null category_id=null keyword=null page=null limit=null filter=null}" {if !isset($filter)}selected{/if}>{$btr->global_all_products|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='featured'}" {if isset($filter) && $filter == 'featured'}selected{/if}>{$btr->products_bestsellers|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='new'}" {if isset($filter) && $filter == 'new'}selected{/if}>{$btr->global_new|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='hit'}" {if isset($filter) && $filter == 'hit'}selected{/if}>{$btr->global_hit|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='discounted'}" {if isset($filter) && $filter == 'discounted'}selected{/if}>{$btr->products_discount|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='to_export'}" {if isset($filter) && $filter == 'to_export'}selected{/if}>{$btr->global_add_xml_short|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='visible'}" {if isset($filter) && $filter == 'visible'}selected{/if}>{$btr->products_enable|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='hidden'}" {if isset($filter) && $filter == 'hidden'}selected{/if}>{$btr->products_disable|escape}</option>
								<option value="{url keyword=null brand_id=null category_id=null page=null limit=null filter='outofstock'}" {if isset($filter) && $filter == 'outofstock'}selected{/if}>{$btr->products_out_of_stock|escape}</option>
							</select>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3">
							<select id="id-categories" name="categories_filter" title="{$btr->global_category_filter|escape}" class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url keyword=null brand_id=null page=null limit=null category_id=null}" {if !isset($category)}selected{/if}>{$btr->global_all_categories|escape}</option>
								{function name=category_select level=0}
									{foreach $categories as $c}
										<option value='{url keyword=null brand_id=null page=null limit=null category_id=$c->id}' {if isset($category) && $category->id == $c->id}selected{/if}>
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
						<div class="col-md-3 col-lg-3 col-sm-12 mb-3">
							<select id="id-brands" name="brands_filter" title="{$btr->global_brand_filter|escape}" class="selectpicker" data-live-search="true" data-size="10" onchange="location = this.value;">
								<option value="{url keyword=null brand_id=null page=null limit=null category_id=null}" {if !isset($brand)}selected{/if}>{$btr->global_all_brands|escape}</option>
								{foreach $brands as $b}
									<option value="{url keyword=null page=null limit=null brand_id=$b->id}" brand_id="{$b->id}" {if isset($brand) && $brand->id == $b->id}selected{/if}>{$b->name}</option>
								{/foreach}
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		{if $products}
			<div class="row">
				<div class="col-12">
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
								<div class="turbo-list-heading turbo-list-name">{$btr->global_title|escape}</div>
								<div class="turbo-list-heading turbo-list-price">{$btr->global_price|escape}</div>
								<div class="turbo-list-heading turbo-list-count">{$btr->global_qty|escape}</div>
								<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
								<div class="turbo-list-heading turbo-list-setting turbo-list-products-setting">{$btr->global_activities|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body sortable">
								{foreach $products as $product}
									<div class="js-row turbo-list-body-item">
										<div class="turbo-list-row">
											<input type="hidden" name="positions[{$product->id}]" value="{$product->position}">
											<div class="turbo-list-boding turbo-list-drag move-zone">
												<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
											</div>
											<div class="turbo-list-boding turbo-list-check form-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$product->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-photo">
												{$image = $product->images|@first}
												{if $image}
													<a href="{url module=ProductAdmin id=$product->id return=$smarty.server.REQUEST_URI}">
														<img src="{$image->filename|escape|resize:45:45}" alt="{$product->name|escape}"></a>
												{else}
													<a href="{url module=ProductAdmin id=$product->id return=$smarty.server.REQUEST_URI}">
														<i class="align-middle" data-feather="camera"></i>
													</a>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-name">
												<a class="fw-bold text-body text-decoration-none" href="{url module=ProductAdmin id=$product->id return=$smarty.server.REQUEST_URI}">
													{$product->name|escape}
													{if $product->variants[0]->name || $product->variants[0]->color}
														<span class="text-secondary">({$product->variants[0]->name|escape}{if $product->variants[0]->color} {$product->variants[0]->color|escape}{/if})</span>
													{/if}
												</a>
												<div class="d-block d-lg-none mt-1">
													<span class="text-primary fw-bold">
														{$product->variants[0]->oprice}
														{if isset($currencies[$product->variants[0]->currency_id])}
															{$currencies[$product->variants[0]->currency_id]->code|escape}
														{/if}
													</span>
													<span class="fw-bold">{if $product->variants[0]->infinity}∞{else}{$product->variants[0]->stock}{/if} {$settings->units|escape}</span>
												</div>
												<div class="turbo-list-name-brand text-muted">{if $product->brand}{$btr->global_brand|escape}{/if} {$product->brand}</div>
												{if $product->variants|count > 1}
													<div class="js-variants-toggle variants-toggle">
														{$btr->global_options|escape}
														<span class="js-icon-arrow">
															<i class="align-middle" data-feather="chevron-down"></i>
														</span>
													</div>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-price">
												<div class="input-group">
													<input class="form-control {if $product->variants[0]->compare_price > 0}text-danger{/if}" type="text" name="price[{$product->variants[0]->id}]" value="{$product->variants[0]->oprice}">
													<span class="input-group-text">
														{if isset($currencies[$product->variants[0]->currency_id])}
															{$currencies[$product->variants[0]->currency_id]->sign|escape}
														{else}
															{$currency->sign}
														{/if}
													</span>
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-count">
												<div class="input-group">
													<input class="form-control" type="text" name="stock[{$product->variants[0]->id}]" value="{if $product->variants[0]->infinity}∞{else}{$product->variants[0]->stock}{/if}">
													<span class="input-group-text">{$settings->units|escape}</span>
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-status">
												<div class="form-check form-switch">
													<input class="form-check-input js-ajax-action {if $product->visible}js-active-class{/if}" id="id-{$product->id}" data-module="product" data-action="visible" data-id="{$product->id}" name="visible" value="1" type="checkbox" {if $product->visible}checked="" {/if}>
													<label class="form-check-label" for="id-{$product->id}"></label>
												</div>
											</div>
											<div class=" turbo-list-setting turbo-list-products-setting">
												<a href="../{$lang_link}products/{$product->url|escape}" target="_blank" class="setting-icon setting-icon-open" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_view|escape}">
													<i class="align-middle" data-feather="external-link"></i>
												</a>
												<button type="button" class="setting-icon setting-icon-featured js-ajax-action {if $product->featured}js-active-class{/if}" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_bestseller|escape}" data-module="product" data-action="featured" data-id="{$product->id}">
													<i class="align-middle" data-feather="star"></i>
												</button>
												<button type="button" class="setting-icon setting-icon-new js-ajax-action {if $product->is_new}js-active-class{/if}" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_new|escape}" data-module="product" data-action="is_new" data-id="{$product->id}">
													<i class="align-middle" data-feather="calendar"></i>
												</button>
												<button type="button" class="setting-icon setting-icon-export js-ajax-action {if $product->to_export}js-active-class{/if}" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_add_xml|escape}" data-module="product" data-action="to_export" data-id="{$product->id}">
													<i class="align-middle" data-feather="file"></i>
												</button>
												<button type="button" class="setting-icon setting-icon-hit js-ajax-action {if $product->is_hit}js-active-class{/if}" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_hit|escape}" data-module="product" data-action="is_hit" data-id="{$product->id}">
													<i class="align-middle" data-feather="award"></i>
												</button>
												<button type="button" class="setting-icon setting-icon-copy js-copy" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->products_dublicate|escape}">
													<i class="align-middle" data-feather="copy"></i>
												</button>
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
													<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
														<i class="align-middle" data-feather="trash-2"></i>
													</button>
												</div>
											</div>
										</div>
										{if $product->variants|count > 1}
											<div class="turbo-list-variants products-variants-block">
												{foreach $product->variants as $variant}
													{if $variant@iteration > 1}
														<div class="turbo-list-row products">
															<div class="turbo-list-boding turbo-list-drag"></div>
															<div class="turbo-list-boding turbo-list-check"></div>
															<div class="turbo-list-boding turbo-list-photo"></div>
															<div class="turbo-list-boding turbo-list-variant-name">
																<span class="text-secondary fw-bold">{$variant->name|escape}{if $variant->color} / {$variant->color|escape}{/if}</span>
															</div>
															<div class="turbo-list-boding turbo-list-price">
																<div class="input-group">
																	<input class="form-control {if $product->variants[0]->compare_price > 0}text-danger{/if}" type="text" name="price[{$variant->id}]" value="{$variant->oprice}">
																	<span class="input-group-text">
																		{if isset($currencies[$variant->currency_id])}
																			{$currencies[$variant->currency_id]->sign|escape}
																		{else}
																			{$currency->sign}
																		{/if}
																	</span>
																</div>
															</div>
															<div class="turbo-list-boding turbo-list-count">
																<div class="input-group">
																	<input class="form-control" type="text" name="stock[{$variant->id}]" value="{if $variant->infinity}∞{else}{$variant->stock}{/if}">
																	<span class="input-group-text">
																		{$settings->units|escape}
																	</span>
																</div>
															</div>
															<div class="turbo-list-boding turbo-list-status"></div>
															<div class="turbo-list-boding turbo-list-delete"></div>
														</div>
													{/if}
												{/foreach}
											</div>
										{/if}
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
										<select name="action" class="selectpicker products-action">
											<option value="enable">{$btr->global_do_enable|escape}</option>
											<option value="disable">{$btr->global_do_disable|escape}</option>
											<option value="set_featured">{$btr->products_mark_bestseller|escape}</option>
											<option value="unset_featured">{$btr->products_unmark_bestseller|escape}</option>
											<option value="set_is_new">{$btr->products_mark_new|escape}</option>
											<option value="unset_is_new">{$btr->products_unmark_new|escape}</option>
											<option value="set_is_hit">{$btr->products_mark_hit|escape}</option>
											<option value="unset_is_hit">{$btr->products_unmark_hit|escape}</option>
											<option value="set_export">{$btr->global_add_xml_short|escape}</option>
											<option value="unset_export">{$btr->global_from_xml_short|escape}</option>
											<option value="duplicate">{$btr->products_create_dublicate|escape}</option>
											{if $pages_count>1}
												<option value="move_to_page">{$btr->products_move_to_page|escape}</option>
											{/if}
											{if $categories|count>1}
												<option value="move_to_category">{$btr->products_move_to_category|escape}</option>
											{/if}
											{if $brands|count>0}
												<option value="move_to_brand">{$btr->products_specify_brand|escape}</option>
											{/if}
											<option value="change_price">{$btr->products_change_price|escape}</option>
											<option value="delete">{$btr->global_delete|escape}</option>
										</select>
									</div>
									<div id="move_to_page" class="row row-cols-md-auto align-items-center ms-3 d-none js-hide-block">
										<div class="col-12">
											<select name="target_page" class="selectpicker">
												{section target_page $pages_count}
													<option value="{$smarty.section.target_page.index+1}">{$smarty.section.target_page.index+1}</option>
												{/section}
											</select>
										</div>
									</div>
									<div id="move_to_category" class="row row-cols-md-auto align-items-center ms-3 d-none js-hide-block">
										<div class="col-12">
											<select name="target_category" class="selectpicker" data-live-search="true" data-size="5">
												{function name=category_select_btn level=0}
													{foreach $categories as $category}
														<option value="{$category->id}">{section sp $level}--{/section} {$category->name|escape}</option>
														{if isset($category->subcategories)}
															{category_select_btn categories=$category->subcategories level=$level+1}
														{/if}
													{/foreach}
												{/function}
												{category_select_btn categories=$categories}
											</select>
										</div>
									</div>
									<div id="move_to_brand" class="row row-cols-md-auto align-items-center ms-3 d-none js-hide-block">
										<div class="col-12">
											<select name="target_brand" class="selectpicker" data-live-search="true" data-size="5">
												<option value="0">{$btr->global_not_set|escape}</option>
												{foreach $all_brands as $b}
													<option value="{$b->id}">{$b->name|escape}</option>
												{/foreach}
											</select>
										</div>
									</div>
									<div id="change_price" class="row row-cols-md-auto align-items-center ms-3 d-none js-hide-block">
										<div class="col-md-5 col-lg-5 ps-0 ps-xl-1">
											<select name="op_type" class="selectpicker">
												<option value="0">{$btr->products_add_subtract|escape}</option>
												<option value="1">{$btr->products_percent|escape}</option>
											</select>
										</div>
										<div class="col-md-5 col-lg-5 ps-0 ps-xl-2">
											<input type="text" name="value" class="form-control" placeholder="{$btr->enter_numeric_value|escape}">
										</div>
										<div class="col-md-2 col-lg-2 ps-0 ps-xl-2">
											<div class="form-check mb-1 mt-1 me-sm-2" data-bs-toggle="tooltip" data-bs-placement="right" title="{$btr->save_old_price|escape}">
												<input class="form-check-input js-check-all-single" type="checkbox" checked="checked" name="save_old" value="1">
												<label class="form-check-label"></label>
											</div>
										</div>
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
			<h5 class="card-title ms-1 my-3">{$btr->products_no|escape}</h5>
		{/if}
	</div>
</div>

{literal}
	<script>
		$(function() {
			$(document).on('click', '.js-variants-toggle', function() {
				$(this).find('.js-icon-arrow').toggleClass('rotate-180');
				$(this).parents('.js-row').find('.products-variants-block').slideToggle();
			});

			$(document).on('change', '.js-action-block select.products-action', function() {
				var elem = $(this).find('option:selected').val();
				$('.js-hide-block').addClass('d-none');
				if ($('#' + elem).size() > 0) {
					$('#' + elem).removeClass('d-none');
				}
			});

			$(document).on("click", ".js-copy", function() {
				$('.js-form-list input[type="checkbox"][name*="check"]').attr('checked', false);
				$(this).closest(".js-form-list").find('select[name="action"] option[value=duplicate]').attr('selected', true);
				$(this).closest(".js-row").find('input[type="checkbox"][name*="check"]').attr('checked', true);
				$(this).closest(".js-row").find('input[type="checkbox"][name*="check"]').click();
				$(this).closest(".js-form-list").submit();
			});

			$("input[name*=stock]").focus(function() {
				if ($(this).val() == '∞')
					$(this).val('');
				return false;
			});

			$("input[name*=stock]").blur(function() {
				if ($(this).val() == '')
					$(this).val('∞');
			});
		});
	</script>
{/literal}