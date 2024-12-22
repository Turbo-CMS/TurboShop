{if $product && $product->id}
	{$id = $product->id}
{elseif $category && $category->id}
	{$id = $category->id}
{elseif $brand && $brand->id}
	{$id = $brand->id}
{elseif $feature && $feature->id}
	{$id = $feature->id}
{elseif $order && $order->id}
	{$id = $order->id}
{elseif $user && $user->id}
	{$id = $user->id}
{elseif $group && $group->id}
	{$id = $group->id}
{elseif $page && $page->id}
	{$id = $page->id}
{elseif $post && $post->id}
	{$id = $post->id}
{elseif $faq && $faq->id}
	{$id = $faq->id}
{elseif $banner && $banner->id}
	{$id = $banner->id}
{elseif $banners_image && $banners_image->id}
	{$id = $banners_image->id}
{elseif $delivery && $delivery->id}
	{$id = $delivery->id}
{elseif $payment_method && $payment_method->id}
	{$id = $payment_method->id}
{elseif $language && $language->id}
	{$id = $language->id}
{elseif $translation && $translation->id}
	{$id = $translation->id}
{/if}

{if $languages}
	<li class="nav-item dropdown">
		<a class="nav-flag dropdown-toggle" href="#" id="languageDropdown" data-bs-toggle="dropdown">
			<img src="design/flags/4x3/{$lang_label}.svg" alt="{if $lang_name}{$lang_name}{/if}" title="{if $lang_name}{$lang_name}{/if}">
		</a>
		<div class="dropdown-menu dropdown-menu-end" aria-labelledby="languageDropdown">
			{foreach $languages as $lang}
				<a class="dropdown-item {if $lang->id == $lang_id}active{/if}" href="{if $id}{url lang_id=$lang->id id=$id}{else}{url lang_id=$lang->id}{/if}">
					<img src="design/flags/4x3/{$lang->label}.svg" alt="{$lang->name|escape}" width="20" class="nav-flag-icon align-middle me-1" />
					<span class="align-middle">{$lang->name|escape}</span>
				</a>
			{/foreach}
		</div>
	</li>
{/if}