<div class="row">
    {foreach $categories as $c}
        {if $c->visible}
            <div class="col-lg-4 col-md-4 col-sm-6">
                <h5>{if $c->subcategories}<i class="fa fa-folder-open text-warning"></i>{else}<i class="fa fa-folder text-warning"></i>{/if} <a href="{$lang_link}catalog/{$c->url}">{$c->name}</a></h5>
                <ul class="list-group list-group-flush">
                    {if $c->subcategories}
                        {foreach $c->subcategories as $cat}
                            {if $cat->visible}
                                <li class="list-group-item"><i class="fal fa-file-alt text-secondary"></i> <a href="{$lang_link}catalog/{$cat->url}">{$cat->name}</a></li>
                            {/if}
                        {/foreach}
                    {/if}
                </ul>
            </div>
        {/if}
    {/foreach}
</div>
<p class="mt-5">{$page->body}</p>