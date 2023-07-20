<div class="mobile-offcanvas col-lg-3 bg-body" id="sidebar">
	<div class="offcanvas-header my-4">
		<button type="button" class="btn-close float-end" aria-label="Close"></button>
		<h5>{$lang->catalog}</h5>
	</div>
	{if $module=='ArticlesView'}
		<form class="input-group my-4" action="{$lang_link}articles">
			<input class="articles_search form-control" type="text" name="keyword" autocomplete="off" value="{if isset($keyword) && $keyword}{$keyword|escape}{/if}" placeholder="{$lang->search_article}">
			<button class="btn btn-success" type="submit"><i class="fal fa-search"></i></button>
		</form>
		<div class="list-group my-4">
			{foreach $articles_categories as $c}
				{if $c->visible}
					<span class="hidden-sm-down list-group-item {if isset($category->id) && $category->id == $c->id}bg-primary{/if}">
						<a data-articles-category="{$c->id}" class="text-decoration-none" href="{$lang_link}articles/{$c->url}">
							{$c->name|escape}
						</a>
						{if isset($c->subcategories)}
							<a data-bs-toggle="collapse" data-parent="#sidebar" class="text-decoration-none" href="#menu{$c->id}" {if isset($category) && in_array($category->id, $c->children)}aria-expanded="true"{/if}>
								<i class="far fa-angle-down"></i>
							</a>
						{/if}
					</span>
					{if isset($c->subcategories)}
						<div class="collapse cat {if isset($category) && in_array($category->id, $c->children)}show{/if}" id="menu{$c->id}">
							{foreach $c->subcategories as $cat}
								{if $cat->visible}
									<span class="hidden-sm-down list-group-item {if isset($category->id) && $category->id == $cat->id}bg-primary{/if}">
										<a data-articles-category="{$cat->id}" class="text-decoration-none" href="{$lang_link}articles/{$cat->url}">
											{$cat->name|escape}
										</a>
										{if $cat->subcategories}
											<a data-bs-toggle="collapse" aria-expanded="false" class="text-decoration-none" href="#menusub{$cat->id}" {if isset($category) && in_array($category->id, $cat->children)}aria-expanded="true"{/if}>
												<i class="far fa-angle-down"></i>
											</a>
										{/if}
									</span>
									{if isset($cat->subcategories)}
										<div class="collapse cat3 {if isset($category) && in_array($category->id, $cat->children)}show{/if}" id="menusub{$cat->id}">
											{foreach $cat->subcategories as $cat3}
												{if $cat3->visible}
													<a data-articles-category="{$cat3->id}" href="{$lang_link}articles/{$cat3->url}" class="list-group-item text-decoration-none {if $category->id == $cat3->id}bg-primary text-white{/if}" data-parent="#menusub{$cat->id}">{$cat3->name|escape}</a>
												{/if}
											{/foreach}
										</div>
									{/if}
								{/if}
							{/foreach}
						</div>
					{/if}
				{/if}
			{/foreach}
		</div>
	{elseif $module=='BlogView'}
		<form class="input-group my-4" action="{$lang_link}blog">
			<input class="blog_search form-control" type="text" name="keyword" autocomplete="off" value="{if isset($keyword) && $keyword}{$keyword|escape}{/if}" placeholder="{$lang->search_blog}">
			<button class="btn btn-success" type="submit"><i class="fal fa-search"></i></button>
		</form>
		{if $categories}
			<div class="list-group mt-4">
				{foreach $categories as $c}
					{if $c->visible}
						<span class="hidden-sm-down list-group-item {if isset($category->id) && $category->id == $c->id}bg-primary{/if}">
							<a data-category="{$c->id}" class="text-decoration-none" href="{$lang_link}catalog/{$c->url}">
								{if $c->code}<i class="fal fa-{$c->code|escape} me-1"></i>{/if} {$c->name|escape}
								<span class="badge badge-pill bg-light text-dark text-dark float-end">{$c->products_count}</span>
							</a>
							{if isset($c->subcategories)}
								<a data-bs-toggle="collapse" data-parent="#sidebar" class="text-decoration-none" href="#menu{$c->id}" {if isset($category) && in_array($category->id, $c->children)}aria-expanded="true"{/if}>
									<i class="far fa-angle-down"></i>
								</a>
							{/if}
						</span>
						{if isset($c->subcategories)}
							<div class="collapse cat {if isset($category) && in_array($category->id, $c->children)}show{/if}" id="menu{$c->id}">
								{foreach $c->subcategories as $cat}
									{if $cat->visible}
										<span class="hidden-sm-down list-group-item {if isset($category->id) && $category->id == $cat->id}bg-primary{/if}">
											<a data-category="{$cat->id}" class="text-decoration-none" href="{$lang_link}catalog/{$cat->url}">
												{if $cat->code}<i class="fal fa-{$cat->code|escape} me-1"></i>{/if} {$cat->name|escape}
												<span class="badge badge-pill bg-light text-dark text-dark float-end">{$cat->products_count}</span>
											</a>
											{if isset($cat->subcategories)}
												<a data-bs-toggle="collapse" aria-expanded="false" class="text-decoration-none" href="#menusub{$cat->id}" {if isset($category) && in_array($category->id, $cat->children)}aria-expanded="true"{/if}>
													<i class="far fa-angle-down"></i>
												</a>
											{/if}
										</span>
										{if isset($cat->subcategories)}
											<div class="collapse cat3 {if isset($category) && in_array($category->id, $cat->children)}show{/if}" id="menusub{$cat->id}">
												{foreach $cat->subcategories as $cat3}
													{if $cat3->visible}
														<a href="{$lang_link}catalog/{$cat3->url}" class="list-group-item text-decoration-none {if $category->id == $cat3->id}bg-primary text-white{/if}" data-category="{$cat3->id}" data-parent="#menusub{$cat->id}">{if $cat3->code}<i class="fal fa-{$cat3->code|escape} me-1"></i>{/if} {$cat3->name|escape}<span class="badge badge-pill bg-light text-dark float-end">{$cat3->products_count}</span></a>
													{/if}
												{/foreach}
											</div>
										{/if}
									{/if}
								{/foreach}
							</div>
						{/if}
					{/if}
				{/foreach}
				<span class="hidden-sm-down list-group-item"><a href="{$lang_link}all-products" class="text-decoration-none">{$lang->all_products}</a></span>
			</div>
		{/if}
		{if $module!=='ProductsView'}
			{* Select all brands in the variable $ all_brands *}
			{get_brands var=all_brands}
			{if $all_brands}
				<div id="all_brands">
					<h4 class="my-4">{$lang->all_brands}:</h4>
					{foreach $all_brands as $b}
						<a class="btn btn-primary btn-sm mb-1" href="{$lang_link}brands/{$b->url}">{$b->name}</a>
					{/foreach}
				</div>
			{/if}
		{/if}
		{if $module=='ProductsView'}
			{include file='filter.tpl'}
		{/if}
		{* Currency selection*}
		{if $currencies|count>1}
			<div class="card my-4">
				<div class="card-header fw-bold">{$lang->currency}</div>
				<div class="card-body">
					<select class="form-select" onchange="location.href=this.value" size="1" aria-label="Select currency">
						{foreach from=$currencies item=c}
							{if $c->enabled} 
								<option value="{url currency_id=$c->id}" {if $c->id==$currency->id}selected="selected"{/if}>{$c->name|escape}</option>
							{/if}
						{/foreach}
				</select>
			</div>
		</div>
	{/if}
	{else}
	{if $module!=='SearchView'}
		{if $module=='PageView'}
			<form class="input-group my-4" action="{$lang_link}search">
				<input id="pages-search" class="form-control" type="text" name="keyword" value="{if isset($keyword) && $keyword}{$keyword|escape}{/if}" placeholder="{$lang->search}...">
				<button class="btn btn-success" type="submit"><i class="fal fa-search"></i></button>
			</form>
		{else}
			<form class="input-group my-4" action="{$lang_link}all-products">
				<input class="input_search form-control" type="text" name="keyword" value="{if isset($keyword) && $keyword}{$keyword|escape}{/if}" placeholder="{$lang->product_search}">
				<button class="btn btn-success" type="submit"><i class="fal fa-search"></i></button>
			</form>
		{/if}
	{/if}
	{if $categories}
		<div class="list-group mt-4">
			{foreach $categories as $c}
				{if $c->visible}
					<span class="hidden-sm-down list-group-item {if isset($category->id) && $category->id == $c->id}bg-primary{/if}">
						<a data-category="{$c->id}" class="text-decoration-none" href="{$lang_link}catalog/{$c->url}">
							{if $c->code}<i class="fal fa-{$c->code|escape} me-1"></i>{/if} {$c->name|escape}
							<span class="badge badge-pill bg-light text-dark text-dark float-end">{$c->products_count}</span>
						</a>
						{if isset($c->subcategories)}
							<a data-bs-toggle="collapse" data-parent="#sidebar" class="text-decoration-none" href="#menu{$c->id}" {if isset($category) && in_array($category->id, $c->children)}aria-expanded="true" {/if}>
								<i class="far fa-angle-down"></i>
							</a>
						{/if}
					</span>
					{if isset($c->subcategories)}
						<div class="collapse cat {if isset($category) && in_array($category->id, $c->children)}show{/if}" id="menu{$c->id}">
							{foreach $c->subcategories as $cat}
								{if $cat->visible}
									<span class="hidden-sm-down list-group-item {if isset($category->id) && $category->id == $cat->id}bg-primary{/if}">
										<a data-category="{$cat->id}" class="text-decoration-none" href="{$lang_link}catalog/{$cat->url}">
											{if $cat->code}<i class="fal fa-{$cat->code|escape} me-1"></i>{/if} {$cat->name|escape}
											<span class="badge badge-pill bg-light text-dark text-dark float-end">{$cat->products_count}</span>
										</a>
										{if isset($cat->subcategories)}
											<a data-bs-toggle="collapse" aria-expanded="false" class="text-decoration-none" href="#menusub{$cat->id}" {if isset($category) && in_array($category->id, $cat->children)}aria-expanded="true" {/if}>
												<i class="far fa-angle-down"></i>
											</a>
										{/if}
									</span>
									{if isset($cat->subcategories)}
										<div class="collapse cat3 {if isset($category) && in_array($category->id, $cat->children)}show{/if}" id="menusub{$cat->id}">
											{foreach $cat->subcategories as $cat3}
												{if $cat3->visible}
													<a href="{$lang_link}catalog/{$cat3->url}" class="list-group-item text-decoration-none {if $category->id == $cat3->id}bg-primary text-white{/if}" data-category="{$cat3->id}" data-parent="#menusub{$cat->id}">{if $cat3->code}<i class="fal fa-{$cat3->code|escape} me-1"></i>{/if} {$cat3->name|escape}<span class="badge badge-pill bg-light text-dark float-end">{$cat3->products_count}</span></a>
												{/if}
											{/foreach}
										</div>
									{/if}
								{/if}
							{/foreach}
						</div>
					{/if}
				{/if}
			{/foreach}
			<span class="hidden-sm-down list-group-item"><a href="{$lang_link}all-products" class="text-decoration-none">{$lang->all_products}</a></span>
		</div>
	{/if}
	{if $module!=='ProductsView'}
		{* Select all brands in the variable $ all_brands *}
		{get_brands var=all_brands}
		{if $all_brands}
			<div id="all_brands">
				<h4 class="my-4">{$lang->all_brands}:</h4>
				{foreach $all_brands as $b}
					<a class="btn btn-primary btn-sm mb-1" href="{$lang_link}brands/{$b->url}">{$b->name}</a>
				{/foreach}
			</div>
		{/if}
	{/if}
	{if $module=='ProductsView'}
		{include file='filter.tpl'}
	{/if}
	{* Currency selection*}
	{if $currencies|count>1}
		<div class="card my-4">
			<div class="card-header fw-bold">{$lang->currency}</div>
			<div class="card-body">
				<select class="form-select" onchange="location.href=this.value" size="1" aria-label="Select currency">
					{foreach from=$currencies item=c}
						{if $c->enabled} <option value="{url currency_id=$c->id}" {if $c->id==$currency->id}selected="selected" {/if}>{$c->name|escape}</option>
					{/if}
				{/foreach}
			</select>
		</div>
	</div>
	{/if}
	{/if}
	{* Last comments *}
	{get_comments var=last_comments}
	{if $last_comments}
		<div class="card my-4">
			<div class="card-header fw-bold">{$lang->comments_global}</div>
			<div class="card-body">
				{get_comments var=last_comments limit=5}
				{if $last_comments}
					{foreach $last_comments as $comment name=com}
						<h5 class="card-title">{$comment->name}</h5>
						<p class="card-text"><small class="text-muted">{$comment->date|date} {$lang->at} {$comment->date|time}</small></p>
						<p class="card-text">{$comment->text|strip_tags|truncate:150}</p>
						<p>
							{if $comment->type == product}
								<a href="{$lang_link}products/{$comment->product->url}#comment_{$comment->id}" class="text-decoration-none"><small>{$comment->product->name}</small></a>
							{/if}
							{if $comment->type == blog}
								<a href="{$lang_link}blog/{$comment->post->url}#comment_{$comment->id}" class="text-decoration-none"><small>{$comment->post->name}</small></a>
							{/if}
							{if $comment->type == article}
								<a href="{$lang_link}article/{$comment->article->url}#comment_{$comment->id}" class="text-decoration-none"><small>{$comment->article->name}</small></a>
							{/if}
							{if $comment->type == review}
								<a href="{$lang_link}reviews#comment_{$comment->id}" class="text-decoration-none"><small>{$lang->reviews_global}</small></a>
							{/if}
						</p>
						{if !$smarty.foreach.com.last}
							<hr class="text-black-50">
						{/if}
					{/foreach}
				{/if}
			</div>
		</div>
	{/if}
</div>