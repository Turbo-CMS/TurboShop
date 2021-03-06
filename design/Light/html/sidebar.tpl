<div class="mobile-offcanvas col-lg-3 bg-white" id="sidebar">
    <div class="offcanvas-header my-4">
        <button class="btn btn-danger btn-close float-right"> &times; {$lang->close}</button>
        <h5 class="py-2">{$lang->catalog}</h5>
    </div>
    {if $module=='ArticlesView' || $module=='ArticleView'}
        <!-- Search -->
        <form class="input-group my-4" action="{$lang_link}articles">
            <input class="form-control" type="text" name="keyword" autocomplete="off" value="{$keyword|escape}" placeholder="{$lang->search_article}" />
            <div class="input-group-append">
                <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
            </div>
        </form>
        <!-- Search (The End)-->
        <div class="list-group my-4">
            {foreach $articles_categories as $c}
                {if $c->visible}
                    <span class="hidden-sm-down list-group-item {if $articles_category->id == $c->id}bg-primary{/if}">
                        <a data-articles-category="{$c->id}" href="{$lang_link}articles/{$c->url}">
                            {$c->name|escape}
                        </a>
                        {if $c->subcategories}
                            <a data-toggle="collapse" data-parent="#sidebar" href="#menu{$c->id}">
                                <i class="fa fa-caret-down"></i>
                            </a>
                        {/if}
                    </span>
                    {if $c->subcategories}
                        <div class="collapse cat {if in_array($articles_category->id, $c->children)}show{/if}" id="menu{$c->id}">
                            {foreach $c->subcategories as $cat}
                                {if $c->visible}
                                    <span class="hidden-sm-down list-group-item {if $articles_category->id == $cat->id}bg-primary{/if}">
                                        <a data-articles-category="{$cat->id}" href="{$lang_link}articles/{$cat->url}">
                                            {$cat->name|escape}
                                        </a>
                                        {if $cat->subcategories}
                                            <a data-toggle="collapse" aria-expanded="false" href="#menusub{$cat->id}">
                                                <i class="fa fa-caret-down"></i>
                                            </a>
                                        {/if}
                                    </span>
                                    {if $cat->subcategories}
                                        <div class="collapse cat3 {if in_array($articles_category->id, $cat->children)}show{/if}" id="menusub{$cat->id}">
                                            {foreach $cat->subcategories as $cat3}
                                                {if $cat3->visible}
                                                    <a data-articles-category="{$cat3->id}" href="{$lang_link}articles/{$cat3->url}" class="list-group-item {if $articles_category->id == $cat3->id}bg-primary text-white{/if}" data-parent="#menusub{$cat->id}">{$cat3->name|escape}</a>
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
    {elseif $module=='BlogView'}
        <!-- Search-->
        <form class="input-group my-4" action="{$lang_link}blog">
            <input class="form-control" type="text" name="keyword" autocomplete="off" value="{$keyword|escape}" placeholder="{$lang->search_blog}" />
            <div class="input-group-append">
                <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
            </div>
        </form>
        <!-- Search (The End)-->
        {if $categories}
            <div class="list-group mt-4">
                {foreach $categories as $c}
                    {if $c->visible}
                        <span class="hidden-sm-down list-group-item {if $category->id == $c->id}bg-primary{/if}">
                            <a data-category="{$c->id}" href="{$lang_link}catalog/{$c->url}">
                                {$c->name|escape}
                                <span class="badge badge-pill badge-light float-right">{$c->products_count}</span>
                            </a>
                            {if $c->subcategories}
                                <a data-toggle="collapse" data-parent="#sidebar" href="#menu{$c->id}">
                                    <i class="fa fa-caret-down"></i>
                                </a>
                            {/if}
                        </span>
                        {if $c->subcategories}
                            <div class="collapse cat {if in_array($category->id, $c->children)}show{/if}" id="menu{$c->id}">
                                {foreach $c->subcategories as $cat}
                                    {if $c->visible}
                                        <span class="hidden-sm-down list-group-item {if $category->id == $cat->id}bg-primary{/if}">
                                            <a data-category="{$cat->id}" href="{$lang_link}catalog/{$cat->url}">
                                                {$cat->name|escape}
                                                <span class="badge badge-pill badge-light float-right">{$cat->products_count}</span>
                                            </a>
                                            {if $cat->subcategories}
                                                <a data-toggle="collapse" aria-expanded="false" href="#menusub{$cat->id}">
                                                    <i class="fa fa-caret-down"></i>
                                                </a>
                                            {/if}
                                        </span>
                                        {if $cat->subcategories}
                                            <div class="collapse cat3 {if in_array($category->id, $cat->children)}show{/if}" id="menusub{$cat->id}">
                                                {foreach $cat->subcategories as $cat3}
                                                    {if $cat3->visible}
                                                        <a href="{$lang_link}catalog/{$cat3->url}" class="list-group-item {if $category->id == $cat3->id}bg-primary text-white{/if}" data-category="{$cat3->id}" data-parent="#menusub{$cat->id}">{$cat3->name|escape}<span class="badge badge-pill badge-light float-right">{$cat3->products_count}</span></a>
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
                <span class="hidden-sm-down list-group-item bg-light"><a href="{$lang_link}products">{$lang->all_products}</a></span>
            </div>
        {/if}
        {if $module!=='ProductsView'}
            <!-- All brands -->
            {* Select all brands in the variable $ all_brands *}
            {get_brands var=all_brands}
            {if $all_brands}
                <div id="all_brands">
                    <h4 class="my-4">{$lang->all_brands}:</h4>
                    {foreach $all_brands as $b}
                        <a class="btn btn-primary btn-sm mb-1" href="{$lang_link}brands/{$b->url}">{$b->name}</a>
                    {/foreach}
                </div>
            {/if}
            <!-- All brands (The End)-->
        {/if}
        {if $module=='ProductsView'}
            {include file='filter.tpl'}
        {/if}
        <!-- Currency selection -->
        {* Currency selection only if there is more than one *}
        {if $currencies|count>1}
            <div class="my-4" id="currencies">
                <h4 class="mt-4">{$lang->currency}</h4>
                {foreach $currencies as $c}
                    {if $c->enabled}
                        <a class="badge {if $c->id==$currency->id}badge-success{else}badge-secondary{/if}" href='{url currency_id=$c->id}'>{$c->name|escape}</a>
                    {/if}
                {/foreach}
            </div>
        {/if}
        <!-- Currency selection (The End) -->
    {else}
        {if $module!=='SearchView'}
            <!-- Search -->
            <form class="input-group my-4" action="{$lang_link}products">
                <input class="input_search form-control" type="text" name="keyword" value="{$keyword|escape}" placeholder="{$lang->product_search}" />
                <div class="input-group-append">
                    <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                </div>
            </form>
            <!-- Search (The End)-->
        {/if}
        {if $categories}
            <div class="list-group mt-4">
                {foreach $categories as $c}
                    {if $c->visible}
                        <span class="hidden-sm-down list-group-item {if $category->id == $c->id}bg-primary{/if}">
                            <a data-category="{$c->id}" href="{$lang_link}catalog/{$c->url}">
                                {$c->name|escape}
                                <span class="badge badge-pill badge-light float-right">{$c->products_count}</span>
                            </a>
                            {if $c->subcategories}
                                <a data-toggle="collapse" data-parent="#sidebar" href="#menu{$c->id}">
                                    <i class="fa fa-caret-down"></i>
                                </a>
                            {/if}
                        </span>
                        {if $c->subcategories}
                            <div class="collapse cat {if in_array($category->id, $c->children)}show{/if}" id="menu{$c->id}">
                                {foreach $c->subcategories as $cat}
                                    {if $c->visible}
                                        <span class="hidden-sm-down list-group-item {if $category->id == $cat->id}bg-primary{/if}">
                                            <a data-category="{$cat->id}" href="{$lang_link}catalog/{$cat->url}">
                                                {$cat->name|escape}
                                                <span class="badge badge-pill badge-light float-right">{$cat->products_count}</span>
                                            </a>
                                            {if $cat->subcategories}
                                                <a data-toggle="collapse" aria-expanded="false" href="#menusub{$cat->id}">
                                                    <i class="fa fa-caret-down"></i>
                                                </a>
                                            {/if}
                                        </span>
                                        {if $cat->subcategories}
                                            <div class="collapse cat3 {if in_array($category->id, $cat->children)}show{/if}" id="menusub{$cat->id}">
                                                {foreach $cat->subcategories as $cat3}
                                                    {if $cat3->visible}
                                                        <a href="{$lang_link}catalog/{$cat3->url}" class="list-group-item {if $category->id == $cat3->id}bg-primary text-white{/if}" data-category="{$cat3->id}" data-parent="#menusub{$cat->id}">{$cat3->name|escape}<span class="badge badge-pill badge-light float-right">{$cat3->products_count}</span></a>
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
                <span class="hidden-sm-down list-group-item bg-light"><a href="{$lang_link}products">{$lang->all_products}</a></span>
            </div>
        {/if}
        {if $module!=='ProductsView'}
            <!-- All brands -->
            {* Select all brands in the variable $ all_brands *}
            {get_brands var=all_brands}
            {if $all_brands}
                <div id="all_brands">
                    <h4 class="my-4">{$lang->all_brands}:</h4>
                    {foreach $all_brands as $b}
                        <a class="btn btn-primary btn-sm mb-1" href="{$lang_link}brands/{$b->url}">{$b->name}</a>
                    {/foreach}
                </div>
            {/if}
            <!-- All brands (The End)-->
        {/if}
        {if $module=='ProductsView'}
            {include file='filter.tpl'}
        {/if}
        <!-- Currency selection -->
        {* Currency selection only if there is more than one *}
        {if $currencies|count>1}
            <div class="my-4" id="currencies">
                <h4 class="mt-4">{$lang->currency}</h4>
                {foreach $currencies as $c}
                    {if $c->enabled}
                        <a class="badge {if $c->id==$currency->id}badge-success{else}badge-secondary{/if}" href='{url currency_id=$c->id}'>{$c->name|escape}</a>
                    {/if}
                {/foreach}
            </div>
        {/if}
        <!-- Currency selection (The End) -->
    {/if}
    {* Last comments *}
    {get_comments var=last_comments}
    {if $last_comments}
        <div class="card my-4">
            <h5 class="card-header">{$lang->comments_global}</h5>
            <div class="card-body">
                {get_comments var=last_comments limit=3 type='product'}
                {if $last_comments}
                    {foreach $last_comments as $comment}
                        <h5 class="card-title">{$comment->name}</h5>
                        <p class="card-text"><small class="text-muted">{$comment->date|date} ?? {$comment->date|time}</small></p>
                        <p class="card-text">{$comment->text|strip_tags|truncate:150}</p>
                        <p>
                            <a href="{$lang_link}products/{$comment->url}#comment_{$comment->id}" class="card-link"><small>{$comment->product}</small></a>
                        </p>
                        <hr>
                    {/foreach}
                {/if}
                {get_comments var=last_comments limit=3 type='article'}
                {if $last_comments}
                    {foreach $last_comments as $comment}
                        <h5 class="card-title">{$comment->name}</h5>
                        <p class="card-text"><small class="text-muted">{$comment->date|date} ?? {$comment->date|time}</small></p>
                        <p class="card-text">{$comment->text|strip_tags|truncate:150}</p>
                        <p>
                            <a href="{$lang_link}article/{$comment->url}#comment_{$comment->id}" class="card-link"><small>{$comment->article}</small></a>
                        </p>
                        <hr>
                    {/foreach}
                {/if}
                {get_comments var=last_comments limit=3 type='blog'}
                {if $last_comments}
                    {foreach $last_comments as $comment}
                        <h5 class="card-title">{$comment->name}</h5>
                        <p class="card-text"><small class="text-muted">{$comment->date|date} ?? {$comment->date|time}</small></p>
                        <p class="card-text">{$comment->text|strip_tags|truncate:150}</p>
                        <p>
                            <a href="{$lang_link}blog/{$comment->url}#comment_{$comment->id}" class="card-link"><small>{$comment->post}</small></a>
                        </p>
                        <hr>
                    {/foreach}
                {/if}
            </div>
        </div>
    {/if}
</div>