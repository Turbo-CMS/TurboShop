{* Reviews *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->global_reviews scope=global}

	{* Canonical *}
	{$canonical="/reviews" scope=global}
{/if}

<div class="row justify-content-center">
	<div class="col-md-12 col-lg-9 col-xl-8">

		{* Page Title *}
		{if $page}
			<h1 class="my-4">
				<span data-page="{$page->id}">{$page->name|escape}</span>
			</h1>
		{else}
			<h1 class="my-4">{$lang->global_reviews|escape}</h1>
		{/if}

		{* Rating Wrap *}
		<div class="rating-wrap mb-2 ratings reviews">
			<ul class="rating-stars rater-starsOff" style="width:132px;">
				<li style="width:{$ratings*100/5|string_format:'%.0f'}%" class="stars-active rater-starsOn">
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
				</li>
				<li>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
					<i class="far fa-star"></i>
				</li>
			</ul>
			{if $ratings> 0}
				<div class="label-rating">
					<span class="rater-rating h3">{$ratings|string_format:"%.1f"}</span>
				</div>
			{/if}
		</div>

		{* Post Body *}
		{if $page}
			{$page->body}
		{/if}

		{* Comments *}
		{include file='comments/comments_reviews.tpl'}

	</div>
</div>