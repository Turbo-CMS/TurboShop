{* Search Articles *}
<form class="input-group my-4" action="{$lang_link}articles">
    <input class="articles-search form-control" type="text" name="keyword" autocomplete="off" value="{if isset($keyword) && $keyword}{$keyword|escape}{/if}" placeholder="{$lang->search_article}">
    <button class="btn btn-success" type="submit"><i class="fal fa-search"></i></button>
</form>

{* Articles Categories *}
<div class="list-group my-4">
    {foreach $articles_categories as $c}
        {if $c->visible}
            <span class="hidden-sm-down list-group-item {if isset($articles_category->id) && $articles_category->id == $c->id}bg-primary{/if}">
                <a data-articles-category="{$c->id}" class="text-decoration-none" href="{$lang_link}articles/{$c->url}">
                    {$c->name|escape}
                </a>
                {if isset($c->subcategories)}
                    <a data-bs-toggle="collapse" data-parent="#sidebar" class="text-decoration-none" href="#menu{$c->id}" {if isset($articles_category) && in_array($articles_category->id, $c->children)}aria-expanded="true" {/if}>
                        <i class="far fa-angle-down"></i>
                    </a>
                {/if}
            </span>
            {if isset($c->subcategories)}
                <div class="collapse cat {if isset($articles_category) && in_array($articles_category->id, $c->children)}show{/if}" id="menu{$c->id}">
                    {foreach $c->subcategories as $cat}
                        {if $cat->visible}
                            <span class="hidden-sm-down list-group-item {if isset($articles_category->id) && $articles_category->id == $cat->id}bg-primary{/if}">
                                <a data-articles-category="{$cat->id}" class="text-decoration-none" href="{$lang_link}articles/{$cat->url}">
                                    {$cat->name|escape}
                                </a>
                                {if $cat->subcategories}
                                    <a data-bs-toggle="collapse" aria-expanded="false" class="text-decoration-none" href="#menusub{$cat->id}" {if isset($articles_category) && in_array($articles_category->id, $cat->children)}aria-expanded="true" {/if}>
                                        <i class="far fa-angle-down"></i>
                                    </a>
                                {/if}
                            </span>
                            {if isset($cat->subcategories)}
                                <div class="collapse cat3 {if isset($articles_category) && in_array($articles_category->id, $cat->children)}show{/if}" id="menusub{$cat->id}">
                                    {foreach $cat->subcategories as $cat3}
                                        {if $cat3->visible}
                                            <a data-articles-category="{$cat3->id}" href="{$lang_link}articles/{$cat3->url}" class="list-group-item text-decoration-none {if $articles_category->id == $cat3->id}bg-primary text-white{/if}" data-parent="#menusub{$cat->id}">{$cat3->name|escape}</a>
                                        {/if}
                                    {/foreach}
                                </div>
                            {/if}
                        {/if}
                    {/foreach}
                </div>
            {/if}
        {/if}
    {/foreach}
</div>