/**
 * Copyright (c) 2018-2024 TurboCMS.
 * https://github.com/Turbo-CMS
 */

(function ($) {
	"use strict";

	/*
	// Comment Form
	*/

	var $form = $('#commentForm');
	var $rating = $('form #rating');
	$('.comment span').click(function () {
		$form.hide();
		$('.comment span').html($(this).attr('data-reply-text'));
		if (!$(this).hasClass('active')) {
			$(this).html($(this).attr('data-close-text')).addClass('active btn-danger');
			$rating.detach();
			var $comment = $(this).parent();
			$form.find('#parent').val($comment.attr('id'));
			$comment.after($('#commentForm').show());
			return false;
		} else {
			$('.comment span').removeClass('active btn-danger');
			return false;
		}
	});

	$('.comments-reply-form').click(function () {
		$form.hide();
		$('.comments-reply-form').html($(this).attr('data-comment-text'));
		if (!$(this).hasClass('active')) {
			$(this).html($(this).attr('data-close-text')).addClass('active btn-danger');
			$('#form-horizontal span').append($rating);
			$(this).after($('#commentForm').show());
			return false;
		} else {
			$('.comments-reply-form').removeClass('active btn-danger');
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
	// Rate
	*/

	if ($('#review').length) {
		$(function () {
			$('#review').rating({
				'value': 4,
				'click': function (e) {
					console.log(e);
					$('#starsInput').val(e.stars);
				}
			});
		});
	}

	/*
	// Search Autocomplete
	*/

	function setupAutocomplete(selector, serviceUrl, formSelector, pathPrefix) {
		if ($(selector).length) {
			$(selector).autocomplete({
				serviceUrl: serviceUrl,
				minChars: 1,
				noCache: false,
				onSelect: function () {
					$(selector).closest(formSelector).submit();
				},
				formatResult: function (suggestion, currentValue) {
					var pattern = new RegExp('(' + currentValue.replace(/[\-\[\]{}()*+?.,\\^$|#\s]/g, "\\$&") + ')', 'gi');
					return (suggestion.data.image ? "<span class='search-img'><img src='" + suggestion.data.image + "'></span>" : '') + "<a href='" + suggestion.lang + "/" + pathPrefix + suggestion.data.url + "'>" + suggestion.value.replace(pattern, '<strong>$1</strong>') + "</a>";
				}
			});
		}
	}

	setupAutocomplete('#products-search', 'ajax/search_products.php', 'form', 'products/');
	setupAutocomplete('.input-search', 'ajax/search_products.php', 'form', 'products/');
	setupAutocomplete('.blog-search', 'ajax/search_blog.php', 'form', 'blog/');
	setupAutocomplete('.articles-search', 'ajax/search_articles.php', 'form', 'article/');
	setupAutocomplete('#pages-search', 'ajax/search_pages.php', 'form', '');

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

	/*
	// Phone Mask 
	*/

	$(function () {
		$('#call-mask').mask('+**(999) 999-99-99');
		$('#cart-phone').mask('+**(999) 999-99-99');
		$('#fastorder-mask').mask('+**(999) 999-99-99');
		$('#phone').mask('+**(999) 999-99-99');
	});

	/*
	// Empty ul
	*/

	$(document).ready(function () {
		$('#featured-categories').each(function () {
			if ($(this).find('li').length === 0) {
				$(this).addClass('empty-ul');
			}
		});
	});

	/*
	// Tooltip
	*/

	$(function () {
		$('[data-bs-toggle="tooltip"]').tooltip();
	});

	/*
	// Fancybox
	*/

	if (typeof Fancybox !== 'undefined') {
		Fancybox.bind("[data-fancybox]", {
			Thumbs: { type: false },
		});
	}

})(jQuery);			 