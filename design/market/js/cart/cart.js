/* Delivery & Payment */
function change_payment_method($id) {
	$(".delivery-payment").css("display", "none");
	$("#delivery-payment-" + $id).css("display", "block");

	var firstPaymentOption = $("#accordionPayment .card:visible").first();

	if (firstPaymentOption.length > 0) {
		firstPaymentOption.find("input[type='radio']").prop("checked", true);
	}

	var del_cost;
	var del_sep;
	var currency;
	if ($('.form-check-label input[type="radio"]:checked').length > 0) {
		del_cost = parseFloat($('.form-check-label input[type="radio"]:checked').closest('.form-check-label').find('.payment-price').attr('data-cost').replace(/\s/g, ''));
		del_sep = $('.form-check-label input[type="radio"]:checked').closest('.form-check-label').find('.payment-price').attr('data-separate');
		currency = $('.form-check-label input[type="radio"]:checked').closest('.form-check-label').find('.payment-price').attr('data-currency');
	}

	if (del_cost > 0) {
		var costFormatted = del_cost.toLocaleString('ua-UA', { minimumFractionDigits: 2, useGrouping: true });

		costFormatted = costFormatted.replace(',', '.');

		$('#cart-delivery-cost').html(costFormatted + ' ' + currency);
	} else {
		if (del_sep == 1) {
			var text = $('#cart-delivery-cost').data('delivery-separate');
			$('#cart-delivery-cost').html(text);
		} else {
			var text = $('#cart-delivery-cost').data('delivery-cost');
			$('#cart-delivery-cost').html(text);
		}
	}

	var products_cost = parseFloat($('#cart-produts-cost').attr('data-cost').replace(/\s/g, ''));
	var total = del_cost + products_cost;
	var totalFormatted = total.toLocaleString('ua-UA', { minimumFractionDigits: 2, useGrouping: true });

	totalFormatted = totalFormatted.replace(',', '.');

	$('#cart-total-cost').html(totalFormatted + ' ' + currency);
}

$(window).on('load', function () {
	var delivery_num = $('#accordionDelivery .card:visible:first input[name="delivery_id"]').val();
	change_payment_method(delivery_num);
});

$(document).ready(function () {
	$(".card").on("hide.bs.collapse", function () {
		const $cardHeader = $(this).find(".card-header");
		$cardHeader.addClass("accordion-bottom");
	});

	$(".card").on("show.bs.collapse", function () {
		const $cardHeader = $(this).find(".card-header");
		$cardHeader.removeClass("accordion-bottom");
	});

	$(".card").each(function () {
		const $cardHeader = $(this).find(".card-header");

		if ($(this).find(".collapse.show").length > 0) {
			$cardHeader.removeClass("accordion-bottom");
		} else {
			$cardHeader.addClass("accordion-bottom");
		}
	});
});

/*
// Validation
*/

var formValidation = function () {
	var selector = 'needs-validation';
	window.addEventListener('load', function () {
		var forms = document.getElementsByClassName(selector);
		var validation = Array.prototype.filter.call(forms, function (form) {
			form.addEventListener('submit', function (e) {
				if (form.checkValidity() === false) {
					e.preventDefault();
					e.stopPropagation();
				}
				form.classList.add('was-validated');
			}, false);
		});
	}, false);
}();
