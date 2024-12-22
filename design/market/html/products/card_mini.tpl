<div class="sticky-card">
	<div class="card mb-3">
		<div class="row g-0">
			<div class="col-md-3">
				<div class="card-img py-3">
					{if $product->image}
						<span class="image"><img src="{$product->image->filename|resize:96:96}" alt="{$product->name|escape}"></span>
					{else}
						<span><img style="width: 96px; height: 96px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}"></span>
					{/if}
				</div>
			</div>
			<div class="col-md-9">
				<div class="card-body">
					<h5 class="card-title">{$product->name|escape}</h5>
					<p class="card-text">{$product->annotation|strip_tags|truncate:120}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="card my-3">
		<div class="card-body">
			<div class="row g-2 d-flex align-items-center">
				<div class="col-6">
					{if $product->variant->compare_price > 0}
						<h6 class="text-muted offers-price-old mb-0">
							<del>
								<span>{$product->variant->compare_price|convert}</span><span class="small">{$currency->sign|escape}</span>
							</del>
						</h6>
					{/if}
					<h4 class="offers-price">
						<span class="{if $product->variant->compare_price > 0}text-danger{/if}">{$product->variant->price|convert}</span><span class="fs-6 {if $product->variant->compare_price > 0}text-danger{/if}">{$currency->sign|escape}</span>
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
								<i class="far fa-scale-balanced text-body-tertiary" data-result-text="{$lang->added_to_compare|escape}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_compare|escape}"></i>
							</a>
						{/if}
					</div>
				</div>
				<div class="col-12">
					<div class="d-flex flex-column gap-2">
						<form class="variants" action="{$lang_link}cart">
							{foreach $product->variants as $v}
								<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} style="display:none;">
							{/foreach}
							<button type="submit" data-result-text="<i class='far fa-cart-shopping me-2'></i>{$lang->added_cart|escape}" id="add-to-cart" class="btn btn-success w-100 mb-2" value="{$lang->add_cart|escape}" title="{$lang->add_cart|escape}" {if !$product->variant->stock}disabled{/if}>
								<i class="far fa-cart-shopping me-2"></i>
								{$lang->add_cart|escape}
							</button>
							<a class="btn btn-outline-success fast-order-send-button w-100 {if !$product->variant->stock}disabled{/if}" id="fast-order" href="javascript:void(0)" role="button" data-name="{$product->name}" data-bs-toggle="modal" data-bs-target="#fastOrder">
								<i class="far fa-rocket-launch me-2"></i>
								{$lang->fast_order|escape}
							</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>