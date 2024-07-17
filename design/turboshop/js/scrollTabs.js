InitTabsScroll = function () {
	$(".arrow_scroll:not(.arrow_scroll_init)").scrollTab();
};

ResizeScrollTabs = function () {
	var scrollTabs = $(".arrow_scroll_init");

	if (scrollTabs.length) {
		scrollTabs.each(function (i, scrollTab) {
			var _scrollTab = $(scrollTab);
			_scrollTab.data("scrollTabOptions").resize();
		});
	}
};

$(document).ready(function () {
	InitTabsScroll();
});

$(window).on("resize", function () {
	if (window.scrollTabsTimeout !== undefined) {
		clearTimeout(window.scrollTabsTimeout);
	}

	window.scrollTabsTimeout = setTimeout(ResizeScrollTabs, 20);
});

$.fn.scrollTab = function (options) {
	function _scrollTab(element, options) {
		var _scrollTab = $(element);
		var tabs_wrapper = _scrollTab.find(options.tabs_wrapper);
		if (tabs_wrapper === undefined || !tabs_wrapper.length) return false;

		var tabs = tabs_wrapper.find(options.tab_item);
		if (!tabs.length) return false;

		var arrow_svg =
			'<svg xmlns="http://www.w3.org/2000/svg" width="12" height="8" viewBox="0 0 12 8">' +
			'<rect width="12" height="8" fill="#333" fill-opacity="0" />' +
			'<path d="M1015.69,507.693a0.986,0.986,0,0,1-1.4,0l-4.31-4.316-4.3,4.316a0.993,0.993,0,0,1-1.4-1.408l4.99-5.009a1.026,1.026,0,0,1,1.43,0l4.99,5.009A0.993,0.993,0,0,1,1015.69,507.693Z" fill="#333" transform="translate(-1004 -501)"/>' +
			"</svg>";
		var arrows_wrapper =
			'<div class="arrows_wrapper">' +
			'<div class="arrow arrow_left colored_theme_hover_text fill-dark-light-block">' +
			arrow_svg +
			"</div>" +
			'<div class="arrow arrow_right colored_theme_hover_text fill-dark-light-block">' +
			arrow_svg +
			"</div>" +
			"</div>";

		var arrows = $(arrows_wrapper).insertAfter(tabs_wrapper);
		var arrow_left = arrows.find(".arrow_left");
		var arrow_right = arrows.find(".arrow_right");

		var thisOoptions = $.extend({}, options);

		if (thisOoptions.outer_wrapper) {
			thisOoptions.outer_wrapper_node = $(thisOoptions.outer_wrapper);
		}

		thisOoptions.scrollTab = _scrollTab;
		thisOoptions.wrapper = tabs_wrapper;
		thisOoptions.tabs = tabs;
		thisOoptions.arrows = {};
		thisOoptions.arrows.wrapper = arrows;
		thisOoptions.arrows.arrow_left = arrow_left;
		thisOoptions.arrows.arrow_right = arrow_right;

		if (
			thisOoptions.linked_tabs !== undefined &&
			thisOoptions.linked_tabs.length &&
			thisOoptions.linked_tabs.data("scrollTabOptions") !== undefined
		) {
			thisOoptions.linked_options = thisOoptions.linked_tabs.data("scrollTabOptions");
			thisOoptions.linked_options.linked_options = thisOoptions;
		}

		if (options.arrows_css) {
			thisOoptions.arrows.arrow_left.css(options.arrows_css);
			thisOoptions.arrows.arrow_right.css(options.arrows_css);
		}

		thisOoptions.initTabs = function () {
			thisOoptions.wrapperBounds = thisOoptions.wrapper[0].getBoundingClientRect();
			thisOoptions.scrollBounds = thisOoptions.scrollTab[0].getBoundingClientRect();
			if (thisOoptions.offset) {
				thisOoptions.scrollBounds.width += thisOoptions.offset;
			}
			elements = $(thisOoptions.tabs);
			if (elements.length) {
				thisOoptions.firstTabBound = elements[0].getBoundingClientRect().left;
				thisOoptions.lastTabBound = elements[elements.length - 1].getBoundingClientRect().right;
			}
			thisOoptions.minTranslate =
				thisOoptions.wrapperBounds.right < thisOoptions.lastTabBound
					? thisOoptions.wrapperBounds.right - thisOoptions.lastTabBound - 3
					: 0;
			thisOoptions.disabled =
				thisOoptions.lastTabBound - thisOoptions.wrapperBounds.left <= thisOoptions.scrollBounds.width;
		};

		thisOoptions.wrapper.css({
			"white-space": "nowrap",
			"min-width": "auto",
			overflow: "visible",
			"z-index": "1",
		});
		thisOoptions.scrollTab.css({
			overflow: "hidden",
			position: "relative",
		});

		thisOoptions.checkArrows = function (translate) {
			if (translate === undefined) {
				translate = thisOoptions.translate;
			}
			// if (!translate && thisOoptions.maxTranslate === thisOoptions.minTranslate) {
			//   return;
			// }
			if (thisOoptions.disabled) {
				thisOoptions.arrows.arrow_left.addClass("disabled");
				thisOoptions.arrows.arrow_right.addClass("disabled");
			} else {
				if (translate >= thisOoptions.maxTranslate) {
					thisOoptions.arrows.arrow_left.addClass("disabled");
					thisOoptions.arrows.arrow_right.removeClass("disabled");
				} else if (translate <= thisOoptions.minTranslate) {
					thisOoptions.arrows.arrow_right.addClass("disabled");
					thisOoptions.arrows.arrow_left.removeClass("disabled");
				} else {
					thisOoptions.arrows.arrow_left.removeClass("disabled");
					thisOoptions.arrows.arrow_right.removeClass("disabled");
				}
			}
		};

		thisOoptions.directScroll = function (distance, delay, step) {
			if (delay === undefined) {
				delay = 5;
			}
			clearInterval(thisOoptions.timerMoveDirect);
			var newTranslate = thisOoptions.translate + distance;

			if (newTranslate > thisOoptions.maxTranslate) {
				newTranslate = thisOoptions.maxTranslate;
			} else if (newTranslate < thisOoptions.minTranslate) {
				newTranslate = thisOoptions.minTranslate;
			}
			var tmpTranslate = thisOoptions.translate;
			thisOoptions.translate = newTranslate;

			if (delay == 0) {
				thisOoptions.translate = newTranslate;
				thisOoptions.wrapper.css({
					transform: "translateX(" + thisOoptions.translate + "px)",
				});
			} else {
				if (step === undefined) {
					step = 1;
				}
				thisOoptions.timerMoveDirect = setInterval(function () {
					thisOoptions.wrapper.css({
						transform: "translateX(" + tmpTranslate + "px)",
					});

					if ((distance < 0 && tmpTranslate <= newTranslate) || (distance > 0 && tmpTranslate >= newTranslate)) {
						thisOoptions.initTabs();
						clearInterval(thisOoptions.timerMoveDirect);
					}

					if (tmpTranslate < newTranslate) {
						tmpTranslate += step;
					} else {
						tmpTranslate -= step;
					}
				}, delay);
			}

			thisOoptions.checkArrows(newTranslate);
		};

		thisOoptions.addArrowsEvents = function () {
			thisOoptions.arrows.arrow_right.on("mouseenter", function () {
				thisOoptions.arrows.arrow_left.removeClass("disabled");
				thisOoptions.timerMoveLeft = setInterval(function () {
					if (thisOoptions.translate < thisOoptions.minTranslate) {
						clearInterval(thisOoptions.timerMoveLeft);
						thisOoptions.arrows.arrow_right.addClass("disabled");
					} else {
						thisOoptions.translate -= thisOoptions.translateSpeed;
						thisOoptions.wrapper.css({
							transform: "translateX(" + thisOoptions.translate + "px)",
						});
					}
				}, 10);
			});

			thisOoptions.arrows.arrow_right.on("mouseleave", function () {
				clearInterval(thisOoptions.timerMoveLeft);
			});

			thisOoptions.arrows.arrow_right.on("click", function () {
				thisOoptions.directScroll(-thisOoptions.directTranslate);
				thisOoptions.arrows.arrow_left.removeClass("disabled");
			});

			thisOoptions.arrows.arrow_right.on("touchend", function () {
				setTimeout(function () {
					clearInterval(thisOoptions.timerMoveLeft);
				}, 1);
			});

			thisOoptions.arrows.arrow_left.on("mouseenter", function () {
				thisOoptions.arrows.arrow_right.removeClass("disabled");
				thisOoptions.timerMoveRight = setInterval(function () {
					if (thisOoptions.translate >= thisOoptions.maxTranslate) {
						clearInterval(thisOoptions.timerMoveRight);
						thisOoptions.arrows.arrow_left.addClass("disabled");
					} else {
						thisOoptions.translate += thisOoptions.translateSpeed;
						thisOoptions.wrapper.css({
							transform: "translateX(" + thisOoptions.translate + "px)",
						});
					}
				}, 10);
			});

			thisOoptions.arrows.arrow_left.on("mouseleave", function () {
				clearInterval(thisOoptions.timerMoveRight);
			});

			thisOoptions.arrows.arrow_left.on("click", function () {
				thisOoptions.directScroll(thisOoptions.directTranslate);
				thisOoptions.arrows.arrow_right.removeClass("disabled");
			});

			thisOoptions.arrows.arrow_left.on("touchend", function () {
				setTimeout(function () {
					clearInterval(thisOoptions.timerMoveRight);
				}, 1);
			});
		};

		thisOoptions.addTabsEvents = function () {
			thisOoptions.tabs.on("click", function () {
				var leftScrollBound = thisOoptions.scrollBounds.left;
				var rightScrollBound = thisOoptions.scrollBounds.right;

				var tabBounds = this.getBoundingClientRect();
				var leftTabScrollBound = tabBounds.left - thisOoptions.arrows.arrow_width;
				var rightTabScrollBound = tabBounds.right + thisOoptions.arrows.arrow_width;

				if (leftTabScrollBound < leftScrollBound) {
					thisOoptions.directScroll(leftScrollBound - leftTabScrollBound, 1, 2);
				} else if (rightTabScrollBound > rightScrollBound) {
					thisOoptions.directScroll(rightScrollBound - rightTabScrollBound, 1, 2);
				}

				thisOoptions.activeTab = $(this);

				if (thisOoptions.linked_options !== undefined) {
					var this_index = $(this).index();
					var linked_tab = $(thisOoptions.linked_options.tabs[this_index]);
					var linked_tabs = {
						leftScrollBound: thisOoptions.linked_options.scrollBounds.left,
						rightScrollBound: thisOoptions.linked_options.scrollBounds.right,
						tabBounds: linked_tab[0].getBoundingClientRect(),
					};
					if (linked_tabs.tabBounds.left < linked_tabs.leftScrollBound) {
						thisOoptions.linked_options.directScroll(
							linked_tabs.leftScrollBound -
							linked_tabs.tabBounds.left +
							thisOoptions.linked_options.arrows.arrow_width +
							1,
							0
						);
					} else if (linked_tabs.tabBounds.right > linked_tabs.rightScrollBound) {
						thisOoptions.linked_options.directScroll(
							linked_tabs.rightScrollBound -
							linked_tabs.tabBounds.right -
							thisOoptions.linked_options.arrows.arrow_width -
							1,
							0
						);
					}

					thisOoptions.linked_options.activeTab = linked_tab;
				}
			});
		};

		thisOoptions.addWrapperEvents = function () {
			thisOoptions.wrapper.on("touchstart", function (event) {
				thisOoptions.touch.posPrev = event.originalEvent.changedTouches[0].pageX;
				clearInterval(thisOoptions.timerMoveRight);
				clearInterval(thisOoptions.timerMoveLeft);
				clearInterval(thisOoptions.timerMoveDirect);
			});

			thisOoptions.wrapper.on("touchmove", function (event) {
				thisOoptions.touch.posCurrent = event.originalEvent.changedTouches[0].pageX - thisOoptions.touch.posPrev;
				thisOoptions.directScroll(thisOoptions.touch.posCurrent, 0);
				thisOoptions.touch.posPrev = event.originalEvent.changedTouches[0].pageX;
			});
		};

		thisOoptions.resize = function () {
			if (thisOoptions.onBeforeResize && typeof thisOoptions.onBeforeResize == "function") {
				thisOoptions.onBeforeResize(thisOoptions);
			}

			if (thisOoptions.onResize && typeof thisOoptions.onResize == "function") {
				thisOoptions.onResize(thisOoptions);
			}

			if (thisOoptions.translate < thisOoptions.minTranslate) {
				thisOoptions.directScroll(thisOoptions.minTranslate - thisOoptions.translate);
			} else if (thisOoptions.translate > thisOoptions.maxTranslate) {
				thisOoptions.directScroll(thisOoptions.maxTranslate - thisOoptions.translate);
			}

			if (thisOoptions.activeTab !== undefined && thisOoptions.activeTab.length) {
				var activeTabBounds = thisOoptions.activeTab[0].getBoundingClientRect();
				if (activeTabBounds.left < thisOoptions.scrollBounds.left) {
					thisOoptions.directScroll(thisOoptions.scrollBounds.left - activeTabBounds.left);
				} else if (activeTabBounds.right > thisOoptions.scrollBounds.right) {
					thisOoptions.directScroll(thisOoptions.scrollBounds.right - activeTabBounds.right);
				}
			}

			thisOoptions.initTabs();
			thisOoptions.checkArrows();

			if (thisOoptions.onAfterResize && typeof thisOoptions.onAfterResize == "function") {
				thisOoptions.onAfterResize(thisOoptions);
			}
		};

		_scrollTab.data("scrollTabOptions", thisOoptions);
		_scrollTab.data("scrollTabOptions").addArrowsEvents();
		_scrollTab.data("scrollTabOptions").addTabsEvents();
		_scrollTab.data("scrollTabOptions").addWrapperEvents();
		_scrollTab.addClass("arrow_scroll_init").addClass("swipeignore");
		if (arrow_right !== undefined && arrow_right.length) {
			thisOoptions.arrows.arrow_width = thisOoptions.arrows.arrow_right[0].getBoundingClientRect().width;
		}
		_scrollTab.data("scrollTabOptions").resize();
		delete thisOoptions;
	}

	var options = $.extend(
		{
			translate: 1,
			translateSpeed: 2,
			directTranslate: 150,
			maxTranslate: 0,
			touch: {},
			arrows_css: false,
			tabs_wrapper: ".nav-tabs",
			tab_item: "> li",
			onResize: false,
			outer_wrapper: "",
			width_grow: 9,
			offset: 0,
		},
		options
	);

	var el = $(this);

	if (el.hasClass("arrow_scroll_init")) return false;

	el.each(function (i, scrollTab) {
		_scrollTab(scrollTab, options);
	});
};