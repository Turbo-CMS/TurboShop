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

	if ($('#products-search').length) {
		$(function () {
			$('#products-search').autocomplete({
				serviceUrl: 'ajax/search_products.php',
				minChars: 1,
				noCache: false,
				onSelect: function (suggestion) {
					$('#products-search').closest('form').submit();
				},
				formatResult: function (suggestion, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "products/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
				}
			});
		});
	}

	if ($('.input-search').length) {
		$(function () {
			$('.input-search').autocomplete({
				serviceUrl: 'ajax/search_products.php',
				minChars: 1,
				noCache: false,
				onSelect: function (suggestion) {
					$('.input-search').closest('form').submit();
				},
				formatResult: function (suggestion, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "products/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
				}
			});
		});
	}

	if ($('.blog-search').length) {
		$(function () {
			$(".blog-search").autocomplete({
				serviceUrl: 'ajax/search_blog.php',
				minChars: 1,
				noCache: false,
				onSelect: function (suggestion) {
					$('.blog-search').closest('form').submit();
				},
				formatResult: function (suggestion, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "blog/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
				}
			});
		});
	}

	if ($('.articles-search').length) {
		$(function () {
			$(".articles-search").autocomplete({
				serviceUrl: 'ajax/search_articles.php',
				minChars: 1,
				noCache: false,
				onSelect: function (suggestion) {
					$('.articles-search').closest('form').submit();
				},
				formatResult: function (suggestion, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "article/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
				}
			});
		});
	}

	if ($('#pages-search').length) {
		$(function () {
			$("#pages-search").autocomplete({
				serviceUrl: 'ajax/search_pages.php',
				minChars: 1,
				noCache: false,
				onSelect: function (suggestion) {
					$('#pages-search').closest('form').submit();
				},
				formatResult: function (suggestion, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return "<span class='ms-3 mb-3'></span>" + "<a href=" + suggestion.lang + "/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
				}
			});
		});
	}

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

})(jQuery);			 