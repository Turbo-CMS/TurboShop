(function ($) {
	// Ajax cart
$(document).ready(function () {
	$('form.variants').submit(function (e) {
		e.preventDefault();
		button = $(this).find('input[type="submit"]');
		if ($(this).find('select[name=variant]').length > 0)
			variant = $(this).find('select').val();
		if ($(this).find('input[name=variant]:checked').length > 0)
			variant = $(this).find('input[name=variant]:checked').val();

		$.ajax({
			url: "ajax/cart.php",
			data: { variant: variant },
			dataType: 'json',
			success: function (data) {
				$('#cart_informer').html(data);
				if (button.attr('data-result-text')) button.val(button.attr('data-result-text'));
			}
		});
		var o1 = $(this).offset();
		var o2 = $('#cart_informer').offset();
		var dx = o1.left - o2.left;
		var dy = o1.top - o2.top;
		var distance = Math.sqrt(dx * dx + dy * dy);
		$(this).closest('.product').find('.image img').effect("transfer", { to: $("#cart_informer"), className: "transfer_class" }, distance);
		$('.transfer_class').html($(this).closest('.product').find('.image').html());
		$('.transfer_class').find('img').css('height', '100%');
		return false;
	});
});

// Product price replacement select
$('select[name=variant]').on('change', function () {
	var price = $(this).find('option:selected').data('price'),
		sku = $(this).find('option:selected').data('sku'),
		compare = $(this).find('option:selected').data('compare'),
		stock = $(this).find('option:selected').data('stock')
	var $availability = $('.availability');
	var $addToCart = $('#add-to-cart');
	var $fastOrder = $('#fast-order');	
	$('.offers_price .price_value').html(price)
	$('.offers_price_old .price_value').html(compare)
	$('.article .value').html(sku)
	if (stock < 1) {
        $availability.text($availability.data('stock')).removeClass('text-success').addClass('text-danger');
        $addToCart.attr('disabled', true);
        $fastOrder.addClass('disabled');
    } else {
        $availability.text($availability.data('default')).removeClass('text-danger').addClass('text-success');
        $addToCart.attr('disabled', false);
        $fastOrder.removeClass('disabled');
    }
});

// Product price replacement radio
$('input[name=variant]').on('change', function() {
	var price = $('input[name=variant]:checked').data('price'),
    sku = $('input[name=variant]:checked').data('sku'),
    compare = $('input[name=variant]:checked').data('compare'),
    stock = $('input[name=variant]:checked').data('stock');
	var $availability = $('.availability');
	var $addToCart = $('#add-to-cart');
	var $fastOrder = $('#fast-order');

	$('.offers_price .price_value').html(price);
	$('.offers_price_old .price_value').html(compare);
	$('.article .value').html(sku);

	if (stock < 1) {
		$availability.text($availability.data('stock')).removeClass('text-success').addClass('text-danger');
		$addToCart.attr('disabled', true);
		$fastOrder.addClass('disabled');
	} else {
		$availability.text($availability.data('default')).removeClass('text-danger').addClass('text-success');
		$addToCart.attr('disabled', false);
		$fastOrder.removeClass('disabled');
	}
});

// Wishlist
$('a.wishlist').on('click', function (e) {
	href = $(this).attr('href');
	$('#wishlist_informer').load(href + ' #wishlist_informer');
	$(this).removeClass('wishlist');
	$(this).attr('href', 'wishlist');
	$(this).html("<i class='fal fa-heart text-danger'></i>");
	$(this).attr('data-bs-title', $(this).data('result-text')).tooltip('dispose').tooltip('show');
	var o1 = $(this).offset();
	var o2 = $('#wishlist_informer').offset();
	var dx = o1.left - o2.left;
	var dy = o1.top - o2.top;
	var distance = Math.sqrt(dx * dx + dy * dy);
	$(this).closest('.product').find('.image img').effect("transfer", { to: $("#wishlist_informer"), className: "transfer_class" }, distance);
	$('.transfer_class').html($(this).closest('.product').find('.image').html());
	$('.transfer_class').find('img').css('height', '100%');
	return false;

});

// Compare
$('a.compare').on('click', function (e) {
	href = $(this).attr('href');
	$('#compare_informer').load(href + ' #compare_informer');
	$(this).removeClass('compare');
	$(this).attr('href', 'compare');
	$(this).html("<i class='fal fa-sync text-primary'></i>");
	$(this).attr('data-bs-title', $(this).data('result-text')).tooltip('dispose').tooltip('show');
	var o1 = $(this).offset();
	var o2 = $('#compare_informer').offset();
	var dx = o1.left - o2.left;
	var dy = o1.top - o2.top;
	var distance = Math.sqrt(dx * dx + dy * dy);
	$(this).closest('.product').find('.image img').effect("transfer", { to: $("#compare_informer"), className: "transfer_class" }, distance);
	$('.transfer_class').html($(this).closest('.product').find('.image').html());
	$('.transfer_class').find('img').css('height', '100%');
	return false;

});

// Quickview
const quickview = {
	cancelPreviousModal: function () { },
	clickHandler: function () {
		const modal = $('#quickview-modal');
		const button = $(this);
		var link = $(this).attr('data-url');
		const doubleClick = button.is('.product-card-quickview-preload');

		quickview.cancelPreviousModal();

		if (doubleClick) {
			return;
		}

		button.addClass('product-card-quickview-preload');
		button.find(".product-card-quickview .fa-eye").hide();

		let xhr = null;
		xhr = $.ajax({
			url: link,
			success: function (data) {
				quickview.cancelPreviousModal = function () { };
				button.removeClass('product-card-quickview-preload');

				modal.find('.modal-content').html(data);
				modal.find('.quickview-close').on('click', function () {
					modal.modal('hide');
				});
				modal.modal('show');
				$('[data-toggle="tooltip"]').tooltip({ trigger: 'hover' });
			}
		});

		quickview.cancelPreviousModal = function () {
			button.removeClass('product-card-quickview-preload');
			button.find(".product-card-quickview .fa-eye").show();

			if (xhr) {
				xhr.abort();
			}

		};
	}
};

$(function () {
	const modal = $('#quickview-modal');
	$('.product-card-quickview').on('click', function () {
		$('[data-bs-toggle="tooltip"]').tooltip('dispose');
		quickview.clickHandler.apply(this, arguments);
		$('[data-bs-toggle="tooltip"]').tooltip();
	});
});

})(jQuery);	