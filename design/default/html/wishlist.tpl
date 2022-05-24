{* Wish list*}

{* Canonical page address *}
{$canonical="/{$page->url}" scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
    <ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb bg-light">
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
            <a itemprop="item" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
            <meta itemprop="position" content="{$level++}" />
        </li>
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
            <a itemprop="item" href="{$lang_link}{$page->url}"><span itemprop="name">{$page->header|escape}</span></a>
            <meta itemprop="position" content="{$level++}" />
        </li>
    </ol>
</nav>
<!-- Breadcrumb #End /-->

{* Page title *}
<h1 class="my-4">{$page->name|escape}</h1>

{if $products}
    <div class="btn-toolbar justify-content-between mb-4" role="toolbar" aria-label="Toolbar with button groups">
        <span></span>
        <div class="btn-group" role="group" aria-label="First group">
            <button onclick="document.cookie='view=grid;path=/';document.location.reload();" type="button" class="btn btn-light {if $smarty.cookies.view == 'grid'}active{/if}"><i class="fa fa-th"></i></button>
            <button onclick="document.cookie='view=list;path=/';document.location.reload();" type="button" class="btn btn-light {if $smarty.cookies.view == 'list'}active{/if}"><i class="fa fa-th-list"></i></button>
        </div>
    </div>
    <div class="row">
        {if $smarty.cookies.view == 'list'}
            <main class="col-md-12">
                {include file='list.tpl'}
                {include file='pagination.tpl'}
            </main>
        {else}
            {foreach $products as $product}
                {include file='grid.tpl'}
            {/foreach}
            <main class="col-md-12">
                {include file='pagination.tpl'}
            </main>
        {/if}
    </div>
{else}
    <p>
        {$lang->wishlist_no_products}
    </p>
{/if}

{* Page description (if set) *}
{$page->body}