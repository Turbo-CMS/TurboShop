{* Header *}

<header>
	<nav id="navbar" class="navbar navbar-dark fixed-top bg-charcoal">
		<div class="container-xxl d-flex align-items-center flex-nowrap">
			<button class="navbar-toggler me-3 flex-shrink-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			{* Logo *}
			{if $module=='MainView'}
				<span class="navbar-brand d-none d-lg-block fs-2 fw-bold">
					{include file='header/logo.tpl'}
				</span>
			{else}
				<a class="navbar-brand d-none d-lg-block fs-2 fw-bold" href="{if $lang_link}{$lang_link}{else}/{/if}">
					{include file='header/logo.tpl'}
				</a>
			{/if}

			{* Megamenu *}
			{include file='header/megamenu.tpl'}

			{* Search Products *}
			<form class="input-group w-auto d-flex flex-grow-1 me-3" role="search" action="{$lang_link}all-products">
				<input class="form-control input-search" type="text" name="keyword" value="{$keyword|escape}" placeholder="{$lang->product_search|escape}" aria-label="Search">
				<button class="btn btn-success d-none d-md-block" type="submit">{$lang->search|escape}</button>
			</form>

			{* Languages *}
			{if $languages|count > 1}
				<div class="dropdown me-3 d-none d-lg-block">
					<a class="dropdown-toggle text-decoration-none text-white" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						{$language->label|escape|upper}
					</a>
					<ul class="dropdown-menu">
						{foreach $languages as $l}
							<li><a class="dropdown-item {if $language->id == $l->id}active{/if}" href="{$l->url}">{$l->label|escape|upper}</a></li>
						{/foreach}
					</ul>
				</div>
			{/if}
			
			<div class="list-inline d-flex flex-shrink-0">
				{* Wishlist Informer *}
				<span id="wishlist-informer">
					{include file='informers/wishlist_informer.tpl'}
				</span>
				{* Compare Informer *}
				<span id="compare-informer">
					{include file='informers/compare_informer.tpl'}
				</span>
				{* Login *}
				<div class="list-inline-item me-2 d-none d-lg-inline">
					{if $user}
						<a href="{$lang_link}user" class="text-white text-decoration-none">
							<i class="fal fa-square-list"></i>
						</a>
					{else}
						<a href="#!" class="text-white text-decoration-none" data-bs-toggle="modal" data-bs-target="#userModal">
							<i class="fal fa-user"></i>
						</a>
					{/if}
				</div>
				{* Cart Informer *}
				<div id="cart-informer" class="list-inline-item me-lg-0">
					{include file='informers/cart_informer.tpl'}
				</div>
			</div>
		</div>
	</nav>
</header>