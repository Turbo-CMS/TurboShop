$(document).ready(function () {
	$(document).on('click', '.bottom-menu .items > .item-link.items-child', function (event) {
		if (window.matchMedia("(max-width:767px)").matches) {
			var _this = $(this);
			var target = event.target;

			if (!target.getAttribute('href')) {
				_this.next('.wrap_menu_compact_mobile').slideToggle();
				_this.toggleClass("opened");
			}
		}
	});
});
