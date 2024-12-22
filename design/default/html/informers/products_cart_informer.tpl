<div class="d-flex flex-align-end flex-column h-100">
	<div class="h-100 mb-auto overflow-y-auto p-0">
		<div class="mb-3">
			{if $cart->total_products > 0}
				<ul class="list-group list-group-flush">
					{foreach $cart->purchases as $purchase}
						{* List Group *}
						<li class="list-group-item py-3 ps-0 border-bottom">
							{* Row *}
							<div class="row">
								<div class="d-flex justify-content-center align-items-center">
									<div class="col-2 col-md-2 col-lg-2">
										<div class="ms-0 d-flex justify-content-center">
											<a href="{$lang_link}products/{$purchase->product->url}">
												{if $purchase->product->images}
													{$image = $purchase->product->images|first}
													<img src="{$image->filename|resize:64:64}" alt="{$purchase->product->name|escape}">
												{else}
													<img style="width: 64px; height: 64px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$purchase->product->name|escape}">
												{/if}
											</a>
										</div>
									</div>
									<div class="col-6 col-md-6 col-lg-6">
										<div class="text-start ms-3">
											{* Title *}
											<a href="{$lang_link}products/{$purchase->product->url}" class="text-decoration-none">
												<h6 class="mb-0">{$purchase->product->name|escape}</h6>
											</a>
											{* Variant *}
											<span>
												<small class="text-muted">
													{$purchase->variant->color|escape} {if $purchase->variant->color && $purchase->variant->name}/{/if} {$purchase->variant->name|escape}
												</small>
											</span>
											{* Remove *}
											<div class="mt-2 small lh-1">
												<a href="{$lang_link}cart/remove/{$purchase->variant->id}" class="product-remove text-decoration-none d-flex align-items-center">
													<span class="me-1 align-text-bottom">
														<i class="fal fa-trash-can"></i>
													</span>
													<span class="text-muted">{$lang->delete|escape}</span>
												</a>
											</div>
										</div>
									</div>
									{* Amaunt *}
									<div class="col-1 col-md-1 col-lg-1">
										<small class="text-muted">x {$purchase->amount}</small>
									</div>
									{* Price *}
									<div class="col-3 text-lg-end text-start text-md-end col-md-3 col-lg-3">
										<span class="fw-bold">{($purchase->variant->price)|convert}&nbsp;{$currency->sign}</span>
									</div>
								</div>
							</div>
						</li>
					{/foreach}
				</ul>
			</div>
		{else}
			<div class="text-start">{$lang->cart_no_products|escape}</div>
		{/if}
	</div>
	{if $cart->total_products > 0}
		{* Total *}
		<div class="fs-6 my-3">
			<span class="fw-bold">{$lang->total|escape}: {$cart->total_price|convert}&nbsp;{$currency->sign}</span>
		</div>
		{* Btn *}
		<div class="d-flex justify-content-between align-items-center">
			<a href="#offcanvasCart" class="btn btn-primary" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasCart" aria-label="Close">{$lang->continue_shopping|escape}</a>
			<a href="{$lang_link}cart" class="btn btn-secondary">{$lang->go_to_cart|escape}</a>
		</div>
	{/if}
</div>