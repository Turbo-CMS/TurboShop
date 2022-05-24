{* Product comparison page template *}

{* Canonical page address *}
{$canonical="/compare" scope=global}

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

<!-- Page title -->
<h1 data-page="{$page->id}" class="my-4">{$lang->compare}</h1>

{if $products}
    <div class="table-responsive mt-4">
        <table class="table table-striped">
            <thead>
                <tr>
                    <td></td>
                    {foreach from=$products item=product}
                        <td class="product">
                            <a href='{$lang_link}compare/remove/{$product->url}'>
                                <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </a>
                            <!-- Product photo -->
                            {if $product->image}
                                <div class="image">
                                    <a href="{$lang_link}products/{$product->url}"><img src="{$product->image->filename|resize:100:100}" alt="{$product->name|escape}" /></a>
                                </div>
                            {else}
                                <div class="image">
                                    <a href="{$lang_link}products/{$product->url}"><img style="width: 100px; height: 100px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}" /></a>
                                </div>
                            {/if}
                            <!-- Product photo (The End) -->
                            <!-- Product Name -->
                            <p style="height: 30px;" class="text-center"><a data-product="{$product->id}" href="{$lang_link}products/{$product->url}">{$product->name|escape}</a></p>
                            <!-- Product Name (The End) -->
                            <div class="rating-wrap text-center  mb-2">
                                <ul class="rating-stars">
                                    <li style="width:{$product->rating*100/5|string_format:"%.0f"}%" class="stars-active">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                    </li>
                                </ul>
                                <div class="label-rating">{$product->votes|string_format:"%.0f"} {$product->votes|plural:$lang->vote:$lang->votes:$lang->of_vote}</div>
                            </div> <!-- rating-wrap.// -->
                        </td>
                    {/foreach}
                </tr>
            </thead>
            {foreach from=$compare_features name=features item=property}
                {if !$property->is_color}
                    <tr class="bord {if $smarty.foreach.features.iteration%2 == 0}gray{/if}">
                        <td class="feat">
                            <b>{$property->name}: </b>
                        </td>
                        {foreach from=$products item=product}
                            <td>
                                {foreach $product->features as $f}
                                    {if $f->name == $property->name}
                                        <span>{$f->value}</span>
                                    {/if}
                                {/foreach}
                            </td>
                        {/foreach}
                    </tr>
                {/if}
            {/foreach}
        </table>
    </div>
{else}
    <p>
        {$lang->compare_no_products}
    </p>
{/if}