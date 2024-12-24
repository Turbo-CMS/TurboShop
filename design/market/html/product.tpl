{* Product Page *}

{* Canonical *}
{$canonical="/products/{$product->url}" scope=global}

{* Quickview *}
{if isset($smarty.server.HTTP_X_REQUESTED_WITH) && $smarty.server.HTTP_X_REQUESTED_WITH == 'XMLHttpRequest'}
	{$wrapper = 'modals/quickview.tpl' scope=global}
{/if}

<div itemscope itemtype="http://schema.org/Product">
	<link itemprop="image" href="{if $product->image}{$product->image->filename|resize:570:570}{/if}">
	<meta itemprop="category" content="{$category->name|escape}">
	<meta itemprop="name" content="{$product->name|escape}">
	<ul class="nav nav-underline border-bottom overflow-auto flex-nowrap" id="productTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="{if isset($smarty.get.page) || isset($smarty.get.sort)}nav-link{else}nav-link active{/if} text-nowrap" id="details-tab" data-bs-toggle="tab" data-bs-target="#details-tab-pane" type="button" role="tab" aria-controls="details-tab-pane" aria-selected="true">{$lang->product_details|escape}</button>
		</li>
		{if $product->features}
			<li class="nav-item" role="presentation">
				<button class="nav-link text-nowrap" id="feature-tab" data-bs-toggle="tab" data-bs-target="#feature-tab-pane" type="button" role="tab" aria-controls="feature-tab-pane" aria-selected="false">{$lang->feature|escape}</button>
			</li>
		{/if}
		<li class="nav-item" role="presentation">
			<button class="nav-link {if isset($smarty.get.page) || isset($smarty.get.sort)}active{/if} text-nowrap" id="comments-tab" data-bs-toggle="tab" data-bs-target="#comments-tab-pane" type="button" role="tab" aria-controls="comments-tab-pane" aria-selected="false">{if $comments}{$lang->global_reviews|escape} {$comments_count}{else}{$lang->leave_review|escape}{/if}</button>
		</li>
		{if $cms_files}
			<li class="nav-item" role="presentation">
				<button class="nav-link text-nowrap" id="files-tab" data-bs-toggle="tab" data-bs-target="#files-tab-pane" type="button" role="tab" aria-controls="files-tab-pane" aria-selected="false">{$lang->global_files|escape}</button>
			</li>
		{/if}
		{if $product->videos}
			<li class="nav-item" role="presentation">
				<button class="nav-link text-nowrap" id="videos-tab" data-bs-toggle="tab" data-bs-target="#videos-tab-pane" type="button" role="tab" aria-controls="videos-tab-pane" aria-selected="false">{$lang->global_videos|escape}</button>
			</li>
		{/if}
	</ul>
	<div class="tab-content" id="productTabContent">
		<div class="{if isset($smarty.get.page) || isset($smarty.get.sort)}tab-pane fade{else}tab-pane fade show active{/if}" id="details-tab-pane" role="tabpanel" aria-labelledby="details-tab" tabindex="0">
			<div class="row product mb-3 mt-2">
				{* Product Gallery *}
				<div class="col-md-6 pt-3">
					{* Big Images *}
					<div id="productImages" class="carousel carousel-dark slide" data-bs-ride="false">
						<div class="carousel-inner" role="listbox">
							<div class="icons">
								{if $product->variant->compare_price > 0}<span class="notify-badge badge bg-danger fs-5"><i class="fal fa-badge-percent me-1"></i>{$lang->badge_sale|escape}</span>{/if}
								{if $product->featured}<span class="notify-badge badge bg-primary fs-5"><i class="fal fa-thumbs-up me-1"></i>{$lang->badge_featured|escape}</span>{/if}
								{if $product->is_hit}<span class="notify-badge badge bg-success fs-5"><i class="fal fa-circle-star me-1"></i>{$lang->badge_hit|escape}</span>{/if}
								{if $product->is_new}<span class="notify-badge badge bg-warning fs-5"><i class="fal fa-badge-check me-1"></i>{$lang->badge_new|escape}</span>{/if}
							</div>
							{if $product->image}
								{foreach $product->images as $i=>$image name=img}
									<div class="carousel-item image {if $smarty.foreach.img.first}active{/if}" data-slide-number="{$smarty.foreach.img.index}">
										<a data-fancybox="gallery" href="{if $settings->watermark_enable}{$image->filename|resize:1000:1000:w}{else}{$image->filename|resize:1000:1000}{/if}">
											<img src="{$image->filename|resize:800:800}" class="rounded img-responsive" alt="{$product->name|escape}">
											<span class="icon-focus"><i class="fal fa-search-plus"></i></span>
										</a>
									</div>
								{/foreach}
							{else}
								<div class="image">
									<img src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}">
								</div>
							{/if}
						</div>
						{if $product->images|count > 1}
							<div class="d-none d-md-block">
								<button class="carousel-control-prev" type="button" data-bs-target="#productImages" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#productImages" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
							<div class="carousel-indicators d-flex d-md-none" style="margin-bottom: -20px;">
								{foreach $product->images as $i=>$image name=img}
									<button type="button" data-bs-target="#productImages" data-bs-slide-to="{$smarty.foreach.img.index}" {if $smarty.foreach.img.first}class="active" {/if} aria-current="true" aria-label="Image {$smarty.foreach.img.index}"></button>
								{/foreach}
							</div>
						{/if}
					</div>

					{* Gallery Thumblist *}
					{if $product->images|count > 1}
						<div id="product-slider-pagination" class="product-gallery-thumblist d-none d-md-flex">
							{foreach $product->images as $i => $image name=images}
								<a id="carousel-selector-{$smarty.foreach.images.index}" class="product-gallery-thumblist-item d-flex justify-content-center align-items-center {if $smarty.foreach.images.first}selected{/if}" href="#" data-bs-target="#productImages" data-bs-slide-to="{$smarty.foreach.images.index}">
									<img src="{$image->filename|resize:95:95}" alt="{$product->name|escape}">
								</a>
							{/foreach}
						</div>
					{/if}

					{* Annotation *}
					<div class="my-3">{$product->annotation}</div>
					{if $product->body}
						<a href="#description" class="scroll-link">{$lang->more_details_product|escape}</a>
					{/if}
				</div>
				<div class="col-md-6 pt-4 pt-lg-1">
					<div class="product-details ms-auto pb-3">
						{* Product Name *}
						<h1 class="h5"><span data-product="{$product->id}">{$product->name|escape}</span></h1>

						<div class="d-flex justify-content-between mb-3">
							{* Rating *}
							<div {if $product->ratings|string_format:'%.1f'|floatval > 0}itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating" {/if}>
								<meta itemprop="ratingValue" content="{$product->ratings|string_format:'%.1f'}">
								<meta itemprop="reviewCount" content="{$comments_count}">
								<meta itemprop="bestRating" content="5">
								<meta itemprop="worstRating" content="1">
								<ul class="rating-stars">
									<li style="width:{$product->ratings*100/5|string_format:'%.0f'}%" class="stars-active">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</li>
									<li>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
									</li>
								</ul>
								{if $product->ratings|string_format:'%.1f'|floatval > 0}
									<div class="label-rating">
										<span class="text-muted">{if $product->ratings|string_format:'%.1f'|floatval > 0}{$product->ratings|string_format:'%.1f'}{else}{$product->ratings|intval}{/if}</span>
										<span class="text-muted">({$comments_count} {$comments_count|plural:$lang->review_1:$lang->review_2:$lang->review_3})</span>
									</div>
								{/if}
							</div>

							{* SKU *}
							{if $product->variant->sku}<div class="article text-muted">{$lang->sku|escape}: <span itemprop="sku" class="value">{$product->variant->sku}</span></div>{/if}
						</div>

						{* Brand *}
						{if $brand && $brand->image}
							<div class="mb-3">
								<a href="{$lang_link}catalog/{$category->url}/{$brand->url}">
									<img src="{$brand->image|resize_brands:75:25}" alt="{$brand->name|escape}" title="{$brand->name|escape}">
									<span style="display:none;" itemprop="brand">{$brand->name|escape}</span>
								</a>
							</div>
						{/if}

						{* Timer Action *}
						{if !empty($product->sale_to)}
							<div id="countdown-title" class="mb-1">{$lang->end_promotion|escape}</div>
							<div class="mb-4" id="countdown" sale_to="{strtotime($product->sale_to) * 1000}"></div>
						{/if}

						{* Stock *}
						<div class="mb-3">
							{if $product->variant->stock}
								<div data-stock="<i class='fa-light fa-circle-xmark me-2'></i>{$lang->not_available|escape}" data-default="<i class='fal fa-circle-check me-2'></i>{$lang->In_stock|escape}" class="availability text-success"><i class="fal fa-circle-check me-2"></i>{$lang->In_stock|escape}</div>
							{else}
								<div data-stock="<i class='fa-light fa-circle-xmark me-2'></i>{$lang->not_available|escape}" data-default="<i class='fal fa-circle-check me-2'></i>{$lang->In_stock|escape}" class="availability text-danger"><i class="fa-light fa-circle-xmark me-2"></i>{$lang->not_available|escape}</div>
							{/if}
						</div>

						{* Variants *}
						<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
							<link itemprop="url" href="{$config->root_url}/products/{$product->url}">
							<form class="variants" action="{$lang_link}cart">
								{if $product->related_products}
									<div class="mb-0">
										<label class="form-label"><strong>{$lang->color|escape}</strong>: <span class="text-secondary">{$product->variant->color}</span></label>
									</div>
									<div class="color-product mb-3">
										{foreach $product->related_products as $related_product}
											<span>
											<a href="{$lang_link}products/{$related_product->url}" style="background-color:{$related_product->variant->color_code}" class="btn btn-sm rounded-circle mb-1 me-2 {if $related_product->variant->color_code == '#ffffff'}white{/if} {if $product->id == $related_product->id}active{/if}" {if $related_product->variant->color}data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$related_product->variant->color}"{/if}>
												<span class="fa fa-check"></span>
											</a>
											</span>
										{/foreach}
									</div>
									<div class="{if $product->variants|count < 2}d-none{/if}">
										<div class="mb-0">
											<label class="form-label">{$lang->option|escape}:</label>
										</div>
										<div class="variants-size mb-3">
											{foreach $product->variants as $v}
												<input type="radio" name="variant" value="{$v->id}" class="btn-check" id="btn-{$v->id}" data-price="{$v->price|convert}" data-stock="{$v->stock}" {if $v->compare_price}data-compare="{$v->compare_price|convert}" {/if} {if $v->name}data-name="{$v->name}" {/if} {if $v->sku}data-sku="{$v->sku}" {/if} {if $product->variant->id==$v->id}checked{/if} autocomplete="off">
												<label class="btn btn-sm btn-outline-option mb-1 me-1 {if !$v->stock}position-relative disabled{/if}" for="btn-{$v->id}">{$v->name}</label>
											{/foreach}
										</div>
									</div>
								{else}
									<select name="variant" id="{if $prefix}{$prefix}variant-{/if}{$product->id}" class="orderby form-select mb-4" data-productid="{$product->id}" {if $product->variants|count == 1}hidden{/if}>
										{foreach $product->variants as $v}
											<option value="{$v->id}" data-price="{$v->price|convert}" data-stock="{$v->stock}" {if $v->compare_price}data-compare="{$v->compare_price|convert}" {/if} {if $v->name}data-name="{$v->name}" {/if} {if $v->sku}data-sku="{$v->sku}" {/if} {if $product->variant->id==$v->id}selected{/if}>{$v->name}</option>
										{/foreach}
									</select>
								{/if}
								<div class="card my-3">
									<div class="card-body">
										<div class="row g-2 d-flex align-items-center">
											<div class="col-6 col-xl-2 order-1">
												{if $product->variant->compare_price > 0}
													<h6 class="text-secondary offers-price-old mb-0">
														<del>
															<span class="price-value">{$product->variant->compare_price|convert}</span><span class="currency small">{$currency->sign|escape}</span>
														</del>
													</h6>
												{/if}
												<h4 class="offers-price">
													<span itemprop="price" content="{$product->variant->price|convert:'':false}" class="price-value {if $product->variant->compare_price > 0}text-danger{/if}">{$product->variant->price|convert}</span><span itemprop="priceCurrency" content="{$currency->code|escape}" class="currency fs-6 {if $product->variant->compare_price > 0}text-danger{/if}">{$currency->sign|escape}</span>
												</h4>
											</div>
											<div class="col-12 col-xl-8 order-3 order-xl-2">
												<div class="d-flex flex-column flex-xl-row gap-2">
													<button type="submit" data-result-text="<i class='far fa-cart-shopping me-2'></i>{$lang->added_cart|escape}" id="add-to-cart" class="btn btn-success w-100" value="{$lang->add_cart|escape}" title="{$lang->add_cart|escape}" {if !$product->variant->stock}disabled{/if}>
														<i class="far fa-cart-shopping me-2"></i>
														{$lang->add_cart|escape}
													</button>
													<a class="btn btn-outline-success fast-order-send-button w-100 {if !$product->variant->stock}disabled{/if}" id="fast-order" href="javascript:void(0)" role="button" data-name="{$product->name}" data-bs-toggle="modal" data-bs-target="#fastOrder">
														<i class="far fa-rocket-launch me-2"></i>
														{$lang->fast_order|escape}
													</a>
												</div>
											</div>
											<div class="col-6 col-xl-2 order-2 order-xl-3 text-end">
												<div class="btn-group" role="group" aria-label="Product button">
													{if $wishlist_products && in_array($product->url, $wishlist_products)}
														<a class="btn btn-lg btn-link mr-1" href="{$lang_link}wishlist">
															<i class="fa fa-heart text-warning" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_wishlist|escape}"></i>
														</a>
													{else}
														<a class="btn btn-lg btn-link wishlist mr-1" href="{$lang_link}wishlist/{$product->url}">
															<i class="far fa-heart text-warning" data-result-text="{$lang->added_to_wishlist|escape}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_wishlist|escape}"></i>
														</a>
													{/if}
													{if isset($smarty.session.compared_products) && in_array($product->url, $smarty.session.compared_products)}
														<a class="btn btn-lg btn-link" href="{$lang_link}compare">
															<i class="far fa-scale-balanced text-primary" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_compare|escape}"></i>
														</a>
													{else}
														<a class="btn btn-lg btn-link compare" href="{$lang_link}compare/{$product->url}">
															<i class="far fa-scale-balanced text-secondary" data-result-text="{$lang->added_to_compare|escape}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_compare|escape}"></i>
														</a>
													{/if}
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
							{* Schema.org *}
							<span style="display:none;">
								{if !empty($product->sale_to)}
									<meta itemprop="priceValidUntil" content="{$product->sale_to|date:'Y-m-d'}">
								{/if}
								{if $product->variant->stock > 0}
									<link itemprop="availability" href="https://schema.org/InStock">
								{else}
									<link itemprop="availability" href="http://schema.org/OutOfStock">
								{/if}
								<link itemprop="itemCondition" href="https://schema.org/NewCondition">
								<span itemprop="seller" itemscope itemtype="http://schema.org/Organization">
									<span itemprop="name">{$settings->site_name}</span>
								</span>
							</span>
						</div>
						<div class="accordion mb-4" id="productPanels">
							<div class="accordion-item">
								<h3 class="accordion-header">
									<button class="accordion-button link-body-emphasis" type="button" data-bs-toggle="collapse" data-bs-target="#shippingOptions" aria-expanded="true" aria-controls="shippingOptions">
										<i class="fal fa-truck-fast align-middle me-2"></i>
										{$lang->delivery_methods|escape}
									</button>
								</h3>
								<div class="accordion-collapse collapse show" id="shippingOptions" data-bs-parent="#productPanels">
									<div class="accordion-body fs-sm">
										<ul>
											{$lang->delivery_methods_list}
										</ul>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h3 class="accordion-header">
									<button class="accordion-button link-body-emphasis collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#paymentStore" aria-expanded="false" aria-controls="paymentStore">
										<i class="fal fa-credit-card align-middle me-2"></i>
										{$lang->payment_methods|escape}
									</button>
								</h3>
								<div class="accordion-collapse collapse" id="paymentStore" data-bs-parent="#productPanels">
									<div class="accordion-body">
										<ul>
											{$lang->payment_methods_list}
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			{* Nex & Prev *}
			{if $prev_product || $next_product}
				<hr class="border-color">
				<div class="row">
					<div class="col-lg-6 col-sm-6 col-6 text-start">
						{if $prev_product}
							<a class="text-decoration-none" href="{$lang_link}products/{$prev_product->url}"><i class="fal fa-arrow-left me-2"></i>{$prev_product->name|escape}</a>
						{/if}
					</div>
					<div class="col-lg-6 col-sm-6 col-6 text-end">
						{if $next_product}
							<a class="text-decoration-none" href="{$lang_link}products/{$next_product->url}">{$next_product->name|escape}<i class="fal fa-arrow-right ms-2"></i></a>
						{/if}
					</div>
				</div>
				<hr class="border-color">
			{/if}

			{* Recommended Products *}
			{if $recommended_products}
				<h2 class="my-3 fs-5">{$lang->related_products|escape}</h2>
				<div class="row g-0 border-start border-top">
					{foreach $recommended_products as $product}
						<div class="col-6 col-sm-6 col-md-4 col-lg-3 col-xl-2">
							{include file='products/grid.tpl'}
						</div>
					{/foreach}
				</div>
			{/if}

			{* Description *}
			<div class="container pt-lg-3 pb-3 pb-sm-5">
				<div class="row justify-content-center">
					<div class="col-lg-10" itemprop="description">
						<div id="description" class="block-description">{$product->body}</div>
					</div>
				</div>
			</div>

			{* Products Brand Random *}
			{if $brand}
				{get_products var=brand_products brand_id=$brand->id limit=6 sort=random}
				{if $brand_products}
					<h2 class="my-3 fs-5">{$lang->products_from_brand|escape}</h2>
					<div class="row g-0 border-start border-top mb-3">
						{foreach $brand_products as $product}
							<div class="col-6 col-sm-6 col-md-4 col-lg-3 col-xl-2">
								{include file='products/grid.tpl'}
							</div>
						{/foreach}
					</div>
				{/if}
			{/if}

			{* Products Category Random *}
			{get_products var=cat_products category_id=$category->id limit=6}
			{if $cat_products}
				<h2 class="my-3 fs-5">{$lang->products_from_category|escape}</h2>
				<div class="row g-0 border-start border-top">
					{foreach $cat_products as $product}
						<div class="col-6 col-sm-6 col-md-4 col-lg-3 col-xl-2">
							{include file='products/grid.tpl'}
						</div>
					{/foreach}
				</div>
			{/if}
		</div>

		{* Features Tab *}
		{if $product->features}
			<div class="tab-pane fade" id="feature-tab-pane" role="tabpanel" aria-labelledby="feature-tab" tabindex="0">
				<h1 class="h5 my-3">{$lang->feature|escape} {$product->name|escape}</h1>
				<div class="row position-relative">
					<div class="col-lg-8">
						<table class="table table-hover mt-3">
							<tbody>
								{foreach $product->features as $f}
									{if !$f->is_color}
										<tr>
											<th scope="row">{$f->name}</th>
											<td>
												{foreach $f->values as $v}
													{if $f->url_in_product && $f->in_filter}
														<a href="{$lang_link}catalog/{$category->url}/{$f->url}-{$v->translit}">{$v->value|escape}</a>
													{else}
														{$v->value|escape}{if !$v@last},{/if}
													{/if}
												{/foreach}
											</td>
										</tr>
									{/if}
								{/foreach}
							</tbody>
						</table>
					</div>
					<div class="col-lg-4 d-none d-lg-block">
						{include file='products/card_mini.tpl'}
					</div>
				</div>
			</div>
		{/if}

		{* Comments Tab *}
		<div class="tab-pane fade {if isset($smarty.get.page) || isset($smarty.get.sort)}show active{/if}" id="comments-tab-pane" role="tabpanel" aria-labelledby="comments-tab" tabindex="0">
			<h2 class="h5 my-3">{$lang->customer_reviews|escape} {$product->name|escape}</h2>
			<div class="row position-relative">
				<div class="col-lg-8">
					{include file='comments/comments_products.tpl'}
				</div>
				<div class="col-lg-4 d-none d-lg-block">
					{include file='products/card_mini.tpl'}
				</div>
			</div>
		</div>

		{* Files *}
		{if $cms_files}
			<div class="tab-pane fade" id="files-tab-pane" role="tabpanel" aria-labelledby="files-tab" tabindex="0">
				<h2 class="h5 my-3">{$lang->global_files|escape} {$product->name|escape}</h2>
				<div class="row position-relative">
					<div class="col-lg-8">
						<div class="row">
							{foreach $cms_files as $file}
								{assign var="filename" value=$file->filename}
								{assign var="file_parts" value=$filename|split:'.'}
								{assign var="extension" value=$file_parts|@array_pop}
								{assign var="file_path" value=$config->cms_files_dir|cat:$filename}
								{assign var="file_size" value=$file_path|@filesize}
								<div class="col-md-6 mb-3">
									<div class="card p-3 d-flex align-items-center">
										<div class="row w-100">
											<div class="col-9 d-flex align-items-center">
												<i class="fal fa-file-{$extension} fs-2 me-3"></i>
												<div>
													<h6 class="mb-0">
														<a href="{$config->cms_files_dir}{$file->filename}" target="_blank" class="text-decoration-none text-body">
															{if $file->name}{$file->name}{else}{$file->filename}{/if}
														</a>
													</h6>
													<small class="text-muted">{$file_size|format_filesize}</small>
												</div>
											</div>
											<div class="col-3 text-end">
												<a href="{$config->cms_files_dir}{$file->filename}" target="_blank" class="btn btn-link text-decoration-none">
													<i class="fal fa-arrow-down-to-line fs-3"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
					<div class="col-lg-4 d-none d-lg-block">
						{include file='products/card_mini.tpl'}
					</div>
				</div>
			</div>
		{/if}

		{* Videos *}
		{if $product->videos}
			<div class="tab-pane fade" id="videos-tab-pane" role="tabpanel" aria-labelledby="videos-tab" tabindex="0">
				<h2 class="h5 my-3">{$lang->global_videos|escape} {$product->name|escape}</h2>
				<div class="row position-relative">
					<div class="col-lg-8">
						<div class="row">
							{foreach $product->videos as $video}
								<div class="col-md-6 mb-3">
									<div class="card">
										<div class="ratio ratio-16x9">
											<iframe class="rounded-top" src="https://www.youtube.com/embed/{$video->vid}" title="{$lang->global_videos|escape} {$product->name|escape}" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
										<div class="card-body text-center">
											<a href="https://www.youtube.com/watch?v={$video->vid}" class="btn btn-danger">{$lang->watch_youtube|escape}<i class="ms-1 fab fa-youtube"></i></a>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
					<div class="col-lg-4 d-none d-lg-block">
						{include file='products/card_mini.tpl'}
					</div>
				</div>
			{/if}
		</div>
	</div>
</div>