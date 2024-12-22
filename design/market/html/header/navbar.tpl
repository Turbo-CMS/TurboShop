{* Offcanvas Navbar *}

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
    <div class="offcanvas-header bg-charcoal" data-bs-theme="dark">
        <h5 class="offcanvas-title text-white" id="offcanvasNavbarLabel">{include file='header/logo.tpl'}</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        {if $categories}
            <button class="btn btn-success w-100 d-flex justify-content-center align-items-center" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCategories" aria-controls="offcanvasCategories">
                <i class="fal fa-grid-2 me-2"></i>
                {$lang->catalog|escape}
            </button>
            <hr>
        {/if}
        {if $user}
            <ul class="nav">
                <li class="nav-item w-100">
                    <a href="{$lang_link}user" class="nav-link d-flex align-items-center justify-content-between px-0">
                        <span class="d-flex align-items-center">
                            <i class="fal fa-user"></i>
                            <span class="ms-2">{$user->name}</span>
                        </span>
                    </a>
                </li>
            </ul>
        {else}
            <div class="bg-body-emphasis p-3 rounded text-center">
                <p class="small">{$lang->user_login_text|escape}</p>
                <a class="btn btn-primary btn-sm" href="#!" role="button" data-bs-toggle="modal" data-bs-target="#userModal">{$lang->user_login_button|escape}</a>
            </div>
            <hr class="border-color">
        {/if}
        <ul class="nav navbar-nav">
            {* Languages *}
            {if $languages|count > 1}
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#{$lang_link}" id="dropdownLang" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        {$language->label|escape|upper}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownLang">
                        {foreach $languages as $l}
                            {if $l->enabled}
                                <a href="{$l->url}" class="dropdown-item {if $language->id == $l->id}active{/if}">{$l->label|escape|upper}</a>
                            {/if}
                        {/foreach}
                    </div>
                </li>
            {/if}
            {* Currencies *}
            {if $currencies|count > 1}
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#{$lang_link}" id="dropdownCurrency" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        {$currency->sign|escape} {$currency->code|escape}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownCurrency">
                        {foreach $currencies as $c}
                            <a href="{url currency_id=$c->id}" class="dropdown-item {if $c->id==$currency->id}active{/if}">{$c->sign|escape} {$c->code|escape}</a>
                        {/foreach}
                    </div>
                </li>
            {/if}
        </ul>
        {* Color Mode *}
        {if $theme_settings->theme_color == 'theme_default'}
            <div class="d-flex my-1">
                <label role="button" class="custom-control-label me-1" for="darkSwitch"><i class="fal fa-moon"></i></label>
                <div class="form-switch form-check ms-2">
                    {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
                        <input role="button" type="checkbox" onclick="document.cookie='mode=;path=/';document.location.reload();" class="form-check-input" id="darkSwitch">
                    {else}
                        <input role="button" type="checkbox" onclick="document.cookie='mode=mode;path=/';document.location.reload();" class="form-check-input" id="darkSwitch" checked>
                    {/if}
                </div>
                <label role="button" class="custom-control-label" for="darkSwitch"><i class="fal fa-sun-bright"></i></label>
            </div>
        {/if}
        <hr class="border-color">
        <ul class="nav">
            {* Cart Informer *}
            <li id="cart-informer-sidebar" class="nav-item w-100">
                {include file='informers/cart_informer_sidebar.tpl'}
            </li>
            {* Wishlist Informer *}
            <li id="wishlist-informer-sidebar" class="nav-item w-100">
                {include file='informers/wishlist_informer_sidebar.tpl'}
            </li>
            {* Compare Informer *}
            <li id="compare-informer-sidebar" class="nav-item w-100">
                {include file='informers/compare_informer_sidebar.tpl'}
            </li>
        </ul>
        <hr class="border-color">
        <h6 class="text-muted">{$lang->about_shop|escape}</h6>
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
            {foreach $pages as $p}
                {if $p->menu_id == $theme_settings->menu_header_1}
                    {if $p->visible}
                        <li itemprop="name" class="nav-item dropdown {if $page && $page->id == $p->id}active{/if}">
                            <a itemprop="url" class="nav-link {if $p->subpages}dropdown-toggle{/if}" href="{$lang_link}{$p->url}" id="dropdown{$p->id}" role="button" {if $p->subpages}data-bs-toggle="dropdown" aria-expanded="false"{/if} aria-haspopup="true">
                                <span data-page="{$p->id}">{$p->header|escape}</span>
                            </a>
                            {if $p->subpages}
                                <div class="dropdown-menu" aria-labelledby="dropdown{$p->id}">
                                    {foreach $p->subpages as $p2}
                                        <a itemprop="url" class="dropdown-item {if $page && $page->id == $p2->id}active{/if}" href="{$lang_link}{$p2->url}">
                                            <span data-page="{$p2->id}">{$p2->header|escape}</span>
                                        </a>
                                    {/foreach}
                                </div>
                            {/if}
                        </li>
                    {/if}
                {/if}
            {/foreach}
        </ul>
        <hr class="border-color">
        <h6 class="text-muted">{$lang->catalog|escape}</h6>
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
            {foreach $pages as $p}
                {if $p->menu_id == $theme_settings->menu_header_2}
                    {if $p->visible}
                        <li itemprop="name" class="nav-item dropdown {if $page && $page->id == $p->id}active{/if}">
                            <a itemprop="url" class="nav-link {if $p->subpages}dropdown-toggle{/if}" href="{$lang_link}{$p->url}" id="dropdown{$p->id}" data-page="{$p->id}" role="button" {if $p->subpages}data-bs-toggle="dropdown" aria-expanded="false" {/if} aria-haspopup="true">{$p->header}</a>
                            {if $p->subpages}
                                <div class="dropdown-menu" aria-labelledby="dropdown{$p->id}">
                                    {foreach $p->subpages as $p2}
                                        <a itemprop="url" class="dropdown-item {if $page && $page->id == $p2->id}active{/if}" href="{$lang_link}{$p2->url}">
                                            <span data-page="{$p2->id}">{$p2->header|escape}</span>
                                        </a>
                                    {/foreach}
                                </div>
                            {/if}
                        </li>
                    {/if}
                {/if}
            {/foreach}
        </ul>
        <hr class="border-color">
        {* Callback *}
        <a href="javascript:void(0)" class="btn btn-primary w-100 d-flex justify-content-center align-items-center" type="button" data-bs-toggle="modal" data-bs-target="#callbackModal" role="button">
            <i class="fal fa-headset me-2"></i>
            {$lang->callback|escape}
        </a>
        <hr class="border-color">
        {* Social Buttons *}
        <h6 class="text-muted">{$lang->social_networks|escape}</h6>
        <ul class="list-unstyled list-inline">
            <li class="list-inline-item">
                <a href="{$theme_settings->facebook|escape}" class="btn-sm link-secondary mx-1">
                    <i class="fab fa-facebook-f bs-facebook"></i>
                </a>
            </li>
            <li class="list-inline-item">
                <a href="{$theme_settings->instagram|escape}" class="btn-sm link-secondary mx-1">
                    <i class="fab fa-instagram bs-instagram"></i>
                </a>
            </li>
            <li class="list-inline-item">
                <a href="{$theme_settings->twitterx|escape}" class="btn-sm link-secondary mx-1">
                    <i class="fab fa-x-twitter"></i>
                </a>
            </li>
            <li class="list-inline-item">
                <a href="{$theme_settings->youtube|escape}" class="btn-sm link-secondary mx-1">
                    <i class="fab fa-youtube bs-youtube"></i>
                </a>
            </li>
            <li class="list-inline-item">
                <a href="{$theme_settings->linkedin|escape}" class="btn-sm link-secondary mx-1">
                    <i class="fab fa-linkedin-in bs-linkedin"></i>
                </a>
            </li>
        </ul>
    </div>
</div>