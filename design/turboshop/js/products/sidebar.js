/*side head block*/
$(document).on("click", ".slide-block .slide-block__head", function (e) {
	var _this = $(this),
		menu = _this.siblings(".slide-block__body"),
		bVisibleMeu = menu.is(":visible");

	if (!_this.hasClass("clicked") && menu.length && !_this.hasClass("ignore") && !$(e.target).attr("href")) {
		var type = _this.data("id");
		_this.addClass("clicked");

		if (_this.hasClass("opened")) {
			_this.removeClass("opened");
		} else {
			_this.addClass("opened");
		}

		if (bVisibleMeu) {
			$.cookie(type + "_CLOSED", "Y", {
				path: "/",
			});
			menu.slideUp();
		} else {
			$.removeCookie(type + "_CLOSED", {
				path: "/",
			});
			menu.slideDown();
		}

		_this.toggleClass("closed");
		_this.removeClass("clicked");
	}
});
$(document).on("click", ".side-menu .toggle_block", function (e) {
	var _this = $(this),
		menu = _this.closest(".child").find("> .submenu-wrapper"),
		bVisibleMeu = menu.is(":visible");

	if (!_this.hasClass("clicked")) {
		_this.addClass("clicked");
		menu.slideToggle(150, function () {
			_this.removeClass("clicked");
		});
		_this.toggleClass("closed");
	}

	_this.closest(".child").toggleClass("opened");
});
/**/
