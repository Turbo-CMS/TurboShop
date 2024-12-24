(function ($) {
	// Ajax cart
	$(document).on('submit', 'form.variants', function (e) {
		e.preventDefault();

		button = $(this).find('button[type="submit"]');

		if ($(this).find('select[name=variant]').length > 0) {
			variant = $(this).find('select').val();
		}

		if ($(this).find('input[name=variant]:checked').length > 0) {
			variant = $(this).find('input[name=variant]:checked').val();
		}

		$.ajax({
			url: "ajax/cart.php",
			data: { variant: variant },
			dataType: 'json',
			success: function (data) {
				$('#cart-informer').html(data.cart_informer);
				$('#cart-informer-sidebar').html(data.cart_informer_sidebar);
				$('#cart-informer-footer').html(data.cart_informer_footer);

				if (button.attr('data-result-text')) button.html(button.attr('data-result-text'));

				$('#toastCart').toast('show');
			}
		});

		return false;
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

			$('#cart-informer').load(href + ' #cart-informer', function () {
				$('#offcanvasCart').offcanvas('show');
			});

			$('#cart-informer-sidebar').load(href + ' #cart-informer-sidebar');
			$('#cart-informer-footer').load(href + ' #cart-informer-footer');
			$('#offcanvasCart').offcanvas('hide');

			if ($('#js-ajax-content').length > 0) {
				$('#js-ajax-content').load(href + ' #js-ajax-content');
			}

			return false;
		});
	});

	// Wishlist
	$(document).on('click', 'a.wishlist', function (e) {
		e.preventDefault();

		const icon = $(this).find('i');
		const href = $(this).attr('href');

		$('#wishlist-informer').load(href + ' #wishlist-informer');
		$('#wishlist-informer-sidebar').load(href + ' #wishlist-informer-sidebar');
		$('#wishlist-informer-footer').load(href + ' #wishlist-informer-footer');

		$(this).removeClass('wishlist');
		$(this).attr('href', 'wishlist');

		icon.removeClass('far').addClass('fa');
		icon.attr('data-bs-title', icon.data('result-text')).tooltip('dispose').tooltip('show');

		return false;
	});

	// Compare
	$(document).on('click', 'a.compare', function (e) {
		e.preventDefault();

		const icon = $(this).find('i');
		const href = $(this).attr('href');

		$('#compare-informer').load(href + ' #compare-informer');
		$('#compare-informer-sidebar').load(href + ' #compare-informer-sidebar');
		$('#compare-informer-footer').load(href + ' #compare-informer-footer');

		$(this).removeClass('compare');
		$(this).attr('href', 'compare');

		icon.removeClass('text-secondary').addClass('text-primary');
		icon.attr('data-bs-title', icon.data('result-text')).tooltip('dispose').tooltip('show');

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

		$(document).on('click', '.product-card-quickview', function () {
			$('[data-bs-toggle="tooltip"]').tooltip('dispose');
			quickview.clickHandler.apply(this, arguments);
			$('[data-bs-toggle="tooltip"]').tooltip();
		});
	});

})(jQuery);	