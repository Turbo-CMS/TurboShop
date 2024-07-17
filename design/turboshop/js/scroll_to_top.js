var $scrolltotop = null;

scrollToTop = function () {
	if (typeof turboOptions === "undefined") {
		return;
	}

	if (turboOptions.THEME.SCROLLTOTOP_TYPE !== "NONE") {
		scrollToTopAnimateClassIn = turboOptions.THEME.SCROLLTOTOP_TYPE.indexOf("ROUND") !== -1 ? "rotateIn" : "rubberBand";
		scrollToTopAnimateClassOut = turboOptions.THEME.SCROLLTOTOP_TYPE.indexOf("ROUND") !== -1 ? "rotateOut" : "flipOutX";

		if (Turbo.browser.IsMac()) {
			scrollToTopAnimateClassIn = scrollToTopAnimateClassOut = "";
		}

		var _isScrolling = false;

		// Append Button
		$("body").append(
			$("<a />").addClass("scroll-to-top " + turboOptions.THEME.SCROLLTOTOP_TYPE + " " + turboOptions.THEME.SCROLLTOTOP_POSITION).attr({ href: "#", id: "scrollToTop" })
		);

		$scrolltotop = $("#scrollToTop");

		if (
			turboOptions.THEME.SCROLLTOTOP_POSITION !== 'TOUCH' &&
			turboOptions.THEME.SCROLLTOTOP_POSITION_RIGHT
		) {
			$scrolltotop.css({ right: turboOptions.THEME.SCROLLTOTOP_POSITION_RIGHT + "px", left: "auto" });
		}

		$scrolltotop.click(function (e) {
			e.preventDefault();
			$("body, html").animate({ scrollTop: 0 }, 500);

			return false;
		});

		// Show/Hide Button on Window Scroll event.
		$(window).scroll(function () {
			if (!_isScrolling) {
				_isScrolling = true;

				if ($(window).scrollTop() > 150) {
					$scrolltotop.stop(true, true).addClass("visible");
					_isScrolling = false;
				} else {
					$scrolltotop.stop(true, true).removeClass("visible");
					_isScrolling = false;
				}

				CheckScrollToTop();
			}
		});

		$(window).resize(function () {
			CheckScrollToTop();
		});
	}
}

CheckScrollToTop = function () {
	if (typeof turboOptions === "undefined") {
		return;
	}

	if (turboOptions.THEME.SCROLLTOTOP_TYPE !== "NONE" && $scrolltotop) {
		if (documentScrollTop > 150) {
			$scrolltotop.stop(true, true).addClass("visible").addClass("animated");

			if (scrollToTopAnimateClassOut) {
				$scrolltotop.removeClass(scrollToTopAnimateClassOut);
			}
			if (scrollToTopAnimateClassIn) {
				$scrolltotop.addClass(scrollToTopAnimateClassIn);
			}
		} else {
			$scrolltotop.stop(true, true).removeClass("visible");

			if (scrollToTopAnimateClassIn) {
				$scrolltotop.removeClass(scrollToTopAnimateClassIn);
			}
			if (scrollToTopAnimateClassOut) {
				$scrolltotop.addClass(scrollToTopAnimateClassOut);
			}
		}
	}

	var bottom = 23,
		scrollVal = $(window).scrollTop(),
		windowHeight = $(window).height();

	if (turboOptions.THEME.SCROLLTOTOP_POSITION_BOTTOM) {
		bottom = parseFloat(turboOptions.THEME.SCROLLTOTOP_POSITION_BOTTOM);
	}

	if (parseInt($scrolltotop.css("bottom")) > bottom) {
		bottom = Math.round(bottom);
	}

	if ($("footer").length) {
		var footerOffset = $("footer").offset().top;

		if (scrollVal + windowHeight > footerOffset) {
			bottom = Math.round(bottom + scrollVal + windowHeight - Math.round(footerOffset));
		}
	}

	$scrolltotop.css("bottom", bottom + "px");
}
