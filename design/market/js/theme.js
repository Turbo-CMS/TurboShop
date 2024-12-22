/**
 * Copyright (c) 2018-2024 TurboCMS.
 * https://github.com/Turbo-CMS
 */

(function ($) {
	"use strict";

	// Megamenu
	document.addEventListener('DOMContentLoaded', function () {
		const categoryLinks = document.querySelectorAll('.categories-list a');
		if (categoryLinks.length) {
			categoryLinks.forEach(function (categoryLink) {
				categoryLink.addEventListener('mouseenter', function () {
					document.querySelectorAll('.category-content').forEach(function (content) {
						content.classList.add('d-none');
					});

					var targetCategory = this.getAttribute('data-cat');
					var targetElement = document.getElementById(targetCategory);

					if (targetElement) {
						targetElement.classList.remove('d-none');
						targetElement.classList.add('active');
					}
				});
			});
		}
	});

	// Catalog Button
	const dropdownButton = document.getElementById('dropdownMenuButton1');
	const dropdownIcon = document.getElementById('dropdownIcon');

	if (dropdownButton && dropdownIcon) {
		dropdownButton.addEventListener('show.bs.dropdown', () => {
			dropdownIcon.classList.remove('fa-grid-2');
			dropdownIcon.classList.add('fa-xmark');
		});

		dropdownButton.addEventListener('hide.bs.dropdown', () => {
			dropdownIcon.classList.remove('fa-xmark');
			dropdownIcon.classList.add('fa-grid-2');
		});
	}

	// Fancybox
	if (typeof Fancybox !== 'undefined') {
		Fancybox.bind("[data-fancybox]", {
			Thumbs: { type: false },
		});
	}

	// Tooltip Init
	$(function () {
		$('[data-bs-toggle="tooltip"]').tooltip();
	});

	// Lazy Load
	function lazyLoadImages() {
		const lazyImages = document.querySelectorAll("img[data-src]");

		if ("IntersectionObserver" in window) {
			const observer = new IntersectionObserver((entries, observer) => {
				entries.forEach(entry => {
					if (entry.isIntersecting) {
						const img = entry.target;
						img.src = img.getAttribute("data-src");
						observer.unobserve(img);
					}
				});
			});

			lazyImages.forEach(img => observer.observe(img));
		} else {
			lazyImages.forEach(img => img.src = img.getAttribute("data-src"));
		}
	}

	document.addEventListener("DOMContentLoaded", lazyLoadImages);

	// Infinite Scroll
	if ($('.infinite-next').length > 0) {
		$('.infinite').infiniteScroll({
			path: '.infinite-next',
			append: '.infinite-item',
			button: '.infinite-btn',
			scrollThreshold: false
		});
	}

	$('.infinite').on('request.infiniteScroll', function (event, path) {
		$('.pagination').hide();
	});

	$('.infinite').on('append.infiniteScroll', function (event, response, path, items) {
		lazyLoadImages();
	});

	// Comment Form
	$(document).ready(function () {
		$('.comment-button').on('click', function () {
			var commentId = $(this).data('comment-id');
			$('#commentForm #parent').val(commentId);
		});
	});

	// Comment Rate && Post Rate
	$(document).on('click', '.vote a', function (e) {
		e.preventDefault();
		var counter = $(this).siblings('.vote-value');
		$.ajax({
			url: $(this).attr('href')
		}).done(function (response) {
			if (response.success) {
				counter.text(response.value)
					.toggleClass('text-danger', response.value < 0)
					.toggleClass('text-success', response.value > 0);
			} else {
				$('#rate-danger').toast('show');
			}
		}).fail(function () {
			console.error();
		});
	});

	// Rate Review
	$(document).ready(function () {
		if ($('#review').length) {
			$('#review').rating({
				'value': 0,
				'click': function (e) {
					$('#starsInput').val(e.stars);
				}
			});
		}
	});

	// Search Autocomplete
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

	// Back to Top
	if ($('#back-to-top').length) {
		const scrollTrigger = 100;
		const backToTop = () => {
			const scrollTop = $(window).scrollTop();
			$('#back-to-top').toggleClass('show', scrollTop > scrollTrigger);
		};
		backToTop();
		$(window).on('scroll', backToTop);
		$('#back-to-top').on('click', function (e) {
			e.preventDefault();
			$('html, body').animate({ scrollTop: 0 }, 700);
		});
	}

	// Validation
	(function () {
		var selector = 'needs-validation';
		window.addEventListener('load', function () {
			var forms = document.getElementsByClassName(selector);
			Array.prototype.filter.call(forms, function (form) {
				form.addEventListener('submit', function (e) {
					if (form.checkValidity() === false) {
						e.preventDefault();
						e.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();

	// Phone Mask
	$('#call-mask, #cart-phone, #fastorder-mask, #phone').each(function () {
		if ($(this).length) {
			$(this).mask('+**(999) 999-99-99');
		}
	});

	// Empty ul
	$(document).ready(function () {
		if ($('#featured-categories').length) {
			$('#featured-categories').each(function () {
				if ($(this).find('li').length === 0) {
					$(this).addClass('empty-ul');
				}
			});
		}
	});

})(jQuery);
