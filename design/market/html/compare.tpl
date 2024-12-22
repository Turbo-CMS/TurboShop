{* Product Comparison *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->compare scope=global}

	{* Canonical *}
	{$canonical="/compare" scope=global}
{/if}

{* Page Title *}
{if $page}
	<h1 class="my-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-4">{$lang->compare|escape}</h1>
{/if}

{if $products}
	<div class="table-responsive mt-4 compare">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<td class="feature"></td>
					{assign var="product_count" value=$products|@count}
					{assign var="max_compare" value=4}
					{foreach $products as $product}
						<td class="product">
							<a href='{$lang_link}compare/remove/{$product->url}'>
								<button type="button" class="btn-close small" aria-label="Close"></button>
							</a>
							{if $product->image}
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
									<li style="width:{$product->ratings*100/5|string_format:'%.0f'}%" class="stars-active">
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
								<div class="label-rating">{$product->ratings|string_format:"%.1f"}</div>
							</div>
						</td>
					{/foreach}
					{if $product_count < $max_compare}
						{for $i=1 to $max_compare-$product_count}
							<td class="product"></td>
						{/for}
					{/if}
				</tr>
			</thead>
			{if $compare_features}
				{foreach $compare_features as $feature}
					{if !$feature->is_color}
						<tr>
							<td class="feature">
								<strong>{$feature->name}:</strong>
							</td>
							{foreach $products as $product}
								<td>
									{if $product->features}
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
							{if $product_count < $max_compare}
								{for $i=1 to $max_compare-$product_count}
									<td class="product"></td>
								{/for}
							{/if}
						</tr>
					{/if}
				{/foreach}
			{/if}
		</table>
	</div>
{else}
	<div class="my-1">
		{$lang->compare_no_products|escape}
	</div>
{/if}