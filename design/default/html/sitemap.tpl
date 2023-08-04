{* Sitemap *}

{$meta_title = $lang->sitemap scope=global}

{* Canonical page address *}
{$canonical="/{if isset($page->url)}{$page->url}{/if}" scope=global}

<!-- Breadcrumb /-->
{$level = 1}
<nav class="mt-4" aria-label="breadcrumb">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item">
			<a itemprop="item" class="text-decoration-none" href="{if $lang_link}{$lang_link}{else}/{/if}"><span itemprop="name" title="{$lang->home}">{$lang->home}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
		<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item active" aria-current="page">
			<a itemprop="item" class="text-decoration-none" href="{$lang_link}{if isset($page->url)}{$page->url}{/if}"><span itemprop="name">{if isset($page->header)}{$page->header|escape}{/if}</span></a>
			<meta itemprop="position" content="{$level++}">
		</li>
	</ol>
</nav>
<!-- Breadcrumb #End /-->

<!-- Page title -->
<h1 {if isset($page->id)}data-page="{$page->id}" {/if} class="my-4">{if isset($page->name)}{$page->name|escape}{/if}</h1>

{if isset($page->body)}
	{$page->body}
{/if}

<h2 class="my-4">{$settings->site_name|escape}</h2>
<ul>
	{foreach $pages as $p1}
		{if $p1->menu_id == 1}
			{if $p1->visible}
				<li><a class="text-decoration-none" href="{$lang_link}{$p1->url}">{$p1->header}</a></li>
			{/if}
		{/if}
	{/foreach}
</ul>
<h2 class="my-4">{$lang->information}</h2>
<ul>
	{foreach $pages as $p3}
		{if $p3->menu_id == 3}
			{if $p3->visible}
				<li><a class="text-decoration-none" href="{$lang_link}{$p3->url}">{$p3->header}</a></li>
			{/if}
		{/if}
	{/foreach}
</ul>
{if $posts}
	<h2 class="my-4">{$lang->global_blog}</h2>
	<ul>
		{foreach $posts as $p}
			<li><a class="text-decoration-none" href="{$lang_link}blog/{$p->url}">{$p->name}</a></li>
		{/foreach}
	</ul>
{/if}
{if isset($articles)}
	<h2 class="my-4">{$lang->global_articles}</h2>
	<ul>
		{foreach $articles as $p}
			<li><a class="text-decoration-none" href="{$lang_link}article/{$p->url}">{$p->name}</a></li>
		{/foreach}
	</ul>
{/if}
{if $articles_cats}
	<h2 class="my-4">{$lang->global_articles}</h2>
	{function name=cat_art}
		{if $articles}
			<ul>
				{foreach $articles as $p}
					{if $p->visible}
						<li><a class="text-decoration-none" href="{$lang_link}article/{$p->url}">{$p->name}</a></li>
					{/if}
				{/foreach}
			</ul>
		{/if}
	{/function}
	{function name=articles_cat_tree}
		{if $articles_cats}
			<ul>
				{foreach $articles_cats as $c}
					{if $c->visible}
						<li>
							<a class="text-decoration-none" href="{$lang_link}articles/{$c->url}"><b>{$c->name}</b></a>
							{if property_exists($c, 'subcategories')}
								{articles_cat_tree articles_cats=$c->subcategories}
							{/if}
							{cat_art articles=$c->articles}
						</li>
					{/if}
				{/foreach}
			</ul>
		{/if}
	{/function}
	{articles_cat_tree articles_cats=$articles_cats}
{/if}
{if $cats}
	<h2 class="my-4">{$lang->global_products}</h2>
	{function name=cat_prod}
		{if $prod}
			<ul>
				{foreach $prod as $p}
					{if $p->visible}
						<li><a class="text-decoration-none" href="{$lang_link}products/{$p->url}">{$p->name}</a></li>
					{/if}
				{/foreach}
			</ul>
		{/if}
	{/function}
	{function name=cat_tree}
		{if $cats}
			<ul>
				{foreach $cats as $c}
					{if $c->visible}
						<li>
							<a class="text-decoration-none" href="{$lang_link}catalog/{$c->url}"><b>{$c->name}</b></a>
							{if property_exists($c, 'subcategories')}
								{cat_tree cats=$c->subcategories}
							{/if}
							{cat_prod prod=$c->products}
						</li>
					{/if}
				{/foreach}
			</ul>
		{/if}
	{/function}
	{cat_tree cats=$cats}
{/if}