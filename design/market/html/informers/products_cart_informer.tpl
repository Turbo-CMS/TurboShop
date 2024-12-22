<div class="d-flex flex-align-end flex-column h-100">
	<div class="h-100 mb-auto overflow-y-auto p-0">
		<div class="mb-3">
			{if $cart->total_products > 0}
				<ul class="list-group list-group-flush">
					{foreach $cart->purchases as $purchase}
						{* List Group *}
						<li class="list-group-item py-3 border-bottom">
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
											<a href="{$lang_link}products/{$purchase->product->url}" class="link-body-emphasis link-hover text-decoration-none">
												<p class="mb-0">{$purchase->product->name|escape}</p>
											</a>
											{* Variant *}
											{if $purchase->variant->color || $purchase->variant->name}
												<span>
													<small class="text-muted">
														{$purchase->variant->color|escape} {if $purchase->variant->color && $purchase->variant->name}/{/if} {$purchase->variant->name|escape}
													</small>
												</span>
											{/if}
											{* Remove *}
											<div class="mt-2 small lh-1">
												<a href="{$lang_link}cart/remove/{$purchase->variant->id}" class="product-remove text-decoration-none d-flex align-items-center">
													<span class="me-1">
														<i class="far fa-trash-can"></i>
													</span>
													<span class="text-muted">{$lang->delete|escape}</span>
												</a>
											</div>
										</div>
									</div>
									{* Amaunt *}
									<div class="col-1 col-md-1 col-lg-1 text-center">
										<small class="text-muted">x {$purchase->amount}</small>
									</div>
									{* Price *}
									<div class="col-3 text-lg-end text-start text-md-end col-md-3 col-lg-3">
										{if $purchase->variant->compare_price > 0}
											<del class="text-secondary">
												<small>
													{$purchase->variant->compare_price|convert} {$currency->sign|escape}
												</small>
											</del>
										{/if}
										<span class="fw-bold {if $purchase->variant->compare_price > 0}text-danger{/if}">{($purchase->variant->price)|convert}&nbsp;{$currency->sign}</span>
									</div>
								</div>
							</div>
						</li>
					{/foreach}
				</ul>
			{else}
				<div class="text-start p-3">{$lang->cart_no_products|escape}</div>
			{/if}
		</div>
	</div>
	{* Btn *}
	{if $cart->total_products > 0}
		<div class="d-flex justify-content-center border-top">
			<div class="align-self-center pb-3 pt-2 text-center w-100">
				{* Total *}
				<div class="fs-6 my-2 text-end me-3">
					<span class="fw-bold fs-5">{$lang->total|escape}: {$cart->total_price|convert}&nbsp;{$currency->sign}</span>
				</div>
				<div class="d-flex justify-content-between gap-2 mt-3 px-3">
					<a href="#offcanvasCart" class="btn btn-gray w-100" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasCart" aria-label="Close">{$lang->continue|escape}</a>
					<a href="{$lang_link}cart" class="btn btn-success w-100">{$lang->global_checkout|escape}</a>
				</div>
			</div>
		</div>
	{/if}
</div>