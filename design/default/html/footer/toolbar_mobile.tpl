{* Toolbar mobile *}
<nav class="handheld-toolbar fixed-bottom bg-body-tertiary d-block d-lg-none shadow-top">
	<div class="container-fluid text-center">
		<div class="row align-items-start py-2">
			<div class="col border-end">
				{if $theme_settings->header_type == '2' && $module == 'MainView'}
					<button type="button" class="btn btn-link" data-bs-toggle="offcanvas" data-bs-target="#navbar-default" role="button" aria-controls="navbar-default">
						<i class="fal fa-bars text-muted fs-4"></i>
					</button>
				{elseif $theme_settings->main_type == '2' && $module == 'MainView'}
					<button type="button" class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#navbarMenu" role="button" aria-controls="navbarMenu">
						<i class="fal fa-bars text-muted fs-4"></i>
					</button>
				{else}
					<button type="button" class="btn btn-link" data-bs-toggle="offcanvas" href="#sidebar" role="button" aria-controls="sidebar">
						<i class="fal fa-bars text-muted fs-4"></i>
					</button>
				{/if}
			</div>
			<div class="col border-end">
				<button type="button" class="btn btn-link">
					<a href="{$lang_link}wishlist"><i class="fal fa-heart text-muted fs-4"></i></a>
				</button>
			</div>
			<div class="col border-end">
				<button type="button" class="btn btn-link">
					<a href="{$lang_link}compare"><i class="fal fa-sync text-muted fs-4"></i></a>
				</button>
			</div>
			<div class="col">
				<div id="cart-informer-footer">
					{include file='informers/cart_informer_footer.tpl'}
				</div>
			</div>
		</div>
	</div>
</nav>