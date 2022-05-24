<!DOCTYPE html>
{* General page *}
<html {if $language->label}lang="{$language->label|escape}" {/if}>

<head>
    <base href="{$config->root_url}/" />

    {if $seo->seo_automation == "on"}
        <title>{($meta_title|default:$auto_meta->title)|escape}</title>
    {else}
        <title>{($auto_meta->title|default:$meta_title)|escape}</title>
    {/if}

    {* Meta tags *}
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    {if $seo->seo_automation == "on"}
        <meta name="description" content="{($meta_description|default:$auto_meta->description)|escape}" />
    {else}
        <meta name="description" content="{($auto_meta->description|default:$meta_description)|escape}" />
    {/if}

    {if $seo->seo_automation == "on"}
        <meta name="keywords" content="{($meta_keywords|default:$auto_meta->keywords)|escape}" />
    {else}
        <meta name="keywords" content="{($auto_meta->keywords|default:$meta_keywords)|escape}" />
    {/if}

    <meta name="author" content="Turbo CMS">
    <meta name="generator" content="Turbo CMS">

    {if $module=='ProductView'}
        <meta property="og:url" content="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
        <meta property="og:type" content="website">
        <meta property="og:title" content="{$product->name|escape}">
        <meta property="og:description" content='{$product->annotation|strip_tags|escape}'>
        <meta property="og:image" content="{$product->image->filename|resize:330:300}">
        <link rel="image_src" href="{$product->image->filename|resize:330:300}">
        {* Twitter *}
        <meta name="twitter:card" content="product" />
        <meta name="twitter:url" content="{$config->root_url}{$canonical}">
        <meta name="twitter:site" content="{$settings->site_name|escape}">
        <meta name="twitter:title" content="{$product->name|escape}">
        <meta name="twitter:description" content="{$product->annotation|strip_tags|escape}">
        <meta name="twitter:image" content="{$product->image->filename|resize:330:300}">
        <meta name="twitter:label1" content="{$product->variant->price|convert:null:false} {$currency->code|escape}">
        <meta name="twitter:label2" content="{$settings->site_name|escape}">
    {elseif $module == 'BlogView' && $post}
        <meta property="og:url" content="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
        <meta property="og:type" content="article">
        <meta property="og:title" content="{$post->name|escape}">
        {if $post->image}
            <meta property="og:image" content="{$post->image|resize_posts:400:300}">
            <link rel="image_src" href="{$post->image|resize_posts:400:300}">
        {else}
            <meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
            <meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
        {/if}
        <meta property="og:description" content='{$post->annotation|strip_tags|escape}'>
        {* Twitter *}
        <meta name="twitter:card" content="summary">
        <meta name="twitter:title" content="{$post->name|escape}">
        <meta name="twitter:description" content="{$post->annotation|strip_tags|escape}">
        <meta name="twitter:image" content="{$post->image|resize_posts:400:300}">
    {elseif $module=='ArticlesView' && $post}
        <meta property="og:url" content="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
        <meta property="og:type" content="article">
        <meta property="og:title" content="{$post->name|escape}">
        {if $post->image}
            <meta property="og:image" content="{$post->image|resize_articles:400:300}">
            <link rel="image_src" href="{$post->image|resize_articles:400:300}">
        {else}
            <meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
            <meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
        {/if}
        <meta property="og:description" content='{$post->annotation|strip_tags|escape}'>
        {*twitter*}
        <meta name="twitter:card" content="summary">
        <meta name="twitter:title" content="{$post->name|escape}">
        <meta name="twitter:description" content="{$post->annotation|strip_tags|escape}">
        <meta name="twitter:image" content="{$post->image|resize_articles:400:300}">
    {else}
        <meta property="og:title" content="{$settings->site_name|escape}">
        <meta property="og:type" content="website">
        <meta property="og:url" content="{$config->root_url}">
        <meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
        <meta property="og:site_name" content="{$settings->site_name|escape}">
        {if $seo->seo_automation == "on"}
            <meta property="og:description" content="{($meta_description|default:$auto_meta->description)|escape}" />
        {else}
            <meta property="og:description" content="{($auto_meta->description|default:$meta_description)|escape}" />
        {/if}
        <link rel="image_src" href="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
        {* Twitter *}
        <meta name="twitter:card" content="summary">
        <meta name="twitter:title" content="{$settings->site_name|escape}">
        {if $seo->seo_automation == "on"}
            <meta name="twitter:description" content="{($meta_description|default:$auto_meta->description)|escape}" />
        {else}
            <meta name="twitter:description" content="{($auto_meta->description|default:$meta_description)|escape}" />
        {/if}
        <meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
    {/if}

    {if $module == 'ProductsView'}
        {if $noindex_filter && !$page}
            <meta name="robots" content="noindex,nofollow">
        {elseif $smarty.get.page || $smarty.get.sort}
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
    {elseif $smarty.get.module == "BlogView" && $smarty.get.sort || isset($smarty.get.keyword)}
        <meta name="robots" content="noindex,follow">
    {elseif $smarty.get.module == "ArticlesView" && $smarty.get.sort || isset($smarty.get.keyword)}
        <meta name="robots" content="noindex,follow">
    {else}
        <meta name="robots" content="index,follow">
    {/if}

    {* Canonical page address *}
    {if isset($canonical)}
        <link rel="canonical" href="{$config->root_url}{if $lang_link}/{str_replace('/', '', $lang_link)}{/if}{$canonical}">
    {/if}

    {* Language attribute *}
    {foreach $languages as $lang}
        {if $lang->enabled}
            <link rel="alternate" hreflang="{if $lang@first}x-default{else}{$lang->label}{/if}" href="{$config->root_url}{if !$lang@first}/{/if}{preg_replace('/^(.+)\/$/', '$1', $lang->url)}">
        {/if}
    {/foreach}

    {* Styles *}
    {css id="libs" include=[
	"design/{$settings->theme|escape}/css/bootstrap.min.css",
    "design/{$settings->theme|escape}/css/style.css",
    "design/{$settings->theme|escape}/css/products.css",
    "design/{$settings->theme|escape}/css/fontawesome-all.min.css",
    "design/{$settings->theme|escape}/css/jquery.fancybox.min.css",
    "design/{$settings->theme|escape}/css/flag-icon.min.css",
    "design/{$settings->theme|escape}/css/toast.css"
    ]}{/css}
    {stylesheet minify=true}

    {if $module=='ProductsView'}
        {css id="filter" include=[
		"design/{$settings->theme|escape}/css/filter.css"
        ]}{/css}
        {stylesheet minify=true}
    {/if}

    {if $module == 'ProductView'}
        {css id="product" include=[
		"design/{$settings->theme|escape}/css/product.css"
        ]}{/css}
        {stylesheet minify=true}
    {/if}

    {if $module=='CartView' || $module=='OrderView' }
        {css id="cart" include=[
		"design/{$settings->theme|escape}/css/cart.css"
        ]}{/css}
        {stylesheet minify=true}
    {/if}

    {if $module == 'BlogView' && $post || $module=='ArticlesView' && $post}
        {css id="post" include=[
		"design/{$settings->theme|escape}/css/post.css"
        ]}{/css}
        {stylesheet minify=true}
    {/if}

    {if $module == 'FAQView'}
        {css id="faq" include=[
		"design/{$settings->theme|escape}/css/faq.css"
        ]}{/css}
        {stylesheet minify=true}
    {/if}

    <link href="design/{$settings->theme|escape}/images/favicon.ico" rel="icon" type="image/x-icon" />
    <link href="design/{$settings->theme|escape}/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    {if $counters['head']}
        {foreach $counters['head'] as $counter}
            {$counter->code}
        {/foreach}
    {/if}
</head>

<body itemscope itemtype="https://schema.org/WebPage">

    {if $counters['body_top']}
        {foreach $counters['body_top'] as $counter}
            {$counter->code}
        {/foreach}
    {/if}
    <!-- Navigation -->
    <nav itemscope itemtype="https://schema.org/SiteNavigationElement" class="navbar navbar-expand-lg navbar-light bg-light rounded fixed-top">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarsExample09">
                <ul class="navbar-nav mr-auto">
                    {foreach $pages as $p}
                        {if $p->menu_id == 1}
                            {if $p->visible}
                                {if $p->subpages}
                                    <li itemprop="name" class="nav-item dropdown {if $page && $page->id == $p->id}active{/if}">
                                        <a itemprop="url" class="nav-link dropdown-toggle" href="{$lang_link}{$p->url}" id="dropdown{$p->id}" data-page="{$p->id}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$p->header}</a>
                                        <div class="dropdown-menu" aria-labelledby="dropdown{$p->id}">
                                            {foreach $p->subpages as $p2}
                                                <a itemprop="url" data-page="{$p2->id}" class="dropdown-item" href="{$lang_link}{$p2->url}">{$p2->header}</a>
                                            {/foreach}
                                        </div>
                                    </li>
                                {else}
                                    <li itemprop="name" class="nav-item {if $page && $page->id == $p->id}active{/if}">
                                        <a itemprop="url" data-page="{$p->id}" class="nav-link" href="{$lang_link}{$p->url}">{$p->header}</a>
                                    </li>
                                {/if}
                            {/if}
                        {/if}
                    {/foreach}
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    {* Languages *}
                    {if $languages|count > 1}
                        {$cnt = 0}
                        {foreach $languages as $ln}
                            {if $ln->enabled}
                                {$cnt = $cnt+1}
                            {/if}
                        {/foreach}
                        {if $cnt>1}
                            <li class="nav-item dropdown">
                                {foreach $languages as $l}
                                    {if $language->id == $l->id}
                                        <a class="nav-link dropdown-toggle" href="{$config->root_url}{$lang_link}" id="dropdown09" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="flag-icon flag-icon-{$l->label}"></span> {$l->label|upper}</a>
                                    {/if}
                                {/foreach}
                                <div class="dropdown-menu" aria-labelledby="dropdown09">
                                    {foreach $languages as $l}
                                        {if $l->enabled}
                                            <a href="{$l->url}" class="dropdown-item {if $language->id == $l->id}active{/if}"><span class="flag-icon flag-icon-{$l->label}"></span> {$l->name}</a>
                                        {/if}
                                    {/foreach}
                                </div>
                            </li>
                        {/if}
                    {/if}
                    <li class="nav-link">
                        <span id="wishlist_informer">
                            {include file='wishlist_informer.tpl'}
                        </span>
                    </li>
                    <li class="nav-link">
                        <span id="compare_informer">
                            {include file='compare_informer.tpl'}
                        </span>
                    </li>
                    {if $user}
                        <li class="nav-link"><i class="fal fa-user"></i> <a class="text-secondary card-link" href="{$lang_link}user">{$user->name}</a></li>
                        <li class="nav-link"><i class="fal fa-sign-out"></i> <a class="text-secondary card-link" href="{$lang_link}user/logout">{$lang->logout}</a></li>
                    {else}
                        <li class="nav-link"><i class="fal fa-sign-in"></i> <a class="text-secondary card-link" href="{$lang_link}user/login">{$lang->login}</a></li>
                        <li class="nav-link"><i class="fal fa-user-plus"></i> <a class="text-secondary card-link" href="{$lang_link}user/register">{$lang->registration}</a></li>
                    {/if}
                </ul>
            </div>
            <!-- Cart -->
            <div id="cart_informer">
                {include file='cart_informer.tpl'}
            </div>
            <!-- Cart (The End)-->
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-lg-6 mt-2">
                <h1 class="mt-4">
                    {if $module=='MainView'}
                        <i class="fal fa-shopping-bag text-success"></i> TurboShop
                    {else}
                        <a class="text-dark card-link" href="{if $lang_link}{$lang_link}{else}/{/if}"><i class="fal fa-shopping-bag text-success"></i> TurboShop</a>
                    {/if}
                </h1>
            </div>
            <div class="col-lg-6 mt-2">
                <p class="text-right">{$lang->phone_number}<br>
                    {$lang->contact_details}
                <div class="callback float-right">
                    <a class="btn btn-success btn-sm" href="javascript:void(0)" data-toggle="modal" data-target="#exampleModal" role="button"><i class="fal fa-phone-alt"></i> <span>{$lang->callback}</span></a>
                </div>
                </p>
            </div>
        </div>
    </div>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            {include file='sidebar.tpl'}
            <div class="col-lg-9 order-lg-2 order-1">
                <nav class="navbar navbar-expand-lg navbar-dark bg-primary d-lg-none mt-4 rounded">
                    <a class="navbar-brand" href="#">{$lang->catalog}</a>
                    <button class="navbar-toggler" type="button" data-trigger="#sidebar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </nav>
                {if !$is_mobile}
                    {* Slider *}
                    {include file='slider.tpl'}
                {/if}
                {* Content *}
                {$content}
            </div>
            <!-- /.col-lg-9 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->
    <div class="container mt-5">
        {*  All brands *}
        {if $module=='MainView'}
            {get_brands var=all_brands visible_brand=1}
            {if $all_brands}
                <header class="section-heading">
                    <a href="{$lang_link}brands" class="btn btn-outline-primary float-right">{$lang->see_all}</a>
                    <h2 class="section-title my-2">{$lang->index_brands}</h2>
                </header><!-- sect-heading -->
                <hr>
                <div class="row">
                    {foreach $all_brands as $b}
                        {if $b@iteration < 7}
                            <div class="col-lg-2 col-md-4">
                                <figure class="box item-logo">
                                    {if $b->image}
                                        <a href="{$lang_link}brands/{$b->url}"><img src="{$b->image|resize_brands:100:100}" alt="{$b->name|escape}" title="{$b->name|escape}"></a>
                                    {else}
                                        <a href="{$lang_link}brands/{$b->url}">
                                            <h3>{$b->name|escape}</h3>
                                        </a>
                                    {/if}
                                </figure> <!-- item-logo.// -->
                            </div> <!-- col.// -->
                        {/if}
                    {/foreach}
                </div> <!-- row.// -->
            {/if}
        {/if}
        {*  Viewed products *}
        {get_browsed_products var=browsed_products limit=4}
        {if $browsed_products}
            <h2 class="my-2">{$lang->viewed_products}</h2>
            <hr>
            <div class="row">
                {foreach $browsed_products as $product}
                    <div class="col-md-4 col-lg-3">
                        <figure class="card card-product-grid product">
                            <div class="img-wrap">
                                <span class="badges">
                                    {if $product->variants[0]->compare_price > 0}<span class="notify-badge badge badge-danger">{$lang->badge_sale}</span>{/if}
                                    {if $product->featured}<span class="notify-badge badge badge-primary">{$lang->badge_featured}</span>{/if}
                                    {if $product->is_hit}<span class="notify-badge badge badge-success">{$lang->badge_hit}</span>{/if}
                                    {if $product->is_new}<span class="notify-badge badge badge-warning">{$lang->badge_new}</span>{/if}
                                </span>
                                {if $product->image}
                                    <a class="image" href="{$lang_link}products/{$product->url}"><img src="{$product->image->filename|resize:240:240}" alt="{$product->name|escape}" /></a>
                                {else}
                                    <a class="image" href="{$lang_link}products/{$product->url}"><img style="width: 170px; height: 170px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$product->name|escape}" /></a>
                                {/if}
                            </div> <!-- img-wrap.// -->
                            <figcaption class="info-wrap">
                                <div class="fix-height">
                                    <a data-product="{$product->id}" href="{$lang_link}products/{$product->url}" class="title">{$product->name|escape}</a>
                                    <div class="rating-wrap mb-2">
                                        <ul class="rating-stars">
                                            <li style="width:{$product->rating*100/5|string_format:"%.0f"}%" class="stars-active">
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
                                    <div class="price-wrap mt-2">
                                        {if $product->variants|count > 0}
                                            {if $product->variants[0]->compare_price > 0}<del class="price-old"><small><span class="compare_price">{$product->variants[0]->compare_price|convert}</span> {$currency->sign|escape}</small></del>{/if}
                                            <span class="price">{$product->variants[0]->price|convert} {$currency->sign|escape}</span>
                                        {/if}
                                    </div> <!-- price-wrap.// -->
                                </div>
                                <div class="btn-toolbar justify-content-between">
                                    {if $product->variants|count > 0}
                                        <form class="variants" action="{$lang_link}cart">
                                            {foreach $product->variants as $v}
                                                <input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} style="display:none;" />
                                            {/foreach}
                                            <input type="submit" data-result-text="{$lang->added_cart}" class="btn btn-primary" value="{$lang->add_cart}" title="{$lang->add_cart}" />
                                        </form>
                                    {else}
                                        {$lang->not_available}
                                    {/if}
                                    <div class="btn-group" role="group" aria-label="First group">
                                        {if $wishlist}
                                            <a class="btn btn-light" href='{$lang_link}wishlist/remove/{$product->url}'><i class="fal fa-heart text-danger"></i></a>
                                        {elseif $wishlist_products && in_array($product->url, $wishlist_products)}
                                            <a class="btn btn-light" href='{$lang_link}wishlist'><i class="fal fa-heart text-danger"></i></a>
                                        {else}
                                            <a class="btn btn-light wishlist" href='{$lang_link}wishlist/{$product->url}'><i class="fal fa-heart text-secondary"></i></a>
                                        {/if}
                                        {if $smarty.session.compared_products && in_array($product->url, $smarty.session.compared_products)}
                                            <a class="btn btn-light" href='{$lang_link}compare'><i class="fal fa-sync text-primary"></i></a>
                                        {else}
                                            <a class="btn btn-light compare" href='{$lang_link}compare/{$product->url}'><i class="fal fa-sync text-secondary"></i></a>
                                        {/if}
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                {/foreach}
            </div>
            <!-- /.row -->
        {/if}
        {if $module=='MainView'}
            {get_posts var=last_posts limit=3}
            {if $last_posts}
                <header class="section-heading">
                    <a href="{$lang_link}blog" class="btn btn-outline-primary float-right">{$lang->see_all}</a>
                    <h2 class="section-title my-2">{$lang->index_blog}</h2>
                </header><!-- sect-heading -->
                <hr>
                <div class="row">
                    {foreach $last_posts as $post}
                        <div class="col-md-6 col-lg-4 mb-5">
                            <div class="card h-100">
                                {if $post->image}
                                    <img class="card-img-top" src="{$post->image|resize_posts:750:300}" alt="{$post->name|escape}">
                                {else}
                                    <span class="text-center mt-4">
                                        <img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$article->name|escape}" />
                                    </span>
                                {/if}
                                <div class="card-body">
                                    <h5 class="card-title"><a data-post="{$post->id}" href="blog/{$post->url}">{$post->name|escape}</a></h5>
                                    <p class="card-text"><small class="text-muted">{$post->date|date}</small></p>
                                    <p class="card-text">{$post->annotation|strip_tags|truncate:150}</p>
                                </div>
                                <div class="card-footer">
                                    <a href="{$lang_link}blog/{$post->url}" class="btn btn-primary btn-sm">{$lang->more_details}</a>
                                </div>
                            </div>
                        </div>
                        <!-- /.col-md-4 -->
                    {/foreach}
                </div>
            {/if}
        {/if}
        {if $module=='MainView'}
            {get_articles var=last_articles limit=3}
            {if $last_articles}
                <header class="section-heading">
                    <a href="{$lang_link}articles" class="btn btn-outline-primary float-right">{$lang->see_all}</a>
                    <h2 class="section-title my-2">{$lang->index_articles}</h2>
                </header><!-- sect-heading -->
                <hr>
                <div class="row">
                    {foreach $last_articles as $article}
                        <div class="col-md-6 col-lg-4 mb-5">
                            <div class="card h-100">
                                {if $article->image}
                                    <img class="card-img-top" src="{$article->image|resize_articles:750:300}" alt="{$article->name|escape}">
                                {else}
                                    <span class="text-center mt-4">
                                        <img style="width: 210px; height: 210px;" src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$article->name|escape}" />
                                    </span>
                                {/if}
                                <div class="card-body">
                                    <h5 class="card-title"><a data-article="{$article->id}" href="{$lang_link}article/{$article->url}">{$article->name|escape}</a></h5>
                                    <p class="card-text"><small class="text-muted">{$article->date|date}</small></p>
                                    <p class="card-text">{$article->annotation|strip_tags|truncate:150}</p>
                                </div>
                                <div class="card-footer">
                                    <a href="{$lang_link}article/{$article->url}" class="btn btn-primary btn-sm">{$lang->more_details}</a>
                                </div>
                            </div>
                        </div>
                        <!-- /.col-md-4 -->
                    {/foreach}
                </div>
            {/if}
        {/if}
    </div>
    <!-- Subscribe -->
    <div class="container-fluid bg-light">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <form class="form-group my-5" id="loginForm" novalidate="" method="post">
                    {if $subscribe_error}
                        <label class="error text-danger">
                            {if $subscribe_error == 'email_exist'}
                                {$lang->already_subscribe}
                            {/if}
                            {if $subscribe_error == 'empty_email'}
                                {$lang->enter_your_email}
                            {/if}
                        </label>
                    {/if}
                    {if $subscribe_success}
                        <label class="success text-success">
                            {$lang->success_subscribe}
                        </label>
                    {/if}
                    <div class="input-group mb-2">
                        <input type="email" name="subscribe_email" class="form-control {if $subscribe_error}border-danger{/if} {if $subscribe_success}border-success{/if}" required size="20" value="" placeholder="{$lang->enter_your_email}">
                        <div class="input-group-append">
                            <button type="submit" name="subscribe" value="{$lang->subscribe_to}" id="btnLogin" class="btn btn-warning"><i class="fa fa-envelope"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Subscribe (The End)-->
    <a href="#" id="back-to-top" title="Back to top"><i class="fa fa-angle-double-up"></i></a>
    <!-- Footer -->
    <footer itemscope itemtype="https://schema.org/WPFooter" class="page-footer font-small bg-dark text-white pt-4">
        <!-- Footer Links -->
        <div class="container text-center text-md-left">
            <!-- Footer links -->
            <div class="row text-center text-md-left mt-3 pb-3">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">{$settings->company_name|escape}</h6>
                    <p class="text-muted">{$lang->main_description}</p>
                </div>
                <!-- Grid column -->
                <hr class="w-100 clearfix d-md-none">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">{$lang->about_shop}</h6>
                    {foreach $pages as $p}
                        {if $p->menu_id == 1}
                            <p {if $page && $page->id == $p->id}class="selected" {/if}>
                                <a data-page="{$p->id}" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
                            </p>
                        {/if}
                    {/foreach}
                </div>
                <!-- Grid column -->
                <hr class="w-100 clearfix d-md-none">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">{$lang->information}</h6>
                    {foreach $pages as $p}
                        {if $p->menu_id == 3}
                            <p {if $page && $page->id == $p->id}class="selected" {/if}>
                                <a data-page="{$p->id}" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
                            </p>
                        {/if}
                    {/foreach}
                </div>
                <!-- Grid column -->
                <hr class="w-100 clearfix d-md-none">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h6 class="text-uppercase mb-4 font-weight-bold">{$lang->contacts}</h6>
                    <p><i class="far fa-home mr-3 text-muted"></i>{$lang->contact_details}</p>
                    <p><i class="far fa-envelope mr-3 text-muted"></i> info@gmail.com</p>
                    <p><i class="far fa-phone mr-3 text-muted"></i> (123) 456-78-90</p>
                    <p><i class="far fa-print mr-3 text-muted"></i> (987) 654-32-10</p>
                    <p class="text-muted">
                        <i class="fab fa-lg fa-cc-visa"></i>
                        <i class="fab fa-lg fa-cc-mastercard"></i>
                        <i class="fab fa-lg fa-cc-paypal"></i>
                        <i class="fab fa-lg fa-cc-stripe"></i>
                        <i class="fab fa-lg fa-cc-apple-pay"></i>
                    </p>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Footer links -->
            <hr>
            <!-- Grid row -->
            <div class="row d-flex align-items-center">
                <!-- Grid column -->
                <div class="col-md-4 col-lg-4">
                    <!--Copyright-->
                    <p class="text-center text-md-left text-muted">© <span itemprop="copyrightYear">{$smarty.now|date_format:"%Y"}</span>
                        <a href="https://turbo-cms.com">
                            <strong>TurboCMS</strong>
                        </a>
                    </p>
                </div>
                <!-- Grid column -->
                <!-- Grid column -->
                <div class="col-md-4 col-lg-4">
                    <p class="text-center text-md-center text-muted"><i class="flag-icon flag-icon-ua"></i>
                        <strong>Made in Ukraine</strong>
                    </p>
                </div>
                <!-- Grid column -->
                <!-- Grid column -->
                <div class="col-md-4 col-lg-4 ml-lg-0">
                    <!-- Social buttons -->
                    <div class="text-center text-md-right">
                        <ul class="list-unstyled list-inline">
                            <li class="list-inline-item">
                                <a href="#" class="btn-floating btn-sm rgba-white-slight mx-1">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#" class="btn-floating btn-sm rgba-white-slight mx-1">
                                    <i class="fab fa-twitter"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#" class="btn-floating btn-sm rgba-white-slight mx-1">
                                    <i class="fab fa-google-plus-g"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#" class="btn-floating btn-sm rgba-white-slight mx-1">
                                    <i class="fab fa-linkedin-in"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="{$lang_link}sitemap" class="btn-floating btn-sm rgba-white-slight mx-1">
                                    <i class="fa fa-sitemap"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
        <!-- Footer Links -->
    </footer>
    <!-- Footer -->

    {* Javascripts *}
    {js id="libs" priority=99 include=[
	"design/{$settings->theme|escape}/js/jquery.min.js",
    "design/{$settings->theme|escape}/js/bootstrap.bundle.min.js",
    "design/{$settings->theme|escape}/js/jquery.fancybox.min.js",
    "design/{$settings->theme|escape}/js/script.js"
    ]}{/js}
    {javascript minify=true}

    {* Rating *}
    {if $module == 'ProductView'}
        {js id="rating" priority=99 include=[
		"design/{$settings->theme|escape}/js/rating-product.js"
        ]}{/js}
        {javascript minify=true}
    {/if}

    {* Reviews *}
    {if $module == 'CommentsView'}
        {js id="reviews" priority=99 include=[
		"design/{$settings->theme}/js/rating.js"
        ]}{/js}
        {javascript minify=true}
    {/if}

    {* Filter *}
    {if $module == 'ProductsView'}
        {css id="filter" include=[
		"design/{$settings->theme|escape}/js/ion.rangeSlider/ion.rangeSlider.css",
        "design/{$settings->theme|escape}/js/ion.rangeSlider/ion.rangeSlider.skinHTML5.css"
        ]}{/css}
        {stylesheet minify=true}

        {js id="filter" priority=99 include=[
		"design/{$settings->theme}/js/ion.rangeSlider/ion.rangeSlider.min.js",
        "design/{$settings->theme|escape}/js/price-slider.js"
        ]}{/js}
        {javascript minify=true}
    {/if}

    {* Blog Articles*}
    {if $module=='BlogView' || $module=='ArticlesView'}
        {css id="prism" include=[
		"design/{$settings->theme|escape}/css/prism.css"
        ]}{/css}
        {stylesheet minify=true}

        {js id="prism" priority=99 include=[
		"design/{$settings->theme}/js/prism.js"
        ]}{/js}
        {javascript minify=false}

        {js id="toc" priority=99 include=[
		"design/{$settings->theme}/js/owl.carousel.min.js",
        "design/{$settings->theme}/js/jquery.toc.js"
        ]}{/js}
        {javascript minify=true}
    {/if}

    {* Ctrl-navigate *}
    {js id="libs" priority=99 include=[
	"js/ctrlnavigate.js"
	]}{/js}
    {javascript minify=true}

    {* Ajax cart *}
    {js id="libs" priority=99 include=[
	"design/{$settings->theme|escape}/js/jquery-ui.min.js",
    "design/{$settings->theme}/js/ajax_cart.js"
    ]}{/js}
    {javascript minify=true}

    {* Baloon *}
    {js id="libs" priority=99 include=[
	"js/baloon/js/baloon.js"
	]}{/js}
    {javascript minify=true}

    {css id="libs" include=[
	"js/baloon/css/baloon.css"
	]}{/css}
    {stylesheet minify=true}

    {* Maske *}
    {js id="libs" priority=99 include=[
	"design/{$settings->theme|escape}/js/jquery.maskedinput.min.js"
    ]}{/js}
    {javascript minify=true}

    {* Search autocomplete *}
    {literal}
        <style>
            .autocomplete-suggestions {
                background-color: #ffffff;
                overflow: hidden;
                border: 1px solid #e0e0e0;
                overflow-y: auto;
            }

            .autocomplete-suggestions .search-img {
                display: inline-block;
                text-align: center;
                width: 50px;
                height: 50px;
                line-height: 43px;
            }

            .autocomplete-suggestions img {
                max-width: 100%;
                max-height: 60px;
            }

            .autocomplete-suggestions a {
                text-decoration: none !important;
                display: inline-block;
            }

            .autocomplete-suggestions .autocomplete-suggestion{cursor: default;}

            .autocomplete-suggestions .selected {
                background: #F0F0F0;
            }

            .autocomplete-suggestions div {
                white-space: nowrap;
            }

            .autocomplete-suggestions strong {
                font-weight: bold;
                color: #0d6efd;
            }
        </style>
        <script src="js/autocomplete/jquery.autocomplete-min.js" type="text/javascript"></script>
        <script>
            // Search autocomplete
            $(".input_search").autocomplete({
                serviceUrl: 'ajax/search_products.php',
                minChars: 1,
                noCache: false,
                onSelect: function(suggestion) {
                    $(".input_search").closest('form').submit();
                },
                formatResult: function(suggestion, currentValue) {
                    var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
                    var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
                    return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "products/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
                }
            });
        </script>
        <script>
            $(function() {
                if ($('#back-to-top').length) {
                    var scrollTrigger = 100, // px
                        backToTop = function() {
                            var scrollTop = $(window).scrollTop();
                            if (scrollTop > scrollTrigger) {
                                $('#back-to-top').addClass('show');
                            } else {
                                $('#back-to-top').removeClass('show');
                            }
                        };
                    backToTop();
                    $(window).on('scroll', function() {
                        backToTop();
                    });
                    $('#back-to-top').on('click', function(e) {
                        e.preventDefault();
                        $('html,body').animate({
                            scrollTop: 0
                        }, 700);
                    });
                }
            });
        </script>
    {/literal}
    <script>
        $("#btnLogin").click(function(event) {
            var form = $("#loginForm");
            if (form[0].checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.addClass('was-validated');
        });
    </script>
    <!-- Modal -->
    <div class="modal fade fade bd-example-modal-sm" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{$lang->request_a_call}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form class="form feedback_form" method="post">
                    <div class="modal-body">
                        {if $call_sent}
                            <div id="elasto_callback_s1_alert" class="alert alert-success" style="display: block;">
                                {$lang->message_sent}
                            </div>
                        {/if}
                        {if $call_error}
                            <div class="alert alert-danger" role="alert">
                                {if $call_error == 'empty_name'}
                                    {$lang->enter_your_name}
                                {elseif $call_error == 'empty_phone'}
                                    {$lang->enter_phone_number}
                                {elseif $call_error == 'captcha'}
                                    {$lang->captcha_incorrect}
                                {else}
                                    {$call_error}
                                {/if}
                            </div>
                        {/if}
                        <p class="modal-caption">{$lang->your_phone_number}</p>
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text text-primary"><i class="fv-icon-no-has fal fa-user"></i></div>
                                </div>
                                <input type="text" name="name" data-format=".+" data-notice="{$lang->enter_your_name}" value="{if $callname}{$callname|escape}{else}{$user->name|escape}{/if}" class="form-control" placeholder="{$lang->name}" required />
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text text-primary"><i class="fv-icon-no-has fal fa-phone-alt"></i></div>
                                </div>
                                <input data-format=".+" data-notice="{$lang->enter_phone_number}" required value="{if $callphone}{$callphone|escape}{else}{$user->phone|escape}{/if}" id="call_mask" name="phone" maxlength="255" type="text" class="form-control" placeholder="{$lang->phone}" />
                            </div>
                        </div>
                        {if $settings->captcha_callback}
                            <div class="form-row">
                                <div class="form-group col-sm-6">
                                    {get_captcha var="captcha_callback"}
                                    <div class="secret_number">{$captcha_callback[0]|escape} + ? = {$captcha_callback[1]|escape}</div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <input class="form-control" type="text" name="captcha_code" placeholder="{$lang->captcha}" required="" autocomplete="off" value="" data-format=".+" data-notice="{$lang->enter_captcha}" />
                                </div>
                            </div>
                        {/if}
                    </div>
                    <div class="modal-footer">
                        <input class="btn btn-primary mx-auto" type="submit" name="callback" value="{$lang->send}" />
                    </div>
                </form>
            </div>
        </div>
    </div>
    {if $module=='ProductView'}
        <div class="modal fade" id="fast_order" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">{$lang->buy_one_click}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="form feedback_form" id="loginForm" method="post">
                        <input id="fast-order-product-id" class="fast-order-inputarea" value="" name="variant_id" type="hidden" />
                        <input type="hidden" name="IsFastOrder" value="true">
                        <div class="modal-body">
                            {if $fastorder_error}
                                <div class="alert alert-danger" role="alert">
                                    {if $fastorder_error == 'empty_name'}
                                        {$lang->enter_your_name}
                                    {elseif $fastorder_error == 'empty_phone'}
                                        {$lang->enter_phone_number}
                                    {elseif $fastorder_error == 'captcha'}
                                        {$lang->captcha_incorrect}
                                    {else}
                                        {$fastorder_error}
                                    {/if}
                                </div>
                            {/if}
                            <p id="fast-order-product-name" class="modal-caption"></p>
                            <div class="form-group has-feedback">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text text-primary"><i class="fv-icon-no-has fal fa-user"></i></div>
                                    </div>
                                    <input type="text" name="name" data-format=".+" data-notice="{$lang->enter_your_name}" required value="{if $name}{$name|escape}{else}{$user->name|escape}{/if}" class="form-control" placeholder="{$lang->name}" />
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text text-primary"><i class="fv-icon-no-has fal fa-phone-alt"></i></div>
                                    </div>
                                    <input data-format=".+" data-notice="{$lang->enter_phone_number}" required id="fastorder" value="{if $phone}{$phone|escape}{else}{$user->phone|escape}{/if}" name="phone" maxlength="255" type="text" class="form-control" placeholder="{$lang->phone}" />
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text text-primary"><i class="fv-icon-no-has fal fa-at"></i></div>
                                    </div>
                                    <input value="{if $email}{$email|escape}{else}{$user->email|escape}{/if}" data-format=".+" data-notice="{$lang->enter_your_email}" name="email" maxlength="255" required type="text" class="form-control" placeholder="Email" />
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text text-primary"><i class="fv-icon-no-has fal fa-map-marker-alt"></i></div>
                                    </div>
                                    <input value="{if $address}{$address|escape}{else}{$user->address|escape}{/if}" data-format=".+" data-notice="{$lang->enter_the_address}" name="address" maxlength="255" type="text" class="form-control" placeholder="{$lang->address}" />
                                </div>
                            </div>
                            {if $settings->captcha_fastorder}
                                <div class="form-row">
                                    <div class="form-group col-sm-6">
                                        {get_captcha var="captcha_fastorder"}
                                        <div class="secret_number">{$captcha_fastorder[0]|escape} + ? = {$captcha_fastorder[1]|escape}</div>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <input class="form-control" type="text" name="captcha_code" placeholder="{$lang->enter_captcha}" required="" autocomplete="off" value="" data-format=".+" data-notice="{$lang->enter_captcha}" />
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <div class="modal-footer">
                            <input class="btn btn-success mx-auto" id="btnLogin" type="submit" name="checkout" value="{$lang->send}" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    {/if}
    <div class="position-fixed top-0 start-50 translate-middle-x p-3 mt-5" style="z-index: 1060">
        <div id="rate_danger" class="toast fade hide align-items-center text-white bg-danger border-0" role="alert" aria-live="assertive" data-delay="4000" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    {$lang->already_voted}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>
    <div class="position-fixed top-0 start-50 translate-middle-x p-3 mt-5" style="z-index: 1060">
        <div id="rate" class="toast fade hide align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" data-delay="4000" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    {$lang->vote_counted}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>
    <div class="position-fixed top-0 start-50 translate-middle-x p-3 mt-5" style="z-index: 1060">
        <div id="subscribe" class="toast fade hide align-items-center text-white {if $subscribe_error}bg-danger{/if}{if $subscribe_success}bg-success{/if} border-0" role="alert" aria-live="assertive" data-delay="4000" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    {if $subscribe_error}
                        {if $subscribe_error == 'email_exist'}
                            {$lang->already_subscribe}
                        {/if}
                        {if $subscribe_error == 'empty_email'}
                            {$lang->enter_your_email}
                        {/if}
                    {/if}
                    {if $subscribe_success}
                        {$lang->success_subscribe}
                    {/if}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>
    <script type='text/javascript'>
        $('#liveToastBtn').on('click', function(event) {
            $('#liveToast').toast('show');
        });
    </script>
    {if $call_sent}
        <script type='text/javascript'>
            $(window).on("load", function() {
                $('#exampleModal').modal('show');
            });
        </script>
    {/if}
    {if $call_error}
        <script type='text/javascript'>
            $(window).on("load", function() {
                $('#exampleModal').modal('show');
            });
        </script>
    {/if}
    {if $subscribe_success || $subscribe_error}
        <script type='text/javascript'>
            $(window).on("load", function() {
                $('#subscribe').toast('show');
            });
        </script>
    {/if}
    {if $fastorder_error}
        <script type='text/javascript'>
            $(window).on("load", function() {
                $('#fast_order').modal('show');
            });
        </script>
    {/if}
    {if $module=='ProductView'}
        <script>
            function changeColor() {
                var color = $('input[name=color]:checked'),
                    arr = [];
                $('#colors label').removeClass('active');
                color.parent().addClass('active');
                $('#variants label').remove();
                $.each(variants, function(id, val) {
                    if (val['color'] == color.val() && $.inArray(val['name'], arr) < 0) {
                        arr.push(val['name']);
                        $('#variants').append('<label tabindex="0"><input type="radio" name="variant" value="' + id + '" />' + val['name'] + '</label>');
                    }
                });
                if (arr.length > 1) $('#variants').show();
                $("input[name=variant]:first").attr('checked', true).parent().addClass('active');
                changeVariant();
            }

            function changeVariant() {
                var variant = $('input[name=variant]:checked');
                var val = variants[variant.val()];
                var images_ids = val['images_ids'];
                var image_id = images_ids[0];
                var arr = [];
                if (images_ids.length > 0)
                    $('#product-slider-pagination div').hide();
                if (image_id != '' && $('#image' + image_id) !== 'undefined') {
                    //$('#big_image img').attr('src', $('#image'+image_id).data('img'));
                    $('#image' + image_id).find('a').trigger('click');
                    $.each(images_ids, function(id, val) { $('#image' + val).show(); });
                }
                $('#variants label').removeClass('active');
                variant.parent().addClass('active');
                $('.offers_price_old .price_value').text(val['compare_price']);
                $('.offers_price .price_value').text(val['price']);
                $('.article .value').html(val['sku']);
            }
            $(document).ready(function() {
                $(document).on('change', '#colors input', function() { changeColor(); });
                $(document).on('change', '#variants input', function() { changeVariant(); });
                changeColor();
            });
        </script>
        <script>
            $('[id^=carousel-selector-]').click(function() {
                var id_selector = $(this).attr("id");
                var id = id_selector.substr(id_selector.length - 1);
                id = parseInt(id);
                $('[id^=carousel-selector-]').removeClass('selected');
                $(this).addClass('selected');
            });
        </script>
        <script type="text/javascript">
            $(function() {
                $('.fast-order-send-button').click(function() {
                    $("#fast-order-product-name").html($(this).data('name'));

                    var variant;
                    var form_obj = $(this).closest("form.variants");
                    if (form_obj.find('input[name=variant]:checked').length > 0)
                        variant = form_obj.find('input[name=variant]:checked').val();
                    if (form_obj.find('select[name=variant]').length > 0)
                        variant = form_obj.find('select').val();

                    $("#fast-order-product-id").val(variant);

                });
            });
        </script>
    {/if}
    <script type="text/javascript">
        // jquery ready start
        $(document).ready(function() {
            // jQuery code

            $("[data-trigger]").on("click", function(e) {
                e.preventDefault();
                e.stopPropagation();
                var offcanvas_id = $(this).attr('data-trigger');
                $(offcanvas_id).toggleClass("show");
                $('body').toggleClass("offcanvas-active");
                $(".screen-overlay").toggleClass("show");
            });

            // Close menu when pressing ESC
            $(document).on('keydown', function(event) {
                if (event.keyCode === 27) {
                    $(".mobile-offcanvas").removeClass("show");
                    $("body").removeClass("overlay-active");
                }
            });

            $(".btn-close-sidebar, .screen-overlay").click(function(e) {
                $(".screen-overlay").removeClass("show");
                $(".mobile-offcanvas").removeClass("show");
                $("body").removeClass("offcanvas-active");
            });

        }); // jquery end
    </script>
    {if $module=='ProductView'}
        {* Timer *}
        <script src="design/{$settings->theme|escape}/js/jq-timeTo/jquery.time-to.js"></script>
        <link href="design/{$settings->theme|escape}/js/jq-timeTo/timeTo.css" rel="stylesheet" type="text/css" />
        <script>
            $('#countdown').each(function() {
                var prd = $(this).parent();
                $(this).timeTo({
                    timeTo: new Date(parseInt($(this).attr('sale_to'))),
                    displayDays: true,
                    fontSize: 28,
                    displayDays: 2,
                    displayCaptions: true,
                    lang: "{$language->label|escape}",
                    callback: function() {
                        prd.find('#countdown').hide();
                        prd.find('#countdown_title').hide();
                        real = prd.find('form.variants .offers_price_old .price_value').first().html();
                        if (typeof(real) == 'undefinded' || real == null) {
                            return;
                        }

                        prd.find('form.variants .offers_price_old').first().remove();
                        prd.find('form.variants .offers_price .price_value').first().html(real);
                    }
                });
            });
        </script>
    {/if}
    <script>
        $(function() {
            $("#call_mask").mask("+*(999) 999-99-99");
            $("#order_phone").mask("+*(999) 999-99-99");
            $("#fastorder").mask("+*(999) 999-99-99");
            $("#phone").mask("+*(999) 999-99-99");
        });
    </script>
    {if $module == 'CommentsView'}
        <script>
            $("#review").rating({
                "value": 4,
                "click": function(e) {
                    console.log(e);
                    $("#starsInput").val(e.stars);
                }
            });
        </script>
    {/if}
    {css id="chat" include=[
	"design/{$settings->theme|escape}/css/online-chat.css"
    ]}{/css}
    {stylesheet minify=true}

    {js id="chat" priority=99 include=[
	"design/{$settings->theme}/js/online-chat.js"
    ]}{/js}
    {javascript minify=false}
    {if $settings->chat_viber || $settings->chat_whats_app || $settings->chat_telegram || $settings->chat_facebook}
        {include file="online_chat.tpl"}
    {/if}
    {if $smarty.session.admin == 'admin'}
        {$admintooltip}
    {/if}
    {if $counters['body_bottom']}
        {foreach $counters['body_bottom'] as $counter}
            {$counter->code}
        {/foreach}
    {/if}
</body>
</html>