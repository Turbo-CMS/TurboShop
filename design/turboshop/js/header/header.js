$(document).ready(function () {
	$(document).on("click", ".header-menu__wide-submenu-item-inner .toggle_block", function (e) {
		e.preventDefault();

		var _this = $(this),
			menu = _this.closest(".header-menu__wide-submenu-item-inner").find("> .submenu-wrapper");

		if (!_this.hasClass("clicked")) {
			_this.addClass("clicked");

			menu.slideToggle(150, function () {
				_this.removeClass("clicked");
			});

			_this.closest(".header-menu__wide-submenu-item-inner").toggleClass("opened");
		}
	});

	$(document).on("click", ".header-menu__wide-submenu-item--more_items", function (e) {
		e.stopImmediatePropagation();

		var _this = $(this);
		var bOpened = _this.hasClass("opened");
		var childSpan = _this.find("span");
		var childSvg = childSpan.find(".svg");
		var parent = _this.closest(".header-menu__wide-submenu");
		var collapsed = parent.find(".collapsed");
		var useDelimetr = parent.hasClass("header-menu__wide-submenu--delimiter");
		var lastSeparator = parent.find(".last-visible");

		if (collapsed.length) {
			if (useDelimetr) {
				collapsed.fadeToggle(200);
				if (lastSeparator.length) lastSeparator.fadeToggle(200);
			} else {
				collapsed.slideToggle(200);
			}

			if (bOpened) {
				childSpan.text(Turbo.message("SHOW") + ' ').append(childSvg);
			} else {
				childSpan.text(Turbo.message("HIDE") + ' ').append(childSvg);
			}
			_this.toggleClass("opened");
		}
	});

	$(document).on("click", '.header-menu__link--only-catalog', function (e) {
		e.preventDefault();
		let catalogButton = $(this);
		let curSvg = catalogButton.find('use').attr('xlink:href');
		if (catalogButton.hasClass("opened")) {
			catalogButton.removeClass('opened');
			catalogButton.find('use').attr('xlink:href', curSvg.replace('#close', '#burger'));
		} else {
			catalogButton.addClass('opened');
			catalogButton.find('use').attr('xlink:href', curSvg.replace('#burger', '#close'));
			onlyCatalogMenuOpen(catalogButton);
		}
	});

	$(document).on("click", 'body', function (e) {
		let catalogButton = $('.header-menu__link--only-catalog.opened');

		if (catalogButton.length && !$(e.target).closest('.header-menu__wrapper').length) {
			onlyCatalogMenuClose();
		}
	});

	onlyCatalogMenuClose = function () {
		let catalogButton = $('.header-menu__link--only-catalog.opened');

		if (catalogButton.length) {
			let curSvg = catalogButton.find('use').attr('xlink:href');
			catalogButton.removeClass('opened');
			catalogButton.find('use').attr('xlink:href', curSvg.replace('#close', '#burger'));
		}
	}

	onlyCatalogMenuOpen = function (catalogButton) {
		var menuNLO = catalogButton.siblings("[data-nlo]");

		if (menuNLO.length) {
			if (!menuNLO.hasClass("nlo-loadings")) {
				menuNLO.addClass("nlo-loadings");
				var menuCatalog = $(".header-menu__link--only-catalog ~ .header-menu__dropdown-menu");
				if (menuCatalog.length) {
					menuNLO.replaceWith(menuCatalog.clone());
					catalogButton.parent().find('.aim-init').removeClass('aim-init');
					if (funcDefined("InitMenuNavigationAim")) {
						InitMenuNavigationAim();
					}
				} else {
					var buttonTitle = catalogButton.find(".header-menu__title");
					buttonTitle.addClass("loadings");
					$.ajax({
						data: { nlo: menuNLO.attr("data-nlo") },
						error: function () {
							menuNLO.removeClass("nlo-loadings");
						},
						complete: function (jqXHR, textStatus) {
							if (textStatus === "success" || jqXHR.status == 404) {
								var ob = Turbo.processHTML($.trim(jqXHR.responseText));
								Turbo.ajax.processScripts(ob.SCRIPT);
								menuNLO.replaceWith(ob.HTML);
								if (funcDefined("InitMenuNavigationAim")) {
									InitMenuNavigationAim();
								}
							}
							buttonTitle.removeClass("loadings");
						},
					});
				}
			}
		}
	};

	Turbo.addCustomEvent("onAjaxChangeWidgetValue", function (eventdata) {
		if (eventdata && eventdata["NAME"] === "PAGE_WIDTH") {
			if (funcDefined("CheckTopMenuDotted")) {
				CheckTopMenuDotted();
			}
		}
	});

});
