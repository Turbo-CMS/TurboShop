{* Cart template *}

{$meta_title = $lang->global_cart scope=global}

<!--title_content-->
<div class="page-top-info">
	<div class="page-top-wrapper page-top-wrapper--white">
		<section class="page-top maxwidth-theme">
			<div class="cowl">
				{$level = 1}
				<div id="navigation">
					<div class="breadcrumbs swipeignore" itemscope="" itemtype="http://schema.org/BreadcrumbList">
						<div class="breadcrumbs__item" id="tb_breadcrumb_0" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a class="breadcrumbs__link" href="{if $lang_link}{$lang_link}{else}/{/if}" title="{$lang->home|escape}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->home|escape}</span>
								<meta itemprop="position" content="{$level++}">
							</a>
						</div>
						<span class="breadcrumbs__separator">
							<i class="svg inline muted-use fill-dark-light" aria-hidden="true">
								<svg width="7" height="5">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-5"></use>
								</svg>
							</i>
						</span>
						<span class="breadcrumbs__item" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<link href="{$lang_link}cart" itemprop="item">
							<span>
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->global_cart|escape}</span>
								<meta itemprop="position" content="{$level++}">
							</span>
						</span>
					</div>
				</div>
			</div>
			<!--h1_content-->
			<div class="topic">
				<div class="topic__inner">
					<div class="topic__heading flexbox--wrap-nowrap">
						<h1 id="pagetitle" class="switcher-title">{$lang->global_cart|escape}</h1>
						{if $cart->purchases}
							<div class="heading-icons">
								<div class="item-action item-action--horizontal fill-theme-hover hover-block">
									<div class="hover-block__item">
										<div class="print-link btn-heading btn_basket_heading btn_heading--with_title btn_basket_heading--print" title="{$lang->print|escape}">
											<i class="svg colored_theme_hover_bg-el-svg">
												<svg class="svg-print" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
													<path fill-rule="evenodd" clip-rule="evenodd" d="M6 4H10V2H6V4ZM12 4V2C12 0.895431 11.1046 0 10 0H6C4.89543 0 4 0.895431 4 2V4H3C1.34315 4 0 5.34315 0 7V10C0 11.6569 1.34315 13 3 13H4V14C4 15.1046 4.89543 16 6 16H10C11.1046 16 12 15.1046 12 14V13H13C14.6569 13 16 11.6569 16 10V7C16 5.34315 14.6569 4 13 4H12ZM11 6H5H3C2.44772 6 2 6.44772 2 7V10C2 10.5523 2.44772 11 3 11H4V9C4 8.44772 4.44772 8 5 8H11C11.5523 8 12 8.44772 12 9V11H13C13.5523 11 14 10.5523 14 10V7C14 6.44772 13.5523 6 13 6H11ZM10 14H6V10H10V14Z" fill="#b8b8b8"></path>
												</svg>
											</i>
											<span class="title">{$lang->print|escape}</span>
										</div>
									</div>
								</div>
							</div>
						{/if}
					</div>
				</div>
			</div>
			<!--/h1_content-->
		</section>
	</div>
</div>
<!--end-title_content-->

<div class="container">
	<div class="row">
		<div class="maxwidth-theme">
			<div class="col-md-12 col-sm-12 col-xs-12 content-md">
				<div class="right_block narrow_N">
					{if $cart->purchases}
						<form class="form cart" method="post" name="cart" novalidate="novalidate">
							<div id="basket-root" class="tb-basket tb-blue tb-step-opacity" style="opacity: 1;">
								<div class="flexbox flexbox--row basket-items-list">
									<div class="basket-items-list-outer">
										<div class="basket-items-list-wrapper basket-items-list-wrapper-height-fixed" id="basket-items-list-wrapper">
											<div class="basket-items-list-container bordered outer-rounded-x" id="basket-items-list-container">
												<div class="basket-items-list" id="basket-item-list">
													<table class="basket-items-list-table" id="basket-item-table">
														<tbody>
															{foreach $cart->purchases as $purchase}
																<tr class="basket-items-list-item-wrapper js-popup-block product">
																	<td class="basket-items-list-item-picture">
																		<div class="basket-item-block-image">
																			<div class="fast_view" data-event="jqm" data-name="fast_view" data-url="{$lang_link}products/{$purchase->product->url}?tpl=quickview">
																				<i class="svg inline svg-inline-side-search" aria-hidden="true">
																					<svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
																						<circle r="6" transform="matrix(1 0 0 -1 7 7)" stroke="#999999" stroke-width="2"></circle>
																						<path d="M12 12L14 14" stroke="#999999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
																						<path d="M7 5V9M9 7H5" stroke="#999999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
																					</svg>
																				</i>
																			</div>
																			<a href="{$lang_link}products/{$purchase->product->url}" class="basket-item-image-link image">
																				{if $purchase->product->images}
																					{$image = $purchase->product->images|first}
																					<img class="basket-item-image js-popup-image lazyload" alt="{$purchase->product->name|escape}" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$image->filename|resize:160:160}">
																				{else}
																					<img style="width: 160px; height: 160px;" class="basket-item-image" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$purchase->product->name|escape}">
																				{/if}
																			</a>
																		</div>
																	</td>
																	<td class="basket-items-list-item-descriptions-inner">
																		<div class="basket-item-block-info">
																			<span class="basket-item-actions-remove" data-entity="basket-item-delete"></span>
																			<div class="stickers-basket sticker sticker--upper sticker--static">
																				{if $purchase->variant->compare_price> 0}
																					<div>
																						<div class="stickers-basket--item sticker__item sticker__item--aktsiya font_10">
																							{$lang->badge_sale|escape}
																						</div>
																					</div>
																				{/if}
																				{if $purchase->product->featured}
																					<div>
																						<div class="stickers-basket--item sticker__item sticker__item--recommend font_10">
																							{$lang->badge_featured|escape}
																						</div>
																					</div>
																				{/if}
																				{if $purchase->product->is_new}
																					<div>
																						<div class="stickers-basket--item sticker__item sticker__item--new font_10">{$lang->badge_new|escape}</div>
																					</div>
																				{/if}
																				{if $purchase->product->is_hit}
																					<div>
																						<div class="stickers-basket--item sticker__item sticker__item--khit font_10">
																							{$lang->badge_hit|escape}
																						</div>
																					</div>
																				{/if}
																			</div>
																			<h2 class="basket-item-info-name">
																				<a href="{$lang_link}products/{$purchase->product->url}" class="basket-item-info-name-link">
																					<span class="js-popup-title" data-entity="basket-item-name">{$purchase->product->name|escape}</span>
																				</a>
																			</h2>
																			<div class="basket-item-block-properties">
																				{if $purchase->variant->compare_price > $purchase->variant->price && $purchase->variant->price > 0}
																					<div class="basket-item-property-custom basket-item-property-custom-text">
																						<div class="basket-item-property-custom-name">{$lang->discount|escape}</div>
																						<div class="basket-item-property-custom-value">
																							{round((($purchase->variant->price-$purchase->variant->compare_price)/$purchase->variant->compare_price)*100, 0)}%
																						</div>
																					</div>
																				{/if}
																				{if $purchase->variant->color}
																					<div class="basket-item-property-custom basket-item-property-custom-text">
																						<div class="basket-item-property-custom-name">{$lang->color|escape}</div>
																						<div class="basket-item-property-custom-value">
																							{$purchase->variant->color|escape}
																						</div>
																					</div>
																				{/if}
																				{if $purchase->variant->name}
																					<div class="basket-item-property-custom basket-item-property-custom-text">
																						<div class="basket-item-property-custom-name">{$lang->option|escape}</div>
																						<div class="basket-item-property-custom-value">
																							{$purchase->variant->name|escape}
																						</div>
																					</div>
																				{/if}
																			</div>
																		</div>
																	</td>
																	<td class="basket-items-list-item-amount-outer">
																		<div class="basket-item-amount">
																			<span class="basket-item-btn-minus"></span>
																			<div class="basket-item-amount-filed-block">
																				<input type="text" class="basket-item-amount-filed" name="amounts[{$purchase->variant->id}]" value="{$purchase->amount}" min="1" max="{$purchase->variant->stock}" onchange="document.cart.submit();">
																			</div>
																			<span class="basket-item-btn-plus"></span>
																		</div>
																		<div class="basket-items-list-item-price basket-items-list-item-price-for-one hidden-xs1">
																			<div class="basket-item-price">
																				<div class="basket-item-price-current">
																					<span class="basket-item-price-current-text">
																						{($purchase->variant->price)|convert} {$currency->sign}/
																						<div class="basket-item-amount-field-description">
																							{$settings->units}
																						</div>
																					</span>
																				</div>
																			</div>
																		</div>
																	</td>
																	<td class="basket-items-list-item-price">
																		<div class="basket-items-list-item-price-action-wrap flexbox flexbox--row flexbox--align-start">
																			<div class="basket-item-price flex-1">
																				{if $purchase->variant->compare_price > $purchase->variant->price && $purchase->variant->price > 0}
																					<div class="stickers-basket sticker sticker--upper sticker--static flexbox--justify-end">
																						<div>
																							<div class="stickers-basket--item sticker__item sticker__item--sale font_12">
																								{round((($purchase->variant->price-$purchase->variant->compare_price)/$purchase->variant->compare_price)*100, 0)}%
																							</div>
																						</div>
																					</div>
																				{/if}
																				<div class="basket-item-price-current">
																					<div class="basket-item-price-current-value">
																						{($purchase->variant->price*$purchase->amount)|convert}&nbsp;{$currency->sign}
																					</div>
																				</div>
																				{if $purchase->variant->compare_price > 0}
																					<div class="basket-item-price-old">
																						<span class="basket-item-price-old-text">
																							{($purchase->variant->compare_price*$purchase->amount)|convert}&nbsp;{$currency->sign}
																						</span>
																					</div>
																				{/if}
																			</div>
																			<div class="basket-items-list-item-favorite">
																				{if $wishlist_products && in_array($purchase->product->url, $wishlist_products)}
																					<div class="item-action item-action--horizontal item-action--favorite active">
																						<a href="{$lang_link}wishlist" class="item-action__inner item-action__inner--sm item-action__inner--sm-to-600 fill-theme-use-svg-hover fill-dark-light-block active" title="{$lang->added_to_wishlist|escape}">
																							<i class="svg inline" aria-hidden="true">
																								<svg width="18" height="16">
																									<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
																								</svg>
																							</i>
																						</a>
																					</div>
																				{else}
																					<div class="item-action item-action--horizontal item-action--favorite">
																						<a href="{$lang_link}wishlist/{$purchase->product->url}" rel="nofollow" class="wishlist item-action__inner item-action__inner--sm item-action__inner--sm-to-600 fill-theme-use-svg-hover fill-dark-light-block" title="{$lang->add_to_wishlist|escape}" data-title_added="{$lang->added_to_wishlist|escape}">
																							<i class="svg inline" aria-hidden="true">
																								<svg width="18" height="16">
																									<use xlink:href="design/{$settings->theme|escape}/images/svg/catalog/item_icons.svg#favorite-18-16"></use>
																								</svg>
																							</i>
																						</a>
																					</div>
																				{/if}
																			</div>
																			<div class="basket-items-list-item-removes">
																				<div class="basket-item-block-actions">
																					<a href="{$lang_link}cart/remove/{$purchase->variant->id}" class="basket-item-actions-remove fill-dark-light-block fill-theme-use-svg-hover">
																						<i class="svg inline remove" aria-hidden="true">
																							<svg width="16" height="16">
																								<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#remove-16-16"></use>
																							</svg>
																						</i>
																					</a>
																				</div>
																			</div>
																		</div>
																	</td>
																</tr>
															{/foreach}
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="row basket-items-list-wrapper no-print">
											<div class="col-md-12">
												{* Delivery *}
												{if $deliveries}
													<h3 class="my-4">{$lang->select_delivery_method|escape}:</h3>
													<div id="accordionDelivery">
														{foreach $deliveries as $delivery}
															<div id="delivery" class="panel item-accordion-wrapper shadow-hovered shadow-no-border-hovered">
																<div class="card-accordion-head">
																	<label role="button" class="form-radiobox__label">
																		<input role="button" type="radio" class="{$delivery->module} form-radiobox__input" onclick="change_payment_method({$delivery->id})" name="delivery_id" value="{$delivery->id}" data-toggle="collapse" data-target="#collapseDelivery-{$delivery->id}" aria-expanded="true" aria-controls="collapseDelivery-{$delivery->id}" {if $delivery && $delivery_id==$delivery->id}checked{elseif $delivery@first}checked{/if} id="deliveries-{$delivery->id}">
																		<span class="form-radiobox__box"></span>
																		{if $delivery->icon}
																			<i class="svg inline" aria-hidden="true">
																				<img class="icon" style="width: 21px; height: 21px;" src="{$config->delivery_images_dir}{$delivery->icon}" alt="{$delivery->name|escape}">
																			</i>
																		{/if}
																		<span class="switcher-title color_222 font_18">{$delivery->name}</span>
																		<span class="payment-price" data-separate="{if $delivery->separate_payment}1{else}0{/if}" data-cost="{if $cart->total_price < $delivery->free_from && $delivery->price > 0}{$delivery->price|convert}{elseif $cart->total_price >= $delivery->free_from}0{/if}" data-currency="{$currency->sign}">
																			{if $cart->total_price < $delivery->free_from && $delivery->price > 0}
																				({$delivery->price|convert}&nbsp;{$currency->sign})
																			{elseif $cart->total_price >= $delivery->free_from}
																				{if $delivery->separate_payment}
																					({$lang->paid_separate|escape})
																				{else}
																					({$lang->free|escape})
																				{/if}
																			{/if}
																		</span>
																	</label>
																</div>
																<div id="collapseDelivery-{$delivery->id}" class="panel-collapse collapse {if $delivery@first}in{/if}" aria-labelledby="heading-{$delivery->id}" data-parent="#accordionDelivery">
																	{if $delivery->description || $delivery->ext_module_form}
																		<div class="accordion-body color_666">
																			<div class="accordion-preview">
																				{* Description *}
																				{if $delivery->description}
																					{$delivery->description}
																				{/if}
																				{* Module *}
																				{if $delivery->ext_module_form}
																					{$delivery->ext_module_form}
																				{/if}
																			</div>
																		</div>
																	{/if}
																</div>
															</div>
														{/foreach}
													</div>
													{* Payments *}
													<h3 class="my-4">{$lang->select_payment_method|escape}:</h3>
													<div id="accordionPayment">
														{foreach $deliveries as $delivery}
															{if $delivery->payment_methods}
																<div class="delivery-payment" id="delivery-payment-{$delivery->id}" style="display:none">
																	{foreach $delivery->payment_methods as $payment_method}
																		<div id="list_payment_{$payment_method->id}" class="panel item-accordion-wrapper shadow-hovered shadow-no-border-hovered">
																			<div class="card-accordion-head">
																				<label role="button" for="payment-{$delivery->id}-{$payment_method->id}" class="form-radiobox__label">
																					<input role="button" type="radio" class="form-radiobox__input" name="payment_method_id" value="{$payment_method->id}" data-toggle="collapse" data-target="#collapsePayment-{$delivery->id}-{$payment_method->id}" aria-expanded="true" aria-controls="collapsePayment-{$delivery->id}-{$payment_method->id}" {if $payment_method@first}checked{/if} id="payment-{$delivery->id}-{$payment_method->id}">
																					<span class="form-radiobox__box"></span>
																					{if $payment_method->icon}
																						<i class="svg inline" aria-hidden="true">
																							<img class="icon" style="width: 21px; height: 21px;" src="{$config->payment_images_dir}{$payment_method->icon}" alt="{$payment_method->name|escape}">
																						</i>
																					{/if}
																					<span class="switcher-title color_222 font_18">{$payment_method->name}</span>, {$lang->to_pay_small|escape}
																					{$total_price_with_delivery = $cart->total_price}
																					{if !$delivery->separate_payment && $cart->total_price < $delivery->free_from}
																						{$total_price_with_delivery = $cart->total_price + $delivery->price}
																					{/if}
																					<strong>{$total_price_with_delivery|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}</strong>
																				</label>
																			</div>
																			<div id="collapsePayment-{$delivery->id}-{$payment_method->id}" class="panel-collapse collapse {if $payment_method@first}in{/if}" aria-labelledby="headingPayment-{$payment_method->id}" data-parent="#delivery-payment-{$delivery->id}">
																				{if $payment_method->description}
																					<div class="accordion-body color_666">
																						<div class="accordion-preview">
																							{$payment_method->description}
																						</div>
																					</div>
																				{/if}
																			</div>
																		</div>
																	{/foreach}
																</div>
															{/if}
														{/foreach}
													</div>
												{/if}

												{* Form Data *}
												<h3>{$lang->address_recipient|escape}</h3>
												{if $error}
													<div class="alert alert-danger" role="alert">
														{if $error == 'empty_name'}{$lang->enter_your_name|escape}{/if}
														{if $error == 'empty_email'}{$lang->enter_your_email|escape}{/if}
														{if $error == 'captcha'}{$lang->captcha_incorrect|escape}{/if}
													</div>
												{/if}
												<div class="form-group">
													<label for="cart-name" class="form-label">{$lang->general_full_name|escape}<span class="required-star">*</span></label>
													<div class="input">
														<input type="text" class="form-control" name="name" id="cart-name" value="{$name|escape}" placeholder="{$lang->enter_your_name|escape}" required>
													</div>
												</div>
												<div class="form-group">
													<label for="cart-email" class="form-label">Email<span class="required-star">*</span></label>
													<div class="input">
														<input type="text" class="form-control" name="email" id="cart-email" value="{$email|escape}" placeholder="{$lang->enter_your_email|escape}" required>
													</div>
												</div>
												<div class="form-group">
													<label for="cart-phone" class="form-label">{$lang->phone|escape}</label>
													<div class="input">
														<input type="text" class="form-control phone" name="phone" id="cart-phone" value="{$phone|escape}" placeholder="{$lang->enter_phone_number|escape}">
													</div>
												</div>
												<div class="form-group">
													<label for="cart-address" class="form-label">{$lang->delivery_address|escape}</label>
													<div class="input">
														<input type="text" class="form-control" name="address" id="cart-address" value="{$address|escape}" placeholder="{$lang->enter_the_address|escape}">
													</div>
												</div>
												<div class="form-group">
													<label for="cart-comment" class="form-label">{$lang->comment|escape}</label>
													<div class="input">
														<textarea class="form-control" name="comment" id="cart-comment" placeholder="{$lang->enter_a_comment|escape}" rows="4">{$comment|escape}</textarea>
													</div>
												</div>
												{if $settings->captcha_cart}
													<div class="clearfix fill-animate">
														<label class="font_14">
															<span>{$lang->captcha_label|escape}&nbsp;<span class="required-star">*</span></span>
														</label>
													</div>
													<div class="row">
														<div class="form-group col-sm-6 pb-3">
															{get_captcha var="captcha_cart"}
															<div class="secret-number">{$captcha_cart[0]|escape} + ? = {$captcha_cart[1]|escape}</div>
														</div>
														<div class="form-group col-sm-6">
															<div class="input">
																<input type="text" class="form-control required" name="captcha_code" value="" autocomplete="off" required>
															</div>
														</div>
													</div>
												{/if}
											</div>
										</div>
									</div>
									<div class="basket-total-outer">
										<div class="basket-total-block">
											<div class="basket-checkout-container visible">
												<div class="basket-checkout-section">
													<div class="basket-checkout-section-inner">
														<div class="basket-checkout-section-left">
															<div class="basket-checkout-block basket-checkout-total">
																<div class="basket-checkout-block-total-inner">
																	<div class="basket-checkout-total-title font_24" id="cart-produts-cost" data-cost="{$cart->total_price|convert}">{$lang->total|escape}</div>
																	<div class="basket-coupon-block-total-price-current font_24" id="cart-total-cost">
																		{$cart->total_price|convert}&nbsp;{$currency->sign}
																	</div>
																</div>
															</div>
															{* Discount *}
															{if $user && $user->discount}
																<div class="basket-checkout-block basket-checkout-total-price">
																	<div class="basket-checkout-total-price-inner font_short">
																		<div class="basket-checkout-info basket-coupon-total-price-difference">
																			<div class="basket-checkout-info__name font_15">{$lang->discount|escape}</div>
																			<div class="basket-checkout-info__value font_15">{$user->discount}&nbsp;%</div>
																		</div>
																	</div>
																</div>
															{/if}
															{* Coupon Sum *}
															{if $cart->coupon_discount > 0}
																<div class="basket-checkout-block basket-checkout-total-price">
																	<div class="basket-checkout-total-price-inner font_short">
																		<div class="basket-checkout-info basket-coupon-total-price-difference">
																			<div class="basket-checkout-info__name font_15">{$lang->coupon|escape}</div>
																			<div class="basket-checkout-info__value font_15">&minus;{$cart->coupon_discount|convert}&nbsp;{$currency->sign}</div>
																		</div>
																	</div>
																</div>
															{/if}
															{* Delivery Sum *}
															<div class="basket-checkout-block basket-checkout-total-price">
																<div class="basket-checkout-total-price-inner font_short">
																	<div class="basket-checkout-info basket-coupon-total-price-difference">
																		<div class="basket-checkout-info__name font_15">{$lang->global_delivery|escape}</div>
																		<div class="basket-checkout-info__value text font_15" data-delivery-cost="{$lang->free|escape}" data-delivery-separate="{$lang->paid_separate|escape}" id="cart-delivery-cost"></div>
																	</div>
																</div>
															</div>
															{* Weight *}
															{if $cart->total_weight}
																<div class="basket-checkout-block basket-checkout-total-price">
																	<div class="basket-checkout-total-price-inner font_short">
																		<div class="basket-checkout-info basket-coupon-total-price-difference">
																			<div class="basket-checkout-info__name font_15">{$lang->weight|escape}</div>
																			<div class="basket-checkout-info__value text font_15">{$cart->total_weight} {$settings->weight_units}</div>
																		</div>
																	</div>
																</div>
															{/if}
															{* Sum *}
															<div class="basket-checkout-block basket-checkout-total-price">
																<div class="basket-checkout-total-price-inner font_short">
																	<div class="basket-checkout-info basket-coupon-total-price-difference">
																		<div class="basket-checkout-info__name font_15">{$lang->sum|escape}</div>
																		<div class="basket-checkout-info__value text font_15">{$cart->total_cart|convert}&nbsp;{$currency->sign}</div>
																	</div>
																</div>
															</div>
															<div class="basket-coupon-section">
																{* Coupon *}
																{if $cart->coupon && $cart->coupon->min_order_price > 0}
																	<div class="alert bordered font_13" role="alert">
																		{$lang->coupon|escape} {$lang->coupon_valid|escape} {$cart->coupon->min_order_price|convert} {$currency->sign}
																	</div>
																{/if}
																<div class="basket-coupon-block-field">
																	<div class="form">
																		<div class="form-group" style="position: relative;">
																			<input type="text" placeholder="{$lang->promo_code|escape}" class="form-control" name="coupon_code" value="{$cart->coupon->code|default:''|escape}">
																			<span class="basket-coupon-block-coupon-btn" onclick="document.cart.submit();">
																				<i class="svg inline  svg-inline-coupon" aria-hidden="true">
																					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="10" viewBox="0 0 16 10">
																						<defs>
																							<style>
																								.cls-1 {
																									fill: #333;
																									fill-rule: evenodd;
																								}
																							</style>
																						</defs>
																						<path id="Rounded_Rectangle_934_copy_3" data-name="Rounded Rectangle 934 copy 3" class="cls-1" d="M654.7,381.707l-3.991,3.985a1,1,0,0,1-1.41-1.414L651.576,382H640a1,1,0,0,1,0-2h11.589l-2.3-2.31a1,1,0,0,1,1.41-1.414l3.991,4.017A1,1,0,0,1,654.7,381.707Z" transform="translate(-639 -376)"></path>
																					</svg>
																				</i>
																			</span>
																		</div>
																	</div>
																</div>
															</div>
															{if $coupon_request}
																<div class="basket-coupon-alert-section">
																	<div class="basket-coupon-alert-inner has_coupon">
																		{if $coupon_error}
																			<div class="basket-checkout-info basket-coupon-alert text-danger">
																				<span class="basket-coupon-text font_15 font_short">
																					<strong class="color_555">{$lang->coupon_is_invalid|escape}</strong>
																				</span>
																				<span class="font_15 font_short basket-coupon-info">
																					<span class="close-link" onclick="document.getElementsByName('coupon_code')[0].value=''; document.cart.submit();"></span>
																				</span>
																			</div>
																		{/if}
																		{if $cart->coupon && $cart->coupon->valid}
																			<div class="basket-checkout-info basket-coupon-alert text-success">
																				<span class="basket-coupon-text font_15 font_short">
																					<strong class="color_555">{$lang->coupon|escape}</strong>
																				</span>
																				<span class="font_15 font_short basket-coupon-info">
																					<span class="basket-coupon-info__text">{$cart->coupon->code|escape}</span>
																					<span class="close-link" onclick="document.getElementsByName('coupon_code')[0].value=''; document.cart.submit();"></span>
																				</span>
																			</div>
																		{/if}
																	</div>
																</div>
															{/if}
														</div>
														<div class="basket-checkout-section-right">
															<div class="basket-checkout-block basket-checkout-btn checkout-order">
																<button type="submit" class="btn btn-lg btn-default basket-btn-checkout" name="checkout">{$lang->checkout|escape}</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="basket-total-block__clear">
												<a href="{url empty=1}" class="delete_all colored_theme_hover_text remove_all_basket font_14 font_large dark_link color_555">
													{$lang->empty_trash|escape}
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					{else}
						<div class="tb-sbb-empty-cart-container">
							<div class="tb-sbb-empty-cart-image">
								<img class="lazyloaded" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="" alt="">
							</div>
							<div class="tb-sbb-empty-cart-text">{$lang->cart_no_products|escape}</div>
							<div class="tb-sbb-empty-cart-desc">
								<a href="{if $lang_link}{$lang_link}{else}/{/if}">{$lang->click_here|escape}</a>, {$lang->to_continue_shopping|escape}
							</div>
						</div>
					{/if}
				</div>
			</div>
		</div>
	</div>
</div>