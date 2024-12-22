<div class="card card-product-grid product {if !$product->variant->stock && $product->variants|count < 2}opacity-50{/if}">
	<div class="img-wrap">
		<div class="badges">
			{if $product->variant->compare_price> 0}<span class="notify-badge badge bg-danger"><i class="fal fa-badge-percent me-1"></i>{$lang->badge_sale|escape}</span>{/if}
			{if $product->featured}<span class="notify-badge badge bg-primary"><i class="fal fa-thumbs-up me-1"></i>{$lang->badge_featured|escape}</span>{/if}
			{if $product->is_hit}<span class="notify-badge badge bg-success"><i class="fal fa-circle-star me-1"></i>{$lang->badge_hit|escape}</span>{/if}
			{if $product->is_new}<span class="notify-badge badge bg-warning"><i class="fal fa-badge-check me-1"></i>{$lang->badge_new|escape}</span>{/if}
		</div>
		{if $product->image}
			<a class="image" href="{$lang_link}products/{$product->url}"><img src="{$product->image->filename|resize:240:240}" alt="{$product->name|escape}"></a>
		{else}
			<a class="image" href="{$lang_link}products/{$product->url}"><img style="width: 170px; height: 170px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}"></a>
		{/if}
	</div>
	<div class="my-1">
		{if $product->related_products}
			<div class="related-products position-absolute ms-3">
				{foreach $product->related_products as $related_product}
					<a href="{$lang_link}products/{$related_product->url}" class="{if $related_product->variant->color_code == '#ffffff'}white{/if} {if $product->id == $related_product->id}active{/if}" {if $related_product->variant->color}data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$related_product->variant->color}" {/if}>
						<span style="background-color:{$related_product->variant->color_code}"></span>
					</a>
				{/foreach}
			</div>
		{/if}
	</div>
	<div class="info-wrap">
		<div class="fix-height">
			<a data-product="{$product->id}" href="{$lang_link}products/{$product->url}" class="fw-semibold lh-sm text-decoration-none">{$product->name|escape}</a>
			<div class="mt-1">
				<ul class="rating-stars">
					<li style="width:{$product->rating*100/5|string_format:'%.0f'}%" class="stars-active">
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
				<div class="d-inline-block align-middle">
					<span class="me-1">{$product->rating|string_format:"%.1f"}</span>
					<a class="text-muted text-decoration-none" href="{$lang_link}products/{$product->url}">
						<i class="far fa-comment me-1"></i>
						{$product->comments_count}
					</a>
				</div>
			</div>
			<div class="mt-1">
				{if $product->variant->compare_price> 0}<del class="price-old"><small><span class="compare_price">{$product->variant->compare_price|convert}</span> {$currency->sign|escape}</small></del>{/if}
				<span class="price">{$product->variant->price|convert} {$currency->sign|escape}</span>
				{if $product->variant->stock}
					<div class="text-success mt-1"><i class="fal fa-circle-check me-1"></i>{$lang->In_stock|escape}</div>
				{else}
					<div class="text-danger mt-1"><i class="fa-light fa-circle-xmark me-1"></i>{$lang->not_available|escape}</div>
				{/if}
			</div>
		</div>
		<div class="btn-toolbar justify-content-between flex-nowrap align-items-center mt-0">
			{if $product->variants|count > 1}
				<a class="btn btn-secondary d-flex align-items-center" href="{$lang_link}products/{$product->url}" role="button">
					<i class="fal fa-external-link me-2"></i>{$lang->choose|escape}
				</a>
			{else}
				<form class="variants d-flex align-items-center" action="{$lang_link}cart">
					{foreach $product->variants as $v}
						<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} style="display:none;">
					{/foreach}
					<button type="submit" data-result-text="<i class='fal fa-shopping-bag me-2'></i>{$lang->added_cart|escape}" class="btn btn-primary d-flex align-items-center" value="{$lang->add_cart|escape}" title="{$lang->add_cart|escape}" {if !$product->variant->stock}disabled{/if}>
						<i class="fal fa-shopping-bag me-2"></i>{$lang->add_cart|escape}
					</button>
				</form>
			{/if}
			<div class="btn-group" role="group" aria-label="cardFooterButton">
				<button class="btn btn-link product-card-quickview" type="button" data-url="{$lang_link}products/{$product->url}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->quick_view|escape}">
					<i class="fal fa-eye text-muted"></i>
				</button>
				{if $wishlist}
					<a class="btn btn-link" href="{$lang_link}wishlist/remove/{$product->url}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->delete|escape}">
						<i class="fal fa-trash text-muted"></i>
					</a>
				{elseif $wishlist_products && in_array($product->url, $wishlist_products)}
					<a class="btn btn-link" href="{$lang_link}wishlist" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_wishlist|escape}">
						<i class="fal fa-heart text-danger"></i>
					</a>
				{else}
					<a class="btn btn-link wishlist" href="{$lang_link}wishlist/{$product->url}" data-result-text="{$lang->added_to_wishlist|escape}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_wishlist|escape}">
						<i class="fal fa-heart text-muted"></i>
					</a>
				{/if}
				{if isset($smarty.session.compared_products) && in_array($product->url, $smarty.session.compared_products)}
					<a class="btn btn-link" href="{$lang_link}compare" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_compare|escape}">
						<i class="fal fa-sync text-primary"></i>
					</a>
				{else}
					<a class="btn btn-link compare" href="{$lang_link}compare/{$product->url}" data-result-text="{$lang->added_to_compare|escape}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_compare|escape}">
						<i class="fal fa-sync text-muted"></i>
					</a>
				{/if}
			</div>
		</div>
	</div>
</div>