{* Navigation *}
<nav itemscope itemtype="https://schema.org/SiteNavigationElement" class="navbar navbar-expand-lg {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}navbar-dark bg-body-tertiary{else}navbar-light bg-light{/if} fixed-top shadow">
	<div class="container">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Menu">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarMenu">
			<hr class="text-black-50 d-block d-lg-none">
			{* Pages *}
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item d-none d-lg-block">
					{if $module=='MainView'}
						<span class="nav-link"><i class="fal fa-house"></i></span>
					{else}
						<a class="nav-link" href="{if $lang_link}{$lang_link}{else}/{/if}"><i class="fal fa-house"></i></a>
					{/if}
				</li>
				{foreach $pages as $p}
					{if $p->menu_id == $theme_settings->menu_header_id}
						{if $p->visible}
							<li itemprop="name" class="nav-item dropdown {if $page && $page->id == $p->id}active{/if}">
								<a itemprop="url" class="nav-link {if isset($p->subpages)}dropdown-toggle{/if}" href="{$lang_link}{$p->url}" id="dropdown{$p->id}" data-page="{$p->id}" {if isset($p->subpages)}data-bs-toggle="dropdown" aria-expanded="false" {/if} aria-haspopup="true">{$p->header}</a>
								{if isset($p->subpages)}
									<div class="dropdown-menu" aria-labelledby="dropdown{$p->id}">
										{foreach $p->subpages as $p2}
											<a itemprop="url" data-page="{$p2->id}" class="dropdown-item" href="{$lang_link}{$p2->url}">{$p2->header}</a>
										{/foreach}
									</div>
								{/if}
							</li>
						{/if}
					{/if}
				{/foreach}
			</ul>
			<hr class="text-black-50 d-block d-lg-none">
			<ul class="nav navbar-nav navbar-right">
				{* Theme mode *}
				<li class="nav-link">
					<div class="form-check form-switch">
						{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
							<input role="button" type="checkbox" onclick="document.cookie='mode=;path=/';document.location.reload();" class="form-check-input" id="darkSwitch">
							<label role="button" class="custom-control-label" for="darkSwitch"><i class="fal fa-moon"></i></label>
						{else}
							<input role="button" type="checkbox" onclick="document.cookie='mode=mode;path=/';document.location.reload();" class="form-check-input" id="darkSwitch" checked>
							<label role="button" class="custom-control-label" for="darkSwitch"><i class="fal fa-sun-bright"></i></label>
						{/if}
					</div>
				</li>
				{* Languages *}
				{if $languages|count > 1}
					<li class="nav-item dropdown">
						{foreach $languages as $l}
							{if $language->id == $l->id}
								<a class="nav-link dropdown-toggle" href="#{$lang_link}" id="dropdownLang" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<span class="flag-icon flag-icon-{$language->label}"></span>
									{$language->label|escape|capitalize}
								</a>
							{/if}
						{/foreach}
						<div class="dropdown-menu" aria-labelledby="dropdownLang">
							{foreach $languages as $l}
								{if $l->enabled}
									<a href="{$l->url}" class="dropdown-item {if $language->id == $l->id}active{/if}"><span class="flag-icon flag-icon-{$l->label}"></span> {$l->name}</a>
								{/if}
							{/foreach}
						</div>
					</li>
				{/if}
				<hr class="text-black-50 d-block d-lg-none">
				{* Wishlist Informer *}
				<li class="nav-link">
					<div id="wishlist-informer">
						{include file='informers/wishlist_informer.tpl'}
					</div>
				</li>
				{* Compare Informer *}
				<li class="nav-link">
					<div id="compare-informer">
						{include file='informers/compare_informer.tpl'}
					</div>
				</li>
				<hr class="text-black-50 d-block d-lg-none">
				{* Login *}
				{if $user}
					<li class="nav-item"><a class="nav-link text-decoration-none" href="{$lang_link}user"><i class="fal fa-user text-primary me-2"></i>{$user->name}</a></li>
					<li class="nav-item"><a class="nav-link text-decoration-none" href="{$lang_link}user/logout"><i class="fal fa-sign-out me-2"></i>{$lang->logout}</a></li>
				{else}
					<li class="nav-item me-2"><a class="nav-link text-decoration-none" href="{$lang_link}user/login"><i class="fal fa-user me-2"></i>{$lang->account}</a></li>
				{/if}
				<hr class="text-black-50 d-block d-lg-none">
			</ul>
		</div>
		{* Cart Informer *}
		<div id="cart-informer">
			{include file='informers/cart_informer.tpl'}
		</div>
	</div>
</nav>
{* Logo Header *}
<div class="container pt-4 mt-5">
	<div class="row justify-content-between mt-2">
		{* Logo *}
		<div class="col-lg-6 d-flex align-items-center justify-content-start">
			<h1>
				{if $module=='MainView'}
					{$theme_settings->logo_icon}
					<span class="logo-main">{$theme_settings->logo|escape}</span>
				{else}
					<a class="{if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}text-white{else}text-dark{/if} card-link text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}">
						{$theme_settings->logo_icon}
						<span class="logo-main">{$theme_settings->logo|escape}</span>
					</a>
				{/if}
			</h1>
		</div>
		{* Header Contacts *}
		<div class="col-lg-6">
			<div class="text-end">
				<div class="mb-1">{$lang->phone_number}</div>
				<div class="mb-3">{$lang->contact_details}</div>
				<div class="callback float-end">
					<a class="btn btn-success btn-sm" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#callbackModal" role="button">
						<i class="fal fa-headset"></i>
						<span>{$lang->callback}</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>