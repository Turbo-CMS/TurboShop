function initSwiperSlider(selector) {
	const $slider = $((selector || ".slider-solution") + ':not(.swiper-initialized):not(.appear-block)');
	$slider.each(function () {
		const _this = $(this);
		let options = {
			grabCursor: true,
			//   longSwipes: false,
			navigation: {
				nextEl: _this.parent().find(".swiper-button-next")[0],
				prevEl: _this.parent().find(".swiper-button-prev")[0],
			},
			pagination: {
				// el: ".swiper-pagination",
				el: _this.parent().find(".swiper-pagination")[0],
				type: "bullets",
				clickable: true,
			},
		};
		if (_this.data("pluginOptions")) {
			options = deepMerge({}, options, _this.data("pluginOptions"));
		}

		if (options.thumbs && typeof options.thumbs.swiper === "string") {
			const thumbsSwiper = $(options.thumbs.swiper).data("swiper");

			if (thumbsSwiper) options.thumbs.swiper = thumbsSwiper;
			else delete options.thumbs;
		}

		Turbo.onCustomEvent("onSetSliderOptions", [options]);
		const swiper = new Swiper(this, options);
		const mainSwiper = options.mainSwiper ? $(options.mainSwiper).data("swiper") : false;

		if (mainSwiper) {
			mainSwiper.thumbs.swiper = swiper;

			if (options.init !== false) mainSwiper.thumbs.init();
		}

		swiper.on("slideChange", function (swiper) {
			const eventdata = { slider: swiper };
			Turbo.onCustomEvent("onSlideChanges", [eventdata]);
		});

		if (options.init === false) {
			swiper.on("init", function (swiper) {
				const eventdata = { slider: swiper, options: options };
				Turbo.onCustomEvent("onInitSlider", [eventdata]);
				if (swiper.slides.length === 1) Turbo.onCustomEvent("onSlideChanges", [{ slider: swiper }]);
			});
			// init Swiper
			swiper.init();
			if (mainSwiper) {
				mainSwiper.thumbs.init();
			}
		}

		_this.data("swiper", swiper);
	});
}

function deepMerge() {
	const arr = [].slice.call(arguments);
	let destination = arr[0];
	const other = arr.slice(1);

	other.forEach(function (params) {
		for (let param in params) {
			if (typeof params[param] === "object") {
				for (let param2 in params[param]) {
					if (typeof destination[param] !== "object") {
						destination[param] = {};
					}
					destination[param][param2] = params[param][param2];
				}
			} else {
				destination[param] = params[param];
			}
		}
	});
	return destination;
}

readyDOM(function () {
	initSwiperSlider();
});
