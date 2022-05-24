{if $cart->total_products>0}
    <a href="{$lang_link}cart/" class="btn btn-primary">
        <i class="fal fa-shopping-bag"></i> {$lang->index_cart} <span class="badge badge-light">{$cart->total_products}</span>
    </a>
{else}
    <a href="{$lang_link}cart/" class="btn btn-primary">
        <i class="fal fa-shopping-bag"></i> {$lang->index_cart} <span class="badge badge-light">0</span>
    </a>
{/if}