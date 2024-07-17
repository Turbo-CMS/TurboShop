function checkNavColor(slider) {
	var nav_color_flex = slider.find(".swiper-slide-active").data("nav_color"),
		menu_color = slider.find(".swiper-slide-active").data("color");
	if (nav_color_flex == "dark") slider.find(".swiper-pagination").addClass("flex-dark");
	else slider.find(".swiper-pagination").removeClass("flex-dark");
	if (typeof checkNavColor.hasLongBanner === "undefined") {
		checkNavColor.hasLongBanner = $(".header_opacity").length;
	}
	if (checkNavColor.hasLongBanner) {
		var logoOpacity =
			$("body.header_opacity").length &&
			(!$("header.header--offset").length ||
				$("header .logo").closest(".header__top-part").length ||
				($("header.header--offset").length &&
					($("header .header__main-inner.bg_none").length || $("header .header__sub-inner.bg_none").length)));
		var bLogoImg = $("body:not(.left_header_column) header .logo img").length && logoOpacity;
		if (bLogoImg) $("header .logo img").attr("src", turboOptions.THEME.LOGO_IMAGE);
		$("header").removeClass("light dark");
		if (menu_color == "light") {
			$("header").addClass(menu_color);
			if (bLogoImg) {
				if (turboOptions.THEME.LOGO_IMAGE_WHITE)
					$("header .logo img").attr("src", turboOptions.THEME.LOGO_IMAGE_WHITE);
			}
		}
	}

	var eventdata = { slider: slider };
	Turbo.onCustomEvent("onSlide", [eventdata]);
}

readyDOM(function () {
	$(".main-slider").mouseenter(function () {
		if (!$(this).hasClass("video_visible") && $(this).data("swiper")) {
			if ($(this).data("swiper").params.autoplay.enabled) {
				$(this).data("swiper").autoplay.stop();
			}
		}
	});

	$(".main-slider").mouseleave(function () {
		if (!$(this).hasClass("video_visible") && $(this).data("swiper")) {
			if ($(this).data("swiper").params.autoplay.enabled) {
				$(this).data("swiper").autoplay.start();
			}
		}
	});
});

Turbo.addCustomEvent("onSetSliderOptions", function (options) {
	if ("type" in options && options.type === "main_banner") {
		if (typeof turboOptions["THEME"] != "undefined") {
			const slideshowSpeed = Math.abs(parseInt(turboOptions["THEME"]["BIGBANNER_SLIDESSHOWSPEED"]));
			const animationSpeed = Math.abs(parseInt(turboOptions["THEME"]["BIGBANNER_ANIMATIONSPEED"]));

			options.autoplay = slideshowSpeed && turboOptions["THEME"]["BIGBANNER_ANIMATIONTYPE"].length ? {} : false;
			// options.autoplay.pauseOnMouseEnter = true;
			// options.autoplay.disableOnInteraction = false;
			options.effect = turboOptions["THEME"]["BIGBANNER_ANIMATIONTYPE"] === "FADE" ? "fade" : "slide";
			if (animationSpeed >= 0) {
				options.speed = animationSpeed;
			}
			if (slideshowSpeed >= 0) {
				options.autoplay.delay = slideshowSpeed;
			}
			/*if (turboOptions["THEME"]["BIGBANNER_ANIMATIONTYPE"] !== "FADE") {
				options.direction =
				  turboOptions["THEME"]["BIGBANNER_ANIMATIONTYPE"] === "SLIDE_VERTICAL" ? "vertical" : "horizontal";
			  }*/
		}

		if ("CURRENT_BANNER_INDEX" in turboOptions && turboOptions["CURRENT_BANNER_INDEX"]) {
			currentBannerIndex = turboOptions["CURRENT_BANNER_INDEX"] - 1;
			if (currentBannerIndex < options.countSlides) {
				options.initialSlide = currentBannerIndex;
				options.autoplay = false;
			}
		}
	}
});

Turbo.addCustomEvent("onSlideChanges", function (eventdata) {
	if ("slider" in eventdata && eventdata.slider) {
		const slider = eventdata.slider;
		if (slider && slider.params) {
			if ("type" in slider.params && slider.params.type === "main_banner") {
				setTimeout(function () {
					checkNavColor($(slider.el));
				}, 100);
			}
		}
	}
});
