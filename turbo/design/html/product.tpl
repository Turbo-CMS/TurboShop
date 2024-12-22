{if $product->id}
	{$meta_title = $product->name scope=global}
{else}
	{$meta_title = $btr->product_new scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if !$product->id}
			{$btr->product_add|escape}
		{else}
			{$product->name|escape}
		{/if}
	</h1>
	{if $product->id}
		<div class="d-grid d-sm-block mt-2 mt-md-0">
			<a class="btn btn-primary" target="_blank" href="../{$lang_link}products/{$product->url}">
				<i class="align-middle mt-n1" data-feather="external-link"></i>
				{$btr->global_open|escape}
			</a>
		</div>
	{/if}
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success=='added'}
						{$btr->product_added|escape}
					{elseif $message_success=='updated'}
						{$btr->product_updated|escape}
					{else}
						{$message_success|escape}
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
					{if $message_error=='url_exists'}
						{$btr->product_exists|escape}
					{elseif $message_error=='empty_name'}
						{$btr->global_enter_name|escape}
					{elseif $message_error == 'empty_url'}
						{$btr->global_enter_url|escape}
					{elseif $message_error == 'url_wrong'}
						{$btr->global_not_underscore|escape}
					{elseif $message_error == 'empty_categories'}
						{$btr->product_no_category|escape}
					{elseif $message_error == 'invalid_file'}
						{$btr->global_invalid_file_type|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" id="product" enctype="multipart/form-data" class="js-fast-button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<input type="hidden" name="lang_id" value="{$lang_id}">
	<div class="row g-2">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-9 col-md-8 col-sm-12">
							<div class="translate-container mb-3">
								<div class="form-label">{$btr->global_title|escape} <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
								<input class="form-control translate-input" name="name" type="text" value="{$product->name|escape}">
								<input name="id" type="hidden" value="{$product->id|escape}">
							</div>
							<div class="row">
								<div class="col-xs-12 col-lg-8 col-md-12">
									<div class="mb-3">
										<div class="input-group">
											<span class="input-group-text">URL</span>
											<input name="url" class="js-meta-field form-control js-url" type="text" value="{$product->url|escape}" {if $product->id}readonly{/if}>
											<input type="checkbox" id="block-translit" class="d-none" value="1" {if $product->id}checked=""{/if}>
											<span class="input-group-text js-disable-url">
												{if $product->id}
													<i class="url-lock"></i>
												{else}
													<i class="url-lock url-unlock"></i>
												{/if}
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="visible" name="visible" value="1" type="checkbox" {if $product->visible}checked=""{/if}>
									<label class="form-check-label ms-2" for="visible">{$btr->global_enable|escape}</label>
								</div>
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="featured" name="featured" value="1" type="checkbox" {if $product->featured}checked=""{/if}>
									<label class="form-check-label ms-2" for="featured">{$btr->global_bestseller|escape}</label>
								</div>
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="new" name="is_new" value="1" type="checkbox" {if $product->is_new}checked=""{/if}>
									<label class="form-check-label ms-2" for="new">{$btr->global_new|escape}</label>
								</div>
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="hit" name="is_hit" value="1" type="checkbox" {if $product->is_hit}checked=""{/if}>
									<label class="form-check-label ms-2" for="hit">{$btr->global_hit|escape}</label>
								</div>
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="export" name="to_xml" value="1" type="checkbox" {if $product->to_xml}checked=""{/if}>
									<label class="form-check-label ms-2" for="export">{$btr->feature_xml|escape}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row gx-2">
		<div class="col-lg-8 col-md-12">
			<div class="card mh-315px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->product_images|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-12 mb-1">
								<ul class="js-droplist-wrap product-images-list sortable" data-image="product">
									<li class="js-dropzone dropzone-block">
										<i class="align-middle" data-feather="plus"></i>
										<input type="file" name="dropped_images[]" multiple class="dropinput">
									</li>
									{foreach $product_images as $image}
										<li class="product-image-item {if $image@first}first-image{/if} {if $image@iteration > 4}js-toggle-hidden d-none{/if} js-sort-item">
											<button type="button" class="js-remove-image remove-image"></button>
											<i class="move-zone">
												{if $image}
													<img class="product-icon" src="{$image->filename|resize:200:100}" alt="">
												{else}
													<i class="align-middle" data-feather="camera"></i>
												{/if}
												<input type="hidden" name='images[]' value="{$image->id}">
											</i>
										</li>
									{/foreach}
									<li class="js-new-image-item product-image-item js-sort-item d-none">
										<button type="button" class="js-remove-image remove-image"></button>
										<img src="" alt="">
										<input type="hidden" name='images_urls[]' value="">
									</li>
								</ul>
							</div>
							{if $product_images|count > 4}
								<div class="col-12">
									<a href="javascript:;" class="js-icon-arrow card-link js-show-images text-body">{$btr->product_images_all|escape}<i class="align-middle chevron" data-feather="chevron-down"></i></a>
								</div>
							{/if}
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-12">
			<div class="card mh-315px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_additional_settings|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="mb-3">
							<div class="form-label">{$btr->product_sale_to|escape}</div>
							<input id="sale-to" name="sale_to" class="form-control flatpickr-datetime" type="text" value="{$product->sale_to}">
						</div>
						<div class="mb-3" {if !$brands}style="display:none;"{/if}>
							<div class="form-label">{$btr->global_brand|escape}</div>
							<select name="brand_id" class="selectpicker mb-1 js-meta-brand" data-live-search="true">
								<option value="0" {if !$product->brand_id}selected=""{/if}>{$btr->global_not_set|escape}</option>
								{foreach $brands as $brand}
									<option value="{$brand->id}" {if $product->brand_id == $brand->id}selected=""{/if} data-brand-name="{$brand->name|escape}">{$brand->name|escape}</option>
								{/foreach}
							</select>
						</div>
						<div class="mb-0" {if !$categories}style="display:none;"{/if}>
							<div class="form-label">{$btr->global_category|escape}</div>
							<fieldset class="form-group">
								<div id="product-categories">
									<div class="product-cats" id="product-cats">
										{foreach $product_categories as $product_category name=categories}
											<div class="list">
												<div class="input-group mb-3">
													<select name="categories[]" class="selectpicker select-control js-meta-categories" data-live-search="true">
														{function name=category_select level=0}
															{foreach $categories as $category}
																<option value="{$category->id}" {if isset($selected->id) && $category->id == $selected->id}selected{/if} category-name="{$category->name|escape}">{section name=sp loop=$level}--{/section} {$category->name|escape}</option>
																{if $category->subcategories}
																	{category_select categories=$category->subcategories selected=$selected level=$level+1}
																{/if}
															{/foreach}
														{/function}
														{category_select categories=$categories selected=$product_category}
													</select>
													<button {if not $smarty.foreach.categories.first}style="display:none;" {/if} class="add btn input-group-addon-categories" type="button"><i class="align-middle" data-feather="plus"></i></button>
													<button {if $smarty.foreach.categories.first}style="display:none;" {/if} class="delete btn input-group-addon-categories" type="button"><i class="align-middle" data-feather="minus"></i></button>
												</div>
											</div>
										{/foreach}
									</div>
								</div>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0 translate-button-card">{$btr->global_options|escape} <span role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></h5>
				</div>
				<div class="collapse-card variants-wrapper">
					<div class="card-body">
						<div class="turbo-list variants-list scrollbar-variants">
							<div class="turbo-list-body sortable variants-listadd">
								{foreach $product_variants as $variant}
									<div class="turbo-list-body-item variants-list-item">
										<div class="turbo-list-row {if $variant->attachment || $variant->attachment_url}mb-0{/if}">
											<div class="turbo-list-boding variants-item-drag">
												<div class="form-label"></div>
												<div class="move-zone">
													<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
												</div>
											</div>
											<div class="turbo-list-boding variants-item-sku">
												<div class="form-label">{$btr->global_sku|escape}</div>
												<input class="form-control" name="variants[sku][]" type="text" value="{$variant->sku|escape}">
											</div>
											<div class="turbo-list-boding variants-item-name translate-container">
												<div class="form-label">{$btr->global_title|escape} <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
												<input name="variants[id][]" type="hidden" value="{$variant->id|escape}">
												<input class="form-control translate-input-card translate-input" name="variants[name][]" type="text" value="{$variant->name|escape}">
											</div>
											<div class="turbo-list-boding variants-item-height color-picker">
												<div class="form-label"></div>
												<input name="variants[color_code][]" type="hidden" value="{$variant->color_code|escape}">
												<div class="add-on colorPicker-picker" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->select_color|escape}"></div>
											</div>
											<div class="turbo-list-boding variants-item-color translate-container">
												<div class="form-label">{$btr->global_color|escape} <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
												<input name="variants[color][]" class="form-control translate-input-card translate-input" type="text" value="{$variant->color|escape}">
											</div>
											<div class="turbo-list-boding variants-item-price">
												<div class="form-label">{$btr->global_price|escape}, {if $variant->currency_id && $currencies[$variant->currency_id]}{$currencies[$variant->currency_id]->sign|escape}{else}{$currency->sign}{/if}</div>
												<input class="form-control" name="variants[price][]" type="text" value="{$variant->oprice|escape}">
											</div>
											<div class="turbo-list-boding variants-item-discount">
												<div class="form-label">{$btr->global_old_price|escape}, {if $variant->currency_id && $currencies[$variant->currency_id]}{$currencies[$variant->currency_id]->sign|escape}{else}{$currency->sign}{/if}</div>
												<input class="form-control text-secondary" name="variants[compare_price][]" type="text" value="{$variant->compare_oprice|escape}">
											</div>
											<div class="turbo-list-boding variants-item-currency">
												<div class="form-label">{$btr->global_currency|escape}</div>
												<select name="variants[currency_id][]" class="selectpicker">
													{foreach $currencies as $c}
														<option value="{$c->id}" {if $c->id == $variant->currency_id}selected="" {/if}>{$c->code|escape}</option>
													{/foreach}
												</select>
											</div>
											<div class="turbo-list-boding variants-item-weight">
												<div class="form-label">{$btr->global_weight|escape}, {$settings->weight_units}</div>
												<input class="form-control" name="variants[weight][]" type="text" value="{if $variant->weight}{$variant->weight|escape}{/if}">
											</div>
											<div class="turbo-list-boding variants-item-amount">
												<div class="form-label">{$btr->global_qty|escape}</div>
												<div class="input-group">
													<input class="form-control" name="variants[stock][]" type="text" value="{if $variant->infinity || $variant->stock == ''}∞{else}{$variant->stock|escape}{/if}">
													<span class="input-group-text">
														{$settings->units|escape}
													</span>
												</div>
											</div>
											<div class="turbo-list-boding variants-item-file">
												<div class="form-label"></div>
												<button type="button" class="add-attachment btn-attachment">
													<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_attachment|escape}">
														<i class="align-middle" data-feather="download"></i>
													</span>
												</button>
											</div>
											{if !$variant@first}
												<div class="turbo-list-boding turbo-list-delete remove-variant">
													<div class="form-label"></div>
													<button type="button" class="btn-delete js-remove-variant">
														<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
															<i class="align-middle" data-feather="trash-2"></i>
														</span>
													</button>
												</div>
											{/if}
										</div>
										<div class="turbo-list-row browse-attachment" {if !$variant->attachment && !$variant->attachment_url}style="display:none;"{/if}>
											<div class="turbo-list-boding variants-item-drag"></div>
											<div class="turbo-list-boding attachment-url">
												<div class="form-label mb-1">{$btr->global_file_link|escape}</div>
												<input class="form-control" type="text" name="variants[attachment_url][]" value="{$variant->attachment_url|escape}">
											</div>
											<div class="turbo-list-boding download-attachment" {if $variant->attachment}style="display:none;" {/if}>
												<div for="download-attachment" class="form-label mb-1">{$btr->global_attachment|escape}</div>
												<input class="form-control" type="file" name="attachment[]" id="download-attachment">
											</div>
											{if $variant->attachment}
												<div class="turbo-list-boding">
													<div class="form-label"></div>
													<input type="hidden" name="delete_attachment[]">
													<span class=js-attachment-name>{$variant->attachment|truncate:25:'...':false:true}</span>
													<button type="button" class="btn-delete js-remove-attachment">
														<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
															<i class="align-middle" data-feather="trash-2"></i>
														</span>
													</button>
												</div>
											{/if}
										</div>
									</div>
								{/foreach}
								<div class="turbo-list-body-item variants-list-item js-new-row-variant" style="display:none;">
									<div class="turbo-list-row">
										<div class="turbo-list-boding variants-item-drag">
											<div class="form-label"></div>
											<div class="move-zone">
												<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
											</div>
										</div>
										<div class="turbo-list-boding variants-item-sku">
											<div class="form-label">{$btr->global_sku|escape}</div>
											<input class="form-control" name="variants[sku][]" type="text" value="">
										</div>
										<div class="turbo-list-boding variants-item-name translate-container">
											<div class="form-label">{$btr->global_title|escape} <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
											<input name="variants[id][]" type="hidden" value="">
											<input class="form-control translate-input-card translate-input" name="variants[name][]" type="text" value="">
										</div>
										<div class="turbo-list-boding variants-item-height">
											<div class="form-label"></div>
											<input name="variants[color_code][]" type="hidden" value="">
											<div class="add-on colorPicker-picker" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->select_color|escape}"></div>
										</div>
										<div class="turbo-list-boding variants-item-color translate-container">
											<div class="form-label">{$btr->global_color|escape} <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
											<input name="variants[color][]" class="form-control translate-input-card translate-input" type="text" value="">
										</div>
										<div class="turbo-list-boding variants-item-price">
											<div class="form-label">{$btr->global_price|escape}, {$currency->sign}</div>
											<input class="form-control" name="variants[price][]" type="text" value="">
										</div>
										<div class="turbo-list-boding variants-item-discount">
											<div class="form-label">{$btr->global_old_price|escape}, {$currency->sign}</div>
											<input class="form-control" name="variants[compare_price][]" type="text" value="">
										</div>
										<div class="turbo-list-boding variants-item-currency">
											<div class="form-label">{$btr->global_currency|escape}</div>
											<select name="variants[currency_id][]">
												{foreach $currencies as $c}
													<option value="{$c->id}">{$c->code|escape}</option>
												{/foreach}
											</select>
										</div>
										<div class="turbo-list-boding variants-item-weight">
											<div class="form-label">{$btr->global_weight|escape}, {$settings->weight_units}</div>
											<input class="form-control" name="variants[weight][]" type="text" value="">
										</div>
										<div class="turbo-list-boding variants-item-amount">
											<div class="form-label">{$btr->global_qty|escape}</div>
											<div class="input-group">
												<input class="form-control" name="variants[stock][]" type="text" value="∞">
												<span class="input-group-text">
													{$settings->units|escape}
												</span>
											</div>
										</div>
										<div class="turbo-list-boding variants-item-file">
											<div class="form-label"></div>
											<button type="button" class="add-attachment btn-attachment">
												<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_attachment|escape}">
													<i class="align-middle" data-feather="download"></i>
												</span>
											</button>
										</div>
										<div class="turbo-list-boding turbo-list-delete remove-variant">
											<div class="form-label"></div>
											<button type="button" class="btn-delete js-remove-variant">
												<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
													<i class="align-middle" data-feather="trash-2"></i>
												</span>
											</button>
										</div>
									</div>
									<div class="turbo-list-row browse-attachment" style="display:none;">
										<div class="turbo-list-boding variants-item-drag"></div>
										<div class="turbo-list-boding attachment-url">
											<div class="form-label mb-1">{$btr->global_file_link|escape}</div>
											<input class="form-control" type="text" name="variants[attachment_url][]" value="">
										</div>
										<div class="turbo-list-boding download-attachment">
											<div class="form-label mb-1">{$btr->global_attachment|escape}</div>
											<input class="form-control" type="file" name="attachment[]">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="box_btn_heading mt-3">
							<button type="button" class="btn btn-primary js-add-variant">
								<i class="align-middle" data-feather="plus"></i>
								<span>{$btr->product_add_option|escape}</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row gx-2">
		<div class="col-lg-6 col-md-12">
			<div class="card mh-210px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0 translate-button-card">{$btr->product_features|escape} <span role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></h5>
				</div>
				<div class="collapse-card">
					<div class="card-body features-wrap js-features-wrap">
						{if $features}
							{foreach $features as $feature}
								<div class="js-feature-block-{$feature->id}">
									{assign var="feature_id" value=$feature->id}
									{foreach $options.$feature_id|default:[] as $option}
										<div class="feature-row clearfix">
											<div class="feature-name {if !$option@first}additional-values feature-value-mobile{/if}">
												{if $option@first}
													<div title="{$feature->name|escape}">
														<a href="index.php?module=FeatureAdmin&id={$feature->id}" target="_blank">
															{$feature->name|escape}
														</a>
													</div>
												{/if}
											</div>
											<input {if $lang_id == $first_lang && $option->id}class="js-id-option" {/if} type="hidden" name="options_id[{$feature_id}][]" value="{$option->id}">
											<div class="feature-value {if $feature->is_color}color-picker{/if}">
												<input class="feature-input js-auto-option {if !$option@first}feature-input-single{/if} translate-input-card" data-id="{$feature_id}" data-color="{$feature->is_color}" type="text" name="options_values[{$feature_id}][]" value="{$option->value|escape}">
												{if $feature->is_color}<div class="add-on colorPicker-picker"></div>{/if}
												<button type="button" class="btn {if $option@first}btn-feature {if $feature->is_color}js-add-color{else}js-add{/if} {else}btn-minus-feature js-remove{/if} js-feature-multi-values feature-multi-values">
													<span class="js-plus" {if !$option@first}style="display: none;" {/if}>
														<i class="align-middle" data-feather="plus"></i>
													</span>
													<span class="js-minus" {if $option@first}style="display: none;" {/if}>
														<i class="align-middle" data-feather="minus"></i>
													</span>
												</button>
											</div>
										</div>
									{foreachelse}
										<div class="feature-row clearfix">
											<div class="feature-name">
												<div title="{$feature->name|escape}">
													<a href="index.php?module=FeatureAdmin&id={$feature->id}" target="_blank">
														{$feature->name|escape}
													</a>
												</div>
											</div>
											<input class="js-id-option" type="hidden" name="options_id[{$feature_id}][]" value="">
											<div class="feature-value {if $feature->is_color}color-picker{/if}">
												<input class="feature-input js-auto-option translate-input-card" data-id="{$feature_id}" data-color="{$feature->is_color}" type="text" name="options_values[{$feature_id}][]" value="">
												{if $feature->is_color}<div class="add-on colorPicker-picker"></div>{/if}
												<button type="button" class="btn btn-feature {if $feature->is_color}js-add-color{else}js-add{/if} js-feature-multi-values feature-multi-values">
													<span class="js-plus">
														<i class="align-middle" data-feather="plus"></i>
													</span>
													<span class="js-minus" style="display: none">
														<i class="align-middle" data-feather="minus"></i>
													</span>
												</button>
											</div>
										</div>
									{/foreach}
								</div>
							{/foreach}
						{/if}
						<div class="js-new-feature input-group new-feature-row" style="display:none;">
							<input type="text" class="form-control new-feature-name" name="new_features_names[]" placeholder="{$btr->product_features_enter|escape}">
							<input type="text" class="form-control new-feature-value" name="new_features_values[]" placeholder="{$btr->product_features_value_enter|escape}">
							<button class="btn btn-delete-new-feature js-delete-feature" type="button">
								<i class="align-middle" data-feather="minus"></i>
							</button>
						</div>
						<div class="js-new-feature-category" style="display:none;">
							<div class="feature-row clearfix">
								<div class="feature-name">
									<div title="" class="js-feature-name">
										<a href="" target="_blank"></a>
									</div>
								</div>
								<input class="js-id-option" type="hidden" name="" value="">
								<div class="feature-value">
									<input class="feature-input js-auto-option translate-input-card" data-id="" data-color="" type="text" name="" value="">
									<button type="button" class="btn btn-feature js-add js-feature-multi-values feature-multi-values">
										<span class="js-plus">
											<i class="align-middle" data-feather="plus"></i>
										</span>
										<span class="js-minus" style="display: none">
											<i class="align-middle" data-feather="minus"></i>
										</span>
									</button>
								</div>
							</div>
						</div>
						<div class="js-new-value" style="display:none;">
							<div class="feature-row clearfix">
								<div class="feature-name feature-value-mobile">
									<div title="" class="js-feature-name">
										<a href="" target="_blank"></a>
									</div>
								</div>
								<input class="js-id-option" type="hidden" name="" value="">
								<div class="feature-value">
									<input class="feature-input js-auto-option translate-input-card" data-id="" data-color="" type="text" name="" value="">
									<button type="button" class="btn btn-feature js-add js-feature-multi-values feature-multi-values">
										<span class="js-plus">
											<i class="align-middle" data-feather="plus"></i>
										</span>
										<span class="js-minus" style="display: none">
											<i class="align-middle" data-feather="minus"></i>
										</span>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="card-body mt-nb2">
						<button type="button" class="btn btn-primary js-add-feature">
							<i class="align-middle" data-feather="plus"></i>
							<span>{$btr->product_feature_add|escape}</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="card mh-210px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_related|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="turbo-list turbo-related-list">
							<div class="turbo-list-body related-products sortable">
								{foreach $related_products as $related_product}
									<div class="js-row turbo turbo-list-body-item js-sort-item">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-drag move-zone">
												<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
											</div>
											<div class="turbo-list-boding turbo-list-related-photo">
												<input type="hidden" name="related_products[]" value="{$related_product->id}">
												<a href="{url module=ProductAdmin id=$related_product->id}">
													{if isset($related_product->images[0])}
														<img class="product-icon" src='{$related_product->images[0]->filename|resize:40:40}'>
													{else}
														<i class="align-middle text-muted" data-feather="camera"></i>
													{/if}
												</a>
											</div>
											<div class="turbo-list-boding turbo-list-related-name">
												<a href="{url module=ProductAdmin id=$related_product->id}" class="fw-bold text-body text-decoration-none">{$related_product->name|escape}</a>
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												<button type="button" class="btn-delete js-remove-item">
													<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
														<i class="align-middle" data-feather="trash-2"></i>
													</span>
												</button>
											</div>
										</div>
									</div>
								{/foreach}
								<div id="new-related-product" class="js-row turbo turbo-list-body-item js-sort-item" style="display:none;">
									<div class="turbo-list-row">
										<div class="turbo-list-boding turbo-list-drag move-zone">
											<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
										</div>
										<div class="turbo-list-boding turbo-list-related-photo">
											<input type="hidden" name="related_products[]" value="">
											<img class="product-icon" src="">
										</div>
										<div class="turbo-list-boding turbo-list-related-name">
											<a href="" class="fw-bold text-body text-decoration-none related-product-name"></a>
										</div>
										<div class="turbo-list-boding turbo-list-delete">
											<button type="button" class="btn-delete js-remove-item">
												<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
													<i class="align-middle" data-feather="trash-2"></i>
												</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-label mt-3">{$btr->global_related_add|escape}</div>
						<div class="autocomplete-arrow">
							<input type="text" name="related" id="related-products" class="form-control" placeholder="{$btr->global_add_product|escape}">
						</div>
					</div>
				</div>
			</div>
			<div class="card mh-210px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_recommended|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="turbo-list turbo-recommended-list">
							<div class="turbo-list-body recommended-products sortable">
								{foreach $recommended_products as $recommended_product}
									<div class="js-row turbo turbo-list-body-item js-sort-item">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-drag move-zone">
												<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
											</div>
											<div class="turbo-list-boding turbo-list-recommended-photo">
												<input type="hidden" name="recommended_products[]" value="{$recommended_product->id}">
												<a href="{url module=ProductAdmin id=$recommended_product->id}">
													{if isset($recommended_product->images[0])}
														<img class="product-icon" src="{$recommended_product->images[0]->filename|resize:40:40}">
													{else}
														<i class="align-middle text-secondary" data-feather="camera"></i>
													{/if}
												</a>
											</div>
											<div class="turbo-list-boding turbo-list-recommended-name">
												<a href="{url module=ProductAdmin id=$recommended_product->id}" class="fw-bold text-body text-decoration-none">{$recommended_product->name|escape}</a>
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												<button type="button" class="btn-delete js-remove-item">
													<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
														<i class="align-middle" data-feather="trash-2"></i>
													</span>
												</button>
											</div>
										</div>
									</div>
								{/foreach}
								<div id="new-recommended-product" class="js-row turbo turbo-list-body-item js-sort-item" style="display:none;">
									<div class="turbo-list-row">
										<div class="turbo-list-boding turbo-list-drag move-zone">
											<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
										</div>
										<div class="turbo-list-boding turbo-list-recommended-photo">
											<input type="hidden" name="recommended_products[]" value="">
											<img class="product-icon" src="">
										</div>
										<div class="turbo-list-boding turbo-list-recommended-name">
											<a href="" class="fw-bold text-body text-decoration-none recommended-product-name"></a>
										</div>
										<div class="turbo-list-boding turbo-list-delete">
											<button type="button" class="btn-delete js-remove-item">
												<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
													<i class="align-middle" data-feather="trash-2"></i>
												</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-label mt-3">{$btr->global_recommended_add|escape}</div>
						<div class="autocomplete-arrow">
							<input type="text" name="recommended" id="recommended-products" class="form-control" placeholder="{$btr->global_add_product|escape}">
						</div>
					</div>
				</div>
			</div>
			<div class="card mh-210px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->product_rating|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<label for="ratingRange" class="form-label">
							{$btr->product_rating_value|escape}
							<span class="js-show-rating">{$product->rating}</span>
						</label>
						<div class="raiting-boxed mb-4">
							<input class="js-rating-value" type="hidden" value="{$product->rating}" name="rating">
							<input class="js-rating form-range" id="ratingRange" type="range" min="1" max="5" step="0.1" value="{$product->rating}">
							<div class="raiting-range-number">
								<span class="float-start">1</span>
								<span class="float-end">5</span>
							</div>
						</div>
						<div class="mb-1">
							<div class="form-label">{$btr->product_rating_number|escape}</div>
							<input type="text" class="form-control" name="votes" value="{$product->votes}">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row gx-2">
		<div class="col-lg-6 col-md-12">
			<div class="card mh-270px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->product_files|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="turbo-list turbo-files-list mb-3">
							<div class="turbo-list-body sortable">
								{foreach $cms_files as $file}
									<div class="js-row turbo turbo-list-body-item">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-drag move-zone">
												<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
											</div>
											<div class="turbo-list-boding">
												<input type="hidden" name="files[id][]" value="{$file->id}">
												<input class="form-control" type="text" name="files[name][]" value="{$file->name}">
											</div>
											<div class="turbo-list-boding turbo-list-files-name">
												<a class="fw-bold text-body text-decoration-none" href="../{$config->cms_files_dir}{$file->filename|escape}">{$file->filename|escape}</a>
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												<button type="button" class="btn-delete js-remove-item">
													<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
														<i class="align-middle" data-feather="trash-2"></i>
													</span>
												</button>
											</div>
										</div>
									</div>
								{/foreach}
							</div>
						</div>
						<input class="form-control" name="files[]" id="file" type="file" multiple accept="pdf/txt/doc/docx">
						<div for="file" class="form-label mt-1">
							{$btr->supported_formats|escape}: pdf, txt, doc, docx. {$btr->import_maxsize|escape}
							{if $config->max_upload_filesize>1024*1024}
								{$config->max_upload_filesize/1024/1024|round:'2'} {$btr->global_mb|escape}
							{else}
								{$config->max_upload_filesize/1024|round:'2'} {$btr->global_kb|escape}
							{/if}
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="card mh-270px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_video|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body videos">
						<div class="turbo-list turbo-video-list mb-3">
							<div class="turbo-list-body sortable">
								{foreach $product_videos as $video}
									<div class="js-row turbo turbo-list-body-item js-sort-item">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-drag move-zone">
												<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
											</div>
											<div class="turbo-list-boding turbo-list-video-photo">
												<a href="https://www.youtube.com/embed/{$video->vid}" data-fancybox class="iframe fancybox.iframe">
													<img class="product-icon" src="https://img.youtube.com/vi/{$video->vid}/mqdefault.jpg">
												</a>
											</div>
											<div class="turbo-list-boding turbo-list-video-name">
												<input name="videos[]" value="{$video->link}" class="form-control">
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												<button type="button" class="btn-delete js-remove-item">
													<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
														<i class="align-middle" data-feather="trash-2"></i>
													</span>
												</button>
											</div>
										</div>
									</div>
								{/foreach}
							</div>
						</div>
						<div id="new-video" class="js-row turbo turbo-list-body-item js-sort-item" style="display:none;">
							<div class="turbo-list-row">
								<div class="turbo-list-boding turbo-list-drag move-zone">
									<i class="align-middle" transform="rotate(-45)" data-feather="maximize-2"></i>
								</div>
								<div class="turbo-list-boding turbo-list-video-photo"></div>
								<div class="turbo-list-boding turbo-list-video-name">
									<input name="videos[]" class="form-control" value="" placeholder="https://www.youtube.com/watch?v=abc">
								</div>
								<div class="turbo-list-boding turbo-list-delete">
									<button type="button" class="btn-delete js-remove-item delete">
										<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
											<i class="align-middle" data-feather="trash-2"></i>
										</span>
									</button>
								</div>
							</div>
						</div>
						<div class="box_btn_heading">
							<button type="button" class="btn  btn-primary js-add-video">
								<i class="align-middle" data-feather="plus"></i>
								<span>{$btr->global_add_video|escape}</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_metatags|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<div class="translate-container mb-3">
									<div class="form-label translate-button">Meta-title <span id="js-meta-title-counter"></span> <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<input name="meta_title" class="form-control js-meta-field mb-h translate-input" type="text" value="{$product->meta_title|escape}">
								</div>
								<div class="translate-container mb-3">
									<div class="form-label translate-button">Meta-keywords <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<input name="meta_keywords" class="form-control js-meta-field mb-h translate-input" type="text" value="{$product->meta_keywords|escape}">
								</div>
							</div>
							<div class="translate-container col-lg-6 col-md-6">
								<div class="form-label">Meta-description <span id="js-meta-description-counter"></span> <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
								<textarea name="meta_description" class="form-control turbo-textarea js-meta-field translate-input">{$product->meta_description|escape}</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="tab">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item" role="presentation"><a class="nav-link active" href="#tab-1" data-bs-toggle="tab" role="tab" aria-selected="true">{$btr->global_short_description|escape}</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link" href="#tab-2" data-bs-toggle="tab" role="tab" aria-selected="false" tabindex="-1">{$btr->global_full_description|escape}</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active show" id="tab-1" role="tabpanel">
						<textarea name="annotation" id="annotation" class="editor">{$product->annotation|escape}</textarea>
					</div>
					<div class="tab-pane" id="tab-2" role="tabpanel">
						<textarea id="js-editor" name="body" class="editor js-editor-class">{$product->body|escape}</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12">
			<div class="d-grid d-sm-block">
				<button type="submit" class="btn btn-primary float-end mt-n2">
					<i class="align-middle" data-feather="check"></i>
					{$btr->global_apply|escape}
				</button>
			</div>
		</div>
	</div>
</form>

{* TinyMCE *}
{include file='tinymce_init.tpl'}

{* Autocomplete *}
{js id="autocomplete" priority=99 include=["turbo/design/js/autocomplete/jquery.autocomplete-min.js"]}{/js}
{javascript minify=true}

{* Colorpicker *}
{css id="colorpicker" include=["turbo/design/js/colorpicker/css/bootstrap-colorpicker.min.css"]}{/css}
{stylesheet minify=true}

{js id="colorpicker" priority=99 include=["turbo/design/js/colorpicker/js/bootstrap-colorpicker.min.js"]}{/js}
{javascript minify=true}

{* Fancybox *}
{css id="fancybox" include=["turbo/design/js/fancybox/fancybox.css"]}{/css}
{stylesheet minify=true}

{js id="fancybox" priority=99 include=["turbo/design/js/fancybox/fancybox.umd.js"]}{/js}
{javascript minify=true}

<script>
	Fancybox.bind("[data-fancybox]", {
		Thumbs: {
			type: false,
		},
	});
</script>

{literal}
	<script>
		$(window).on("load", function() {
			$(document).ready(function() {
				var targetLang = '{/literal}{if $lang_label == 'ua'}uk{else}{$lang_label}{/if}{literal}';

				$('.translate-button-card').on('click', function() {
					var cardElement = $(this).closest('.card');
					var inputElements = cardElement.find('.translate-input-card');

					inputElements.each(function() {
						var inputElement = $(this);
						var text = inputElement.val();

						if (text.trim() !== '') {
							$.post('ajax/translate.php', {
								'source_lang': 'auto',
								'target_lang': targetLang,
								'text': text
							}, function(data) {
								inputElement.val(data);
							});
						}
					});
				});
			});

			$(document).on("click", ".js-show-images", function() {
				$(".js-toggle-hidden").toggleClass("d-none");
				$('.js-icon-arrow').toggleClass('rotate-180');
			});

			flatpickr(".flatpickr-datetime", {
				enableTime: true,
				dateFormat: "Y-m-d H:i",
				locale: "{/literal}{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}{literal}",
				time_24hr: true
			});

			var colorPickerOptions = {
				colorSelectors: {
					"black": "#000000",
					"blue": "#0000ff",
					"brown": "#a52a2a",
					"gray": "#808080",
					"green": "#008000",
					"red": "#ff0000",
					"orange": "#ffa500",
					"yellow": "#ffff00",
					"white": "#ffffff"
				},
				format: "hex"
			};

			$(document).on("click", ".js-remove-item", function() {
				$('[data-bs-toggle="tooltip"]').tooltip('hide');
				$(this).closest(".js-row").fadeOut(200, function() { $(this).remove(); });
				return false;
			});

			$(document).on("input", ".js-rating", function() {
				$(".js-show-rating").html($(this).val());
				$(".js-rating-value").val($(this).val());
			});

			$('#product-categories .add').click(function() {
				var $orginal = $('#product-categories .product-cats div.list:last');
				var $cloned = $orginal.clone();
				$cloned.find('.bootstrap-select').replaceWith(function() { return $('select', this); })
				$cloned.find('.selectpicker').selectpicker('render');
				$cloned.appendTo('#product-categories .product-cats');
				$("#product-categories .product-cats div.list:last button.add").hide();
				$("#product-categories .product-cats div.list:last button.delete").show();
			});

			$(document).on("click", "#product-categories .delete", function() {
				$(this).closest(".list").remove();
				return false;
			});

			var image_item_clone = $(".js-new-image-item").clone(true).removeClass('d-none');
			$(".js-new-image-item").remove();
			var new_image_tem_clone = $(".js-new-spec-image-item").clone(true).removeClass('d-none');
			$(".js-new-spec-image-item").remove();

			if (window.File && window.FileReader && window.FileList) {
				$(".js-dropzone").on('dragover', function(e) {
					e.preventDefault();
				{/literal}
				{if $settings->admin_theme == "dark"}
					$(this).css('background', '#28323f');
				{else}
					$(this).css('background', '#f8f8f8');
				{/if}
				{literal}
				});
				$(".js-dropzone").on('dragleave', function() {
				{/literal}
				{if $settings->admin_theme == "dark"}
					$(this).css('background', '#28323f');
				{else}
					$(this).css('background', '#f8f8f8');
				{/if}
				{literal}
				});

				function handleFileSelect(evt) {
					dropInput = $(this).closest(".js-droplist-wrap").find("input.dropinput:last").clone();
					var parent = $(this).closest(".js-droplist-wrap");
					var files = evt.target.files;
					for (var i = 0, f; f = files[i]; i++) {
						if (!f.type.match('image.*')) {
							continue;
						}
						var reader = new FileReader();
						reader.onload = (function(theFile) {
							return function(e) {
								if (parent.data('image') == "product") {
									var clone_item = image_item_clone.clone(true);
								} else if (parent.data('image') == "special") {
									var clone_item = new_image_tem_clone.clone(true);
								}
								clone_item.find("img").attr("onerror", '');
								clone_item.find("img").attr("src", e.target.result);
								clone_item.find("input").val(theFile.name);
								clone_item.appendTo(parent);
								temp_input = dropInput.clone();
								parent.find("input.dropinput").hide();
								parent.find(".js-dropzone").append(temp_input);
							};
						})(f);
						reader.readAsDataURL(f);
					}
					$(".js-dropzone").removeAttr("style");
				}
				$(document).on('change', '.dropinput', handleFileSelect);
			}

			$(document).on("click", ".js-remove-image", function() {
				$(this).closest("li").remove();
			});

			$(document).on("click", ".js-remove-variant", function() {
				$('[data-bs-toggle="tooltip"]').tooltip('hide');
				$(this).closest(".variants-list-item").fadeOut(200);
				$(this).closest(".variants-list-item").remove();
			});

			$(document).on("click", ".add-attachment", function() {
				var $attachmentBlock = $(this).closest('.turbo-list-body-item').find('.browse-attachment');
				var $attachmentInput = $(this).closest('.turbo-list-body-item').find('input[name*=attachment]');
				var $firstTurboListRow = $(this).closest('.turbo-list-body-item').find('.turbo-list-row:first');

				$firstTurboListRow.toggleClass('mb-0', !$attachmentBlock.is(':visible'));

				$attachmentBlock.slideToggle('fast', function() {
					var isVisible = $attachmentBlock.is(':visible');
					$attachmentInput.prop('disabled', !isVisible);

					$firstTurboListRow.toggleClass('mb-0', isVisible);
				});

				return false;
			});

			$(document).on("click", ".js-remove-attachment", function() {
				closest = $(this).closest(".turbo-list-boding");
				closest.find(".js-attachment-name");
				$(this).hide();
				closest.hide();
				closest.find("input[name*=delete_attachment]").val("1");
				$(this).closest(".browse-attachment").find('.download-attachment').show('fast');
				return false;
			});

			$('.color-picker').colorpicker(colorPickerOptions);

			var variant = $('.js-new-row-variant').clone(true);
			$('.js-new-row-variant').remove().removeAttr('id');
			variant.find('.bootstrap-select').replaceWith(function() { return $('select', this); });
			$('.js-add-variant').click(function() {
				if (!$('.variants-wrapper').is('.single-variant')) {
					var new_line = $(variant).clone(true);
					new_line.appendTo('.variants-listadd').fadeIn('slow').find("select").selectpicker();
					new_line.find(".variants-item-height").addClass('.color-picker').colorpicker(colorPickerOptions);
					new_line.find('[data-bs-toggle="tooltip"]').tooltip();
				} else {
					$('.variants-wrapper .variants-item-name').show('slow');
					$('.variants-wrapper').removeClass('single-variant');
				}
				return false;
			});

			var new_feature_category = $(".js-new-feature-category").clone(true);
			var new_val = $(".js-new-value").clone(true);
			$(".js-new-feature-category").remove();
			new_feature_category.removeClass("js-new-feature-category");
			$(".js-new-value").remove();
			new_val.removeClass("js-new-value");

			function show_category_features(category_id) {
				$('.js-features-wrap').empty();
				$.ajax({
					url: "ajax/get_features.php",
					data: {category_id: category_id, product_id: $("input[name=id]").val()},
					dataType: 'json',
					success: function(data) {
						for (i = 0; i < data.length; i++) {
							feature = data[i];
							var new_line = new_feature_category.clone(true);
							new_line.addClass('js-feature-block-' + feature.id);
							new_line.find(".js-feature-name").attr('title', feature.name);
							new_line.find(".js-feature-name a").text(feature.name).attr('href', "index.php?module=FeatureAdmin&id=" + feature.id);
							new_line.find(".js-auto-option").attr('name', "options_values[" + feature.id + "][]").val(feature.values[0].value).data('color', feature.is_color);
							new_line.find(".js-id-option").attr('name', "options_id[" + feature.id + "][]").val(feature.values[0].id);
							if (feature.is_color === "1") {
								new_line.find('.feature-value').append('<div class="add-on colorPicker-picker"></div>');
								new_line.find(".feature-value").addClass('color-picker').colorpicker(colorPickerOptions);
							}
							var value = new_line.find(".js-auto-option");
							id_input = new_line.find(".js-id-option");
							value.data('id', feature.id);
							value.attr('name', "options_values[" + feature.id + "][]");
							id_input.attr('name', "options_id[" + feature.id + "][]");
							if (feature.values.length > 1) {
								for (var j = 1; j < feature.values.length; j++) {
									var new_subline = new_val.clone(true);
									new_subline.find(".js-auto-option").attr('name', "options_values[" + feature.id + "][]").val(feature.values[j].value);
									new_subline.find(".js-id-option").attr('name', "options_id[" + feature.id + "][]").val(feature.values[j].id);
									if (feature.is_color === "1") {
										new_subline.find('.feature-value').append('<div class="add-on colorPicker-picker"></div>');
										new_subline.find(".feature-value").addClass('color-picker').colorpicker(colorPickerOptions);
									}
									new_line.append(new_subline);
									if (j > 0) {
										new_subline.find(".js-feature-multi-values")
										.removeClass("js-add")
										.removeClass("btn-feature")
										.addClass("js-remove")
										.addClass("btn-minus-feature");
										new_subline.find(".js-plus").hide();
										new_subline.find(".js-minus").show();
										new_subline.find(".feature-name").html("").addClass("additional-values");
										new_subline.find(".feature-input").html("").addClass("feature-input-single");
									}
									new_subline.show();
									new_line.appendTo(".js-features-wrap");
								}
							}
						{/literal}
						{if $lang_id != $first_lang}
							{literal}	
								if (feature.values[0].id) {
									new_line.find(".js-id-option").removeClass("js-id-option");
								} else {
									new_line.find(".js-id-option").addClass("js-id-option");
								}
							{/literal}
						{/if}
						{literal}
							new_line.appendTo('.js-features-wrap').find("input")
								.autocomplete({
									serviceUrl: 'ajax/options_autocomplete.php',
									minChars: 0,
									maxHeight: 312,
									params: {feature_id:feature.id},
									noCache: false,
									onSelect: function(suggestion) {
										var id_input = $(this).closest('.feature-row').find('.js-id-option');
										id_input.val(suggestion.data.id);
										$(this).trigger('change');
									},
									onSearchStart: function(params) {
										var id_input = $(this).closest('.feature-row').find('.js-id-option');
										id_input.val("");
									}
								});
							new_line.show();
						}
					}
				});
				return false;
			}

			$(document).on("click", ".js-feature-multi-values.js-add-color", function() {
				var feature_id = $(this).closest(".feature-value").find(".js-auto-option").data("id"),
				new_value = new_val.clone(true),
				value_input = new_value.find(".js-auto-option"),
				id_input = new_value.find(".js-id-option");
				value_input.data("id", feature_id);
				value_input.val("");
				value_input.attr('name', "options_values[" + feature_id + "][]");
				id_input.attr("name", "options_id[" + feature_id + "][]");
				new_value.find(".feature-name").html("").addClass("additional-values");
				new_value.find(".feature-input").html("").addClass("feature-input-single");
				new_value.find('.feature-value').append('<div class="add-on colorPicker-picker"></div>');
				new_value.find(".feature-value").addClass('.color-picker').colorpicker(colorPickerOptions);
				new_value.find(".js-feature-multi-values")
				.removeClass("js-add")
				.removeClass("btn-feature")
				.addClass("js-remove")
				.addClass("btn-minus-feature");
				new_value.find(".js-plus").hide();
				new_value.find(".js-minus").show();
				value_input.autocomplete({
					serviceUrl: 'ajax/options_autocomplete.php',
					minChars: 0,
					maxHeight: 312,
					params: {feature_id:feature_id},
					noCache: false,
					onSelect: function(suggestion) {
						var id_input = $(this).closest('.feature-row').find('.js-id-option');
						id_input.val(suggestion.data.id);
						$(this).trigger('change');
					},
					onSearchStart: function(params) {
						var id_input = $(this).closest('.feature-row').find('.js-id-option');
						id_input.val("");
					}
				});
				new_value.appendTo(".js-feature-block-" + feature_id).fadeIn('slow');
				return false;
			});

			$(document).on("click", ".js-feature-multi-values.js-add", function() {
				var feature_id = $(this).closest(".feature-value").find(".js-auto-option").data("id"),
				color = $(this).closest(".feature-value").find(".js-auto-option").data("color"),
				new_value = new_val.clone(true),
				value_input = new_value.find(".js-auto-option"),
				id_input = new_value.find(".js-id-option");
				value_input.data("id", feature_id);
				value_input.val("");
				value_input.attr('name', "options_values[" + feature_id + "][]");
				id_input.attr("name", "options_id[" + feature_id + "][]");
				new_value.find(".feature-name").html("").addClass("additional-values");
				new_value.find(".feature-input").html("").addClass("feature-input-single");
				if (color === "1") {
					new_value.find('.feature-value').append('<div class="add-on colorPicker-picker"></div>');
					new_value.find(".feature-value").addClass('color-picker').colorpicker(colorPickerOptions);
				}
				new_value.find(".js-feature-multi-values")
				.removeClass("js-add")
				.removeClass("btn-feature")
				.addClass("js-remove")
				.addClass("btn-minus-feature");
				new_value.find(".js-plus").hide();
				new_value.find(".js-minus").show();
				value_input.autocomplete({
					serviceUrl: 'ajax/options_autocomplete.php',
					minChars: 0,
					maxHeight: 312,
					params: {feature_id:feature_id},
					noCache: false,
					onSelect: function(suggestion) {
						var id_input = $(this).closest('.feature-row').find('.js-id-option');
						id_input.val(suggestion.data.id);
						$(this).trigger('change');
					},
					onSearchStart: function(params) {
						var id_input = $(this).closest('.feature-row').find('.js-id-option');
						id_input.val("");
					}
				});
				new_value.appendTo(".js-feature-block-" + feature_id).fadeIn('slow');
				return false;
			});

			$(document).on("click", ".js-feature-multi-values.js-remove", function() {
				$(this).closest(".feature-row").remove();
			});

			$('select[name="categories[]"]:first').change(function() {
				show_category_features($("option:selected", this).val());
			});

			$('.js-features-wrap .js-auto-option').each(function(index) {
				feature_id = $(this).closest(".feature-value").find(".js-auto-option").data("id");
				id_input = $(this).closest(".feature-row").find(".js-id-option");
				$(this).autocomplete({
					serviceUrl: 'ajax/options_autocomplete.php',
					minChars: 0,
					maxHeight: 312,
					params: {feature_id:feature_id},
					noCache: false,
					onSelect: function(suggestion) {
						var id_input = $(this).closest('.feature-row').find('.js-id-option');
						id_input.val(suggestion.data.id);
						$(this).trigger('change');
					},
					onSearchStart: function(params) {
						var id_input = $(this).closest('.feature-row').find('.js-id-option');
						id_input.val("");
					}
				});
			});

			var new_feature = $(".js-new-feature").clone(true);
			$(".js-new-feature").remove();
			new_feature.removeClass("js-new-feature");
			$(document).on("click", ".js-add-feature", function() {
				var cloned_feature = new_feature.clone(true);
				cloned_feature.appendTo(".features-wrap").fadeIn('slow');
				return false;
			});

			$(document).on("click", ".js-delete-feature", function() {
				$(this).parent().remove();
			});

			var new_related_product = $('#new-related-product').clone(true);
			$('#new-related-product').remove();
			new_related_product.removeAttr('id');
			$("input#related-products").autocomplete({
				serviceUrl: 'ajax/search_products.php',
				minChars: 0,
				maxHeight: 362,
				noCache: false,
				onSelect: function(suggestion) {
					$("input#related-products").val('').focus().blur();
					new_item = new_related_product.clone().appendTo('.related-products');
					new_item.find('a.related-product-name').html(suggestion.data.name);
					new_item.find('a.related-product-name').attr('href', 'index.php?module=ProductAdmin&id=' + suggestion.data.id);
					new_item.find('input[name*="related_products"]').val(suggestion.data.id);
					new_item.find('[data-bs-toggle="tooltip"]').tooltip();
					if (suggestion.data.image)
						new_item.find('img.product-icon').attr("src", suggestion.data.image);
					else
						new_item.find('img.product-icon').remove();
						new_item.show();
				},
				formatResult: function(suggestions, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return "<div>" + (suggestions.data.image ? "<img align=absmiddle src='" + suggestions.data.image + "'> " : '') + "</div>" + "<span>" + suggestions.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + "</span>";
				}
			});

			var new_recommended_product = $('#new-recommended-product').clone(true);
			$('#new-recommended-product').remove();
			new_recommended_product.removeAttr('id');
			$("input#recommended-products").autocomplete({
				serviceUrl: 'ajax/search_products.php',
				minChars: 0,
				maxHeight: 362,
				noCache: false,
				onSelect: function(suggestion) {
					$("input#recommended-products").val('').focus().blur();
					new_item = new_recommended_product.clone().appendTo('.recommended-products');
					new_item.find('a.recommended-product-name').html(suggestion.data.name);
					new_item.find('a.recommended-product-name').attr('href', 'index.php?module=ProductAdmin&id=' + suggestion.data.id);
					new_item.find('input[name*="recommended_products"]').val(suggestion.data.id);
					new_item.find('[data-bs-toggle="tooltip"]').tooltip();
					if (suggestion.data.image)
						new_item.find('img.product-icon').attr("src", suggestion.data.image);
					else
						new_item.find('img.product-icon').remove();
						new_item.show();
				},
				formatResult: function(suggestions, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return "<div>" + (suggestions.data.image ? "<img align=absmiddle src='" + suggestions.data.image + "'> " : '') + "</div>" + "<span>" + suggestions.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + "</span>";
				}
			});

			$('.videos .js-add-video').click(function() {
				var new_video = $('#new-video').clone(true);
				new_video.appendTo('.videos .sortable').fadeIn('slow').find("input[name*=videos]").focus();
				new_video.find('[data-bs-toggle="tooltip"]').tooltip();
				return false;
			});

			$("input[name*=variant][name*=stock]").focus(function() {
				if ($(this).val() == '∞')
					$(this).val('');
				return false;
			});

			$("input[name*=variant][name*=stock]").blur(function() {
				if ($(this).val() == '')
					$(this).val('∞');
			});
		});
	</script>
{/literal}