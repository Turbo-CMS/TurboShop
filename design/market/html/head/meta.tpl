{* Meta *}

<base href="{$config->root_url}/">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=0">

{if $seo->seo_automation == "on"}
	<title>{($meta_title|default:$auto_meta->title)|escape}</title>
{else}
	<title>{($auto_meta->title|default:$meta_title)|escape}</title>
{/if}

{if $seo->seo_automation == "on"}
	<meta name="description" content="{($meta_description|default:$auto_meta->description)|escape}">
	<meta name="keywords" content="{($meta_keywords|default:$auto_meta->keywords)|escape}">
{else}
	<meta name="description" content="{($auto_meta->description|default:$meta_description)|escape}">
	<meta name="keywords" content="{($auto_meta->keywords|default:$meta_keywords)|escape}">
{/if}

<meta name="author" content="TurboCMS">
<meta name="generator" content="TurboCMS">

{if $module=='ProductView'}
	<meta property="og:url" content="{$config->root_url}{if $lang_link}/{$lang_link|replace:'/':''}{/if}{$canonical}">
	<meta property="og:type" content="website">
	<meta property="og:title" content="{$product->name|escape}">
	<meta property="og:description" content='{$product->annotation|strip_tags|escape}'>
	<meta property="og:image" content="{if $product->image}{$product->image->filename|resize:330:300}{/if}">
	<link rel="image_src" href="{if $product->image}{$product->image->filename|resize:330:300}{/if}">
	<meta name="twitter:card" content="product">
	<meta name="twitter:url" content="{$config->root_url}{$canonical}">
	<meta name="twitter:site" content="{$settings->site_name|escape}">
	<meta name="twitter:title" content="{$product->name|escape}">
	<meta name="twitter:description" content="{$product->annotation|strip_tags|escape}">
	<meta name="twitter:image" content="{if $product->image}{$product->image->filename|resize:330:300}{/if}">
	<meta name="twitter:label1" content="{$product->variant->price|convert:null:false} {$currency->code|escape}">
	<meta name="twitter:label2" content="{$settings->site_name|escape}">
{elseif $module == 'BlogView' && $post}
	<meta property="og:url" content="{$config->root_url}{if $lang_link}/{$lang_link|replace:'/':''}{/if}{$canonical}">
	<meta property="og:type" content="article">
	<meta property="og:title" content="{$post->name|escape}">
	{if $post->image}
		<meta property="og:image" content="{if $post->image}{$post->image|resize_posts:400:300}{/if}">
		<link rel="image_src" href="{if $post->image}{$post->image|resize_posts:400:300}{/if}">
	{else}
		<meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
		<meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
	{/if}
	<meta property="og:description" content='{$post->annotation|strip_tags|escape}'>
	<meta name="twitter:card" content="summary">
	<meta name="twitter:title" content="{$post->name|escape}">
	<meta name="twitter:description" content="{$post->annotation|strip_tags|escape}">
	<meta name="twitter:image" content="{if $post->image}{$post->image|resize_posts:400:300}{/if}">
{elseif $module=='ArticlesView' && $post}
	<meta property="og:url" content="{$config->root_url}{if $lang_link}/{$lang_link|replace:'/':''}{/if}{$canonical}">
	<meta property="og:type" content="article">
	<meta property="og:title" content="{$post->name|escape}">
	{if $post->image}
		<meta property="og:image" content="{if $post->image}{$post->image|resize_articles:400:300}{/if}">
		<link rel="image_src" href="{if $post->image}{$post->image|resize_articles:400:300}{/if}">
	{else}
		<meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
		<meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
	{/if}
	<meta property="og:description" content='{$post->annotation|strip_tags|escape}'>
	<meta name="twitter:card" content="summary">
	<meta name="twitter:title" content="{$post->name|escape}">
	<meta name="twitter:description" content="{$post->annotation|strip_tags|escape}">
	<meta name="twitter:image" content="{if $post->image}{$post->image|resize_articles:400:300}{/if}">
{else}
	<meta property="og:title" content="{$settings->site_name|escape}">
	<meta property="og:type" content="website">
	<meta property="og:url" content="{$config->root_url}">
	<meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
	<meta property="og:site_name" content="{$settings->site_name|escape}">
	{if $seo->seo_automation == "on"}
		<meta property="og:description" content="{($meta_description|default:$auto_meta->description)|escape}">
	{else}
		<meta property="og:description" content="{($auto_meta->description|default:$meta_description)|escape}">
	{/if}
	<link rel="image_src" href="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
	<meta name="twitter:card" content="summary">
	<meta name="twitter:title" content="{$settings->site_name|escape}">
	{if $seo->seo_automation == "on"}
		<meta name="twitter:description" content="{($meta_description|default:$auto_meta->description)|escape}">
	{else}
		<meta name="twitter:description" content="{($auto_meta->description|default:$meta_description)|escape}">
	{/if}
	<meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
{/if}

{if $module == 'ProductsView'}
	{if $is_filter && !$page}
		<meta name="robots" content="noindex,nofollow">
	{elseif isset($smarty.get.page) || isset($smarty.get.sort)}
		<meta name="robots" content="noindex,follow">
	{elseif isset($smarty.get.keyword)}
		<meta name="robots" content="noindex,follow">
	{else}
		<meta name="robots" content="index,follow">
	{/if}
{elseif $smarty.get.module == "RegisterView" || $smarty.get.module == "LoginView" || $smarty.get.module == "UserView" || $smarty.get.module == "CartView"}
	<meta name="robots" content="noindex,follow">
{elseif $smarty.get.module == "OrderView"}
	<meta name="robots" content="noindex,nofollow">
{elseif $smarty.get.module == "BlogView" && isset($smarty.get.sort) || isset($smarty.get.keyword)}
	<meta name="robots" content="noindex,follow">
{elseif $smarty.get.module == "ArticlesView" && isset($smarty.get.sort) || isset($smarty.get.keyword) || isset($smarty.get.author)}
	<meta name="robots" content="noindex,follow">
{else}
	<meta name="robots" content="index,follow">
{/if}

{* Canonical *}
{if $canonical}
	<link rel="canonical" href="{$config->root_url}{if $lang_link}/{$lang_link|replace:'/':''}{/if}{$canonical}">
{/if}

{* Language Attribute *}
{foreach $languages as $lang}
	{if $lang->enabled}
		<link rel="alternate" hreflang="{if $lang@first}x-default{else}{$lang->label|escape}{/if}" href="{$config->root_url}{if !$lang@first}/{/if}{$lang->url}">
	{/if}
{/foreach}

{* RSS *}
<link rel="alternate" type="application/rss+xml" title="{$settings->site_name|escape}" href="{$config->root_url}/{$lang_link}feeds/rss.xml">

{* Favicon *}
<link rel="icon" type="image/x-icon" href="design/{$settings->theme|escape}/images/favicon.ico">
<link rel="shortcut icon" type="image/x-icon" href="design/{$settings->theme|escape}/images/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="design/{$settings->theme|escape}/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="design/{$settings->theme|escape}/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="design/{$settings->theme|escape}/images/favicon-16x16.png">
<link rel="manifest" href="design/{$settings->theme|escape}/images/site.webmanifest">
<link rel="mask-icon" color="#198754" href="design/{$settings->theme|escape}/images/safari-pinned-tab.svg">