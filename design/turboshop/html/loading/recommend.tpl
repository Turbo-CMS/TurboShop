{* Recommend *}
{get_products featured=1 var=featured_products limit=$theme_settings->products_tab_products_limit}
{if $featured_products}
    <div class="catalog-items catalog_block_template">
        <div class="catalog-block">
            <div class="js_append ajax_load block grid-list grid-list--fill-bg mobile-scrolled mobile-scrolled--items-2 mobile-offset grid-list--items-{$theme_settings->products_tab_grid_column}-1200 grid-list--items-4-992 grid-list--items-3-768 grid-list--items-2-601">
                {foreach $featured_products as $product}
                    {include file='products/grid_tab.tpl'}
                {/foreach}
            </div>
        </div>
    </div>
{/if}