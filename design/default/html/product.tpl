{* Product page *}

{* Quickview *}
{if $smarty.server.HTTP_X_REQUESTED_WITH == 'XMLHttpRequest'}
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
		{if $brand}
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
	<link itemprop="image" href="{$product->image->filename|resize:570:570}">
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
					<div id="product-slider-pagination" class="row text-center text-lg-start {if $product->colors|count> 1}loader-container{/if}" {if $product->colors|count> 1}style="display: none;"{/if}>
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
			</div> <!-- rating-wrap.// -->
			{if $brand->image}
				<a href="{$lang_link}catalog/{$category->url}/{$brand->url}">
					<img class="brand_img" src="{$brand->image|resize_brands:75:25}" alt="{$brand->name|escape}" title="{$brand->name|escape}">
					<span style="display:none;" itemprop="brand">{$brand->name|escape}</span>
				</a>
			{/if}
			<p>{$product->annotation}</p>
			{if !empty($product->sale_to)}
				<span id="countdown_title" class="block_title">{$lang->end_promotion} </span>
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
							<div class="loader-container circle-pulse-multiple" style="display: none;">
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
							</div>
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
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" id="body-tab" data-bs-toggle="tab" href="#body" role="tab" aria-controls="body" aria-selected="true">{$lang->description}</a>
		</li>
		{if $product->features}
			<li class="nav-item">
				<a class="nav-link" id="features-tab" data-bs-toggle="tab" href="#features" role="tab" aria-controls="features" aria-selected="false">{$lang->feature}</a>
			</li>
		{/if}
		<li class="nav-item">
			<a class="nav-link" id="comments-tab" data-bs-toggle="tab" href="#comments" role="tab" aria-controls="comments" aria-selected="false">{$lang->comments_global} {if $settings->comments_tree_products == "on"}({$comments_count}){else}({$comments|count}){/if}</a>
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
		<div itemprop="description" class="tab-pane fade show active" id="body" role="tabpanel" aria-labelledby="body-tab"><div class="block-description">{$product->body}</div></div>
		{if $product->features}
			<div class="tab-pane fade" id="features" role="tabpanel" aria-labelledby="features-tab">
				<table class="table table-striped">
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
		<div class="tab-pane fade" id="comments" role="tabpanel" aria-labelledby="comments-tab">
			{* Comments *}
			{if $settings->comments_tree_products == "on"}
				{include file='comments/comments_tree_products.tpl'}
			{else}
				{include file='comments/comments_products.tpl'}
			{/if}
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

{* Related products *}
{if $related_products}
	<h2 class="my-4">{$lang->related_products}</h2>
	<hr class="text-black-50">
	<div class="row">
		{foreach $related_products as $product}
			{include file='grid.tpl'}
		{/foreach}
	</div>
{/if}

{if $brand}
	{get_products var=brand_products brand_id=$brand->id no_id=$no_id limit=3 sort=random}
	{if $brand_products}
		<h2 class="my-4">{$lang->products_from_brand}</h2>
		<hr class="text-black-50">
		<div class="row">
			{foreach $brand_products as $product}
				{include file='grid.tpl'}
			{/foreach}
		</div>
	{/if}
{/if}

{get_products var=cat_products category_id=$category->id  no_id=$no_id limit=3}
{if $cat_products}
	<h2 class="my-4">{$lang->products_from_category}</h2>
	<hr class="text-black-50">
	<div class="row">
		{foreach $cat_products as $product}
			{include file='grid.tpl'}
		{/foreach}
	</div>
{/if}