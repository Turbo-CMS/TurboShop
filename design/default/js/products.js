(function ($) {
	// Ajax cart
	$(document).ready(function () {
		$('form.variants').submit(function (e) {
			e.preventDefault();
			button = $(this).find('button[type="submit"]');
			if ($(this).find('select[name=variant]').length > 0)
				variant = $(this).find('select').val();
			if ($(this).find('input[name=variant]:checked').length > 0)
				variant = $(this).find('input[name=variant]:checked').val();

			$.ajax({
				url: "ajax/cart.php",
				data: { variant: variant },
				dataType: 'json',
				success: function (data) {
					$('#cart-informer').html(data.cart_informer);
					$('#cart-informer-2').html(data.cart_informer_2);
					$('#cart-informer-mobile').html(data.cart_informer_mobile);
					$('#cart-informer-footer').html(data.cart_informer_footer);
					if (button.attr('data-result-text')) button.html(button.attr('data-result-text'));
				}
			});

			if ($('#cart-informer').length > 0) {
				var o1 = $(this).offset();
				var o2 = $('#cart-informer').offset();
				var dx = o1.left - o2.left;
				var dy = o1.top - o2.top;
				var distance = Math.sqrt(dx * dx + dy * dy);
				$(this).closest('.product').find('.image img').effect("transfer", { to: $("#cart-informer"), className: "transfer-class" }, distance);
				$('.transfer-class').html($(this).closest('.product').find('.image').html());
				$('.transfer-class').find('img').css('height', '100%');
			}

			if ($('#cart-informer-2').length > 0) {
				var o1 = $(this).offset();
				var o2 = $('#cart-informer-2').offset();
				var dx = o1.left - o2.left;
				var dy = o1.top - o2.top;
				var distance = Math.sqrt(dx * dx + dy * dy);
				$(this).closest('.product').find('.image img').effect("transfer", { to: $("#cart-informer-2"), className: "transfer-class" }, distance);
				$('.transfer-class').html($(this).closest('.product').find('.image').html());
				$('.transfer-class').find('img').css('height', '100%');
			}
			
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
		$('.offers-price .price-value').html(price)
		$('.offers-price-old .price-value').html(compare)
		$('.article .value').html(sku)
		if (stock < 1) {
			$availability.html($availability.data('stock')).removeClass('text-success').addClass('text-danger');
			$addToCart.attr('disabled', true);
			$fastOrder.addClass('disabled');
		} else {
			$availability.html($availability.data('default')).removeClass('text-danger').addClass('text-success');
			$addToCart.attr('disabled', false);
			$fastOrder.removeClass('disabled');
		}
	});

	// Product price replacement radio
	$('input[name=variant]').on('change', function () {
		var price = $('input[name=variant]:checked').data('price'),
			sku = $('input[name=variant]:checked').data('sku'),
			compare = $('input[name=variant]:checked').data('compare'),
			stock = $('input[name=variant]:checked').data('stock');
		var $availability = $('.availability');
		var $addToCart = $('#add-to-cart');
		var $fastOrder = $('#fast-order');

		$('.offers-price .price-value').html(price);
		$('.offers-price-old .price-value').html(compare);
		$('.article .value').html(sku);

		if (stock < 1) {
			$availability.html($availability.data('stock')).removeClass('text-success').addClass('text-danger');
			$addToCart.attr('disabled', true);
			$fastOrder.addClass('disabled');
		} else {
			$availability.html($availability.data('default')).removeClass('text-danger').addClass('text-success');
			$addToCart.attr('disabled', false);
			$fastOrder.removeClass('disabled');
		}
	});

	// Remove cart
	$(function () {
		$(document).on('click', 'a.product-remove', function (e) {
			e.preventDefault();
			var href = $(this).attr('href');
			$('#cart-informer-2').load(href + ' #cart-informer-2', function () {
				$('#offcanvasCart').offcanvas('show');
			});
			$('#cart-informer-footer').load(href + ' #cart-informer-footer');
			$('#cart-informer-mobile').load(href + ' #cart-informer-mobile');
			$('#offcanvasCart').offcanvas('hide');
			return false;
		});
	});

	// Wishlist
	$('a.wishlist').on('click', function (e) {
		href = $(this).attr('href');
		$('#wishlist-informer').load(href + ' #wishlist-informer');
		$(this).removeClass('wishlist');
		$(this).attr('href', 'wishlist');
		$(this).html("<i class='fal fa-heart text-danger'></i>");
		$(this).attr('data-bs-title', $(this).data('result-text')).tooltip('dispose').tooltip('show');
		var o1 = $(this).offset();
		var o2 = $('#wishlist-informer').offset();
		var dx = o1.left - o2.left;
		var dy = o1.top - o2.top;
		var distance = Math.sqrt(dx * dx + dy * dy);
		$(this).closest('.product').find('.image img').effect("transfer", { to: $("#wishlist-informer"), className: "transfer-class" }, distance);
		$('.transfer-class').html($(this).closest('.product').find('.image').html());
		$('.transfer-class').find('img').css('height', '100%');
		return false;

	});

	// Compare
	$('a.compare').on('click', function (e) {
		href = $(this).attr('href');
		$('#compare-informer').load(href + ' #compare-informer');
		$(this).removeClass('compare');
		$(this).attr('href', 'compare');
		$(this).html("<i class='fal fa-sync text-primary'></i>");
		$(this).attr('data-bs-title', $(this).data('result-text')).tooltip('dispose').tooltip('show');
		var o1 = $(this).offset();
		var o2 = $('#compare-informer').offset();
		var dx = o1.left - o2.left;
		var dy = o1.top - o2.top;
		var distance = Math.sqrt(dx * dx + dy * dy);
		$(this).closest('.product').find('.image img').effect("transfer", { to: $("#compare-informer"), className: "transfer-class" }, distance);
		$('.transfer-class').html($(this).closest('.product').find('.image').html());
		$('.transfer-class').find('img').css('height', '100%');
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