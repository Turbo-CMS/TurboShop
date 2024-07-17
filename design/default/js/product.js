(function ($) {
	"use strict";

	/*
	// Fast Order
	*/

	$(function () {
		$('.fast-order-send-button').click(function () {
			$("#fast-order-product-name").html($(this).data('name'));

			var variant;
			var form_obj = $(this).closest("form.variants");
			if (form_obj.find('input[name=variant]:checked').length > 0)
				variant = form_obj.find('input[name=variant]:checked').val();
			if (form_obj.find('select[name=variant]').length > 0)
				variant = form_obj.find('select').val();

			$("#fast-order-product-id").val(variant);

		});
	});

	/*
	// Carousel
	*/

	$(function () {
		$('[id^=carousel-selector-]').click(function () {
			var id_selector = $(this).attr("id");
			var id = id_selector.substr(id_selector.length - 1);
			id = parseInt(id);
			$('[id^=carousel-selector-]').removeClass('selected');
			$(this).addClass('selected');
		});
	});

})(jQuery);		