const showSectionBanners = function () {
	const $banners = document.querySelector(".banners-slider");
	if ($banners) {
		const $loadWrapper = document.querySelector(".ajax_load");
		if ($loadWrapper) {
			if ($loadWrapper.classList.contains("list-view")) {
				$loadWrapper.querySelector(".catalog-list__wrapper").after($banners);
			}
			if ($loadWrapper.classList.contains("price-view")) {
				$loadWrapper.querySelector(".js_append:not(.table-props-cols) .catalog-table__wrapper").after($banners);
			}
			if ($loadWrapper.classList.contains("table-view")) {
				$loadWrapper.querySelector(".catalog-block__wrapper").after($banners);
			}
		}

		$banners.classList.remove("hidden");
		if (typeof initSwiperSlider === 'function') {
			initSwiperSlider();
		}
	}
};