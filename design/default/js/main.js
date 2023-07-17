(function ($) {
	"use strict";

	/*
	// Comment Form
	*/

	var $form = $('#CommentForm');
	var $rating = $('form #rating');
	$('.comment span').click(function () {
		$form.hide();
		$('.comment span').text($(this).attr('data-reply-text'));
		if (!$(this).hasClass('active')) {
			$(this).text($(this).attr('data-close-text')).addClass('active');
			$rating.detach();
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
			$('#FormValidation span').append($rating);
			$(this).after($('#CommentForm').show());
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

	if ($(".input_search").length) {
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
	}

	if ($(".blog_search").length) {
		$(function () {
			$(".blog_search").autocomplete({
				serviceUrl: 'ajax/search_blog.php',
				minChars: 1,
				noCache: false,
				onSelect: function (suggestion) {
					$(".blog_search").closest('form').submit();
				},
				formatResult: function (suggestion, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "blog/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
				}
			});
		});
	}

	if ($(".articles_search").length) {
		$(function () {
			$(".articles_search").autocomplete({
				serviceUrl: 'ajax/search_articles.php',
				minChars: 1,
				noCache: false,
				onSelect: function (suggestion) {
					$(".articles_search").closest('form').submit();
				},
				formatResult: function (suggestion, currentValue) {
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
					return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "article/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
				}
			});
		});
	}
	
	if ($("#pages-search").length) {
		$(function () {
			$("#pages-search").autocomplete({
				serviceUrl: 'ajax/search_pages.php',
				minChars: 1,
				noCache: false,
				onSelect: function (suggestion) {
					$("#pages-search").closest('form').submit();
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