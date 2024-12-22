{* Search Blog *}
{if $theme_settings->header_type != '2'}
    <form class="input-group my-4" action="{$lang_link}blog">
        <input class="blog-search form-control" type="text" name="keyword" autocomplete="off" value="{$keyword|escape}" placeholder="{$lang->search_blog|escape}">
        <button class="btn btn-success" type="submit"><i class="fal fa-search"></i></button>
    </form>
{/if}

{* Categories *}
{include file='sidebar/products_categories.tpl'}

{* All Brands *}
{if $module!=='ProductsView'}
    {include file='sidebar/all_brands.tpl'}
{/if}

{* Currency *}
{include file='sidebar/currency.tpl'}