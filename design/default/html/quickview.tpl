{* Quickview *}

<div class="quickview">
	<button type="button" class="btn-close float-end quickview__close" aria-label="Close"></button>
	<div class="row product">
		<div class="col-lg-8">
			<div id="ProductImages" class="carousel slide my-4" data-bs-ride="false">
				<div class="carousel-inner" role="listbox">
					<span class="icons">
						{if $product->variant->compare_price> 0}<span class="notify-badge badge bg-danger">{$lang->badge_sale}</span>{/if}
						{if $product->featured}<span class="notify-badge badge bg-primary">{$lang->badge_featured}</span>{/if}
						{if $product->is_hit}<span class="notify-badge badge bg-success">{$lang->badge_hit}</span>{/if}
						{if $product->is_new}<span class="notify-badge badge bg-warning">{$lang->badge_new}</span>{/if}
					</span>
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
			{if $product->images|count>1}
				<span class="d-sm-none d-md-block d-none">
					<div id="product-slider-pagination" class="row text-center text-lg-start">
						{foreach $product->images as $i=>$image name=images}
							<div id="image{$image->id}" class="col-lg-3 col-md-4 col-xs-6 mb-4">
								<a href="#" id="carousel-selector-{$image->id}" data-bs-target="#ProductImages" data-bs-slide-to="{$smarty.foreach.images.index}" class="d-block text-center img-thumbnail {if $smarty.foreach.images.first}selected{/if}">
									<img class="img-fluid thumbnail" src="{$image->filename|resize:95:95}" alt="{$product->name|escape}">
								</a>
							</div>
						{/foreach}
					</div>
				</span>
			{/if}
		</div>
		<div class="col-lg-4 mb-4">
			<h3 class="my-3">{$product->name|escape}</h3>
			<div rel="{$product->id}" class="rating-wrap mb-2 ratings" {if $product->rating> 0}itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating" {/if}>
				<div class="rating-wrap">
					{if $smarty.session.rating_ids && in_array($product->id, $smarty.session.rating_ids)}
						<div class="raty raty-read" data-score="{if $product->rating> 0}{$product->rating|string_format:"%.1f"}{/if}" data-id="{$product->id}" data-readonly="true"></div>
					{else}
						<div class="raty raty-write" data-score="{if $product->rating> 0}{$product->rating|string_format:"%.1f"}{/if}" data-id="{$product->id}" data-readonly="true"></div>
					{/if}
				</div>
				{if $product->rating> 0}
					<div class="label-rating">
						<span class="test-text">
							<span itemprop="ratingValue" class="rater-rating">{$product->rating|string_format:"%.1f"}</span>&#160;(<span itemprop="reviewCount" class="rater-rateCount">{$product->votes|string_format:"%.0f"} {$product->votes|plural:$lang->vote:$lang->votes:$lang->of_vote}</span>)
							<meta itemprop="worstRating" content="1">
							<meta itemprop="bestRating" content="5">
						</span>
					</div>
				{/if}
			</div>
			{if $brand->image}
				<a href="{$lang_link}catalog/{$category->url}/{$brand->url}">
					<img class="brand_img" src="{$brand->image|resize_brands:75:23}" alt="{$brand->name|escape}" title="{$brand->name|escape}">
					<span style="display:none;" itemprop="brand">{$brand->name|escape}</span>
				</a>
			{/if}
			<p>{$product->annotation}</p>
			{if !empty($product->sale_to)}
				<span id="countdown_title" class="block_title">{$lang->until_the_end_of_the_promotion_is_left} </span>
				<div class="mb-4" id="countdown" sale_to="{strtotime($product->sale_to) * 1000}"></div>
			{/if}
			{if $product->variant->sku}<span class="article"><span class="block_title">{$lang->sku}: </span><span itemprop="sku" class="value">{$product->variant->sku}</span></span>{/if}
			{if $product->variants|count> 0}
				<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
					<link itemprop="url" href="{$config->root_url}/products/{$product->url}">
					<!-- Selecting a product option -->
					<form class="variants" action="{$lang_link}cart">
						<h3 class="offers_price"><span itemprop="price" content="{$product->variant->price|convert:'':false}" class="price_value">{$product->variant->price|convert}</span> <span itemprop="priceCurrency" content="{$currency->code|escape}" class="currency">{$currency->sign|escape}</span></h3>
						{if $product->variant->compare_price> 0}<h5 class="mb-3 text-muted offers_price_old"><del><span class="price_value">{$product->variant->compare_price|convert}</span> <span class="currency">{$currency->sign|escape}</span></del></h5>{/if}
						{if $product->colors|count> 1}
							<table class="variations mb-2" {if $product->variants|count==1  && !$product->variant->name}display:none;{/if}' cellspacing="0">
								<tr {if $product->colors|count < 2}style="display:none;" {/if}>
									<td id="colors">
										<div class="detail-parameter-block-title">{$lang->colour}:</div>
										{foreach $product->colors as $k=>$v}
											<label tabindex="0" title="{$k}" {if $v['code']}style="background: {$v['code']}" {/if} {if $v@first}class="active" {/if}><input type="radio" name="color" value="{$k}" {if $v@first}checked{/if}>{if $v['code']}&nbsp;&nbsp;&nbsp;&nbsp;{else}{$k}{/if}</label>
										{/foreach}
									</td>
								</tr>
								<tr {if !$product->variant->name}style="display:none;"{/if}>
									<td id="variants">
										<div class="detail-parameter-block-title">{$lang->option}:</div>
										{foreach $product->variants as $v}
										<label tabindex="0" {if $v@first}class="active" {/if}><input type="radio" name="variant" value="{$v->id}" {if $v@first}checked{/if}>{$v->name}</label>
										{/foreach}
									</td>
								</tr>
							</table>
							<script>
								var variants = {
									{foreach $product->variants as $v} 
										'{$v->id}': {literal}{{/literal}'color':'{$v->color}', 'images_ids':[{$v->images_ids}], 'name':'{$v->name}', 'price':'{$v->price|convert}', 'sku':'{$v->sku}', 'compare_price':'{$v->compare_price|convert}'{literal}}{/literal},
									{/foreach}   
								};
							</script>
							{else}
								<select name="variant" id="{$prefix}variant_{$product->id}" class="orderby form-select mb-4" data-productid="{$product->id}" {if $product->variants|count == 1}hidden{/if}>
									{foreach $product->variants as $v}
										<option value="{$v->id}" data-price="{$v->price|convert}" {if $v->compare_price} data-compare="{$v->compare_price|convert}" {/if}{if $v->name} data-name="{$v->name}" {/if}{if $v->sku} data-sku="{$v->sku}" {/if}{if $product->variant->id==$v->id}selected{/if}>{$v->name}</option>
									{/foreach}
								</select>
							{/if}
						<input data-result-text="{$lang->added_cart}" type="submit" class="btn btn-primary btn-lg" value="{$lang->add_cart}">
						<div class="btn-group" role="group" aria-label="Product button">
							{if $wishlist_products && in_array($product->url, $wishlist_products)}
								<a class="btn btn-lg btn-link mr-1" href="wishlist"><i class="fal fa-heart text-danger"></i></a>
							{else}
								<a class="btn btn-lg btn-link wishlist mr-1" href="wishlist/{$product->url}"><i class="fal fa-heart text-muted"></i></a>
							{/if}
							{if $smarty.session.compared_products && in_array($product->url, $smarty.session.compared_products)}
								<a class="btn btn-lg btn-link" href="compare"><i class="fal fa-sync text-primary"></i></a>
							{else}
								<a class="btn btn-lg btn-link compare" href="compare/{$product->url}"><i class="fal fa-sync text-muted"></i></a>
							{/if}
						</div>
						<a class="btn btn-success btn-lg mt-3 fast-order-send-button" href="javascript:void(0)" role="button" data-name="{$product->name}" data-bs-toggle="modal" data-bs-target="#FastOrder"><i class="fal fa-shopping-bag"></i> {$lang->fast_order}</a>
					</form>
					<!-- Selecting a product option (The End) -->
					<span style="display:none;">
						<time itemprop="priceValidUntil" datetime="{$product->created|date:'Ymd'}"></time>
						{if $product->variant->stock> 0}
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
			{else}
				{$lang->not_available}
			{/if}
		</div>
	</div>
</div>

{js id="products" priority=99 include=[
"design/{$settings->theme}/js/products.js"
]}{/js}
{javascript minify=true}

{css id="product" include=[
"design/{$settings->theme|escape}/css/product.css"
]}{/css}
{stylesheet minify=true}

{js id="product" priority=99 include=[
"design/{$settings->theme|escape}/js/product.js",
"design/{$settings->theme|escape}/js/rating-product.js"
]}{/js}
{javascript minify=true}

{* Timer action *}
{if !empty($product->sale_to)}
	{css id="countdown" include=[
	"design/{$settings->theme|escape}/js/jq-timeTo/timeTo.css"
	]}{/css}
	{stylesheet minify=true}

	{js id="countdown" priority=99 include=[
	"design/{$settings->theme|escape}/js/jq-timeTo/jquery.time-to.js"
	]}{/js}
	{javascript minify=true}
	<script>
		$('#countdown').each(function() {
			var prd = $(this).parent();
			$(this).timeTo({
				timeTo: new Date(parseInt($(this).attr('sale_to'))),
				displayDays: true,
				fontSize: 28,
				displayDays: 2,
				{if $smarty.cookies.mode == 'mode'}
				theme: "black",
				{/if}
				displayCaptions: true,
				lang: "{$language->label|escape}",
				callback: function() {
					prd.find('#countdown').hide();
					prd.find('#countdown_title').hide();
					real = prd.find('form.variants .offers_price_old .price_value').first().html();
					if (typeof(real) == 'undefinded' || real == null) {
						return;
					}
					prd.find('form.variants .offers_price_old').first().remove();
					prd.find('form.variants .offers_price .price_value').first().html(real);
				}
			});
		});
	</script>
{/if}