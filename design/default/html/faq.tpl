{* FAQ Template *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->faq scope=global}

	{* Canonical *}
	{$canonical="/faq" scope=global}
{/if}

{* Breadcrumb *}
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}">
				<span itemprop="name" title="{$lang->home}"><i class="fal fa-house me-2"></i>{$lang->home}</span>
			</a>
			<meta itemprop="position" content="{$level++}">
		</li>
		{if isset($page)}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}{$page->url}">
					<span itemprop="name">{$page->header|escape}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{else}
			<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}faq">
					<span itemprop="name">{$lang->faq}</span>
				</a>
				<meta itemprop="position" content="{$level++}">
			</li>
		{/if}
	</ol>
</nav>

{* Page Title *}
{if isset($page->name)}
	<h1 class="my-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-4">{$lang->faq}</h1>
{/if}

{* Page Body *}
{if isset($page->body)}
	{$page->body}
{/if}

{if $faqs}
	<div class="accordion" id="accordionFaq">
		{foreach $faqs as $faq name=active}
			<div class="accordion-item" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
				<h2 class="accordion-header" id="heading-{$faq->id}">
					<button class="accordion-button {if !$smarty.foreach.active.first}collapsed{/if}" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-{$faq->id}" aria-expanded="true" aria-controls="collapse-{$faq->id}">
						<span itemprop="name">{$faq->name|escape}</span>
					</button>
				</h2>
				<div id="collapse-{$faq->id}" class="accordion-collapse collapse {if $smarty.foreach.active.first}show{/if}" aria-labelledby="heading-{$faq->id}" data-bs-parent="#accordionFaq" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
					<div class="accordion-body" itemprop="text">
						{$faq->answer}
					</div>
				</div>
			</div>
		{/foreach}
	</div>
{/if}