{if $category->brands || $features}
    <div class="card card-filter mt-4">
        {if ($minprice != 0 && $maxprice != 0) && ($minprice != $maxprice)}
            <article class="card-group-item">
                <header class="card-header">
                    <a class="" aria-expanded="true" href="#" data-toggle="collapse" data-target="#collapse22">
                        <i class="icon-action fa fa-chevron-down"></i>
                        <h6 class="title">{$lang->filter_by_price}</h6>
                    </a>
                </header>
                <div style="" class="filter-content collapse show" id="collapse22">
                    <div class="card-body">
                        <div class="sidebar-block filter-price">
                            <input type="hidden" value="{$minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" id="f_minPrice">
                            <input type="hidden" value="{$maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" id="f_maxPrice">
                            <input type="hidden" value="{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}" id="f_currentMinPrice">
                            <input type="hidden" value="{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}" id="f_currentMaxPrice">
                            <input type="hidden" value="10{if $currency->code == 'RUR'}0{/if}" id="f_priceStep">
                            <input type="hidden" value=" {$currency->sign}" id="f_postfix">
                            <span type="text" id="price-slider"></span>
                            <form class="mcf_form" method="post">
                                <input type="hidden" name="rate_from" id="rate_from" value="{$currency->rate_from}" />
                                <input type="hidden" name="rate_to" id="rate_to" value="{$currency->rate_to}" />
                                <input type="hidden" name="min_price" id="min_price" value="{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}">
                                <input type="hidden" name="max_price" id="max_price" value="{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}">
                                <button type="submit" class="btn btn-block btn-outline-primary mt-2">{$lang->apply}</button>
                            </form>
                        </div>
                    </div>
                </div>
            </article>
        {/if}
        <form method="get" action="{url page=null}">
            {if !$brand}
                {if $category->brands}
                    <article class="card-group-item">
                        <header class="card-header">
                            <a href="#" data-toggle="collapse" data-target="#collapse_brands">
                                <i class="icon-action fa fa-chevron-down"></i>
                                <h6 class="title">{$lang->index_brands}</h6>
                            </a>
                        </header>
                        <div class="filter-content collapse show" id="collapse_brands">
                            <div class="card-body">
                                {foreach $category->brands as $b}
                                    <div tabindex="0" class="fac fac-checkbox">
                                        <a href="{furl params=[brand=>$b->url, page=>null]}" {if $brand->id == $b->id || $smarty.get.b && in_array($b->id,$smarty.get.b)}class="selected" {/if}>{$b->name|escape}</a>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </article>
                {/if}
            {/if}
            {if $features}
                {foreach $features as $f}
                    {if $f->is_color}
                        <article class="card-group-item">
                            <header class="card-header">
                                <a href="#" data-toggle="collapse" data-target="#collapse{$f->id}">
                                    <i class="icon-action fa fa-chevron-down"></i>
                                    <h6 class="title">{$f->name}</h6>
                                </a>
                            </header>
                            <div class="filter-content collapse show" id="collapse{$f->id}">
                                <div class="card-body">
                                    {foreach $f->options as $k=>$o}
                                        <a href="{furl params=[$f->url=>$o->translit, page=>null]}" style="background-color:{$o->value|escape}" class="btn btn-sm mt-1 {if $o->value == '#ffffff'}white{/if} {if $smarty.get.{$f@key} && in_array($o->translit,$smarty.get.{$f@key})}active{/if}">
                                            <span class="fas fa-check"></span>
                                        </a>
                                    {/foreach}
                                </div>
                            </div>
                        </article>
                    {else}
                        <article class="card-group-item">
                            <header class="card-header">
                                <a href="#" data-toggle="collapse" data-target="#collapse{$f->id}">
                                    <i class="icon-action fa fa-chevron-down"></i>
                                    <h6 class="title">{$f->name}</h6>
                                </a>
                            </header>
                            <div class="filter-content collapse show" id="collapse{$f->id}">
                                <div class="card-body">
                                    {foreach $f->options as $o}
                                        <div tabindex="0" class="fac fac-checkbox">
                                            <a href="{furl params=[$f->url=>$o->translit, page=>null]}" {if $smarty.get.{$f@key} && in_array($o->translit,$smarty.get.{$f@key})}class="selected"{/if}>{$o->value|escape}</a>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        </article>
                    {/if}
                {/foreach}
            {/if}
        </form>
    </div>
    <div class="card-body">
        <a class="btn btn-block btn-outline-secondary mcf_button" href="{$lang_link}catalog/{$category->url}">{$lang->reset}</a>
    </div>
{/if}