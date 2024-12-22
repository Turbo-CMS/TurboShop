(function ($) {
	"use strict";
	
	if ($('.block-description').length) {
		$('.block-description').find('iframe').wrap('<p class="ratio ratio-16x9"></p>');
		$('.block-description').find('table').wrap('<div class="table-responsive"></div>');

		$(document).ready(function () {
			$('img.img-zoom').each(function (i) {
				if (this.parentNode.tagName != 'A') {
					$(this).wrap('<a class="image-zoom" data-fancybox="image-zoom' + i + '" rel="fancybox_' + i + '" href="' + this.src + '" target="_blank"/>');
				}
			});
			$('img.img-gallery').each(function (i) {
				if (this.parentNode.tagName != 'A') {
					$(this).wrap('<a class="image-gallery" data-fancybox="image-gallery" rel="image-gallery" href="' + this.src + '" target="_blank"/>');
				}
			});
			$('img.img-slider').each(function (i) {
				if (this.parentNode.tagName != 'A') {
					$(this).wrap('<a class="image-slider" data-fancybox="image-slider" rel="image-slider" href="' + this.src + '" target="_blank"/>');
				}
			});

			$("a.image-gallery").wrapAll("<div class='slider-gallery owl-carousel'></div>");

			$("a.image-slider").wrapAll("<div class='slider-mce owl-carousel'></div>");

			if ($('.slider-gallery').length) {
				$('.slider-gallery').owlCarousel({
					loop: false,
					margin: 0,
					lazyLoad: true,
					mouseDrag: false,
					nav: true,
					items: 1,
					dotsEach: true,
					responsive: {
						768: {
							mouseDrag: true,
							items: 1
						},
						992: { items: 3 }
					}
				});
			}
			if ($('.slider-mce').length) {
				$('.slider-mce').owlCarousel({
					loop: true,
					margin: 0,
					lazyLoad: true,
					mouseDrag: true,
					nav: true,
					items: 1,
					dotsEach: true
				});
			}
		});

	}
})(jQuery);		