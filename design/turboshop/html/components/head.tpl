<base href="{$config->root_url}/">

{* Title *}
{if $seo->seo_automation == "on"}
	<title>{($meta_title|default:$auto_meta->title)|escape}</title>
{else}
	<title>{($auto_meta->title|default:$meta_title)|escape}</title>
{/if}

{* Meta *}
<meta name="viewport" content="initial-scale=1.0, width=device-width" />
<meta name="HandheldFriendly" content="true" />
<meta name="yes" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

{if $seo->seo_automation == "on"}
	<meta name="description" content="{($meta_description|default:$auto_meta->description)|escape}">
{else}
	<meta name="description" content="{($auto_meta->description|default:$meta_description)|escape}">
{/if}

{if $seo->seo_automation == "on"}
	<meta name="keywords" content="{($meta_keywords|default:$auto_meta->keywords)|escape}">
{else}
	<meta name="keywords" content="{($auto_meta->keywords|default:$meta_keywords)|escape}">
{/if}

{literal}
	<script data-skip-moving="true">
		(function(w, d, n) {
			var cl = "tb-core";
			var ht = d.documentElement;
			var htc = ht ? ht.className : undefined;
			if (htc === undefined || htc.indexOf(cl) !== -1) {
				return;
			}
			var ua = n.userAgent;
			if (/(iPad;)|(iPhone;)/i.test(ua)) {
				cl += "tb-ios";
			} else if (/Windows/i.test(ua)) {
				cl += "tb-win";
			} else if (/Macintosh/i.test(ua)) {
				cl += "tb-mac";
			} else if (/Linux/i.test(ua) && !/Android/i.test(ua)) {
				cl += "tb-linux";
			} else if (/Android/i.test(ua)) {
				cl += "tb-android";
			}
			cl += /(ipad|iphone|android|mobile|touch)/i.test(ua) ? "tb-touch" : "tb-no-touch";
			cl += w.devicePixelRatio && w.devicePixelRatio >= 2 ? "tb-retina" : "tb-no-retina";
			var ieVersion = -1;
			if (/AppleWebKit/.test(ua)) {
				cl += "tb-chrome";
			} else if ((ieVersion = getIeVersion()) > 0) {
				cl += "tb-ie tb-ie" + ieVersion;
				if (ieVersion > 7 && ieVersion < 10 && !isDoctype()) {
					cl += "tb-quirks";
				}
			} else if (/Opera/.test(ua)) {
				cl += "tb-opera";
			} else if (/Gecko/.test(ua)) {
				cl += "tb-firefox";
			}
			ht.className = htc ? htc + " " + cl : cl;

			function isDoctype() {
				if (d.compatMode) {
					return d.compatMode == "CSS1Compat";
				}
				return d.documentElement && d.documentElement.clientHeight;
			}

			function getIeVersion() {
				if (/Opera/i.test(ua) || /Webkit/i.test(ua) || /Firefox/i.test(ua) || /Chrome/i.test(ua)) {
					return -1;
				}
				var rv = -1;
				if (!!w.MSStream && !w.ActiveXObject && "ActiveXObject" in w) {
					rv = 11;
				} else if (!!d.documentMode && d.documentMode >= 10) {
					rv = 10;
				} else if (!!d.documentMode && d.documentMode >= 9) {
					rv = 9;
				} else if (d.attachEvent && !/Opera/.test(ua)) {
					rv = 8;
				}
				if (rv == -1 || rv == 8) {
					var re;
					if (n.appName == "Microsoft Internet Explorer") {
						re = new RegExp("MSIE ([0-9]+[\.0-9]*)");
						if (re.exec(ua) != null) {
							rv = parseFloat(RegExp.$1);
						}
					} else if (n.appName == "Netscape") {
						rv = 11;
						re = new RegExp("Trident/.*rv:([0-9]+[\.0-9]*)");
						if (re.exec(ua) != null) {
							rv = parseFloat(RegExp.$1);
						}
					}
				}
				return rv;
			}
		})(window, document, navigator);
	</script>
{/literal}

{* Fonts *}
{if $theme_settings->font_family == 'Inter'}
	{css id="fonts" include=["design/{$settings->theme|escape}/css/fonts/inter.css"]}{/css}
	{stylesheet minify=true}
{/if}

{if $theme_settings->font_family == 'Manrope'}
	{css id="fonts" include=["design/{$settings->theme|escape}/css/fonts/manrope.css"]}{/css}
	{stylesheet minify=true}
{/if}

{if $theme_settings->font_family == 'Nunito Sans'}
	{css id="fonts" include=["design/{$settings->theme|escape}/css/fonts/nunito-sans.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Cart *}
{if $module=='CartView' || $module=='OrderView'}
	{css id="cart" include=[
		"design/{$settings->theme|escape}/css/cart/cart.css",
		"design/{$settings->theme|escape}/css/cart/basket.sale.css",
		"design/{$settings->theme|escape}/css/cart/print.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{* CSS *}
{css id="global" include=[
	"design/{$settings->theme|escape}/css/chip.css",
	"design/{$settings->theme|escape}/css/dropdown-select.css",
	"design/{$settings->theme|escape}/css/footer/bottom-icons-panel.css",
	"design/{$settings->theme|escape}/css/bootstrap/lite.bootstrap.css",
	"design/{$settings->theme|escape}/css/vendor/ripple.css",
	"design/{$settings->theme|escape}/css/buttons.css",
	"design/{$settings->theme|escape}/css/svg.css",
	"design/{$settings->theme|escape}/css/header/header.css",
	"design/{$settings->theme|escape}/css/footer/footer.css",
	"design/{$settings->theme|escape}/css/header/mobile-header.css",
	"design/{$settings->theme|escape}/css/header/mobile-menu.css",
	"design/{$settings->theme|escape}/css/header/header-fixed.css",
	"design/{$settings->theme|escape}/css/page-title-breadcrumb-pagination.css",
	"design/{$settings->theme|escape}/css/social-icons.css",
	"design/{$settings->theme|escape}/css/left-menu.css",
	"design/{$settings->theme|escape}/css/tabs.css",
	"design/{$settings->theme|escape}/css/banners/bg-banner.css",
	"design/{$settings->theme|escape}/css/item-views.css",
	"design/{$settings->theme|escape}/css/blocks/countdown.css",
	"design/{$settings->theme|escape}/css/blocks/cross.css",
	"design/{$settings->theme|escape}/css/blocks/dark-light-theme.css",
	"design/{$settings->theme|escape}/css/blocks/flexbox.css",
	"design/{$settings->theme|escape}/css/blocks/grid-list.css",
	"design/{$settings->theme|escape}/css/blocks/hint.css",
	"design/{$settings->theme|escape}/css/blocks/images.css",
	"design/{$settings->theme|escape}/css/blocks/line-block.css",
	"design/{$settings->theme|escape}/css/blocks/mobile-scrolled.css",
	"design/{$settings->theme|escape}/css/blocks/popup.css",
	"design/{$settings->theme|escape}/css/blocks/prices.css",
	"design/{$settings->theme|escape}/css/blocks/scroller.css",
	"design/{$settings->theme|escape}/css/blocks/catalog.viewed.css",
	"design/{$settings->theme|escape}/css/social-list.css",
	"design/{$settings->theme|escape}/css/blocks/sticker.css",
	"design/{$settings->theme|escape}/css/blocks/sticky.css",
	"design/{$settings->theme|escape}/css/blocks/tizers-list.css",
	"design/{$settings->theme|escape}/css/index-page.css",
	"design/{$settings->theme|escape}/css/item-action.css",
	"design/{$settings->theme|escape}/css/notice.css",
	"design/{$settings->theme|escape}/css/scroll_to_top.css",
	"design/{$settings->theme|escape}/css/header/top-menu.css",
	"design/{$settings->theme|escape}/css/theme.selector.css",
	"design/{$settings->theme|escape}/css/search/search.css",
	"design/{$settings->theme|escape}/css/dragscroll.css",
	"design/{$settings->theme|escape}/css/breadcrumb.css",
	"design/{$settings->theme|escape}/css/slider/swiper-bundle.min.css",
	"design/{$settings->theme|escape}/css/slider/slider.swiper.css",
	"design/{$settings->theme|escape}/css/slider/slider.css",
	"design/{$settings->theme|escape}/css/banners/banners.css",
	"design/{$settings->theme|escape}/css/catalog.css",
	"design/{$settings->theme|escape}/css/rating.css",
	"design/{$settings->theme|escape}/css/jquery.fancybox.css",
	"design/{$settings->theme|escape}/css/fancybox-gallery.css",
	"design/{$settings->theme|escape}/css/footer/bottom-menu.css",
	"design/{$settings->theme|escape}/css/gallery.css",
	"design/{$settings->theme|escape}/css/video-block.css",
	"design/{$settings->theme|escape}/css/detail.css",
	"design/{$settings->theme|escape}/css/back-url.css",
	"design/{$settings->theme|escape}/css/comments.css",
	"design/{$settings->theme|escape}/css/style-switcher.css",
	"design/{$settings->theme|escape}/css/styles.css",
	"design/{$settings->theme|escape}/css/template_styles.css",
	"design/{$settings->theme|escape}/css/form.css",
	"design/{$settings->theme|escape}/css/colored.css",
	"design/{$settings->theme|escape}/css/responsive.css",
	"design/{$settings->theme|escape}/css/custom.css",
	"design/{$settings->theme|escape}/css/fast-view.css",
	"design/{$settings->theme|escape}/css/header/basket.css",
	"design/{$settings->theme|escape}/css/footer/developer.css",
	"design/{$settings->theme|escape}/css/profile.css",
	"design/{$settings->theme|escape}/css/header/cabinet-dropdown.css",
	"design/{$settings->theme|escape}/css/flag-icon.min.css",
	"design/{$settings->theme|escape}/css/turbo.css"
]}{/css}
{stylesheet minify=true}

{* Menu Large *}
{if $theme_settings->categories_header_type == '2'}
	{css id="header" include=["design/{$settings->theme|escape}/css/header/menu_many_items.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Main *}
{if $module=='MainView'}
	{css id="main" include=[
		"design/{$settings->theme|escape}/css/main/tabs.css",
		"design/{$settings->theme|escape}/css/main/banners-with-text.css",
		"design/{$settings->theme|escape}/css/main/banners-only-img.css",
		"design/{$settings->theme|escape}/css/main/front-company.css",
		"design/{$settings->theme|escape}/css/main/front-instagramm.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{* Big Banner *}
{if $theme_settings->big_banners_type == '1'}
	{css id="banners" include=["design/{$settings->theme|escape}/css/header/header-opacity.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Footer Type 2 *}
{if $theme_settings->footer_type == '2'}
	{css id="footer" include=["design/{$settings->theme|escape}/css/footer/footer-2.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Catalog Sections *}
{if $theme_settings->catalog_sections_type == '2' && $module=='MainView'}
	{css id="blocks" include=["design/{$settings->theme|escape}/css/main/catalog.section.grid.css"]}{/css}
	{stylesheet minify=true}
{/if}

{if $theme_settings->catalog_sections_type == '3' && $module=='MainView'}
	{css id="blocks" include=["design/{$settings->theme|escape}/css/main/catalog.section.slider.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Catalog Section List *}
{if $module=='ProductsView' || $module=='MainView'}
	{css id="products" include=[
		"design/{$settings->theme|escape}/css/blocks/catalog.section.list.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{* Blog List *}
{if $module == 'BlogView' || $module=='ArticlesView' || $module=='MainView'}
	{css id="share" include=["design/{$settings->theme|escape}/css/news/blog-list.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Post *}
{if $module == 'BlogView' && isset($post) || $module=='ArticlesView' && isset($post)}
	{css id="post" include=[
		"design/{$settings->theme|escape}/css/news/news.detail.css",
		"design/{$settings->theme|escape}/css/news/comments.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{* Subscribe *}
{if $module=='BlogView' || $module=='ArticlesView'}
	{css id="subscribe" include=["design/{$settings->theme|escape}/css/news/subscribe.edit.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Share *}
{if $module == 'BlogView' && isset($post) || $module=='ArticlesView' && isset($post) || $module=='ProductView'}
	{css id="share" include=["design/{$settings->theme|escape}/css/share.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Compare *}
{if $module!='CompareView'}
	{css id="compare" include=["design/{$settings->theme|escape}/css/compare/catalog-block.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Brands *}
{if $module!='MainView' || $module!='BrandsView'}
	{css id="brands" include=["design/{$settings->theme|escape}/css/brands/brands-list.css"]}{/css}
	{stylesheet minify=true}
{/if}

{if $module=='BrandsView' && $theme_settings->brands_type == '1'}
	{css id="brands" include=["design/{$settings->theme|escape}/css/brands/brand-list-inner.css"]}{/css}
	{stylesheet minify=true}
{/if}

{if $module=='BrandsView' && $theme_settings->brands_type == '2'}
	{css id="brands" include=["design/{$settings->theme|escape}/css/brands/brands_by_group.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Products *}
{if $module=='ProductsView'}
	{css id="products" include=[
		"design/{$settings->theme|escape}/css/products/catalog.page.css",
		"design/{$settings->theme|escape}/css/products/toggle-panel.css",
		"design/{$settings->theme|escape}/css/products/filter-panel.css",
		"design/{$settings->theme|escape}/css/products/smart-filter.css",
		"design/{$settings->theme|escape}/css/products/catalog-list.css",
		"design/{$settings->theme|escape}/css/products/catalog-table.css",
		"design/{$settings->theme|escape}/css/products/catalog.section.css",
		"design/{$settings->theme|escape}/css/products/partners.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{* Product *}
{if $module=='ProductView'}
	{css id="product" include=[
		"design/{$settings->theme|escape}/css/product/product.css",
		"design/{$settings->theme|escape}/css/product/properties.css",
		"design/{$settings->theme|escape}/css/product/file-type.css",
		"design/{$settings->theme|escape}/css/product/docs.css",
		"design/{$settings->theme|escape}/css/product/rounded-columns.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{* Compare *}
{if $module=='CompareView'}
	{css id="compare" include=[
		"design/{$settings->theme|escape}/css/compare/catalog.compare.result.css",
		"design/{$settings->theme|escape}/css/compare/owl-styles.css",
		"design/{$settings->theme|escape}/css/compare/owl.carousel.css",
		"design/{$settings->theme|escape}/css/compare/owl.theme.default.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{* Feedback *}
{if $module=='FeedbackView'}
	{css id="contact" include=["design/{$settings->theme|escape}/css/contacts/contacts.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Reviews *}
{if $module=='ReviewsView'}
	{css id="reviews" include=[
		"design/{$settings->theme|escape}/css/reviews/reviews.css",
		"design/{$settings->theme|escape}/css/reviews/review-list-inner.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{* Search *}
{if $module=='SearchView'}
	{css id="search" include=["design/{$settings->theme|escape}/css/search/search-page.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Sitemap *}
{if $module=='SitemapView'}
	{css id="sitemap" include=["design/{$settings->theme|escape}/css/sitemap/sitemap.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* User *}
{if $module=='UserView'}
	{css id="user" include=[
		"design/{$settings->theme|escape}/css/user/index.user.css",
		"design/{$settings->theme|escape}/css/user/banners-slider.css",
		"design/{$settings->theme|escape}/css/user/user.css",
		"design/{$settings->theme|escape}/css/user/sale.user.order.lis.css",
		"design/{$settings->theme|escape}/css/user/sale.personal.order.lis.css",
		"design/{$settings->theme|escape}/css/user/popover.css",
		"design/{$settings->theme|escape}/css/user/popover_order_status.css",
		"design/{$settings->theme|escape}/css/user/personal.section.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{* Page 404 *}
{if isset($page) && $page->url=="404"}
	{css id="404" include=["design/{$settings->theme|escape}/css/error_404.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Cart *}
{if $module=='CartView' || $module=='OrderView'}
	{css id="cart" include=["design/{$settings->theme|escape}/css/footer/footer-simple.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* Settings Theme *}
{if $theme_settings->user_color}
	{assign var="color" value=$theme_settings->custom_color}
	{assign var="hsl" value=$color|hsl}
{else}
	{assign var="color" value=$theme_settings->colors}
	{assign var="hsl" value=$color|hsl}
{/if}

{if $theme_settings->more_colors_on}
	{if $theme_settings->more_user_color}
		{assign var="more_color" value=$theme_settings->more_custom_color}
		{assign var="more_hsl" value=$more_color|hsl}
	{else}
		{assign var="more_color" value=$theme_settings->more_colors}
		{assign var="more_hsl" value=$more_color|hsl}
	{/if}
{/if}

{literal}
	<style>
		html {
			font-size: {/literal}{$theme_settings->font_size}{literal};
			--border-radius: {/literal}{$theme_settings->border_radius}{literal};
			--theme-base-color: {/literal}{$color}{literal};
			--theme-base-opacity-color: {/literal}{$color}{literal}1a;
			--theme-more-color: {/literal}{if $theme_settings->more_colors_on}{$more_color}{else}{$color}{/if}{literal};
			--theme-outer-border-radius: {/literal}{$theme_settings->border_radius}{literal};
			--theme-text-transform: none;
			--theme-letter-spacing: normal;
			--theme-button-font-size: 0%;
			--theme-button-padding-2px: 0%;
			--theme-button-padding-1px: 0%;
			--theme-more-color-hue: {/literal}{if $theme_settings->more_colors_on}{$more_hsl.hue}{else}{$hsl.hue}{/if}{literal};
			--theme-more-color-saturation: {/literal}{if $theme_settings->more_colors_on}{$more_hsl.saturation}{else}{$hsl.saturation}{/if}{literal}%;
			--theme-more-color-lightness: {/literal}{if $theme_settings->more_colors_on}{$more_hsl.lightness}{else}{$hsl.lightness}{/if}{literal}%;
			--theme-base-color-hue: {/literal}{$hsl.hue}{literal};
			--theme-base-color-saturation: {/literal}{$hsl.saturation}{literal}%;
			--theme-base-color-lightness: {/literal}{$hsl.lightness}{literal}%;
			--theme-lightness-hover-diff: 6%;
			--theme-font-family: {/literal}{$theme_settings->font_family}{literal};
			--theme-font-title-family: var(--theme-font-family);
			--theme-font-title-weight: {/literal}{$theme_settings->title_weight}{literal};
			--theme-page-width: {/literal}{$theme_settings->site_width}{literal};
			--theme-page-width-padding: 32px;
		}
	</style>
{/literal}

{* JS *}
{js id="script" priority=99 include=[
	"design/{$settings->theme|escape}/js/jquery/jquery-3.6.0.min.js",
	"design/{$settings->theme|escape}/js/speed.js",
	"design/{$settings->theme|escape}/js/lazysizes.min.js",
	"design/{$settings->theme|escape}/js/ls.unveilhooks.min.js"
]}{/js}
{javascript minify=true}

{* Favicon *}
<link rel="shortcut icon" href="design/{$settings->theme|escape}/images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" sizes="180x180" href="design/{$settings->theme|escape}/images/apple-touch-icon.png" />
<link rel="manifest" href="design/{$settings->theme|escape}/images/site.webmanifest">

{* Meta *}
<meta name="author" content="Turbo CMS">
<meta name="generator" content="Turbo CMS">

{if $module=='ProductView'}
	<meta property="og:url" content="{$config->root_url}{if $lang_link}/{$lang_link|replace:'/':''}{/if}{$canonical}">
	<meta property="og:type" content="website">
	<meta property="og:title" content="{$product->name|escape}">
	<meta property="og:description" content='{$product->annotation|strip_tags|escape}'>
	<meta property="og:image" content="{if isset($product->image)}{$product->image->filename|resize:330:300}{/if}">
	<link rel="image_src" href="{if isset($product->image)}{$product->image->filename|resize:330:300}{/if}">
	<meta name="twitter:card" content="product">
	<meta name="twitter:url" content="{$config->root_url}{$canonical}">
	<meta name="twitter:site" content="{$settings->site_name|escape}">
	<meta name="twitter:title" content="{$product->name|escape}">
	<meta name="twitter:description" content="{$product->annotation|strip_tags|escape}">
	<meta name="twitter:image" content="{if isset($product->image)}{$product->image->filename|resize:330:300}{/if}">
	<meta name="twitter:label1" content="{$product->variant->price|convert:null:false} {$currency->code|escape}">
	<meta name="twitter:label2" content="{$settings->site_name|escape}">
{elseif $module == 'BlogView' && isset($post)}
	<meta property="og:url" content="{$config->root_url}{if $lang_link}/{$lang_link|replace:'/':''}{/if}{$canonical}">
	<meta property="og:type" content="article">
	<meta property="og:title" content="{$post->name|escape}">
	{if $post->image}
		<meta property="og:image" content="{if isset($post->image)}{$post->image|resize_posts:400:300}{/if}">
		<link rel="image_src" href="{if isset($post->image)}{$post->image|resize_posts:400:300}{/if}">
	{else}
		<meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
		<meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
	{/if}
	<meta property="og:description" content='{$post->annotation|strip_tags|escape}'>
	<meta name="twitter:card" content="summary">
	<meta name="twitter:title" content="{$post->name|escape}">
	<meta name="twitter:description" content="{$post->annotation|strip_tags|escape}">
	<meta name="twitter:image" content="{if isset($post->image)}{$post->image|resize_posts:400:300}{{/if}}">
{elseif $module=='ArticlesView' && isset($post)}
	<meta property="og:url" content="{$config->root_url}{if $lang_link}/{$lang_link|replace:'/':''}{/if}{$canonical}">
	<meta property="og:type" content="article">
	<meta property="og:title" content="{$post->name|escape}">
	{if $post->image}
		<meta property="og:image" content="{if isset($post->image)}{$post->image|resize_articles:400:300}{{/if}}">
		<link rel="image_src" href="{if isset($post->image)}{$post->image|resize_articles:400:300}{/if}">
	{else}
		<meta property="og:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
		<meta name="twitter:image" content="{$config->root_url}/design/{$settings->theme|escape}/images/logo.png">
	{/if}
	<meta property="og:description" content='{$post->annotation|strip_tags|escape}'>
	<meta name="twitter:card" content="summary">
	<meta name="twitter:title" content="{$post->name|escape}">
	<meta name="twitter:description" content="{$post->annotation|strip_tags|escape}">
	<meta name="twitter:image" content="{if isset($post->image)}{$post->image|resize_articles:400:300}{/if}">
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
	{if $noindex_filter && !$page}
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
{if isset($canonical)}
	<link rel="canonical" href="{$config->root_url}{if $lang_link}/{$lang_link|replace:'/':''}{/if}{$canonical}">
{/if}

{* Language Attribute *}
{foreach $languages as $lang}
	{if $lang->enabled}
		<link rel="alternate" hreflang="{if $lang@first}x-default{else}{$lang->label}{/if}" href="{$config->root_url}{if !$lang@first}/{/if}{$lang->url|replace:'/':''}">
	{/if}
{/foreach}

{literal}
	<style>
		html {--header-height:184px;}
	</style>
{/literal}

{* Custom Scripts *}
{if isset($counters['head'])}
	{foreach $counters['head'] as $counter}
		{$counter->code}
	{/foreach}
{/if}