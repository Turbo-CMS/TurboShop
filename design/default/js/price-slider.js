$(function () {

	// Catalog page - Price Range
	//----------------------------------------//
	var f_minPrice = parseInt($('#f_minPrice').val()),
		f_maxPrice = parseInt($('#f_maxPrice').val()),
		f_currentMinPrice = parseInt($('#f_currentMinPrice').val()),
		f_currentMaxPrice = parseInt($('#f_currentMaxPrice').val()),
		f_priceStep = parseInt($('#f_priceStep').val()),
		f_postfix = $('#f_postfix').val();

	$("#price-slider").ionRangeSlider({
		type: "double",
		postfix: f_postfix,
		decorate_both: false,
		force_edges: true,
		hide_min_max: true,
		grid: true,
		grid_num: 2,
		min: f_minPrice,
		max: f_maxPrice,
		from: f_currentMinPrice,
		to: f_currentMaxPrice,
		step: f_priceStep,
		onChange: function (data) {
			$("#min_price").val(data.from);
			$("#max_price").val(data.to);
		},
		onFinish: function (data) {
			$('.smartfilter.fast_filter').submit();
		},
	});
});