InitMenuNavigationAim = function (wrapMenu) {
    var $block;
    if (wrapMenu !== undefined && wrapMenu.length) {
        $block = wrapMenu.find('.menu-navigation__sections-wrapper .menu-navigation__sections:not(.aim-init)');
    } else {
        $block = $('.menu-navigation__sections-wrapper .menu-navigation__sections:not(.aim-init)');
    }
	
	if($block.length){
		$block.addClass('aim-init');
		$block.menuAim({
	        firstActiveRow: true,
	        rowSelector: "> .menu-navigation__sections-item",
	        activate: function activate(a) {
	            var _this = $(a),
	                index = _this.index(),
	                items = _this.closest('.menu-navigation__sections-wrapper').next(),
	                link = _this.find('> a');

                _this.siblings().find('> a').removeClass('menu-navigation__sections-item-link--active');
	            link.addClass('menu-navigation__sections-item-link--active');
                items.find('.parent-items').siblings().removeClass('parent-items--active');
                items.find('.parent-items').eq(index).addClass('parent-items--active');
	        },
	        deactivate: function deactivate(a) {
	            var _this = $(a),
	                index = _this.index(),
	                items = _this.closest('.menu-navigation__sections-wrapper').next(),
	                link = _this.find('> a');

	            link.removeClass('menu-navigation__sections-item-link--active');
                items.find('.parent-items').siblings().removeClass('parent-items--active');
	        }
	    });
	}
}

$(document).on("mouseenter", ".header-menu__item--wide", function () {
    InitMenuNavigationAim($(this));
 });