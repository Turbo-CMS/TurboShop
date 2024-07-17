$(document).ready(function () {
	// dropdown-select
	$(document).on("click", ".dropdown-select--with-dropdown .dropdown-select__title", function () {
		var _this = $(this),
			menu = _this.parent().find("> .dropdown-select__list");
		if (!_this.hasClass("clicked") && menu.length) {
			_this.addClass("clicked");

			_this.toggleClass("opened");
			menu.stop().slideToggle(100, function () {
				_this.removeClass("clicked");
			});
		}
	});

	// dropdown-select change item
	$(document).on("click", ".dropdown-select__list .mixitup-item", function () {
		var $select = $(this).closest('.dropdown-select');
		$select.find('.dropdown-select__title span').text($(this).text());
		$select.find('.dropdown-select__title.opened').click();
	});

	// close select
	$("html, body").on("mousedown", function (e) {
		if (typeof e.target.className == "string" && e.target.className.indexOf("adm") < 0) {
			e.stopPropagation();
			$(".dropdown-select .dropdown-select__title.opened").each(function () {
				if ($(this).closest('#mobilefilter').length) return
				var $select = $(this).closest('.dropdown-select');
				if ($select.data('visible_by_class') && $($select.data('visible_by_class')).is(':visible')) return;
				if (!$(e.target).closest($select).length) {
					$(this).click();
				}
			});
		}
	});

	// hint
	$(document).on("click", ".hint__icon", function (e) {
		e.stopImmediatePropagation();
		var tooltipWrapp = $(this).closest(".hint");
		if (tooltipWrapp.hasClass("active")) {
			tooltipWrapp.removeClass("active").find(".tooltip").slideUp(200);
		} else {
			tooltipWrapp.addClass("active");
			tooltipWrapp.find(".tooltip").slideDown(200);
			tooltipWrapp.find(".tooltip_close").click(function (e) {
				e.stopPropagation();
				e.stopImmediatePropagation();
				tooltipWrapp.removeClass("active").find(".tooltip").slideUp(100);
			});
		}
		e.stopPropagation();
	});

	/*show password*/
	$(".form-group:not(.eye-password-ignore) [type=password]").each(function (item) {
		let inputBlock = $(this).closest(".input");
		if (inputBlock.length) {
			inputBlock.addClass("eye-password");
		} else {
			let passBlock = $(this).closest(".form-group");
			let labelBlock = passBlock.find(".label_block");
			if (labelBlock.length) {
				labelBlock.addClass("eye-password");
			} else {
				passBlock.addClass("eye-password");
			}
		}
	});

	$(document).on("click", ".eye-password:not(.eye-password-ignore)", function (event) {
		let input = this.querySelector("input");
		let eyeWidth = 56;
		if (this.clientWidth - eyeWidth < event.offsetX) {
			if (input.type == "password") {
				input.type = "text";
				this.classList.add("password-show");
			} else if (input.type == "text") {
				input.type = "password";
				this.classList.remove("password-show");
			}
			event.stopPropagation();
		}
	});
	/**/
});

// gallery switch
$(document).on("click", ".gallery-view_switch__icons:not(.active)", function () {
	var $this = $(this);
	var animationTime = 200;
	var bSmall = $this.hasClass("gallery-view_switch__icons--small");
	var $switchGallery = $this.closest(".gallery-view_switch");
	var $bigGallery = ($this.closest(".big_gallery").length
		? $this.closest(".big_gallery")
		: $this.closest(".gallery")
	).find(".gallery-big");
	var $bigGalleryCounter = $switchGallery.find(".gallery-view_switch__count-wrapper--big");
	var $smallGallery = ($this.closest(".big_gallery").length
		? $this.closest(".big_gallery")
		: $this.closest(".gallery")
	).find(".gallery-small");
	var $smallGalleryCounter = $switchGallery.find(".gallery-view_switch__count-wrapper--small");
	var $toHideGallery = bSmall ? $bigGallery : $smallGallery;
	var $toHideGalleryCounter = bSmall ? $bigGalleryCounter : $smallGalleryCounter;
	var $toShowGallery = bSmall ? $smallGallery : $bigGallery;
	var $toShowGalleryCounter = bSmall ? $smallGalleryCounter : $bigGalleryCounter;

	$this.addClass("active");
	$this.siblings(".active").removeClass("active");

	$toHideGalleryCounter.fadeOut(animationTime, function () {
		$toShowGalleryCounter.fadeIn(animationTime);
	});

	$toHideGallery.fadeOut(animationTime, function () {
		$toShowGallery.fadeIn(animationTime);
	});
});
