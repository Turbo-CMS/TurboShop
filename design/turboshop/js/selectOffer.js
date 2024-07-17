/*sku change props*/
if (!("SelectOfferProp" in window) || typeof window.SelectOfferProp != "function") {
	SelectOfferProp = function () {
		// return false;
		var _this = $(this),
			container = _this.closest(".sku-props"),
			item = _this.closest(".js-popup-block");

		// set active
		$(".sku-props").removeClass("js-selected");
		container.addClass("js-selected");
		_this.closest(".sku-props__values").find(".sku-props__value").removeClass("sku-props__value--active");
		_this.addClass("sku-props__value--active");
		_this.closest(".sku-props__item").find(".sku-props__js-size").text(_this.data("title"));
	};

	$(document).on("click", ".sku-props__item .sku-props__value:not(.sku-props__value--active)", SelectOfferProp);
}
