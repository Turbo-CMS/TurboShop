{*id of multilingual site entities*}
{if $product->id}
    {$id = $product->id}
{elseif $category->id}
    {$id = $category->id}
{elseif $brand->id}
    {$id = $brand->id}
{elseif $feature->id}
    {$id = $feature->id}
{elseif $order->id}
    {$id = $order->id}
{elseif $user->id}
    {$id = $user->id}
{elseif $group->id}
    {$id = $group->id}
{elseif $page->id}
    {$id = $page->id}
{elseif $post->id}
    {$id = $post->id}
{elseif $faq->id}
    {$id = $faq->id}
{elseif $banner->id}
    {$id = $banner->id}
{elseif $banners_image->id}
    {$id = $banners_image->id}
{elseif $delivery->id}
    {$id = $delivery->id}
{elseif $payment_method->id}
    {$id = $payment_method->id}
{elseif $m->id && $smarty.get.module == "ManagerAdmin"}
    {$id = $m->id}
{elseif $language->id}
    {$id = $language->id}
{elseif $translation->id}
    {$id = $translation->id}
{elseif $menu->id}
    {$id = $menu->id}
{/if}

{*List of languages*}
{if $languages}
    {foreach $languages as $lang}
        <a class="flag flag_{$lang->id} {if $lang->id == $lang_id}focus{/if} hint-bottom-middle-t-info-s-small-mobile hint-anim" data-hint="{$lang->name|escape}" href="{url lang_id=$lang->id id=$id}" data-label="{$lang->label}">
            <img src="design/flags/1x1/{$lang->label}.svg">
        </a>
    {/foreach}
{/if}