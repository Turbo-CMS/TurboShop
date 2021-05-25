{if $cart->total_products>0}
    <a href="{$lang_link}cart/" class="btn btn-primary">
        <i class="fa fa-shopping-cart"></i> {$lang->index_cart} <span class="badge badge-light">{$cart->total_products}</span>
    </a>
{else}
    <a href="{$lang_link}cart/" class="btn btn-primary">
        <i class="fa fa-shopping-cart"></i> {$lang->index_cart} <span class="badge badge-light">0</span>
    </a>
{/if}