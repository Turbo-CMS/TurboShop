{* Page Template *}

{* Canonical *}
{$canonical="/{$page->url}" scope=global}

{if $page->url=="404"}
	<div class="container d-flex justify-content-center align-items-center">
		<div class="text-center">
			<h1 class="display-1 text-danger fw-medium">404</h1>
			<p class="lead text-muted">{$page->header|escape}</p>
			<a class="btn btn-success" href="{if $lang_link}{$lang_link}{else}/{/if}">{$lang->return_to_home|escape}</a>
		</div>
	</div>
{else}
	<div class="row justify-content-center">
		<div class="col-md-12 col-lg-9 col-xl-8">

			{* Page Title *}
			<h1 class="my-4">
				<span data-page="{$page->id}">{$page->name|escape}</span>
			</h1>

			{* Page Body *}
			{$page->body}

		</div>
	</div>
{/if}