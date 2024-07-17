$(document).ready(function () {
	$(".map-columns__dropdown-right-arrow").on("click", function () {
		var _this = $(this);
		var bOpen = !_this.hasClass("opened");
		var parent = _this.closest("li.item");
		if (parent.length) {
			var dropdown = parent.find(">.map-columns__dropdown");
			if (dropdown.length) {
				dropdown.slideToggle();
				dropdown.toggleClass("opened");
				_this.toggleClass("opened");
			}
		}
	});
});