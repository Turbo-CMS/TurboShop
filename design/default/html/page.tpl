{* Page Template *}

{* Canonical *}
{$canonical="/{$page->url}" scope=global}

{* Page Title *}
<h1 class="my-4">
	<span data-page="{$page->id}">{$page->name|escape}</span>
</h1>

{* Page Body *}
{$page->body}