{* Product page *}

{* Canonical *}
{$canonical="/products/{$product->url}" scope=global}

{* Quickview *}
{if isset($smarty.server.HTTP_X_REQUESTED_WITH) && $smarty.server.HTTP_X_REQUESTED_WITH == 'XMLHttpRequest'}
	{$wrapper = 'modals/quickview.tpl' scope=global}
{/if}

{* Breadcrumb *}
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="https://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}">
				<span itemprop="name" title="{$lang->home}"><i class="fal fa-house me-2"></i>{$lang->home}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}catalog">
				<span itemprop="name">{$lang->catalog}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
		{foreach $category->path as $cat}
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}catalog/{$cat->url}">
					<span itemprop="name">{$cat->name|escape}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/foreach}
		{if isset($brand)}
			<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}catalog/{$cat->url}/{$brand->url}">
					<span itemprop="name">{$brand->name|escape}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
		<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<span itemprop="name">{$product->name|escape}</span>
			<meta itemprop="position" content="{$level++}">
		</li>
	</ol>
</nav>

<div itemscope itemtype="http://schema.org/Product">
	<link itemprop="image" href="{if isset($product->image)}{$product->image->filename|resize:570:570}{/if}">
	<meta itemprop="category" content="{$category->name|escape}">
	<meta itemprop="name" content="{$product->name|escape}">
	<div class="row product mb-3">
		{* Product Gallery *}
		<div class="col-md-7 pt-3">
			{* Big Images *}
			<div id="productImages" class="carousel slide" data-bs-ride="false">
				<div class="carousel-inner" role="listbox">
					<div class="icons">
						{if $product->variant->compare_price > 0}<span class="notify-badge badge bg-danger"><i class="fal fa-badge-percent me-1"></i>{$lang->badge_sale}</span>{/if}
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
				<div id="product-slider-pagination" class="product-gallery-thumblist {if $product->colors|count> 1}loader-container{/if}" {if $product->colors|count > 1}style="display: none;" {/if}>
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
		<div class="col-md-5 pt-4 pt-lg-1">
			<div class="product-details ms-auto pb-3">
				{* Product Name *}
				<h1 data-product="{$product->id}" class="h3">{$product->name|escape}</h1>

				{* Brand *}
				{if isset($brand->image) && $brand->image}
					<div class="float-end">
						<a href="{$lang_link}catalog/{$category->url}/{$brand->url}">
							<img src="{$brand->image|resize_brands:75:25}" alt="{$brand->name|escape}" title="{$brand->name|escape}">
							<span style="display:none;" itemprop="brand">{$brand->name|escape}</span>
						</a>
					</div>
				{/if}

				{* Rating *}
				<div rel="{$product->id}" class="rating-wrap mb-2 ratings" {if $product->rating > 0}itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating" {/if}>
					<div class="rating-wrap">
						{if isset($smarty.session.rating_ids) && in_array($product->id, $smarty.session.rating_ids)}
							<div class="raty raty-read" data-score="{if $product->rating > 0}{$product->rating|string_format:'%.1f'}{/if}" data-id="{$product->id}" data-readonly="true"></div>
						{else}
							<div class="raty raty-write" data-score="{if $product->rating > 0}{$product->rating|string_format:'%.1f'}{/if}" data-id="{$product->id}" data-readonly="true"></div>
						{/if}
					</div>
					{if $product->rating > 0}
						<div class="label-rating">
							<span itemprop="ratingValue" class="rater-rating">{$product->rating|string_format:"%.1f"}</span>&#160;(<span itemprop="reviewCount" class="rater-rateCount">{$product->votes|string_format:"%.0f"} {$product->votes|plural:$lang->vote:$lang->votes:$lang->of_vote}</span>)
							<meta itemprop="worstRating" content="1">
							<meta itemprop="bestRating" content="5">
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
				<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
					<link itemprop="url" href="{$config->root_url}/products/{$product->url}">
					<form class="variants" action="{$lang_link}cart">
						<div class="mt-2 mb-3">
							<h3 class="offers-price"><span itemprop="price" content="{$product->variant->price|convert:'':false}" class="price-value">{$product->variant->price|convert}</span> <span itemprop="priceCurrency" content="{$currency->code|escape}" class="currency">{$currency->sign|escape}</span></h3>
							{if $product->variant->compare_price > 0}<h5 class="text-muted offers-price-old"><del><span class="price-value">{$product->variant->compare_price|convert}</span> <span class="currency">{$currency->sign|escape}</span></del></h5>{/if}
						</div>
						{if $product->colors|count > 1}
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
					{* Schema.org *}
					<span style="display:none;">
						<time itemprop="priceValidUntil" datetime="{$product->created|date:'Ymd'}"></time>
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
			</div>
		</div>
	</div>

	{* Tabs *}
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
		{* Description *}
		<div itemprop="description" class="{if isset($smarty.get.page) || isset($smarty.get.sort)}tab-pane fade{else}tab-pane fade show active{/if}" id="body" role="tabpanel" aria-labelledby="body-tab">
			<div class="block-description">{$product->body}</div>
		</div>
		{* Features *}
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
		{* Comments *}
		<div class="tab-pane fade {if isset($smarty.get.page) || isset($smarty.get.sort)}show active{/if}" id="comments" role="tabpanel" aria-labelledby="comments-tab">
			{include file='comments/comments_products.tpl'}
		</div>
		{* Files *}
		{if $cms_files}
			<div class="tab-pane fade" id="files" role="tabpanel" aria-labelledby="files-tab">
				<ul class="list-group list-group-flush">
					{foreach $cms_files as $file}
						<li class="list-group-item">
							<i class="fal fa-file text-primary-emphasis"></i> <a href="{$config->cms_files_dir}{$file->filename}" class="text-decoration-none" target="_blank">{if $file->name}{$file->name}{else}{$file->filename}{/if}</a>
						</li>
					{/foreach}
				</ul>
			</div>
		{/if}
		{* Videos *}
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

{* Nex & Prev *}
{if $prev_product || $next_product}
	<hr class="text-black-50">
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
	<hr class="text-black-50">
{/if}

{* Recommended Products *}
{if $recommended_products}
	<h2 class="my-2">{$lang->related_products}</h2>
	<hr class="text-black-50">
	<div class="row">
		{foreach $recommended_products as $product}
			<div class="col-md-6 col-lg-6 col-xl-4">
				{include file='products/grid.tpl'}
			</div>
		{/foreach}
	</div>
{/if}

{* Products Brand Random *}
{if $brand}
	{get_products var=brand_products brand_id=$brand->id limit=3 sort=random}
	{if isset($brand_products)}
		<h2 class="my-2">{$lang->products_from_brand}</h2>
		<hr class="text-black-50">
		<div class="row">
			{foreach $brand_products as $product}
				<div class="col-md-6 col-lg-6 col-xl-4">
					{include file='products/grid.tpl'}
				</div>
			{/foreach}
		</div>
	{/if}
{/if}

{* Products Category Random *}
{get_products var=cat_products category_id=$category->id limit=3}
{if $cat_products}
	<h2 class="my-2">{$lang->products_from_category}</h2>
	<hr class="text-black-50">
	<div class="row">
		{foreach $cat_products as $product}
			<div class="col-md-6 col-lg-6 col-xl-4">
				{include file='products/grid.tpl'}
			</div>
		{/foreach}
	</div>
{/if}