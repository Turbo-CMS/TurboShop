(function ($) {
	"use strict";

	/*
	// Comment Form
	*/

	var $form = $('#CommentForm');
	var flag = true;
	$('.comment span').click(function () {
		$form.hide();
		$('.comment span').text($(this).attr('data-reply-text'));
		if (!$(this).hasClass('active')) {
			$(this).text($(this).attr('data-close-text')).addClass('active');
			var $comment = $(this).parent();
			$form.find('#parent').val($comment.attr('id'));
			$comment.after($('#CommentForm').show());
			return false;
		} else {
			$('.comment span').removeClass('active');
			return false;
		}
	});

	$('.comments-reply-form').click(function () {
		$form.hide();
		$('.comments-reply-form').text($(this).attr('data-comment-text'));
		if (!$(this).hasClass('active')) {
			$(this).text($(this).attr('data-close-text')).addClass('active');
			var $comment = $(this);
			$comment.after($('#CommentForm').show());
			return false;
		} else {
			$('.comments-reply-form').removeClass('active');
			return false;
		}
	});

	/*
	// Comment Rate
	*/

	$(document).on('click', '.vote a', function (e) {
		e.preventDefault();
		var counter = $(this).siblings('.vote-value');
		$.ajax({
			url: $(this).attr('href')
		}).done(function (response) {
			if (response.success) {
				counter.html(response.value);
				counter.text(response.value).toggleClass('neg', response.value < 0).toggleClass('pos', response.value > 0);
			} else {
				$('#rate-danger').toast('show');
			}
		});
	});


	/*
	// Loader
	*/

	$(window).on("load", function () {
		$('.loader-container').fadeIn('slow');
	})

	/*
	// Quickview
	*/

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
					modal.find('.quickview__close').on('click', function () {
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
			quickview.clickHandler.apply(this, arguments);
		});
	});

	/*
	// Rate
	*/
	if ($("#review").length) {
		$(function () {
			$("#review").rating({
				"value": 4,
				"click": function (e) {
					console.log(e);
					$("#starsInput").val(e.stars);
				}
			});
		});
	}

	/*
	// Search Autocomplete
	*/

	$(function () {
		$(".input_search").autocomplete({
			serviceUrl: 'ajax/search_products.php',
			minChars: 1,
			noCache: false,
			onSelect: function (suggestion) {
				$(".input_search").closest('form').submit();
			},
			formatResult: function (suggestion, currentValue) {
				var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
				var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
				return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "products/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
			}
		});
	});

	/*
	// Back to Top
	*/

	$(function () {
		if ($('#back-to-top').length) {
			var scrollTrigger = 100, // px
				backToTop = function () {
					var scrollTop = $(window).scrollTop();
					if (scrollTop > scrollTrigger) {
						$('#back-to-top').addClass('show');
					} else {
						$('#back-to-top').removeClass('show');
					}
				};
			backToTop();
			$(window).on('scroll', function () {
				backToTop();
			});
			$('#back-to-top').on('click', function (e) {
				e.preventDefault();
				$('html,body').animate({
					scrollTop: 0
				}, 700);
			});
		}
	});

	/*
	// Validation
	*/

	$(function () {
		$("#btnValidation").click(function (event) {
			var form = $("#FormValidation");
			if (form[0].checkValidity() === false) {
				event.preventDefault();
				event.stopPropagation();
			}
			form.addClass('was-validated');
		});
	});

	/*
	// Sidebar
	*/

	$(function () {
		$(document).ready(function () {

			$("[data-trigger]").on("click", function (e) {
				e.preventDefault();
				e.stopPropagation();
				var offcanvas_id = $(this).attr('data-trigger');
				$(offcanvas_id).toggleClass("show");
				$('body').toggleClass("offcanvas-active");
				$(".screen-overlay").toggleClass("show");
			});

			$(document).on('keydown', function (event) {
				if (event.keyCode === 27) {
					$(".mobile-offcanvas").removeClass("show");
					$("body").removeClass("overlay-active");
				}
			});

			$(".btn-close, .screen-overlay").click(function (e) {
				$(".screen-overlay").removeClass("show");
				$(".mobile-offcanvas").removeClass("show");
				$("body").removeClass("offcanvas-active");
			});

		});
	});

	/*
	// Phone Mask
	*/

	$(function () {
		$("#call-mask").mask("+**(999) 999-99-99");
		$("#order-phone").mask("+**(999) 999-99-99");
		$("#fastorder-mask").mask("+**(999) 999-99-99");
		$("#phone").mask("+**(999) 999-99-99");
	});

})(jQuery);			