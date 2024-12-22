(function ($) {
	"use strict";

	/*
	// Create Cookie
	*/

	function createCookie(name, value, days) {
		var expires;

		if (days) {
			var date = new Date();
			date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
			expires = "; expires=" + date.toGMTString();
		} else {
			expires = "";
		}
		document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/";
	}

	/*
	// Table of Contents
	*/

	$(document).on('click', '.js-table-of-contents-hide', function () {

		var $toc = $(this).parents('.table-of-contents');

		$toc.toggleClass('open');
		if ($toc.hasClass('open')) {
			createCookie('turbocms_toc_hide', "", -1);
			$('.js-table-of-contents-list').slideDown();
		} else {
			createCookie('turbocms_toc_hide', 'hide');
			$('.js-table-of-contents-list').slideUp();
		}

	});

	$(document).on('click', '.table-of-contents a[href*="#"]', function (e) {
		var fixed_offset = 70;
		$('html,body').stop().animate({ scrollTop: $(this).parents('.entry-content').find(this.hash).offset().top - fixed_offset }, 500);
		e.preventDefault();
	});
})(jQuery);		