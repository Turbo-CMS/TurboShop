{* Product Comparison *}

{if isset($page)}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->compare scope=global}

	{* Canonical *}
	{$canonical="/compare" scope=global}
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
				<a itemprop="item" class="text-decoration-none" href="{$lang_link}compare">
					<span itemprop="name">{$lang->compare}</span>
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
	<h1 class="my-4">{$lang->compare}</h1>
{/if}

{if $products}
	<div class="table-responsive mt-4 compare">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<td></td>
					{foreach $products as $product}
						<td class="product">
							<a href='{$lang_link}compare/remove/{$product->url}'>
								<button type="button" class="btn-close small" aria-label="Close"></button>
							</a>
							{if isset($product->image)}
								<div class="image">
									<a href="{$lang_link}products/{$product->url}">
										<img src="{$product->image->filename|resize:100:100}" alt="{$product->name|escape}">
									</a>
								</div>
							{else}
								<div class="image">
									<a href="{$lang_link}products/{$product->url}">
										<img style="width: 100px; height: 100px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}">
									</a>
								</div>
							{/if}
							<div style="height: 30px;" class="text-center mb-2">
								<a data-product="{$product->id}" class="text-decoration-none" href="{$lang_link}products/{$product->url}">{$product->name|escape}</a>
							</div>
							<div class="rating-wrap text-center mb-2">
								<ul class="rating-stars">
									<li style="width:{$product->rating*100/5|string_format:'%.0f'}%" class="stars-active">
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
								<div class="label-rating">{$product->votes|string_format:"%.0f"} {$product->votes|plural:$lang->vote:$lang->votes:$lang->of_vote}</div>
							</div>
						</td>
					{/foreach}
				</tr>
			</thead>
			{if isset($compare_features)}
				{foreach $compare_features as $feature}
					{if !$feature->is_color}
						<tr>
							<td>
								<strong>{$feature->name}:</strong>
							</td>
							{foreach $products as $product}
								<td>
									{if isset($product->features)}
										{foreach $product->features as $f}
											{if $f->name == $feature->name}
												{foreach $f->values as $v}
													{$v->value}{if !$v@last},{/if}
												{/foreach}
											{/if}
										{/foreach}
									{/if}
								</td>
							{/foreach}
						</tr>
					{/if}
				{/foreach}
			{/if}
		</table>
	</div>
{else}
	<div class="my-1">
		{$lang->compare_no_products}
	</div>
{/if}