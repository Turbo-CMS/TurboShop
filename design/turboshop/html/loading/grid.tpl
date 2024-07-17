<div class="catalog-block__inner flexbox height-100" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/Product">
	{if $product->annotation}
		<meta itemprop="description" content="{$product->annotation|escape}">
	{/if}
	<div class="image-list {if $theme_settings->products_grid_img_corner}catalog-block__item--img-corner{/if}">
		<div class="image-list-wrapper js-image-block">
			<div class="sticker sticker--upper">
				{if $product->variant->compare_price> 0}
					<div>
						<div class="sticker__item sticker__item--stock font_10">{$lang->badge_sale}</div>
					</div>
				{/if}
				{if $product->featured}
					<div>
						<div class="sticker__item sticker__item--recommend font_10">{$lang->badge_featured}</div>
					</div>
				{/if}
				{if $product->is_new}
					<div>
						<div class="sticker__item sticker__item--new font_10">{$lang->badge_new}</div>
					</div>
				{/if}
				{if $product->is_hit}
					<div>
						<div class="sticker__item sticker__item--hit font_10">{$lang->badge_hit}</div>
					</div>
				{/if}
				{if !empty($product->sale_to)}
					<div>
						<div class="countdown countdown-type-1 countdown--icons countdown--shadowed compact">
							<div class="countdown__inner">
								<span class="countdown__active-to hidden">{$product->sale_to}</span>
								<span class="countdown__icon countdown__item"></span>
								<span class="countdown__items"></span>
							</div>
						</div>
					</div>
				{/if}
			</div>
			<div class="btn-fast-view rounded-x hide-600">
				<div data-event="jqm" class="btn btn-xs btn-default" data-name="fast_view" data-url="{$lang_link}products/{$product->url}?tpl=quickview">
					{$lang->quick_view}
				</div>
			</div>
			<a href="{$lang_link}products/{$product->url}" class="image-list__link">
				<span class="section-gallery-wrapper js-replace-gallery flexbox image">
				{if $product->images|count > 1 && $theme_settings->products_img_gallery && $theme_settings->products_img_gallery_limit > 1}
						{foreach $product->images as $i=>$image name=img}
							<span class="section-gallery-wrapper__item {if $smarty.foreach.img.first}active{/if}">
								<span class="section-gallery-wrapper__item-nav"></span>
								<img class="lazyload img-responsive js-replace-img ls-is-cached" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$image->filename|resize:700:700}" data-big="{$image->filename|resize:700:700}" alt="{$product->name|escape}" title="{$product->name|escape}" />
							</span>
						{/foreach}
					{else}
						<span class="section-gallery-wrapper__item active">
							<span class="section-gallery-wrapper__item-nav section-gallery-wrapper__item_hidden"></span>
							{if isset($product->image) && $product->image}
								<img class="lazyload img-responsive js-replace-img ls-is-cached" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$product->image->filename|resize:700:700}" data-big="{$product->image->filename|resize:700:700}" alt="{$product->name|escape}" title="{$product->name|escape}" />
							{else}
								<img class="lazyload img-responsive js-replace-img ls-is-cached" style="width: 170px; height: 170px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" data-big="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}" title="{$product->name|escape}" />
							{/if}
						</span>
					{/if}
				</span>
			</a>
			{if $product->images|count > 1 && $theme_settings->products_img_gallery && $theme_settings->products_img_gallery_limit > 1}
				<span class="section-gallery-nav hide-600">
					<span class="section-gallery-nav__wrapper">
						{foreach $product->images as $i=>$image name=img}
							<span class="section-gallery-nav__item bg-theme-hover {if $smarty.foreach.img.first}active{/if}"></span>
						{/foreach}
					</span>
				</span>
			{/if}
		</div>
		{if $product->variant->compare_price > $product->variant->price && $product->variant->price > 0}
			<div class="price-economy">
				<span class="js-price-economy__val price-economy__val sticker__item--stock font_12">{round((($product->variant->price-$product->variant->compare_price)/$product->variant->compare_price)*100, 0)}%</span>
			</div>
		{/if}
	</div>
	<meta itemprop="name" content="{$product->name|escape}">
	<link itemprop="url" href="{$lang_link}products/{$product->url}">
	<div class="catalog-block__info flex-1 flexbox flexbox--justify-beetwen" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
		<div class="catalog-block__info-top">
			<div class="catalog-block__info-inner">
				<div class="js-popup-price">
					<div class="price color_222">
						<div class="line-block line-block--6 line-block--align-baseline line-block--flex-wrap">
							<div class="line-block__item">
								<div class="price__new">
									<span class="price__new-val font_18 font_14--to-600">
										<span class="js-price__new-val">{$product->variant->price|convert}</span> {$currency->sign|escape}
										<meta itemprop="price" content="{$product->variant->price|convert:'':false}">
										<meta itemprop="priceCurrency" content="{$currency->code|escape}">
									</span>
								</div>
							</div>
							{if $product->variant->compare_price > 0}
								<div class="line-block__item">
									<div class="price__old">
										<span class="price__old-val font_12 color_999">
											<span class="js-price__old-val">{$product->variant->compare_price|convert}</span> {$currency->sign|escape}
										</span>
									</div>
								</div>
							{/if}
						</div>
					</div>
				</div>
				<div class="catalog-block__info-title linecamp-4 height-auto-t600 font_15 font_14--to-600">
					<link itemprop="url" href="{$lang_link}products/{$product->url}">
					<a href="{$lang_link}products/{$product->url}" class="dark_link switcher-title js-popup-title color-theme-target">
						<span data-product="{$product->id}">{$product->name|escape}</span>
					</a>
				</div>
				<div class="catalog-block__info-tech">
					<div class="line-block line-block--12 flexbox--wrap js-popup-info">
						<div class="line-block__item font_13 font_12--to-600">
							<div class="rating" title="{if $product->ratings|string_format:'%.1f'|floatval > 0}{$lang->rating} {$product->ratings|string_format:'%.1f'} {$lang->out_of} 5{else}{$lang->no_ratings}{/if}">
								<div class="line-block line-block--4">
									<div class="line-block__item flexbox">
										<i class="svg inline rating__star-svg {if $product->rating > 0}rating__star-svg--filled{/if}" aria-hidden="true">
											<svg width="13" height="13">
												<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#star-13-13"></use>
											</svg>
										</i>
									</div>
									<div class="line-block__item rating__value">{$product->ratings|string_format:'%.1f'}</div>
								</div>
							</div>
						</div>
						<div class="line-block__item font_13 font_12--to-600 js-status-container" data-stock="{$lang->not_available}" data-default="{$lang->in_stock}">
							{if $product->variant->stock}
								<link itemprop="availability" href="https://schema.org/InStock">
								<span class="js-replace-status status-icon">{$lang->in_stock}</span>
							{else}
								<link itemprop="availability" href="http://schema.org/OutOfStock">
								<span class="js-replace-status status-icon nostock">{$lang->not_available}</span>
							{/if}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="catalog-block__info-bottom catalog-block__info-bottom--with-sku">
		<form class="variants" action="{$lang_link}cart">
			<div class="line-block line-block--8 line-block--8-vertical flexbox--wrap flexbox--justify-center">
				<div class="line-block__item catalog-grid__info-bottom js-btn-state-wrapper flex-1">
					<div class="js-replace-btns js-config-btns">
						<div class="buy_block btn-actions__inner">
							<div class="buttons">
								<div class="line-block line-block--12-vertical line-block--align-normal flexbox--direction-column">
									<div class="line-block__item">
										<span class="item-action item-action--basket">
											{if $product->variants|count == 1 || $recommended_products}
												{foreach $product->variants as $v}
													<input name="variant" value="{$v->id}" type="radio" {if $v@first}checked{/if} style="display:none;">
												{/foreach}
											{/if}
											<button id="add-to-cart" type="submit" data-result-text="{$lang->added_cart}" class="btn btn-default btn-sm btn-wide to_cart animate-load {if !$product->variant->stock}disabled{/if}" value="{$lang->add_cart}" title="{$lang->add_cart}" {if !$product->variant->stock}disabled{/if}>{$lang->add_cart}</button>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="line-block__item js-replace-icons">
					{if isset($wishlist) && $wishlist}
						<div class="item-action item-action--horizontal item-action--favorite active">
							<a href="{$lang_link}wishlist/remove/{$product->url}" rel="nofollow" class="item-action__inner item-action__inner--md fill-theme-use-svg-hover fill-dark-light-block active" title="{$lang->delete}">
								<i class="svg inline" aria-hidden="true">
									<svg width="18" height="16">
										<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
									</svg>
								</i>
							</a>
						</div>
					{elseif isset($wishlist_products) && in_array($product->url, $wishlist_products)}
						<div class="item-action item-action--horizontal item-action--favorite active">
							<a href="{$lang_link}wishlist" class="item-action__inner item-action__inner--md fill-theme-use-svg-hover fill-dark-light-block active" title="{$lang->added_to_wishlist}">
								<i class="svg inline" aria-hidden="true">
									<svg width="18" height="16">
										<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
									</svg>
								</i>
							</a>
						</div>
					{else}
						<div class="item-action item-action--horizontal item-action--favorite">
							<a href="{$lang_link}wishlist/{$product->url}" rel="nofollow" class="wishlist item-action__inner item-action__inner--md fill-theme-use-svg-hover fill-dark-light-block" title="{$lang->add_to_wishlist}" data-title_added="{$lang->added_to_wishlist}">
								<i class="svg inline" aria-hidden="true">
									<svg width="18" height="16">
										<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
									</svg>
								</i>
							</a>
						</div>
					{/if}
					{if isset($smarty.session.compared_products) && in_array($product->url, $smarty.session.compared_products)}
						<div class="item-action item-action--horizontal item-action--compare active">
							<a href="{$lang_link}compare" class="item-action__inner item-action__inner--md fill-theme-use-svg-hover fill-dark-light-block active" title="{$lang->added_to_compare}">
								<i class="svg inline" aria-hidden="true">
									<svg width="20" height="16">
										<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#compare-20-16"></use>
									</svg>
								</i>
							</a>
						</div>
					{else}
						<div class="item-action item-action--horizontal item-action--compare">
							<a href="{$lang_link}compare/{$product->url}" rel="nofollow" class="compare item-action__inner item-action__inner--md fill-theme-use-svg-hover fill-dark-light-block" title="{$lang->add_to_compare}" data-title_added="{$lang->added_to_compare}">
								<i class="svg inline" aria-hidden="true">
									<svg width="20" height="16">
										<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#compare-20-16"></use>
									</svg>
								</i>
							</a>
						</div>
					{/if}
				</div>
			</div>
			{if isset($product->related_products) && $product->related_products}
				<div class="catalog-block__offers hide-600">
					<div class="sku-props sku-props--block">
						<div class="line-block line-block--flex-wrap line-block--40 line-block--align-flex-end line-block--flex-100">
							<div class="line-block__item sku-props__inner sku-props--pict">
								<div class="sku-props__item">
									<div class="sku-props__title color_666">
										{$lang->color} : <span class="sku-props__js-size">{$product->variant->color}</span>
									</div>
									<div class="line-block line-block--flex-wrap line-block--6 sku-props__values">
										{foreach $product->related_products as $related_product}
											<div class="line-block__item">
												<div class="js-sku-props__value sku-props__value sku-props__value--pict {if $product->id == $related_product->id}sku-props__value--active{/if} {if $related_product->variant->color_code == '#ffffff'}white{/if}" data-title="{$related_product->variant->color}" title="{$related_product->variant->color}" style="background-color:{$related_product->variant->color_code}" data-url="{$lang_link}products/{$related_product->url}?tpl=grid">
													{$related_product->variant->color}
												</div>
											</div>
										{/foreach}
									</div>
								</div>
							</div>
							{if $product->variants|count > 1}
								<div class="line-block__item sku-props__inner">
									<div class="sku-props__item">
										<div class="sku-props__title color_666">
											{$lang->option} : <span class="sku-props__js-size">{$product->variant->name}</span>
										</div>
										<div class="line-block line-block--flex-wrap line-block--4 sku-props__values">
											{foreach $product->variants as $v}
												<div class="line-block__item">
													<label class="sku-props__value font_14 {if $v@first}sku-props__value--active{/if}" data-title="{$v->name}">
														<input type="radio" name="variant" value="{$v->id}" data-price="{$v->price|convert}" data-stock="{$v->stock}" {if $v->compare_price}data-compare="{$v->compare_price|convert}" {if $v->compare_price>$v->price && $v->price>0} data-discount="{round((($v->price-$v->compare_price)/$v->compare_price)*100, 0)}%" {/if}{/if} {if $v->name}data-name="{$v->name}" {/if} {if $v->sku}data-sku="{$v->sku}" {/if} {if $v@first}checked{/if} autocomplete="off" style="display: none;">
														{$v->name}
													</label>
												</div>
											{/foreach}
										</div>
									</div>
								</div>
							{/if}
						</div>
					</div>
				</div>
			{/if}
		</form>
	</div>
</div>