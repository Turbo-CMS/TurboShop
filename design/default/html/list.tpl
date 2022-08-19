{foreach $products as $product}
	<article class="card card-product mb-4">
		<div class="card-body product">
			<div class="row">
				<aside class="col-md-3">
					<div class="img-wrap">
						<span class="badges">
							{if $product->variant->compare_price > 0}<span class="notify-badge badge bg-danger">{$lang->badge_sale}</span>{/if}
							{if $product->featured}<span class="notify-badge badge bg-primary">{$lang->badge_featured}</span>{/if}
							{if $product->is_new}<span class="notify-badge badge bg-warning">{$lang->badge_new}</span>{/if}
							{if $product->is_hit}<span class="notify-badge badge bg-success">{$lang->badge_hit}</span>{/if}
						</span>
						{if $product->image}
							<a class="image" href="{$lang_link}products/{$product->url}"><img src="{$product->image->filename|resize:170:170}" alt="{$product->name|escape}" /></a>
						{else}
							<a href="{$lang_link}products/{$product->url}"><img style="width: 170px; height: 170px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$c->name}" /></a>
						{/if}
					</div>
				</aside>
				<article class="col-md-6">
					<h4 class="title text-decoration-none"><a data-product="{$product->id}" class="text-decoration-none" href="{$lang_link}products/{$product->url}">{$product->name|escape}</a></h4>
					<div class="rating-wrap mb-2">
						<ul class="rating-stars">
							<li style="width:{$product->rating*100/5|string_format:"%.0f"}%" class="stars-active">
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
						<div class="label-rating">{$product->votes|string_format:"%.0f"} {$product->votes|plural:$lang->vote:$lang->votes:$lang->of_vote}</div>
					</div>
					{$product->annotation}
				</article>
				<aside class="col-md-3 border-start">
					<div class="action-wrap">
						{if $product->variants|count > 0}
							<form class="variants" action="{$lang_link}cart">
								{foreach $product->variants as $v}
									<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} style="display:none;" />
								{/foreach}
								<div class="price-wrap h4">
									<span class="price"> {$product->variant->price|convert} {$currency->sign|escape}</span>
									{if $product->variant->compare_price > 0}<del class="price-old"> {$product->variant->compare_price|convert} {$currency->sign|escape}</del>{/if}
								</div>
								<p class="text-success">{$lang->In_stock}</p>
								<p>
									<input type="submit" data-result-text="{$lang->added_cart}" class="btn btn-primary mb-1 me-1" value="{$lang->add_cart}" title="{$lang->add_cart}" />
									<a href="{$lang_link}products/{$product->url}" class="btn btn-secondary mb-1">{$lang->more_details}</a>
								</p>
							</form>
						{else}
							<p class="text-danger">{$lang->not_available}</p>
							<br>
						{/if}
						<div class="btn-group" role="group" aria-label="Card list button">
							<button class="btn btn-link product-card-quickview" type="button" data-url="{$lang_link}products/{$product->url}"><i class="far fa-eye text-muted"></i></button>
							{if $wishlist}
								<a class="btn btn-link" href="{$lang_link}wishlist/remove/{$product->url}"><i class="fal fa-heart text-danger"></i></a>
							{elseif $wishlist_products && in_array($product->url, $wishlist_products)}
								<a class="btn btn-link" href="{$lang_link}wishlist"><i class="fal fa-heart text-danger"></i></a>
							{else}
								<a class="btn btn-link wishlist" href="{$lang_link}wishlist/{$product->url}"><i class="fal fa-heart text-muted"></i></a>
							{/if}
							{if $smarty.session.compared_products && in_array($product->url, $smarty.session.compared_products)}
								<a class="btn btn-link" href="{$lang_link}compare"><i class="fal fa-sync text-primary"></i></a>
							{else}
								<a class="btn btn-link compare" href="{$lang_link}compare/{$product->url}"><i class="fal fa-sync text-muted"></i></a>
							{/if}
						</div>
					</div>
				</aside>
			</div>
		</div>
	</article>
{/foreach}