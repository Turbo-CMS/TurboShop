{* Quickview *}
<div class="quickview">
	<button type="button" class="btn-close position-absolute top-0 end-0 m-3 quickview-close" aria-label="Close"></button>
	<div class="container-fluid">
		<div class="row product">
			{* Product Gallery *}
			<div class="col-lg-6">
				{* Big Images *}
				<div id="productImages" class="carousel carousel-dark slide my-4" data-bs-ride="false">
					<div class="carousel-inner" role="listbox">
						<div class="icons">
							{if $product->variant->compare_price> 0}<span class="notify-badge badge bg-danger"><i class="fal fa-badge-percent me-1"></i>{$lang->badge_sale|escape}</span>{/if}
							{if $product->featured}<span class="notify-badge badge bg-primary"><i class="fal fa-thumbs-up me-1"></i>{$lang->badge_featured|escape}</span>{/if}
							{if $product->is_hit}<span class="notify-badge badge bg-success"><i class="fal fa-circle-star me-1"></i>{$lang->badge_hit|escape}</span>{/if}
							{if $product->is_new}<span class="notify-badge badge bg-warning"><i class="fal fa-badge-check me-1"></i>{$lang->badge_new|escape}</span>{/if}
						</div>
						{if $product->image}
							{foreach $product->images as $i=>$image name=img}
								<div class="carousel-item image {if $smarty.foreach.img.first}active{/if}" data-slide-number="{$smarty.foreach.img.index}">
									<a data-fancybox="gallery" href="{if $settings->watermark_enable}{$image->filename|resize:800:800:w}{else}{$image->filename|resize:800:800}{/if}">
										<img src="{$image->filename|resize:300:300}" class="rounded" alt="{$product->name|escape}">
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
								<button type="button" data-bs-target="#productImages" data-bs-slide-to="{$smarty.foreach.img.index}" {if $smarty.foreach.img.first}class="active"{/if} aria-current="true" aria-label="Image {$smarty.foreach.img.index}"></button>
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
			</div>

			<div class="col-lg-6">
				<div class="product-details ms-auto pb-3">
					{* Product Name *}
					<h3 class="mt-3">{$product->name|escape}</h3>

					<div class="d-flex justify-content-between mb-3">
							{* Rating *}
							<div>
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
										<span class="text-secondary">{$comments_count} {$comments_count|plural:$lang->review_1:$lang->review_2:$lang->review_3}</span>
									</div>
								{/if}
							</div>

							{* SKU *}
							{if $product->variant->sku}<div class="article text-muted">{$lang->sku|escape}: <span class="value">{$product->variant->sku}</span></div>{/if}
						</div>

					{* Annotation *}
					<div class="my-3">{$product->annotation}</div>

					{* Brand *}
					{if $brand && $brand->image}
						<div class="mb-3">
							<a href="{$lang_link}catalog/{$category->url}/{$brand->url}">
								<img src="{$brand->image|resize_brands:75:25}" alt="{$brand->name|escape}" title="{$brand->name|escape}">
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
					<div class="mb-0">
						<form class="variants" action="{$lang_link}cart">
							{if $product->related_products}
								<div class="mb-0">
									<label class="form-label"><strong>{$lang->color|escape}</strong>: <span class="text-secondary">{$product->variant->color}</span></label>
								</div>
								<div class="color-product mb-3">
									{foreach $product->related_products as $related_product}
										<button data-url="{$lang_link}products/{$related_product->url}" type="button" style="background-color:{$related_product->variant->color_code}" class="btn btn-sm product-card-quickview rounded-circle mb-1 me-2 {if $related_product->variant->color_code == '#ffffff'}white{/if} {if $product->id == $related_product->id}active{/if}" {if $related_product->variant->color}data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$related_product->variant->color}"{/if}>
											<span class="fa fa-check"></span>
										</button>
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
										<div class="col-6">
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
										<div class="col-6 text-end">
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
										<div class="col-12">
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
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

{* Products *}
{js id="products" priority=99 include=["design/{$settings->theme}/js/products/products.js"]}{/js}
{javascript minify=true}

{* Product *}
{css id="product" include=["design/{$settings->theme|escape}/css/products/product.css"]}{/css}
{stylesheet minify=true}

{js id="product" priority=99 include=["design/{$settings->theme|escape}/js/products/product.js"]}{/js}
{javascript minify=true}

{* Timer Action *}
{if !empty($product->sale_to)}
	{css id="countdown" include=["design/{$settings->theme|escape}/vendor/jq-timeTo/timeTo.css"]}{/css}
	{stylesheet minify=true}

	{js id="countdown" priority=99 include=["design/{$settings->theme|escape}/vendor/jq-timeTo/jquery.time-to.js"]}{/js}
	{javascript minify=true}

	<script>
		$('#countdown').each(function() {
			var prd = $(this).parent();
			$(this).timeTo({
				timeTo: new Date(parseInt($(this).attr('sale_to'))),
				displayDays: true,
				fontSize: 28,
				displayDays: 2,
				{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}theme: "black",{/if}
				displayCaptions: true,
				lang: "{$language->label|escape}",
				callback: function() {
					prd.find('#countdown').hide();
					prd.find('#countdown-title').hide();
					real = prd.find('form.variants .offers-price-old .price-value').first().html();
					if (typeof(real) == 'undefinded' || real == null) {
						return;
					}
					prd.find('form.variants .offers-price-old').first().remove();
					prd.find('form.variants .offers-price .price-value').first().html(real);
				}
			});
		});
	</script>
{/if}

{* Tooltip *}
<script>
	$(function() {
		$('[data-bs-toggle="tooltip"]').tooltip();
	});
</script>