{* FAQ Template *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->faq_name scope=global}

	{* Canonical *}
	{$canonical="/faq" scope=global}
{/if}

{* Page Title *}
{if $page}
	<h1 class="my-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-4">{$lang->faq_name|escape}</h1>
{/if}

<div class="row justify-content-center">
	<div class="col-md-12 col-lg-9 col-xl-8">

		{* Page Body *}
		{if $page}
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
		{else}
			<div class="mb-3">
				{$lang->no_faqs_found|escape}
			</div>
		{/if}

	</div>
</div>