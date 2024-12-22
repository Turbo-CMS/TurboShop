{* Widgets *}
<div class="container-xxl mt-3">
	{* Brands *}
	{if $module=='MainView'}
		{get_brands var=all_brands visible_brand=1}
		{if $all_brands}
			<div class="section-heading">
				<a href="{$lang_link}brands" class="btn btn-outline-primary float-end">
					{$lang->see_all|escape}
					<i class="fal fa-chevron-right ms-2"></i>
				</a>
				<h2 class="my-2">{$lang->global_brands|escape}</h2>
			</div>
			<hr>
			<div class="row">
				{foreach $all_brands as $b}
					{if $b@iteration < 7}
						<div class="col-sm-4 col-md-3 col-lg-3 col-xl-2 col-xxl-2">
							<div class="box item-logo">
								{if $b->image}
									<a data-brand="{$b->id}" href="{$lang_link}brands/{$b->url}">
										<img src="{$b->image|resize_brands:125:42}" alt="{$b->name|escape}" title="{$b->name|escape}">
									</a>
								{else}
									<a href="{$lang_link}brands/{$b->url}" class="text-decoration-none">
										<h3 data-brand="{$b->id}">{$b->name|escape}</h3>
									</a>
								{/if}
							</div>
						</div>
					{/if}
				{/foreach}
			</div>
		{/if}
	{/if}

	{* Viewed Products *}
	{if $module != 'WishlistView'}
		{get_browsed_products var=browsed_products limit=4}
		{if $browsed_products}
			<h2 class="my-2">{$lang->viewed_products|escape}</h2>
			<hr>
			<div class="row">
				{foreach $browsed_products as $product}
					<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4 col-xxl-3">
						{include file='products/grid.tpl'}
					</div>
				{/foreach}
			</div>
		{/if}
	{/if}

	{if $module=='MainView'}
		{* Blog *}
		{get_posts var=last_posts limit=3}
		{if $last_posts}
			<div class="section-heading">
				<a href="{$lang_link}blog" class="btn btn-outline-primary float-end">{$lang->see_all|escape}<i class="fal fa-chevron-right ms-2"></i></a>
				<h2 class="section-title my-2">{$lang->global_blog|escape}</h2>
			</div>
			<hr>
			<div class="row">
				{foreach $last_posts as $post}
					<div class="col-md-6 col-lg-4 mb-3">
						<div class="card h-100">
							{if $post->image}
								<img class="card-img-top" src="{$post->image|resize_posts:750:300}" alt="{$post->name|escape}">
							{else}
								<span class="text-center mt-4">
									<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$post->name|escape}">
								</span>
							{/if}
							<div class="card-body">
								<h5 class="card-title"><a data-post="{$post->id}" class="text-decoration-none" href="{$lang_link}blog/{$post->url}">{$post->name|escape}</a></h5>
								<div class="my-1"><small class="text-muted">{$post->date|date}</small></div>
								<div class="my-1">{$post->annotation|strip_tags|truncate:150}</div>
							</div>
							<div class="card-footer">
								<a href="{$lang_link}blog/{$post->url}" class="btn btn-primary btn-sm">{$lang->more_details|escape}<i class="fal fa-arrow-right ms-2"></i></a>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		{/if}

		{* Articles *}
		{get_articles var=last_articles limit=3}
		{if $last_articles}
			<div class="section-heading">
				<a href="{$lang_link}articles" class="btn btn-outline-primary float-end">{$lang->see_all|escape}<i class="fal fa-chevron-right ms-2"></i></a>
				<h2 class="section-title my-2">{$lang->global_articles|escape}</h2>
			</div>
			<hr>
			<div class="row">
				{foreach $last_articles as $article}
					<div class="col-md-6 col-lg-4 mb-3">
						<div class="card h-100">
							{if $article->image}
								<img class="card-img-top" src="{$article->image|resize_articles:750:300}" alt="{$article->name|escape}">
							{else}
								<span class="text-center mt-4">
									<img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$article->name|escape}">
								</span>
							{/if}
							<div class="card-body">
								<h5 class="card-title"><a data-article="{$article->id}" class="text-decoration-none" href="{$lang_link}article/{$article->url}">{$article->name|escape}</a></h5>
								<div class="small text-muted">
									<i class="fal fa-calendar me-1"></i>
									<span itemprop="datePublished" class="text-muted me-1" content="{$article->date}">{$article->date|date}</span>
									{if $article->author}
										<i class="fal fa-user-edit me-1"></i>
										<a class="mr-2 text-decoration-none me-1" href="{$lang_link}articles/?author={$article->author|escape}">
											{$article->author|escape}
										</a>
									{/if}
									{if $article->category->name}
										<i class="fal fa-edit me-1"></i>
										<a href="{$lang_link}articles/{$article->category->url}" class="text-decoration-none">
											{$article->category->name}
										</a>
									{/if}
								</div>
								<div class="my-1">{$article->annotation|strip_tags|truncate:150}</div>
							</div>
							<div class="card-footer">
								<a href="{$lang_link}article/{$article->url}" class="btn btn-primary btn-sm">{$lang->more_details|escape}<i class="fal fa-arrow-right ms-2"></i></a>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		{/if}
	{/if}
</div>