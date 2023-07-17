{if isset($product->id)}
	{$id = $product->id}
{elseif isset($category->id)}
	{$id = $category->id}
{elseif isset($brand->id)}
	{$id = $brand->id}
{elseif isset($feature->id)}
	{$id = $feature->id}
{elseif isset($order->id)}
	{$id = $order->id}
{elseif isset($user->id)}
	{$id = $user->id}
{elseif isset($group->id)}
	{$id = $group->id}
{elseif isset($page->id)}
	{$id = $page->id}
{elseif isset($post->id)}
	{$id = $post->id}
{elseif isset($faq->id)}
	{$id = $faq->id}
{elseif isset($banner->id)}
	{$id = $banner->id}
{elseif isset($banners_image->id)}
	{$id = $banners_image->id}
{elseif isset($delivery->id)}
	{$id = $delivery->id}
{elseif isset($payment_method->id)}
	{$id = $payment_method->id}
{elseif isset($m->id) && isset($smarty.get.module) && $m->id && $smarty.get.module == "ManagerAdmin"}
	{$id = $m->id}
{elseif isset($language->id)}
	{$id = $language->id}
{elseif isset($translation->id)}
	{$id = $translation->id}
{elseif isset($menu->id)}
	{$id = $menu->id}
{/if}

{if $languages}
	<li class="nav-item dropdown">
		<a class="nav-flag dropdown-toggle" href="#" id="languageDropdown" data-bs-toggle="dropdown">
			<img src="design/flags/4x3/{$lang_label}.svg" alt="{if isset($lang_name)}{$lang_name}{/if}" title="{if isset($lang_name)}{$lang_name}{/if}" />
		</a>
		<div class="dropdown-menu dropdown-menu-end" aria-labelledby="languageDropdown">
			{foreach $languages as $lang}
				<a class="dropdown-item {if $lang->id == $lang_id}active{/if}" href="{url lang_id=$lang->id}">
					<img src="design/flags/4x3/{$lang->label}.svg" alt="{$lang->name|escape}" width="20" class="align-middle me-1" />
					<span class="align-middle">{$lang->name|escape}</span>
				</a>
			{/foreach}
		</div>
	</li>
{/if}