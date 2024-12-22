{* Articles Sidebar *}

<div class="offcanvas-lg offcanvas-end bg-body col-lg-3 p-0" tabindex="-1" id="sidebar" aria-labelledby="sidebarLabel">
    {* Header Sidebar *}
    <div class="offcanvas-header border-bottom">
        <h5 class="offcanvas-title" id="sidebarLabel">{$lang->global_articles|escape}</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#sidebar" aria-label="Close"></button>
    </div>

    <div class="p-3">
        {* Search *}
        <div class="mb-4">
            <h5 class="text-muted">{$lang->global_search|escape}</h5>
            <form class="input-group" action="{$lang_link}articles">
                <input class="articles-search form-control" type="text" name="keyword" autocomplete="off" value="{$keyword|escape}" placeholder="{$lang->search_article|escape}">
                <button class="btn btn-primary" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>

        {* Categories *}
        <div class="mb-4">
            <h5 class="text-muted">{$lang->global_categories|escape}</h5>
            <ul class="list-group list-group-flush">
                {foreach $articles_categories as $c}
                    <li class="list-group-item ps-1">
                        <a data-articles-category="{$c->id}" class="text-decoration-none {if $articles_category && $articles_category->id == $c->id}fw-medium{/if}" href="{$lang_link}articles/{$c->url}">
                            {$c->name|escape}
                        </a>
                        {if $c->subcategories}
                            <ul class="list-unstyled ms-3">
                                {foreach $c->subcategories as $cat}
                                    <li><a href="{$lang_link}articles/{$cat->url}" class="text-decoration-none"> {$cat->name|escape}</a></li>
                                {/foreach}
                            </ul>
                        {/if}
                    </li>
                {/foreach}
            </ul>
        </div>

        {* Last Articles *}
        {get_articles var=last_articles limit=3}
        {if $last_articles}
            <div class="mb-4">
                <h5 class="text-muted">{$lang->last_articles|escape}</h5>
                {foreach $last_articles as $article}
                    <div class="d-flex mb-2">
                        <a class="flex-shrink-0" href="{$lang_link}article/{$article->url}">
                            <img src="{$article->image|resize_articles:100:100}" class="me-2 rounded" alt="{$article->name|escape}">
                        </a>
                        <div>
                            <a href="{$lang_link}article/{$article->url}" class="text-decoration-none text-reset fw-bold lh-1">{$article->name|escape}</a>
                            <p class="mb-0 text-muted small">{$article->date|date}</p>
                        </div>
                    </div>
                {/foreach}
            </div>
        {/if}

        {* Tags *}
        {if $all_tags}
            <div class="mb-4">
                <h5 class="text-muted">{$lang->global_tags|escape}</h5>
                <div>
                    {foreach $all_tags as $tag}
                        <a href="{$lang_link}articles/?keyword={$tag}" rel="nofollow" class="btn btn-sm btn-outline-default mb-2 {if $keyword == $tag}active{/if}">
                            {$tag}
                        </a>
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>
</div>