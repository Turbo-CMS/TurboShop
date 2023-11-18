{* Home Page *}

{* Wrapper *}
{$wrapper = 'index.tpl' scope=global}

{* Canonical *}
{$canonical="" scope=global}

{* Main Content *}
{if $theme_settings->main_type == "1"}
	{include file='main/main_content_1.tpl'}
{elseif $theme_settings->main_type == "2"}
	{include file='main/main_content_2.tpl'}
{/if}

{* Page Title *}
{if isset($page->header)}
	<h1>
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{/if}

{* Page Body *}
{if isset($page->body)}
	{$page->body}
{/if}