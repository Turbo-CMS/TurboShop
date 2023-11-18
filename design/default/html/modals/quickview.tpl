{* Quickview *}
<div class="quickview">
	<button type="button" class="btn-close float-end quickview-close" aria-label="Close"></button>
	<div class="row product">
		{* Product Gallery *}
		<div class="col-lg-7">
			{* Big Images *}
			<div id="productImages" class="carousel slide my-4" data-bs-ride="false">
				<div class="carousel-inner" role="listbox">
					<div class="icons">
						{if $product->variant->compare_price> 0}<span class="notify-badge badge bg-danger"><i class="fal fa-badge-percent me-1"></i>{$lang->badge_sale}</span>{/if}
						{if $product->featured}<span class="notify-badge badge bg-primary"><i class="fal fa-thumbs-up me-1"></i>{$lang->badge_featured}</span>{/if}
						{if $product->is_hit}<span class="notify-badge badge bg-success"><i class="fal fa-circle-star me-1"></i>{$lang->badge_hit}</span>{/if}
						{if $product->is_new}<span class="notify-badge badge bg-warning"><i class="fal fa-badge-check me-1"></i>{$lang->badge_new}</span>{/if}
					</div>
					{if $product->image}
						{foreach $product->images as $i=>$image name=img}
							<div class="carousel-item image {if $smarty.foreach.img.first}active{/if}">
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
			</div>
			{* Gallery Thumblist *}
			{if $product->images|count>1}
				<div id="product-slider-pagination" class="product-gallery-thumblist">
					{foreach $product->images as $i => $image name=images}
						<div id="image{$image->id}">
							<a id="carousel-selector-{$image->id}" class="product-gallery-thumblist-item d-flex justify-content-center align-items-center {if $smarty.foreach.images.first}selected{/if}" href="#" data-bs-target="#productImages" data-bs-slide-to="{$smarty.foreach.images.index}">
								<img src="{$image->filename|resize:95:95}" alt="{$product->name|escape}">
							</a>
						</div>
					{/foreach}
				</div>
			{/if}
		</div>

		<div class="col-lg-5 mb-4">
			<div class="product-details ms-auto pb-3">
				{* Product Name *}
				<h3 class="my-3">{$product->name|escape}</h3>

				{* Brand *}
				{if isset($brand->image)}
					<div class="float-end">
						<a href="{$lang_link}catalog/{$category->url}/{$brand->url}">
							<img src="{$brand->image|resize_brands:75:25}" alt="{$brand->name|escape}" title="{$brand->name|escape}">
							<span style="display:none;" itemprop="brand">{$brand->name|escape}</span>
						</a>
					</div>
				{/if}

				{* Rating *}
				<div rel="{$product->id}" class="rating-wrap mb-2 ratings">
					<div class="rating-wrap">
						{if isset($smarty.session.rating_ids) && in_array($product->id, $smarty.session.rating_ids)}
							<div class="raty raty-read" data-score="{if $product->rating> 0}{$product->rating|string_format:'%.1f'}{/if}" data-id="{$product->id}" data-readonly="true"></div>
						{else}
							<div class="raty raty-write" data-score="{if $product->rating> 0}{$product->rating|string_format:'%.1f'}{/if}" data-id="{$product->id}" data-readonly="true"></div>
						{/if}
					</div>
					{if $product->rating > 0}
						<div class="label-rating">
							<span class="rater-rating">{$product->rating|string_format:'%.1f'}</span>&#160;(<span class="rater-rateCount">{$product->votes|string_format:'%.0f'} {$product->votes|plural:$lang->vote:$lang->votes:$lang->of_vote}</span>)
						</div>
					{/if}
				</div>

				{* Annotation *}
				<div class="my-3">{$product->annotation}</div>

				{* Timer Action *}
				{if !empty($product->sale_to)}
					<div id="countdown-title" class="mb-1">{$lang->end_promotion}</div>
					<div class="mb-4" id="countdown" sale_to="{strtotime($product->sale_to) * 1000}"></div>
				{/if}

				{* SKU *}
				{if $product->variant->sku}<div class="article mb-2">{$lang->sku}: <span itemprop="sku" class="value">{$product->variant->sku}</span></div>{/if}

				{* Stock *}
				{if $product->variant->stock}
					<div data-stock="<i class='fa-light fa-circle-xmark me-2'></i>{$lang->not_available}" data-default="<i class='fal fa-circle-check me-2'></i>{$lang->In_stock}" class="availability text-success"><i class="fal fa-circle-check me-2"></i>{$lang->In_stock}</div>
				{else}
					<div data-stock="<i class='fa-light fa-circle-xmark me-2'></i>{$lang->not_available}" data-default="<i class='fal fa-circle-check me-2'></i>{$lang->In_stock}" class="availability text-danger"><i class="fa-light fa-circle-xmark me-2"></i>{$lang->not_available}</div>
				{/if}

				{* Variants *}
				<div class="mb-0">
					<form class="variants" action="{$lang_link}cart">
						<div class="mt-2 mb-3">
							<h3 class="offers-price"><span class="price-value">{$product->variant->price|convert}</span> <span class="currency">{$currency->sign|escape}</span></h3>
							{if $product->variant->compare_price> 0}<h5 class="text-muted offers-price-old"><del><span class="price-value">{$product->variant->compare_price|convert}</span> <span class="currency">{$currency->sign|escape}</span></del></h5>{/if}
						</div>
						{if $product->colors|count> 1}
							<div class="mb-0">
								<label class="form-label">{$lang->color}:</label>
							</div>
							<div id="colors" class="mb-3 color-product {if $product->colors|count < 2}d-none{/if}">
								{foreach $product->colors as $k=>$v}
									<label class="btn btn-sm rounded-circle mb-1 me-1 {if $v@first}active{/if} {if $v['code'] == '#ffffff'}white{/if}" style="background: {$v['code']}" {if $k}data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$k}" {/if}>
										<input type="radio" name="color" value="{$k}" class="btn-check" {if $v@first}checked{/if} autocomplete="off">
										<span class="fa fa-check"></span>
									</label>
								{/foreach}
							</div>
							<div class="mb-0">
								{if $category->id == '8'}
									<label class="form-label">{$lang->size}:</label>
								{else}
									<label class="form-label">{$lang->option}:</label>
								{/if}
							</div>
							<div id="variants" class="variants-size mb-3">
								{foreach $product->variants as $v}
									<label class="btn btn-sm btn-outline-secondary mb-1 me-1"><input type="radio" name="variant" value="{$v->id}" class="btn-check" {if $v@first}checked{/if} autocomplete="off">{$v->name}</label>
								{/foreach}
							</div>
							<script>
								var variants = {
									{foreach $product->variants as $v} 
										'{$v->id}': {literal}{{/literal}'color':'{$v->color}', 'images_ids':[{$v->images_ids}], 'name':'{$v->name}', 'stock':'{$v->stock}', 'price':'{$v->price|convert}', 'sku':'{$v->sku}', 'compare_price':'{$v->compare_price|convert}'{literal}}{/literal},
									{/foreach}   
								};
							</script>
						{else}
							{if $related_products}
								<div class="mb-0">
									<label class="form-label"><strong>{$lang->color}</strong>: <span class="text-secondary">{$product->variant->color}</span></label>
								</div>
								<div class="color-product mb-3">
									{foreach $related_products as $related_product}
										<button data-url="{$lang_link}products/{$related_product->url}" type="button" style="background-color:{$related_product->variant->color_code}" class="btn btn-sm product-card-quickview rounded-circle mb-1 me-1 {if $related_product->variant->color_code == '#ffffff'}white{/if} {if $product->id == $related_product->id}active{/if}" {if $related_product->variant->color}data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$related_product->variant->color}" {/if}>
											<span class="fa fa-check"></span>
										</button>
									{/foreach}
								</div>
								<div class="{if $product->variants|count < 2}d-none{/if}">
									<div class="mb-0">
										<label class="form-label">{$lang->option}:</label>
									</div>
									<div class="variants-size mb-3">
										{foreach $product->variants as $v}
											<input type="radio" name="variant" value="{$v->id}" class="btn-check" id="btn-{$v->id}" data-price="{$v->price|convert}" data-stock="{$v->stock}" {if $v->compare_price}data-compare="{$v->compare_price|convert}" {/if} {if $v->name}data-name="{$v->name}" {/if} {if $v->sku}data-sku="{$v->sku}" {/if} {if $product->variant->id==$v->id}checked{/if} autocomplete="off">
											<label class="btn btn-sm btn-outline-secondary mb-1 me-1" for="btn-{$v->id}">{$v->name}</label>
										{/foreach}
									</div>
								</div>
							{else}
								<select name="variant" id="{if isset($prefix)}{$prefix}variant-{/if}{$product->id}" class="orderby form-select mb-4" data-productid="{$product->id}" {if $product->variants|count == 1}hidden{/if}>
									{foreach $product->variants as $v}
										<option value="{$v->id}" data-price="{$v->price|convert}" data-stock="{$v->stock}" {if $v->compare_price}data-compare="{$v->compare_price|convert}" {/if} {if $v->name}data-name="{$v->name}" {/if} {if $v->sku}data-sku="{$v->sku}" {/if} {if $product->variant->id==$v->id}selected{/if}>{$v->name}</option>
									{/foreach}
								</select>
							{/if}
						{/if}
						<button type="submit" data-result-text="<i class='fal fa-shopping-bag me-2'></i>{$lang->added_cart}" id="add-to-cart" class="btn btn-primary btn-lg mb-3" value="{$lang->add_cart}" title="{$lang->add_cart}" {if !$product->variant->stock}disabled{/if}><i class="fal fa-shopping-bag me-2"></i>{$lang->add_cart}</button>
						<div class="btn-group mb-3" role="group" aria-label="Product button">
							{if isset($wishlist_products) && in_array($product->url, $wishlist_products)}
								<a class="btn btn-lg btn-link mr-1" href="{$lang_link}wishlist" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_wishlist}"><i class="fal fa-heart text-danger"></i></a>
							{else}
								<a class="btn btn-lg btn-link wishlist mr-1" href="{$lang_link}wishlist/{$product->url}" data-result-text="{$lang->added_to_wishlist}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_wishlist}"><i class="fal fa-heart text-muted"></i></a>
							{/if}
							{if isset($smarty.session.compared_products) && in_array($product->url, $smarty.session.compared_products)}
								<a class="btn btn-lg btn-link" href="{$lang_link}compare" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_compare}"><i class="fal fa-sync text-primary"></i></a>
							{else}
								<a class="btn btn-lg btn-link compare" href="{$lang_link}compare/{$product->url}" data-result-text="{$lang->added_to_compare}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_compare}"><i class="fal fa-sync text-muted"></i></a>
							{/if}
						</div>
						<div class="mb-3">
							<a class="btn btn-success btn-lg fast-order-send-button {if !$product->variant->stock}disabled{/if}" id="fast-order" href="javascript:void(0)" role="button" data-name="{$product->name}" data-bs-toggle="modal" data-bs-target="#fastOrder"><i class="fal fa-rocket-launch me-2"></i>{$lang->fast_order}</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

{js id="products" priority=99 include=["design/{$settings->theme}/js/products.js"]}{/js}
{javascript minify=true}

{css id="product" include=["design/{$settings->theme|escape}/css/product.css"]}{/css}
{stylesheet minify=true}

{js id="product" priority=99 include=[
	"design/{$settings->theme|escape}/js/product.js",
"design/{$settings->theme|escape}/js/rating-product.js"
]}{/js}
{javascript minify=true}

{* Timer Action *}
{if !empty($product->sale_to)}
	{css id="countdown" include=["design/{$settings->theme|escape}/js/jq-timeTo/timeTo.css"]}{/css}
	{stylesheet minify=true}

	{js id="countdown" priority=99 include=["design/{$settings->theme|escape}/js/jq-timeTo/jquery.time-to.js"]}{/js}
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

<script>
	$(function() {
		$('[data-bs-toggle="tooltip"]').tooltip();
	});
</script>