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

{if $languages}
	<li class="nav-item dropdown">
		<a class="nav-flag dropdown-toggle" href="#" id="languageDropdown" data-bs-toggle="dropdown">
			<img src="design/flags/4x3/{$lang_label}.svg" alt="{$lang_name}" title="{$lang_name}" />
		</a>
		<div class="dropdown-menu dropdown-menu-end" aria-labelledby="languageDropdown">
			{foreach $languages as $lang}
				<a class="dropdown-item {if $lang->id == $lang_id}active{/if}" href="{url lang_id=$lang->id id=$id}">
					<img src="design/flags/4x3/{$lang->label}.svg" alt="{$lang->name|escape}" width="20" class="align-middle me-1" />
					<span class="align-middle">{$lang->name|escape}</span>
				</a>
			{/foreach}
		</div>
	</li>
{/if}