{* Sitemap *}

{if $page}
	{* Canonical *}
	{$canonical="/{$page->url}" scope=global}
{else}
	{* Meta Title *}
	{$meta_title = $lang->sitemap scope=global}

	{* Canonical *}
	{$canonical="/sitemap" scope=global}
{/if}

{* Page Title *}
{if $page}
	<h1 class="my-4">
		<span data-page="{$page->id}">{$page->name|escape}</span>
	</h1>
{else}
	<h1 class="my-4">{$lang->sitemap|escape}</h1>
{/if}

{* Page Body *}
{if $page}
	{$page->body}
{/if}

<div class="row">
	{* Pages *}
	<div class="col-sm-6 col-md-6 col-lg-4 col-xl-3 mb-4">
		<h2 class="my-4">{$lang->about_shop|escape}</h2>
		<ul>
			{foreach $pages as $p1}
				{if $p1->menu_id == $theme_settings->id_menu_sitemap_1}
					{if $p1->visible}
						<li>
							<a class="text-decoration-none" href="{$lang_link}{$p1->url}">
								{$p1->header}
							</a>
						</li>
					{/if}
				{/if}
			{/foreach}
		</ul>
	</div>

	<div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
		<h2 class="my-4">{$lang->catalog|escape}</h2>
		<ul>
			{foreach $pages as $p2}
				{if $p2->menu_id == $theme_settings->id_menu_sitemap_2}
					{if $p2->visible}
						<li>
							<a class="text-decoration-none" href="{$lang_link}{$p2->url}">
								{$p2->header}
							</a>
						</li>
					{/if}
				{/if}
			{/foreach}
		</ul>
	</div>

	<div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
		<h2 class="my-4">{$lang->information|escape}</h2>
		<ul>
			{foreach $pages as $p3}
				{if $p3->menu_id == $theme_settings->id_menu_sitemap_3}
					{if $p3->visible}
						<li>
							<a class="text-decoration-none" href="{$lang_link}{$p3->url}">
								{$p3->header}
							</a>
						</li>
					{/if}
				{/if}
			{/foreach}
		</ul>
	</div>

	<div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
		<h2 class="my-4">{$lang->help|escape}</h2>
		<ul>
			{foreach $pages as $p4}
				{if $p4->menu_id == $theme_settings->id_menu_sitemap_4}
					{if $p4->visible}
						<li>
							<a class="text-decoration-none" href="{$lang_link}{$p4->url}">
								{$p4->header}
							</a>
						</li>
					{/if}
				{/if}
			{/foreach}
		</ul>
	</div>

	<div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
		<h2 class="my-4">{$lang->confidentiality|escape}</h2>
		<ul>
			{foreach $pages as $p5}
				{if $p5->menu_id == $theme_settings->id_menu_sitemap_5}
					{if $p5->visible}
						<li>
							<a class="text-decoration-none" href="{$lang_link}{$p5->url}">
								{$p5->header}
							</a>
						</li>
					{/if}
				{/if}
			{/foreach}
		</ul>
	</div>

	{* Blog *}
	{if $posts}
		<div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
			<h2 class="my-4">{$lang->global_blog|escape}</h2>
			<ul>
				{foreach $posts as $p}
					<li>
						<a class="text-decoration-none" href="{$lang_link}blog/{$p->url}">
							{$p->name}
						</a>
					</li>
				{/foreach}
			</ul>
		</div>
	{/if}

	{* Products *}
	{if $cats}
		<div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
			<h2 class="my-4">{$lang->global_products|escape}</h2>
			{function name=cat_prod}
				{if $prod}
					<ul>
						{foreach $prod as $p}
							{if $p->visible}
								<li>
									<a class="text-decoration-none" href="{$lang_link}products/{$p->url}">
										{$p->name}
									</a>
								</li>
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
									<a class="text-decoration-none" href="{$lang_link}catalog/{$c->url}">
										<strong>{$c->name}</strong>
									</a>
									{if $c->subcategories}
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
		</div>
	{/if}

	{* Articles *}
	{if $articles_cats}
		<div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
			<h2 class="my-4">{$lang->global_articles|escape}</h2>
			{function name=cat_art}
				{if $articles}
					<ul>
						{foreach $articles as $a}
							{if $a->visible}
								<li>
									<a class="text-decoration-none" href="{$lang_link}article/{$a->url}">
										{$a->name}
									</a>
								</li>
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
									<a class="text-decoration-none" href="{$lang_link}articles/{$c->url}">
										<strong>{$c->name}</strong>
									</a>
									{if $c->subcategories}
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
		</div>
	{/if}
</div>