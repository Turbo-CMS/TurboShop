<div class="card card-product-grid grid-big border-0 rounded-0 border-end border-bottom product products-tile">
	<div class="products-tile-inner">
		<div class="products-tile-content {if !$product->variant->stock && $product->variants|count < 2}opacity-50{/if}">
			<div class="badges position-absolute top-0 start-0 pt-2 ps-3">
				{if $product->variant->compare_price> 0}<span class="notify-badge badge bg-danger"><i class="fal fa-badge-percent me-1"></i>{$lang->badge_sale|escape}</span>{/if}
				{if $product->featured}<span class="notify-badge badge bg-primary"><i class="fal fa-thumbs-up me-1"></i>{$lang->badge_featured|escape}</span>{/if}
				{if $product->is_hit}<span class="notify-badge badge bg-success"><i class="fal fa-circle-star me-1"></i>{$lang->badge_hit|escape}</span>{/if}
				{if $product->is_new}<span class="notify-badge badge bg-warning"><i class="fal fa-badge-check me-1"></i>{$lang->badge_new|escape}</span>{/if}
			</div>
			<div class="position-absolute top-0 end-0 p-2 d-flex flex-column">
				{if $wishlist}
					<a class="btn btn-link" href="{$lang_link}wishlist/remove/{$product->url}">
						<i class="far fa-xmark text-secondary fs-5" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->delete|escape}"></i>
					</a>
				{elseif $wishlist_products && in_array($product->url, $wishlist_products)}
					<a class="btn btn-link" href="{$lang_link}wishlist">
						<i class="fa fa-heart text-warning" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_wishlist|escape}"></i>
					</a>
				{else}
					<a class="btn btn-link wishlist" href="{$lang_link}wishlist/{$product->url}">
						<i class="far fa-heart text-warning" data-result-text="{$lang->added_to_wishlist|escape}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_wishlist|escape}"></i>
					</a>
				{/if}
				{if isset($smarty.session.compared_products) && in_array($product->url, $smarty.session.compared_products)}
					<a class="btn btn-link" href="{$lang_link}compare">
						<i class="far fa-scale-balanced text-primary" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_compare|escape}"></i>
					</a>
				{else}
					<a class="btn btn-link compare" href="{$lang_link}compare/{$product->url}">
						<i class="far fa-scale-balanced text-secondary" data-result-text="{$lang->added_to_compare|escape}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_compare|escape}"></i>
					</a>
				{/if}
				<button class="btn btn-link product-card-quickview" type="button" data-url="{$lang_link}products/{$product->url}">
					<i class="far fa-eye text-secondary" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->quick_view|escape}"></i>
				</button>
			</div>
			<div class="img-wrap">
				{if $product->image}
					<a class="image text-decoration-none" href="{$lang_link}products/{$product->url}">
						{if $product->images|count > 1}
							<img class="first-image" data-src="{$product->image->filename|resize:340:340}" src="design/{$settings->theme|escape}/images/lazy.svg" alt="{$product->name|escape}">
							<img class="second-image" data-src="{$product->images[1]->filename|resize:340:340}" src="design/{$settings->theme|escape}/images/lazy.svg" alt="{$product->name|escape}">
						{else}
							<img data-src="{$product->image->filename|resize:340:340}" src="design/{$settings->theme|escape}/images/lazy.svg" alt="{$product->name|escape}">
						{/if}
					</a>
				{else}
					<a class="image" href="{$lang_link}products/{$product->url}"><img style="width: 170px; height: 170px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}"></a>
				{/if}
			</div>
			<div class="my-1">
				{if $product->related_products}
					<div class="related-products position-absolute ms-3">
						{foreach $product->related_products as $related_product}
							<a href="{$lang_link}products/{$related_product->url}" class="{if $related_product->variant->color_code == '#ffffff'}white{/if} {if $product->id == $related_product->id}active{/if}" {if $related_product->variant->color}data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$related_product->variant->color}"{/if}>
								<span style="background-color:{$related_product->variant->color_code}"></span>
							</a>
						{/foreach}
					</div>
				{/if}
			</div>
			<div class="px-3 pt-4 pb-2">
				<a data-product="{$product->id}" href="{$lang_link}products/{$product->url}" class="text-reset lh-sm text-decoration-none">{$product->name|escape}</a>
				<div class="mt-1">
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
					<div class="d-inline-block align-middle">
						<span class="me-1">{$product->ratings|string_format:"%.1f"}</span>
						<a class="text-muted text-decoration-none" href="{$lang_link}products/{$product->url}">
							<i class="far fa-message-lines me-1 small"></i>
							{$product->comments_count}
						</a>
					</div>
				</div>
				<div class="mt-1">
					{if $product->variant->stock}
						<div class="text-success mt-1">{$lang->ready_to_ship|escape}<i class="fal fa-truck-fast ms-1 small"></i></div>
					{else}
						<div class="text-danger mt-1"><i class="fa-light fa-circle-xmark me-1"></i>{$lang->not_available|escape}</div>
					{/if}
				</div>
				<div class="mt-1">
					{if $product->variant->compare_price > 0}
						<del class="text-secondary">
							<small>
								<span class="compare_price">{$product->variant->compare_price|convert}</span>
								{$currency->sign|escape}
							</small>
						</del>
					{/if}
					<div class="d-flex justify-content-between align-items-center">
						<div class="price fs-4 fw-semibold {if $product->variant->compare_price > 0}text-danger{/if}">{$product->variant->price|convert} {$currency->sign|escape}</div>
						<form class="variants" action="{$lang_link}cart">
							{foreach $product->variants as $v}
								<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} style="display:none;">
							{/foreach}
							<button type="submit" data-result-text="<i class='far fa-cart-plus text-success fs-5'></i>" class="btn btn-link p-0" value="{$lang->add_cart|escape}" title="{$lang->add_cart|escape}" {if !$product->variant->stock}disabled{/if}><i class="far fa-cart-shopping text-success fs-5"></i></button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="products-tile-hidden-holder">
			<div class="products-tile-hidden-content ng-star-inserted">
				<div class="products-tile-hidden-content-inner">
					{if $product->variants|count > 1}
						<div class="mb-3">
							{foreach $product->variants as $v}
								<a class="btn btn-sm btn-outline-option py-0 {if $product->variant->id==$v->id}active{/if} {if !$v->stock}position-relative disabled{/if}" href="{$lang_link}products/{$product->url}?variant={$v->id}" role="button">{$v->name}</a>
							{/foreach}
						</div>
					{/if}
					<div class="small text-muted">{$product->annotation}</div>
				</div>
			</div>
		</div>
	</div>
</div>