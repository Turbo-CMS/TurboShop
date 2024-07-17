Turbo.namespace("Turbo.Iblock.Catalog");

$(document).ready(function () {
	$('#compare_diff').change(function () {
		var checked = $(this).prop('checked');

		var uniqueValues = {};

		$('.owl-item.active').each(function () {
			$(this).find('.catalog-compare__prop-line').each(function () {
				var value = $(this).text().trim();
				var propName = $(this).find('.catalog-compare__prop-name').text().trim();

				if (!uniqueValues[propName]) {
					uniqueValues[propName] = [];
				}

				if (!uniqueValues[propName].includes(value)) {
					uniqueValues[propName].push(value);
				}
			});
		});

		$('.owl-item.active').each(function () {
			$(this).find('.catalog-compare__prop-line').each(function () {
				var value = $(this).text().trim();
				var propName = $(this).find('.catalog-compare__prop-name').text().trim();

				if (checked && uniqueValues[propName].length === 1 && uniqueValues[propName].includes(value)) {
					$(this).hide();
				} else {
					$(this).show();
				}
			});
		});
	});
});

function tableEqualHeight($sliderProps, $sliderPropsItems) {
	var arHeights = [];

	$sliderProps.find(".catalog-compare__prop-line").removeAttr("style");

	for (var i = 0; i < $sliderProps.find(".owl-item:first-child .catalog-compare__prop-line").length; i++) {
		arHeights[i] = 0;
	}

	//get max height
	$sliderPropsItems.each(function (i, elementI) {
		$(this)
			.find(".catalog-compare__prop-line")
			.each(function (j, elementJ) {
				if ($(this).outerHeight() > arHeights[j]) arHeights[j] = $(this).outerHeight(true);
			});
	});

	// set height
	$sliderPropsItems.each(function (i, elementI) {
		$(this)
			.find(".catalog-compare__prop-line")
			.each(function (j, elementJ) {
				$(this).css("height", arHeights[j]);
			});
	});
}

Turbo.addCustomEvent("onSliderInitialized", function (eventdata) {
	if (eventdata) {
		var slider = eventdata.slider;
		if (slider) {
			$(".catalog-compare__inner").removeClass("loading");
		}
	}
});

function stickyCompareItems() {
	if (window.matchMedia("(min-width:768px)").matches) {
		let propSlider = $(".compare-sections__item.active .catalog-compare__props-slider:visible");
		let headerSelector = window.matchMedia("(min-width:992px)").matches
			? "#headerfixed"
			: ".mfixed_y.mfixed_view_always #mobileheader, .mfixed_y.mfixed_view_scroll_top #mobileheader.fixed";
		let headerHeight = $(headerSelector).length ? $(headerSelector).height() : 0;
		let comparePosition = propSlider.length > 0 ? propSlider.offset().top : 0;
		let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
		let stickyItems = propSlider.find(".catalog-small__item");
		let topPos = 0;
		if (stickyItems.length) {
			topPos = scrollTop - comparePosition + headerHeight;
			stickyItems.css("top", topPos - 1 + "px");
		}
		if (headerHeight + scrollTop > comparePosition) {
			propSlider.addClass("show-sticky-items");
		} else {
			propSlider.removeClass("show-sticky-items");
		}
	}
}

if ($("html.tb-touch").length) {
	$(document).scroll(debounce(stickyCompareItems, 100));
} else {
	$(document).scroll(stickyCompareItems);
}
//$(document).scroll(throttle(stickyCompareItems, 50));
//$(document).scroll(debounce(stickyCompareItems, 200));

$(document).on("click", ".compare-sections__tab-item", function () {
	let th = $(this);
	if (!th.hasClass("active")) {
		let curSectionId = th.find("[data-section-id]").attr("data-section-id");
		$(".compare-sections__tab-item").removeClass("active");
		$(".compare-sections__item").removeClass("active");
		th.addClass("active");
		if (curSectionId) {
			$(".compare-sections__item" + "[data-section-id=" + curSectionId + "]").addClass("active");
			$.cookie("compare_section", curSectionId);
		}
	}
});
