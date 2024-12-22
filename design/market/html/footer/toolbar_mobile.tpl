<nav class="handheld-toolbar fixed-bottom {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}bg-charcoal{else}bg-white{/if} d-block d-lg-none shadow-top">
	<div class="container-fluid text-center">
		<div class="row align-items-start py-2">
			<div class="col">
				<button type="button" class="btn btn-link" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCategories" role="button" aria-controls="offcanvasCategories">
					<i class="fal fa-grid-2 text-muted fs-4"></i>
				</button>
			</div>
			{if $module=='ArticlesView' && !$post}
				<div class="col">
					<button type="button" class="btn btn-link" data-bs-toggle="offcanvas" data-bs-target="#sidebar" role="button" aria-controls="sidebar">
						<i class="fal fa-bars text-muted fs-4"></i>
					</button>
				</div>
			{/if}
			<div class="col">
				{if $user}
					<a href="{$lang_link}user" class="btn btn-link text-decoration-none">
						<i class="fal fa-square-list text-muted fs-4"></i>
					</a>
				{else}
					<a href="#!" class="btn btn-link text-decoration-none" data-bs-toggle="modal" data-bs-target="#userModal">
						<i class="fal fa-square-list text-muted fs-4"></i>
					</a>
				{/if}
			</div>
			<div class="col">
				<div id="wishlist-informer-footer">
					{include file='informers/wishlist_informer_footer.tpl'}
				</div>
			</div>
			<div class="col">
				<div id="compare-informer-footer">
					{include file='informers/compare_informer_footer.tpl'}
				</div>
			</div>
			<div class="col">
				<div id="cart-informer-footer">
					{include file='informers/cart_informer_footer.tpl'}
				</div>
			</div>
		</div>
	</div>
</nav>