{* Order Page *}

{* Meta Title *}
{$meta_title = "`$lang->email_order_title` `$order->id`" scope=global}

<!--title_content-->
<div class="page-top-info">
	<div class="page-top-wrapper page-top-wrapper--white">
		<section class="page-top maxwidth-theme">
			<div class="cowl">
				{$level = 1}
				<div id="navigation">
					<div class="breadcrumbs swipeignore" itemscope="" itemtype="http://schema.org/BreadcrumbList">
						<div class="breadcrumbs__item" id="tb_breadcrumb_0" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a class="breadcrumbs__link" href="{if $lang_link}{$lang_link}{else}/{/if}" title="{$lang->home}" itemprop="item">
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->home}</span>
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
							<link href="{$lang_link}order/{$order->url}/" itemprop="item"><span>
								<span itemprop="name" class="breadcrumbs__item-name font_13">{$lang->order_page}</span>
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
						<h1 id="pagetitle" class="switcher-title">
							{$lang->email_order_title}{$order->id}
							{if $order->status == 0}
								{$lang->accepted}
							{/if}
							{if $order->status == 1}
								{$lang->in_processing}
							{elseif $order->status == 2}
								{$lang->completed}
							{/if}
							{if $order->paid == 1}
								(<span class="text-success">{$lang->paid}</span>)
							{/if}
						</h1>
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
					<div class="form cart">
						<div id="basket-root" class="tb-basket tb-blue tb-step-opacity" style="opacity: 1;">
							<div class="flexbox flexbox--row basket-items-list">
								<div class="basket-items-list-outer">
									<div class="basket-items-list-wrapper basket-items-list-wrapper-height-fixed" id="basket-items-list-wrapper">
										<div class="basket-items-list-container bordered outer-rounded-x" id="basket-items-list-container">
											<div class="basket-items-list" id="basket-item-list">
												<table class="basket-items-list-table" id="basket-item-table">
													<tbody>
														{foreach $purchases as $purchase}
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
																			{if isset($purchase->product->images)}
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
																						{$lang->badge_sale}
																					</div>
																				</div>
																			{/if}
																			{if $purchase->product->featured}
																				<div>
																					<div class="stickers-basket--item sticker__item sticker__item--recommend font_10">
																						{$lang->badge_featured}
																					</div>
																				</div>
																			{/if}
																			{if $purchase->product->is_new}
																				<div>
																					<div class="stickers-basket--item sticker__item sticker__item--new font_10">{$lang->badge_new}</div>
																				</div>
																			{/if}
																			{if $purchase->product->is_hit}
																				<div>
																					<div class="stickers-basket--item sticker__item sticker__item--khit font_10">
																						{$lang->badge_hit}
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
																					<div class="basket-item-property-custom-name">{$lang->discount}</div>
																					<div class="basket-item-property-custom-value">
																						{round((($purchase->variant->price-$purchase->variant->compare_price)/$purchase->variant->compare_price)*100, 0)}%
																					</div>
																				</div>
																			{/if}
																			{if $purchase->variant->color}
																				<div class="basket-item-property-custom basket-item-property-custom-text">
																					<div class="basket-item-property-custom-name">{$lang->color}</div>
																					<div class="basket-item-property-custom-value">
																						{$purchase->variant->color|escape}
																					</div>
																				</div>
																			{/if}
																			{if $purchase->variant->name}
																				<div class="basket-item-property-custom basket-item-property-custom-text">
																					<div class="basket-item-property-custom-name">{$lang->option}</div>
																					<div class="basket-item-property-custom-value">
																						{$purchase->variant->name|escape}
																					</div>
																				</div>
																			{/if}
																			{if $order->paid && $purchase->variant->attachment}
																				<div class="basket-item-property-custom basket-item-property-custom-text">
																					<div class="basket-item-property-custom-name">{$lang->download}</div>
																					<div class="basket-item-property-custom-value">
																						<a class="fill-dark-light-block" href="{$lang_link}order/{$order->url}/{$purchase->variant->attachment}">
																							<i class="svg inline" aria-hidden="true">
																								<svg width="14" height="14">
																									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/documents_icons.svg#file-download-18-18"></use>
																								</svg>
																							</i>
																						</a>
																					</div>
																				</div>
																			{/if}
																			{if $order->paid && $purchase->variant->attachment_url}
																				<div class="basket-item-property-custom basket-item-property-custom-text">
																					<div class="basket-item-property-custom-name">{$lang->download}</div>
																					<div class="basket-item-property-custom-value">
																						<a class="fill-dark-light-block" href="{$purchase->variant->attachment_url}" target="_blank">
																							<i class="svg inline" aria-hidden="true">
																								<svg width="14" height="14">
																									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/documents_icons.svg#file-download-18-18"></use>
																								</svg>
																							</i>
																						</a>
																					</div>
																				</div>
																			{/if}
																		</div>
																	</div>
																</td>
																<td class="basket-items-list-item-amount-outer">
																	&times; {$purchase->amount}&nbsp;{$settings->units}
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
																	</div>
																</td>
															</tr>
														{/foreach}
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="row basket-items-list-wrapper">
										<div class="col-md-12">
											{* Order Details *}
											<h2>{$lang->order_details}</h2>
											<div class="bordered outer-rounded-x">
												<table class="table table-details">
													<tbody>
														<tr>
															<td scope="row">
																{$lang->order_date}
															</td>
															<td>
																{$order->date|date} {$lang->at}
																{$order->date|time}
															</td>
														</tr>
														{if $order->name}
															<tr>
																<td scope="row">
																	{$lang->name}
																</td>
																<td>
																	{$order->name|escape}
																</td>
															</tr>
														{/if}
														{if $order->email}
															<tr>
																<td scope="row">
																	Email
																</td>
																<td>
																	{$order->email|escape}
																</td>
															</tr>
														{/if}
														{if $order->phone}
															<tr>
																<td scope="row">
																	{$lang->phone}
																</td>
																<td>
																	{$order->phone|escape}
																</td>
															</tr>
														{/if}
														{if $delivery}
															<tr>
																<td scope="row">
																	{$lang->delivery_method}
																</td>
																<td>
																	{$delivery->name|escape}
																</td>
															</tr>
														{/if}
														{if $order->address}
															<tr>
																<td scope="row">
																	{$lang->delivery_address}
																</td>
																<td>
																	{$order->address|escape}
																</td>
															</tr>
														{/if}
														{if $order->comment}
															<tr>
																<td scope="row">
																	{$lang->comment}
																</td>
																<td>
																	{$order->comment|escape|nl2br}
																</td>
															</tr>
														{/if}
													</tbody>
												</table>
											</div>
											{if !$order->paid}
												{* Choosing Payment Method *}
												{if $payment_methods && !isset($payment_method) && $order->total_price>0}
													<form method="post">
														<h2>{$lang->select_a_payment_method}</h2>
														<div id="accordion">
															{foreach $payment_methods as $payment_method}
																<div class="panel item-accordion-wrapper shadow-hovered shadow-no-border-hovered">
																	<div class="card-accordion-head">
																		<label role="button" for="payment-{$payment_method->id}" class="form-radiobox__label">
																			<input role="button" type="radio" class="form-radiobox__input {if $payment_method@first}collapsed{/if}" name="payment_method_id" value="{$payment_method->id}" data-toggle="collapse" data-target="#collapse-{$payment_method->id}" aria-expanded="true" aria-controls="collapse{$payment_method->id}" {if $payment_method@first}checked{/if} id="payment-{$payment_method->id}">
																			<span class="form-radiobox__box"></span>
																			{if $payment_method->icon}
																				<i class="svg inline" aria-hidden="true">
																					<img class="icon" style="width: 21px; height: 21px;" src="{$config->payment_images_dir}{$payment_method->icon}" alt="{$payment_method->name|escape}">
																				</i>
																			{/if}
																			<span class="switcher-title color_222 font_18">
																				{$payment_method->name}, {$lang->to_pay_small} {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}
																			</span>
																		</label>
																	</div>
																	<div id="collapse-{$payment_method->id}" class="panel-collapse collapse {if $payment_method@first}in{/if}" aria-labelledby="heading-{$payment_method->id}" data-parent="#accordion">
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
														<div class="mt-2rem mb-1rem">
															<button type="submit" class="btn btn-default btn-lg">{$lang->finish_the_order}</button>
														</div>
													</form>
													{* Selected Payment Method *}
												{elseif $payment_method}
													<div class="rounded-x grey-bg order-block__wrapper">
														<div class="order-info-block">
															<div class="line-block line-block--align-normal line-block--40">
																<div class="line-block__item flex-1">
																	<h3>
																		{$lang->payment_method} &mdash;
																		{if $payment_method->icon}
																			<img class="align-middle" style="width: 32px; height: 32px;" src="{$config->payment_images_dir}{$payment_method->icon}" alt="{$payment_method->name|escape}">
																		{/if}
																		{$payment_method->name}
																	</h3>
																	<span>{$payment_method->description}</span>
																</div>
																<div class="line-block__item order-info-btns">
																	<div class="line-block line-block--align-normal line-block--12">
																		<div class="line-block__item">
																			<form method="post">
																				<input type="submit" class="btn btn-default btn-lg btn-transparent-border min_width--300" name="reset_payment_method" value="{$lang->choose_payment}">
																			</form>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<h2 class="mb-2rem">
														{$lang->to_pay} {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}
													</h2>
													{* Payment Module *}
													<div class="mb-2rem">
														{checkoutForm order_id=$order->id module=$payment_method->module}
													</div>
												{/if}
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
																<div class="basket-checkout-total-title font_24">{$lang->total}</div>
																<div class="basket-coupon-block-total-price-current font_24">
																	{$order->total_price|convert}&nbsp;{$currency->sign}
																</div>
															</div>
														</div>
														{* Discount *}
														{if $order->discount> 0}
															<div class="basket-checkout-block basket-checkout-total-price">
																<div class="basket-checkout-total-price-inner font_short">
																	<div class="basket-checkout-info basket-coupon-total-price-difference">
																		<div class="basket-checkout-info__name font_15">{$lang->discount}</div>
																		<div class="basket-checkout-info__value font_15">{$order->discount}&nbsp;%</div>
																	</div>
																</div>
															</div>
														{/if}
														{* Coupon *}
														{if $order->coupon_discount> 0}
															<div class="basket-checkout-block basket-checkout-total-price">
																<div class="basket-checkout-total-price-inner font_short">
																	<div class="basket-checkout-info basket-coupon-total-price-difference">
																		<div class="basket-checkout-info__name font_15">{$lang->coupon}</div>
																		<div class="basket-checkout-info__value font_15">&minus;{$order->coupon_discount|convert}&nbsp;{$currency->sign}</div>
																	</div>
																</div>
															</div>
														{/if}
														{* Delivery *}
														{if $order->total_price < $delivery->free_from && $delivery->price > 0}
															<div class="basket-checkout-block basket-checkout-total-price">
																<div class="basket-checkout-total-price-inner font_short">
																	<div class="basket-checkout-info basket-coupon-total-price-difference">
																		<div class="basket-checkout-info__name font_15">{$lang->global_delivery}</div>
																		<div class="basket-checkout-info__value text font_15">{$order->delivery_price|convert}&nbsp;{$currency->sign}</div>
																	</div>
																</div>
															</div>
														{elseif $order->total_price >= $delivery->free_from}
															{if $delivery->separate_payment}
																{* Separate Delivery *}
																<div class="basket-checkout-block basket-checkout-total-price">
																	<div class="basket-checkout-total-price-inner font_short">
																		<div class="basket-checkout-info basket-coupon-total-price-difference">
																			<div class="basket-checkout-info__name font_15">{$lang->global_delivery}</div>
																			<div class="basket-checkout-info__value text font_15">{$lang->paid_separate}</div>
																		</div>
																	</div>
																</div>
															{else}
																{* Delivery Free *}
																<div class="basket-checkout-block basket-checkout-total-price">
																	<div class="basket-checkout-total-price-inner font_short">
																		<div class="basket-checkout-info basket-coupon-total-price-difference">
																			<div class="basket-checkout-info__name font_15">{$lang->global_delivery}</div>
																			<div class="basket-checkout-info__value text font_15">{$lang->free}</div>
																		</div>
																	</div>
																</div>
															{/if}
														{/if}
														{* Weight *}
														{if $order->weight > 0}
															<div class="basket-checkout-block basket-checkout-total-price">
																<div class="basket-checkout-total-price-inner font_short">
																	<div class="basket-checkout-info basket-coupon-total-price-difference">
																		<div class="basket-checkout-info__name font_15">{$lang->weight}</div>
																		<div class="basket-checkout-info__value text font_15">{$order->weight} {$settings->weight_units}</div>
																	</div>
																</div>
															</div>
														{/if}
														{* Sum *}
														<div class="basket-checkout-block basket-checkout-total-price">
															<div class="basket-checkout-total-price-inner font_short">
																<div class="basket-checkout-info basket-coupon-total-price-difference">
																	<div class="basket-checkout-info__name font_15">{$lang->sum}</div>
																	{$total_sum = $order->total_price - $order->delivery_price + $order->coupon_discount + $order->discount}
																	<div class="basket-checkout-info__value text font_15">{$total_sum|convert}&nbsp;{$currency->sign}</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>