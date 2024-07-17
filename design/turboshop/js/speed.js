var funcDefined = function (func) {
	try {
		if (typeof func == 'function')
			return true;
		else
			return typeof window[func] === "function";
	}
	catch (e) {
		return false;
	}
}

var readyDOM = function (callback) {
	if (document.readyState !== "loading") callback();
	else document.addEventListener("DOMContentLoaded", callback);
}

CheckTopMenuPadding = function () {
	if ($('.logo_and_menu-row .right-icons .wrap_icon').length && $('.logo_and_menu-row .menu-row').length && !$('.subbottom.menu-row').length) {
		var menuPosition = $('.menu-row .menu-only').position().left,
			leftPadding = 0,
			rightPadding = 0;
		$('.logo_and_menu-row .menu-row>div').each(function (indx) {
			if (!$(this).hasClass('menu-only')) {
				var elementPosition = $(this).position().left,
					elementWidth = $(this).outerWidth() + 1;

				if (elementPosition > menuPosition) {
					rightPadding += elementWidth;
				} else {
					leftPadding += elementWidth;
				}
			}
		}).promise().done(function () {
			$('.logo_and_menu-row .menu-only').css({ 'padding-left': leftPadding, 'padding-right': rightPadding });
		});
	}
}

CheckTopMenuOncePadding = function () {
	if ($('.menu-row.sliced .right-icons .wrap_icon').length) {
		var menuPosition = $('.menu-row .menu-only').position().left,
			leftPadding = 0,
			rightPadding = 0;
		$('.menu-row.sliced .maxwidth-theme>div>div>div').each(function (indx) {
			if (!$(this).hasClass('menu-only')) {
				var elementPosition = $(this).position().left,
					elementWidth = $(this).outerWidth() + 1;

				if (elementPosition > menuPosition) {
					rightPadding += elementWidth;
				} else {
					leftPadding += elementWidth;
				}
			}
		}).promise().done(function () {
			$('.menu-row.sliced .menu-only').css({ 'padding-left': leftPadding, 'padding-right': rightPadding });
		});
	}
	else if ($('.logo_and_menu-row .mega-menu.sliced').length && !$('.subbottom.menu-row').length) {
		var leftPadding = 0;
		$('.logo_and_menu-row .maxwidth-theme>div>div>div').each(function (indx) {
			if (!$(this).hasClass('menu-row')) {
				var elementPosition = $(this).position().left,
					elementWidth = $(this).outerWidth() + 1;
				if (!$(this).is(':visible') || $(this).hasClass('pull-right') || !$(this).height())
					elementWidth = 0;
				leftPadding += elementWidth;
			}
		}).promise().done(function () {
			$('.logo_and_menu-row .logo-row .menu-row').css({ 'padding-left': leftPadding });
		});
	}
}

CheckTopMenuDotted = function () {
	var menu = $("nav.mega-menu.sliced");
	if (window.matchMedia("(max-width:991px)").matches) return;

	if (menu.length) {
		menu.each(function () {
			var menuMoreItem = $(this).find(".header-menu__item--more-items");
			if ($(this).parents(".collapse").css("display") == "none") {
				return false;
			}

			var headerFixedBlock = $(this).parents("#headerfixed");
			if (headerFixedBlock.length && !headerFixedBlock.hasClass("fixed")) {
				return false;
			}

			var block = $(this).closest(".header-menu, .check-menu-dotted");
			var useFlex1 = block.hasClass('dotted-flex-1');
			if (useFlex1) {
				block.addClass('flex-1');
			}
			var block_w = block[0].getBoundingClientRect().width;
			var items = $(this).find(".header-menu__wrapper > .header-menu__item");
			var menu_w = 0;
			items.each(function (i, el) {
				//var _el = $(el);
				menu_w += el.getBoundingClientRect().width;
			});

			var afterHide = false;
			var newItemsArr = [];
			menuItemNewSave = "";

			while (menu_w > block_w) {
				menuItemOldSave = $(this)
					.find(".header-menu__wrapper > .header-menu__item")
					.not(".header-menu__item--more-items")
					.last();

				if (menuItemOldSave.length) {
					var classes = menuItemOldSave.attr("class");
					var newMenuItem = $("<li />").addClass(classes + ' header-menu__item--in-dotted').attr("data-hidewidth", menu_w).html(menuItemOldSave.html());
					newItemsArr.push(newMenuItem);

					menuItemOldSave.remove();

					menuMoreItem.css({
						display: "flex",
						opacity: 1,
					});

					menu_w = 0;
					items.each(function (i, el) {
						//var _el = $(el);
						menu_w += el.getBoundingClientRect().width;
					});
					block_w = block[0].getBoundingClientRect().width;
					afterHide = true;
				} else {
					break;
				}
			}

			newItemsArr = newItemsArr.reverse();
			menuMoreItem.find("> .header-menu__dropdown-menu > ul").prepend(newItemsArr);

			if (!afterHide) {
				var moreItemsArr = [];
				do {
					menuItemOldSave = menuMoreItem.find("> .header-menu__dropdown-menu > ul > li").first();
					if (!menuItemOldSave.length) {
						menuMoreItem.hide();
						break;
					} else {
						var hideWidth = menuItemOldSave.attr("data-hidewidth");
						if (hideWidth > block_w) {
							break;
						} else {
							menuItemOldSave.removeClass("header-menu__item--in-dotted");
							menuItemOldSave.find('.aim-init').removeClass('aim-init');
							var classes = menuItemOldSave.attr("class");
							var moreMenuItem = $("<div />").addClass(classes).html(menuItemOldSave.html());

							menuItemOldSave.remove();
							$(moreMenuItem).insertBefore(menuMoreItem);
							if (!menuItemOldSave.length) {
								menuMoreItem.hide();
								break;
							}
						}
					}

					menu_w = 0;
					items.each(function (i, el) {
						//var _el = $(el);
						menu_w += el.getBoundingClientRect().width;
					});
				} while (menu_w <= block_w);
			}

			if (menuMoreItem.is(":visible")) {
				block.addClass("menu-dots-visible");
			} else {
				block.removeClass("menu-dots-visible");
			}

			menu.closest(".header-menu").addClass("dotted-complete");
			var wrapper = $(this).closest(".hide-dotted");
			if (wrapper.length) {
				wrapper.addClass("dotted-complete");
			}
			if (useFlex1) {
				block.removeClass("flex-1");
				block.addClass("no-shrinked");
			}
		});
	}
	return false;
};

if (!funcDefined("InitTopestMenuGummi")) {
	InitTopestMenuGummi = function () {
		if (!window.isOnceInited) {
			function _init() {
				var arItems = $menuTopest.find('>li:not(.more)');
				var cntItems = arItems.length;
				if (cntItems) {
					var itemsWidth = 0;
					for (var i = 0; i < cntItems; ++i) {
						var item = arItems.eq(i);
						var itemWidth = item.actual('outerWidth', { includeMargin: true });
						arItemsHideWidth[i] = (itemsWidth += itemWidth) + (i !== (cntItems - 1) ? moreWidth : 0);
					}
				}
			}

			function _gummi() {
				var rowWidth = $menuTopest.actual('innerWidth');
				var arItems = $menuTopest.find('>li:not(.more),li.more>.dropdown>li');
				var cntItems = arItems.length;
				if (cntItems) {
					var bMore = false;
					for (var i = cntItems - 1; i >= 0; --i) {
						var item = arItems.eq(i);
						var bInMore = item.parents('.more').length > 0;
						if (!bInMore) {
							if (arItemsHideWidth[i] > rowWidth) {
								if (!bMore) {
									bMore = true;
									more.removeClass('hidden');
								}
								var clone = item.clone();
								clone.find('>a').addClass('dark_font');
								clone.prependTo(moreDropdown);
								item.addClass('hidden cloned');
								rowWidth = $menuTopest.actual('innerWidth');
							}
						}
					}
					for (var i = 0; i < cntItems; ++i) {
						var item = arItems.eq(i);
						var bInMore = item.parents('.more').length > 0;
						if (bInMore) {
							if (arItemsHideWidth[i] <= rowWidth) {
								if (i === (cntItems - 1)) {
									bMore = false;
									more.addClass('hidden');
								}
								var clone = item.clone();
								clone.find('>a').removeClass('dark_font');
								clone.insertBefore(more);
								item.addClass('cloned');
							}
						}
					}
					$menuTopest.find('li.cloned').remove();
				}
			}

			var $menuTopest = $('.menu.topest');
			if ($menuTopest.length) {
				try {
					var more = $menuTopest.find('>.more');
					var moreDropdown = more.find('>.dropdown');
					var moreWidth = more.actual('outerWidth', { includeMargin: true });
					var arItemsHideWidth = [];

					ignoreResize.push(true);
					_init();
					_gummi();

					ignoreResize.pop();

					Turbo.addCustomEvent('onWindowResize', function (eventdata) {
						try {
							ignoreResize.push(true);
							_gummi();
							$menuTopest.addClass('initied');
							$menuTopest.parent().addClass('initied');
						}
						catch (e) { }
						finally {
							ignoreResize.pop();
						}
					});
				} catch (e) { }
			}
		}
	}
}

if (!funcDefined("InitTopMenuGummi")) {
	InitTopMenuGummi = function () {
		function _init() {
			var arItems = $topMenu.closest('.wrap_menu').find('.inc_menu .menu_top_block >li:not(.more)');
			var cntItems = arItems.length;
			if (cntItems) {
				var itemsWidth = 0;
				for (var i = 0; i < cntItems; ++i) {
					var item = arItems.eq(i);
					var itemWidth = item.actual('outerWidth');
					arItemsHideWidth[i] = (itemsWidth += itemWidth) + (i !== (cntItems - 1) ? moreWidth : 0);
				}
			}

		}

		function _gummi() {
			var rowWidth = $wrapMenu.actual('innerWidth') - $wrapMenuLeft.actual('innerWidth');
			var arItems = $topMenu.find('>li:not(.more):not(.catalog),li.more>.dropdown>li');
			var cntItems = arItems.length;

			if (cntItems) {
				var bMore = false;
				for (var i = cntItems - 1; i >= 0; --i) {
					var item = arItems.eq(i);
					var bInMore = item.parents('.more').length > 0;
					if (!bInMore) {
						if (arItemsHideWidth[i] > rowWidth) {
							if (!bMore) {
								bMore = true;
								more.removeClass('hidden');
							}
							var clone = item.clone();
							clone.find('>.dropdown').removeAttr('style').removeClass('toleft');
							clone.find('>a').addClass('dark_font').removeAttr('style');
							clone.prependTo(moreDropdown);
							item.addClass('cloned');
						}
					}
				}
				for (var i = 0; i < cntItems; ++i) {
					var item = arItems.eq(i);
					var bInMore = item.parents('.more').length > 0;
					if (bInMore) {
						if (arItemsHideWidth[i] <= rowWidth) {
							if (i === (cntItems - 1)) {
								bMore = false;
								more.addClass('hidden');
							}
							var clone = item.clone();
							clone.find('>a').removeClass('dark_font');
							clone.insertBefore(more);
							item.addClass('cloned');
						}
					}
				}
				$topMenu.find('li.cloned').remove();

				var cntItemsVisible = $topMenu.find('>li:not(.more):not(.catalog)').length;
				var o = rowWidth - arItemsHideWidth[cntItemsVisible - 1];
				var itemsPaddingAdd = Math.floor(o / (cntItemsVisible + (more.hasClass('hidden') ? 0 : 1)));
				var itemsPadding_new = itemsPadding_min + itemsPaddingAdd;
				var itemsPadding_new_l = Math.floor(itemsPadding_new / 2);
				var itemsPadding_new_r = itemsPadding_new - itemsPadding_new_l;

				$topMenu.find('>li:not(.catalog):visible>a').each(function () {
					$(this).css({ 'padding-left': itemsPadding_new_l + 'px' });
					$(this).css({ 'padding-right': itemsPadding_new_r + 'px' });
				});

				var lastItemPadding_new = itemsPadding_new + o - (cntItemsVisible + (more.is(':visible') ? 1 : 0)) * itemsPaddingAdd;
				var lastItemPadding_new_l = Math.floor(lastItemPadding_new / 2);
				var lastItemPadding_new_r = lastItemPadding_new - lastItemPadding_new_l;
				$topMenu.find('>li:visible').last().find('>a').css({ 'padding-left': lastItemPadding_new_l + 'px' });
				$topMenu.find('>li:visible').last().find('>a').css({ 'padding-right': lastItemPadding_new_r + 'px' });
			}
			// CheckTopMenuFullCatalogSubmenu();
		}

		var $topMenu = $('.menu_top_block');
		if ($menuTopest.length) {
			var $wrapMenu = $topMenu.parents('.wrap_menu');
			var $wrapMenuLeft = $wrapMenu.find('.catalog_menu_ext');
			var more = $topMenu.find('>.more');
			var moreWidth = more.actual('outerWidth', { includeMargin: true });
			more.addClass('hidden');
			var arItemsHideWidth = [];
			var moreDropdown = more.find('>.dropdown');
			var itemsPadding = parseInt(more.find('>a').css('padding-left')) * 2;
			var itemsPadding_min = itemsPadding;


			setTimeout(function () {
				ignoreResize.push(true);
				_init();
				_gummi();
				ignoreResize.pop();
			}, 5000);

			Turbo.addCustomEvent('onWindowResize', function (eventdata) {
				try {
					ignoreResize.push(true);
					_gummi();
				}
				catch (e) { }
				finally {
					ignoreResize.pop();
				}
			});

			/*Turbo.addCustomEvent('onTopPanelFixUnfix', function(eventdata) {
				ignoreResize.push(true);
				_gummi();
				ignoreResize.pop();
			});*/
		}
	}
}