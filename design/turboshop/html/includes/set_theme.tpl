<script data-skip-moving="true">
	var solutionName = 'arLiteOptions';
	var turboOptions = window[solutionName] = ({});
</script>

<script data-skip-moving="true">
	var turboOptions = (window[solutionName] = {
		SITE_TEMPLATE_PATH: "design/{$settings->theme|escape}",
		SITE_ADDRESS: "{$config->root_url}",
		PAGES: {
			BASKET_PAGE_URL: "{$lang_link}cart",
			COMPARE_PAGE_URL: "{$lang_link}compare",
			WISHLIST_PAGE_URL: "{$lang_link}wishlist",
			SEARCH_PAGE_URL: "{$lang_link}search",
			CATALOG_PAGE_URL: "{$lang_link}all-products",
			SEARCH_BLOG_URL: "{$lang_link}blog",
			SEARCH_ARTICLE_URL: "{$lang_link}articles",
		},
		THEME: {
			LOGO_IMAGE: "design/{$settings->theme|escape}/images/logo.png",
			LOGO_IMAGE_WHITE: "design/{$settings->theme|escape}/images/logo.png",
			FAVICON_IMAGE: "design/{$settings->theme|escape}/images/favicon.ico",
			APPLE_TOUCH_ICON_IMAGE: "design/{$settings->theme|escape}/images/apple-touch-icon.png",
			THEME_VIEW_COLOR: "LIGHT",
			PAGE_WIDTH: "1500px",
			PHONE_MASK: "{$theme_settings->phone_mask}",
			VALIDATE_PHONE_MASK: "{$theme_settings->phone_mask|mask}",
			SCROLLTOTOP_TYPE: "ROUND_COLOR",
			SCROLLTOTOP_POSITION: "PADDING",
			SCROLLTOTOP_POSITION_RIGHT: "",
			SCROLLTOTOP_POSITION_BOTTOM: "",
			BIGBANNER_ANIMATIONTYPE: "SLIDE_HORIZONTAL",
			BIGBANNER_SLIDESSHOWSPEED: "{$theme_settings->banners_slides_show_speed}",
			BIGBANNER_ANIMATIONSPEED: "{$theme_settings->banners_animation_speed}",
			TOP_MENU_FIXED: "Y",
			HEADER_FIXED: "1",
			HEADER_MOBILE_FIXED: "Y",
			HEADER_MOBILE_SHOW: "ALWAYS",
		},
		JS_ITEM_CLICK: {
			precision: 6,
			precisionFactor: Math.pow(10, 6),
		},
	});
</script>