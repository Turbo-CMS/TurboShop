{foreach $products as $product}
	<div class="card card-product mb-4 {if !$product->variant->stock && $product->variants|count < 2}opacity-50{/if}">
		<div class="card-body product">
			<div class="row">
				<div class="col-md-3">
					<div class="img-wrap">
						<div class="badges">
							{if $product->variant->compare_price> 0}<span class="notify-badge badge bg-danger"><i class="fal fa-badge-percent me-1"></i>{$lang->badge_sale}</span>{/if}
							{if $product->featured}<span class="notify-badge badge bg-primary"><i class="fal fa-thumbs-up me-1"></i>{$lang->badge_featured}</span>{/if}
							{if $product->is_hit}<span class="notify-badge badge bg-success"><i class="fal fa-circle-star me-1"></i>{$lang->badge_hit}</span>{/if}
							{if $product->is_new}<span class="notify-badge badge bg-warning"><i class="fal fa-badge-check me-1"></i>{$lang->badge_new}</span>{/if}
						</div>
						{if isset($product->image) && $product->image}
							<a class="image" href="{$lang_link}products/{$product->url}"><img src="{$product->image->filename|resize:170:170}" alt="{$product->name|escape}"></a>
						{else}
							<a href="{$lang_link}products/{$product->url}"><img style="width: 170px; height: 170px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}"></a>
						{/if}
						<div class="my-1">
							{if isset($product->related_products)}
								<div class="related-products">
									{foreach $product->related_products as $related_product}
										<a href="{$lang_link}products/{$related_product->url}" class="{if $related_product->variant->color_code == '#ffffff'}white{/if} {if $product->id == $related_product->id}active{/if}" {if $related_product->variant->color}data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$related_product->variant->color}" {/if}>
											<span style="background-color:{$related_product->variant->color_code}"></span>
										</a>
									{/foreach}
								</div>
							{/if}
						</div>
					</div>

				</div>
				<div class="col-md-6">
					<a data-product="{$product->id}" class="fw-semibold text-decoration-none" href="{$lang_link}products/{$product->url}">{$product->name|escape}</a>
					<div class="mb-3">
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
								{if isset($product->comments_count)}
									{$product->comments_count}
								{/if}
							</a>
						</div>
					</div>
					<div>{$product->annotation}</div>
					{if isset($product->features)}
						<ul class="list-unstyled">
							{foreach $product->features|@array_slice:0:6 as $f}
								{if !$f->is_color}
									<li>
										<strong>{$f->name}:</strong>
										{foreach $f->values as $v}
											{$v->value|escape}{if !$v@last},{/if}
										{/foreach}
									</li>
								{/if}
							{/foreach}
						</ul>
					{/if}
				</div>
				<div class="col-md-3 border-start">
					<div class="action-wrap">
						<form class="variants" action="{$lang_link}cart">
							{foreach $product->variants as $v}
								<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} style="display:none;">
							{/foreach}
							<div class="h4 mb-2">
								<span class="price">{$product->variant->price|convert} {$currency->sign|escape}</span>
								{if $product->variant->compare_price> 0}<del class="price-old"> {$product->variant->compare_price|convert} {$currency->sign|escape}</del>{/if}
							</div>
							{if $product->variant->stock}
								<div class="text-success"><i class="fal fa-circle-check me-1"></i>{$lang->In_stock}</div>
							{else}
								<div class="text-danger"><i class="fa-light fa-circle-xmark me-1"></i>{$lang->not_available}</div>
							{/if}
							<div class="d-grid gap-2 d-block mt-3">
								{if $product->variants|count> 1}
									<a class="btn btn-secondary" href="{$lang_link}products/{$product->url}" role="button"><i class="fal fa-external-link me-2"></i>{$lang->choose}</a>
								{else}
									<button type="submit" data-result-text="<i class='fal fa-shopping-bag me-2'></i>{$lang->added_cart}" class="btn btn-primary" value="{$lang->add_cart}" title="{$lang->add_cart}" {if !$product->variant->stock}disabled{/if}><i class="fal fa-shopping-bag me-2"></i>{$lang->add_cart}</button>
								{/if}
								<a href="{$lang_link}products/{$product->url}" class="btn btn-secondary" role="button">{$lang->more_details}<i class="fal fa-chevron-right ms-2"></i></a>
							</div>
						</form>
						<div class="btn-group mt-2" role="group" aria-label="Card list button">
							<button class="btn btn-link product-card-quickview" type="button" data-url="{$lang_link}products/{$product->url}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->quick_view}"><i class="far fa-eye text-muted"></i></button>
							{if isset($wishlist) && $wishlist}
								<a class="btn btn-link" href="{$lang_link}wishlist/remove/{$product->url}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->delete}"><i class="fal fa-trash text-muted"></i></a>
							{elseif isset($wishlist_products) && in_array($product->url, $wishlist_products)}
								<a class="btn btn-link" href="{$lang_link}wishlist" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_wishlist}"><i class="fal fa-heart text-danger"></i></a>
							{else}
								<a class="btn btn-link wishlist" href="{$lang_link}wishlist/{$product->url}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_wishlist}"><i class="fal fa-heart text-muted"></i></a>
							{/if}
							{if isset($smarty.session.compared_products) && in_array($product->url, $smarty.session.compared_products)}
								<a class="btn btn-link" href="{$lang_link}compare" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->added_to_compare}"><i class="fal fa-sync text-primary"></i></a>
							{else}
								<a class="btn btn-link compare" href="{$lang_link}compare/{$product->url}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{$lang->add_to_compare}"><i class="fal fa-sync text-muted"></i></a>
							{/if}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/foreach}