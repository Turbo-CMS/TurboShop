{get_banner var=banner_1 group='1'}
{if $banner_1->items}
    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
        <ol class="carousel-indicators">
            {foreach $banner_1->items as $s name=indicator}
                <li data-target="#carouselExampleIndicators" data-slide-to="{$smarty.foreach.indicator.index}" {if $smarty.foreach.indicator.first}class="active" {/if}></li>
            {/foreach}
        </ol>
        <div class="carousel-inner" role="listbox">
            {foreach $banner_1->items as $s name=foo}
                <div class="carousel-item {if $smarty.foreach.foo.first}active{/if}">
                    <a href="{$lang_link}{$s->url|escape}"><img class="d-block img-fluid" src="{$s->image|resize_banners:900:350}" alt="{$s->name|escape}"></a>
                    <div class="carousel-caption d-md-block">
                        {if $s->name}<h3>{$s->name|escape}</h3>{/if}
                        <p>{$s->description}</p>
                    </div>
                </div>
            {/foreach}
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
{/if}