{* Product page *}

{* Quickview *}
{if isset($smarty.server.HTTP_X_REQUESTED_WITH) && $smarty.server.HTTP_X_REQUESTED_WITH == 'XMLHttpRequest'}
	{$wrapper = 'quickview.tpl' scope=global}
{/if}


{* Canonical page address *}
{$canonical="/products/{$product->url}" scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="https://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}catalog"><span itemprop="name">{$lang->catalog}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
		{foreach $category->path as $cat}
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}catalog/{$cat->url}"><span itemprop="name">{$cat->name|escape}</span></a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/foreach}
		{if isset($brand)}
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}catalog/{$cat->url}/{$brand->url}"><span itemprop="name">{$brand->name|escape}</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<span itemprop="name">{$product->name|escape}</span>
			<meta itemprop="position" content="{$level++}">
		</li>
	</ol>
</nav>
<!-- Breadcrumb #End /-->

<div itemscope itemtype="http://schema.org/Product">
	<link itemprop="image" href="{if isset($product->image)}{$product->image->filename|resize:570:570}{/if}">
	<meta itemprop="category" content="{$category->name|escape}">
	<meta itemprop="name" content="{$product->name|escape}">
	<!-- Page title -->
	<div class="row product">
		<div class="col-md-8">
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
					<div id="product-slider-pagination" class="row text-center text-lg-start {if $product->colors|count> 1}loader-container{/if}" {if $product->colors|count> 1}style="display: none;" {/if}>
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
		<div class="col-md-4 mb-4">
			<h1 data-product="{$product->id}" class="h3">{$product->name|escape}</h1>
			<div rel="{$product->id}" class="rating-wrap mb-2 ratings" {if $product->rating> 0}itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating" {/if}>
				<div class="rating-wrap">
					{if isset($smarty.session.rating_ids) && in_array($product->id, $smarty.session.rating_ids)}
						<div class="raty raty-read" data-score="{if $product->rating> 0}{$product->rating|string_format:'%.1f'}{/if}" data-id="{$product->id}" data-readonly="true"></div>
					{else}
						<div class="raty raty-write" data-score="{if $product->rating> 0}{$product->rating|string_format:'%.1f'}{/if}" data-id="{$product->id}" data-readonly="true"></div>
					{/if}
				</div>
				{if $product->rating> 0}
					<div class="label-rating">
						<span itemprop="ratingValue" class="rater-rating">{$product->rating|string_format:"%.1f"}</span>&#160;(<span itemprop="reviewCount" class="rater-rateCount">{$product->votes|string_format:"%.0f"} {$product->votes|plural:$lang->vote:$lang->votes:$lang->of_vote}</span>)
						<meta itemprop="worstRating" content="1">
						<meta itemprop="bestRating" content="5">
					</div>
				{/if}
			</div> <!-- rating-wrap.// -->
			{if isset($brand->image)}
				<a href="{$lang_link}catalog/{$category->url}/{$brand->url}">
					<img src="{$brand->image|resize_brands:75:25}" alt="{$brand->name|escape}" title="{$brand->name|escape}">
					<span style="display:none;" itemprop="brand">{$brand->name|escape}</span>
				</a>
			{/if}
			<p>{$product->annotation}</p>
			{if !empty($product->sale_to)}
				<div id="countdown_title" class="mb-1">{$lang->end_promotion}</div>
				<div class="mb-4" id="countdown" sale_to="{strtotime($product->sale_to) * 1000}"></div>
			{/if}
			{if $product->variant->sku}<div class="article mb-2">{$lang->sku}: <span itemprop="sku" class="value">{$product->variant->sku}</span></div>{/if}
			{if $product->variant->stock}
				<div data-stock="{$lang->not_available}" data-default="{$lang->In_stock}" class="availability text-success">{$lang->In_stock}</div>
			{else}
				<div data-stock="{$lang->not_available}" data-default="{$lang->In_stock}" class="availability text-danger">{$lang->not_available}</div>
			{/if}
			<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
				<link itemprop="url" href="{$config->root_url}/products/{$product->url}">
				<!-- Selecting a product option -->
				<form class="variants" action="{$lang_link}cart">
					<div class="mt-2 mb-3">
						<h3 class="offers_price"><span itemprop="price" content="{$product->variant->price|convert:'':false}" class="price_value">{$product->variant->price|convert}</span> <span itemprop="priceCurrency" content="{$currency->code|escape}" class="currency">{$currency->sign|escape}</span></h3>
						{if $product->variant->compare_price> 0}<h5 class="text-muted offers_price_old"><del><span class="price_value">{$product->variant->compare_price|convert}</span> <span class="currency">{$currency->sign|escape}</span></del></h5>{/if}
					</div>
					{if $product->colors|count> 1}
						<div class="loader-container" style="display: none;">
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
								<label class="form-label">{$lang->size}:</label>
							</div>
							<div id="variants" class="variants-size mb-3">
								{foreach $product->variants as $v}
									<label class="btn btn-sm btn-outline-secondary mb-1"><input type="radio" name="variant" value="{$v->id}" class="btn-check" {if $v@first}checked{/if} autocomplete="off">{$v->name}</label>
								{/foreach}
							</div>
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
									<a href="{$lang_link}products/{$related_product->url}" style="background-color:{$related_product->variant->color_code}" class="btn btn-sm rounded-circle mb-1 me-1 {if $related_product->variant->color_code == '#ffffff'}white{/if} {if $product->id == $related_product->id}active{/if}" {if $related_product->variant->color}data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$related_product->variant->color}" {/if}>
										<span class="fa fa-check"></span>
									</a>
								{/foreach}
							</div>
							<div class="{if $product->variants|count < 2}d-none{/if}">
								<div class="mb-0">
									<label class="form-label">{$lang->option}:</label>
								</div>
								<div class="variants-size mb-3">
									{foreach $product->variants as $v}
										<input type="radio" name="variant" value="{$v->id}" class="btn-check" id="btn-{$v->id}" data-price="{$v->price|convert}" data-stock="{$v->stock}" {if $v->compare_price}data-compare="{$v->compare_price|convert}" {/if} {if $v->name}data-name="{$v->name}" {/if} {if $v->sku}data-sku="{$v->sku}" {/if} {if $product->variant->id==$v->id}checked{/if} autocomplete="off">
										<label class="btn btn-sm btn-outline-secondary mb-1" for="btn-{$v->id}">{$v->name}</label>
									{/foreach}
								</div>
							</div>
						{else}
							<select name="variant" id="{if isset($prefix)}{$prefix}variant_{/if}{$product->id}" class="orderby form-select mb-4" data-productid="{$product->id}" {if $product->variants|count == 1}hidden{/if}>
								{foreach $product->variants as $v}
									<option value="{$v->id}" data-price="{$v->price|convert}" data-stock="{$v->stock}" {if $v->compare_price}data-compare="{$v->compare_price|convert}" {/if} {if $v->name}data-name="{$v->name}" {/if} {if $v->sku}data-sku="{$v->sku}" {/if} {if $product->variant->id==$v->id}selected{/if}>{$v->name}</option>
								{/foreach}
							</select>
						{/if}
					{/if}
					<input data-result-text="{$lang->added_cart}" type="submit" class="btn btn-primary btn-lg" id="add-to-cart" value="{$lang->add_cart}" {if !$product->variant->stock}disabled{/if}>
					<div class="btn-group" role="group" aria-label="Product button">
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
					<a class="btn btn-success btn-lg mt-3 fast-order-send-button {if !$product->variant->stock}disabled{/if}" id="fast-order" href="javascript:void(0)" role="button" data-name="{$product->name}" data-bs-toggle="modal" data-bs-target="#FastOrder"><i class="fal fa-shopping-bag"></i> {$lang->fast_order}</a>
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
		</div>
	</div>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item">
			<a class="{if isset($smarty.get.page) || isset($smarty.get.sort)}nav-link{else}nav-link active{/if}" id="body-tab" data-bs-toggle="tab" href="#body" role="tab" aria-controls="body" aria-selected="true">{$lang->description}</a>
		</li>
		{if isset($product->features)}
			<li class="nav-item">
				<a class="nav-link" id="features-tab" data-bs-toggle="tab" href="#features" role="tab" aria-controls="features" aria-selected="false">{$lang->feature}</a>
			</li>
		{/if}
		<li class="nav-item">
			<a class="nav-link {if isset($smarty.get.page) || isset($smarty.get.sort)}active{/if}" id="comments-tab" data-bs-toggle="tab" href="#comments" role="tab" aria-controls="comments" aria-selected="false">{$lang->comments_global} ({$comments_count})</a>
		</li>
		{if $cms_files}
			<li class="nav-item">
				<a class="nav-link" id="files-tab" data-bs-toggle="tab" href="#files" role="tab" aria-controls="files" aria-selected="false">{$lang->files_global}</a>
			</li>
		{/if}
		{if $product->videos}
			<li class="nav-item">
				<a class="nav-link" id="videos-tab" data-bs-toggle="tab" href="#videos" role="tab" aria-controls="videos" aria-selected="false">{$lang->videos_global}</a>
			</li>
		{/if}
	</ul>
	<div class="tab-content mt-4" id="myTabContent">
		<div itemprop="description" class="{if isset($smarty.get.page) || isset($smarty.get.sort)}tab-pane fade{else}tab-pane fade show active{/if}" id="body" role="tabpanel" aria-labelledby="body-tab">
			<div class="block-description">{$product->body}</div>
		</div>
		{if isset($product->features)}
			<div class="tab-pane fade" id="features" role="tabpanel" aria-labelledby="features-tab">
				<table class="table table-striped table-hover">
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
		{/if}
		<div class="tab-pane fade {if isset($smarty.get.page) || isset($smarty.get.sort)}show active{/if}" id="comments" role="tabpanel" aria-labelledby="comments-tab">
			{* Comments *}
			{include file='comments/comments_products.tpl'}
		</div>
		{if $cms_files}
			<div class="tab-pane fade" id="files" role="tabpanel" aria-labelledby="files-tab">
				<ul class="list-group list-group-flush">
					{foreach $cms_files as $file}
						<li class="list-group-item">
							<i class="fal fa-file text-primary"></i> <a href="{$config->cms_files_dir}{$file->filename}" class="text-decoration-none" target="_blank">{if $file->name}{$file->name}{else}{$file->filename}{/if}</a>
						</li>
					{/foreach}
				</ul>
			</div>
		{/if}
		{if $product->videos}
			<div class="tab-pane fade" id="videos" role="tabpanel" aria-labelledby="videos-tab">
				<ul class="list-group list-group-flush">
					{foreach $product->videos as $video}
						<li class="list-group-item">
							<div class="ratio ratio-16x9">
								<iframe src="https://www.youtube.com/embed/{$video->vid}" allowfullscreen="" frameborder="0"></iframe>
							</div>
						</li>
					{/foreach}
				</ul>
			</div>
		{/if}
	</div>
</div>

{if $prev_product || $next_product}
	<hr class="text-black-50">
	<div class="row">
		<div class="col-lg-6 col-sm-6 col-6 text-start">
			{if $prev_product}
				<a class="text-decoration-none" href="{$lang_link}products/{$prev_product->url}">←&nbsp;{$prev_product->name|escape}</a>
			{/if}
		</div>
		<div class="col-lg-6 col-sm-6 col-6 text-end">
			{if $next_product}
				<a class="text-decoration-none" href="{$lang_link}products/{$next_product->url}">{$next_product->name|escape}&nbsp;→</a>
			{/if}
		</div>
	</div>
	<hr class="text-black-50">
{/if}

{* Recommended products *}
{if $recommended_products}
	<h2 class="my-4">{$lang->recommended_products}</h2>
	<hr class="text-black-50">
	<div class="row">
		{foreach $recommended_products as $product}
			<div class="col-md-6 col-lg-6 col-xl-4">
				{include file='grid.tpl'}
			</div>
		{/foreach}
	</div>
{/if}

{if $brand}
	{get_products var=brand_products brand_id=$brand->id limit=3 sort=random}
	{if isset($brand_products)}
		<h2 class="my-4">{$lang->products_from_brand}</h2>
		<hr class="text-black-50">
		<div class="row">
			{foreach $brand_products as $product}
				<div class="col-md-6 col-lg-6 col-xl-4">
					{include file='grid.tpl'}
				</div>
			{/foreach}
		</div>
	{/if}
{/if}

{get_products var=cat_products category_id=$category->id limit=3}
{if $cat_products}
	<h2 class="my-4">{$lang->products_from_category}</h2>
	<hr class="text-black-50">
	<div class="row">
		{foreach $cat_products as $product}
			<div class="col-md-6 col-lg-6 col-xl-4">
				{include file='grid.tpl'}
			</div>
		{/foreach}
	</div>
{/if}