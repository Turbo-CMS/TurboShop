/* Delivery & Payment */
function change_payment_method($id) {
	$(".delivery-payment").css("display", "none");
	$("#delivery-payment-" + $id).css("display", "block");

	var firstPaymentOption = $("#accordionPayment .panel:visible").first();

	if (firstPaymentOption.length > 0) {
		firstPaymentOption.find("input[type='radio']").prop("checked", true);
	}

	var del_cost;
	var del_sep;
	var currency;
	if ($('.form-radiobox__label input[type="radio"]:checked').length > 0) {
		del_cost = parseFloat($('.form-radiobox__label input[type="radio"]:checked').closest('.form-radiobox__label').find('.payment-price').attr('data-cost').replace(/\s/g, ''));
		del_sep = $('.form-radiobox__label input[type="radio"]:checked').closest('.form-radiobox__label').find('.payment-price').attr('data-separate');
		currency = $('.form-radiobox__label input[type="radio"]:checked').closest('.form-radiobox__label').find('.payment-price').attr('data-currency');
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
	var delivery_num = $('#accordionDelivery .panel:visible:first input[name="delivery_id"]').val();
	change_payment_method(delivery_num);
});

$(document).ready(function () {
	$('form[name="cart"]').validate();
});

$(document).ready(function () {
	if (turboOptions["THEME"]["PHONE_MASK"].length) {
		var base_mask = turboOptions["THEME"]["PHONE_MASK"].replace(/(\d)/g, "_");
		$('form[name="cart"] input.phone').inputmask("mask", { mask: turboOptions["THEME"]["PHONE_MASK"], showMaskOnHover: false });
		$('form[name="cart"] input.phone').blur(function () {
			if ($(this).val() == base_mask || $(this).val() == "") {
				if ($(this).hasClass("required")) {
					$(this).parent().find("div.error").html(Turbo.message("JS_REQUIRED"));
				}
			}
		});
	}
});


