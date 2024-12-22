{* Message *}
{literal}
	<script>
		if (!window.Turbo) window.Turbo = {};
		if (!window.Turbo.message)
			window.Turbo.message = function(mess) {
				if (typeof mess === "object") {
					for (let i in mess) {
						Turbo.message[i] = mess[i];
					}
					return true;
				}
			};
	</script>
{/literal}

<script>
	window.lazySizesConfig = window.lazySizesConfig || {};
	lazySizesConfig.loadMode = 1;
	lazySizesConfig.expand = 200;
	lazySizesConfig.expFactor = 1;
	lazySizesConfig.hFac = 0.1;
	window.lazySizesConfig.loadHidden = false;
</script>

{* JS *}
{js id="js" priority=99 include=[
	"design/{$settings->theme|escape}/js/observer.js",
	"design/{$settings->theme|escape}/js/bootstrap/lite.bootstrap.js",
	"design/{$settings->theme|escape}/js/jquery/jquery.cookie.js",
	"design/{$settings->theme|escape}/js/jquery/jquery.validate.min.js",
	"design/{$settings->theme|escape}/js/jquery/jquery.actual.min.js",
	"design/{$settings->theme|escape}/js/jquery/jquery-ui.min.js",
	"design/{$settings->theme|escape}/js/jquery/jquery.plugin.min.js",
	"design/{$settings->theme|escape}/js/jquery/jquery.countdown.js",
	"design/{$settings->theme|escape}/js/jquery/jquery.countdown.langs.js",
	"design/{$settings->theme|escape}/js/jquery/jquery.autocomplete.js",
	"design/{$settings->theme|escape}/js/jquery/jquery.inputmask.bundle.min.js",
	"design/{$settings->theme|escape}/js/jquery/jquery.fancybox.js",
	"design/{$settings->theme|escape}/js/jqModal.js",
	"design/{$settings->theme|escape}/js/scrollTabs.js",
	"design/{$settings->theme|escape}/js/detectmobilebrowser.js",
	"design/{$settings->theme|escape}/js/matchMedia.js",
	"design/{$settings->theme|escape}/js/ripple.js",
	"design/{$settings->theme|escape}/js/controls.js",
	"design/{$settings->theme|escape}/js/selectOffer.js",
	"design/{$settings->theme|escape}/js/tabs.history.js",
	"design/{$settings->theme|escape}/js/general.js",
	"design/{$settings->theme|escape}/js/custom.js",
	"design/{$settings->theme|escape}/js/logo.js",
	"design/{$settings->theme|escape}/js/notice.js",
	"design/{$settings->theme|escape}/js/scroll_to_top.js",
	"design/{$settings->theme|escape}/js/header/header.js",
	"design/{$settings->theme|escape}/js/theme.selector.lite.js",
	"design/{$settings->theme|escape}/js/search/search.title.js",
	"design/{$settings->theme|escape}/js/search/search.js",
	"design/{$settings->theme|escape}/js/dragscroll.js",
	"design/{$settings->theme|escape}/js/banners/banners.js",
	"design/{$settings->theme|escape}/js/banners/video.banner.js",
	"design/{$settings->theme|escape}/js/slider/slider.swiper.js",
	"design/{$settings->theme|escape}/js/slider/swiper-bundle.min.js",
	"design/{$settings->theme|escape}/js/catalog.block.js",
	"design/{$settings->theme|escape}/js/main/index-tabs.js",
	"design/{$settings->theme|escape}/js/phones.js",
	"design/{$settings->theme|escape}/js/footer/footer.js",
	"design/{$settings->theme|escape}/js/footer/bottom.menu.js"
]}{/js}
{javascript minify=true}

{* Menu Many *}
{if $theme_settings->categories_header_type == '2'}
	{js id="header" priority=99 include=[
		"design/{$settings->theme|escape}/js/header/menu_many_items.js",
		"design/{$settings->theme|escape}/js/header/jquery.menu-aim.js"
	]}{/js}
	{javascript minify=true}
{/if}

{* Products *}
{if $module == 'ProductsView'}
	{if $category && ($category->brands || $features)}
		{js id="products" priority=99 include=[
			"design/{$settings->theme|escape}/js/products/mobile.js",
			"design/{$settings->theme|escape}/js/products/sidebar.js",
			"design/{$settings->theme|escape}/js/products/smart-filter.js",
			"design/{$settings->theme|escape}/js/products/filter.js"
		]}{/js}
		{javascript minify=true}
	{/if}

	{js id="products" priority=99 include=["design/{$settings->theme|escape}/js/products/partners.js"]}{/js}
	{javascript minify=true}
{/if}

{* JS *}
{js id="js" priority=99 include=[
		"design/{$settings->theme|escape}/js/infinite-scroll.pkgd.min.js",
		"design/{$settings->theme|escape}/js/gallery.js",
		"design/{$settings->theme|escape}/js/slider/slider.swiper.galleryEvents.js",
		"design/{$settings->theme|escape}/js/hover-block.js"
]}{/js}
{javascript minify=true}

{* Cart *}
{if $module == 'CartView' && $cart->purchases}
	{js id="cart" priority=99 include=[
		"design/{$settings->theme|escape}/js/cart/number.js",
		"design/{$settings->theme|escape}/js/cart/cart.js"
	]}{/js}
	{javascript minify=true}
{/if}

{* Compare *}
{if $module=='CompareView'}
	{js id="compare" priority=99 include=[
		"design/{$settings->theme|escape}/js/compare/owl.carousel.js",
		"design/{$settings->theme|escape}/js/compare/catalog.compare.result.js"
	]}{/js}
	{javascript minify=true}
{/if}

{* User *}
{if $module=='UserView'}
	{js id="user" priority=99 include=[
		"design/{$settings->theme|escape}/js/user/sale.user.order.list.js",
		"design/{$settings->theme|escape}/js/user/banners.slider.user.js",
		"design/{$settings->theme|escape}/js/user/popover.js"
	]}{/js}
	{javascript minify=true}
{/if}

{* Sitemap *}
{if $module=='SitemapView'}
	{js id="sitemap" priority=99 include=["design/{$settings->theme|escape}/js/sitemap/sitemap.js"]}{/js}
	{javascript minify=true}
{/if}

{literal}
	<script>
		new JThemeSelector('g0');
	</script>
{/literal}

{* Turbo JS *}
{js id="script" priority=99 include=["design/{$settings->theme|escape}/js/turbo.js"]}{/js}
{javascript minify=true}

{* Filter *}
{if $module == 'ProductsView'}
	{if $category && ($category->brands || $features)}
		<script>
			Turbo.ready(function() {
				window['trackBar'] = new Turbo.Iblock.SmartFilter({
					'leftSlider': 'left_slider',
					'rightSlider': 'right_slider',
					'tracker': 'drag_tracker',
					'trackerWrap': 'drag_track',
					'minInputId': 'MAX_SMART_FILTER_P1_MIN',
					'maxInputId': 'MAX_SMART_FILTER_P1_MAX',
					'minPrice': '{$minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}',
					'maxPrice': '{$maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}',
					'curMinPrice': '{$current_minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}',
					'curMaxPrice': '{$current_maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}',
					'fltMinPrice': '{$minprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|floor}',
					'fltMaxPrice': '{$maxprice|convert|regex_replace:'/[ ]/':''|regex_replace:'/[,]/':'.'|ceil}',
					'precision': '0',
					'colorUnavailableActive': 'colorUnavailableActive',
					'colorAvailableActive': 'colorAvailableActive',
					'colorAvailableInactive': 'colorAvailableInactive'
				});
			});
		</script>
	{/if}
{/if}

{* Sidebar *}
{if $module == 'ProductsView'}
	{if $category && ($category->brands || $features)}
		<script>
			function checkVisibleProps() {
				$('.tb_filter_parameters_box').each(function() {
					if ($.cookie("LITE_filter_prop_" + $(this).data('prop_code')) == 2) {
						$(this).removeClass('active');
						$(this).find('.tb_filter_block').hide();
					} else if ($.cookie("LITE_filter_prop_" + $(this).data('prop_code')) == 3) {
						$(this).addClass('active');
						$(this).find('.tb_filter_block').show();
					}
				})
			}
			$(document).ready(function() {
				$(document).on('click', '.tb_filter_parameters_box_title:not(.one-value)', function(e) {
					var active = 2;
					if ($(this).closest(".tb_filter_parameters_box").hasClass("active")) {
						$(this).next(".tb_filter_block").slideUp(100);
					} else {
						$(this).next(".tb_filter_block").slideDown(200);
					}
					$(this).closest(".tb_filter_parameters_box").toggleClass("active");

					if ($(this).closest(".tb_filter_parameters_box").hasClass("active")) {
						active = 3;
					}

					$.cookie.json = true;
					$.cookie("LITE_filter_prop_" + $(this).closest(".tb_filter_parameters_box").data('prop_code'), active, {
						path: '/',
						domain: '',
						expires: 360
					});

					e.preventDefault();
				});
				checkVisibleProps()
			})
		</script>
	{/if}
{/if}

{* Banners User *}
{if $module=='UserView'}
	<script>
		showSectionBanners();
	</script>
{/if}

{* Online Chat *}
{if $settings->chat_viber || $settings->chat_whats_app || $settings->chat_telegram || $settings->chat_facebook}
	{css id="chat" include=["design/{$settings->theme|escape}/css/service/online-chat.css"]}{/css}
	{stylesheet minify=true}

	{js id="chat" priority=99 include=["design/{$settings->theme|escape}/js/service/online-chat.js"]}{/js}
	{javascript minify=true}

	{include file='service/online_chat.tpl'}
{/if}

{* Admintooltip *}
{if isset($smarty.session.admin) && $smarty.session.admin == 'admin'}
	{$admintooltip}
{/if}

{* Custom Scripts *}
{if $counters['body_bottom']}
	{foreach $counters['body_bottom'] as $counter}
		{$counter->code}
	{/foreach}
{/if}