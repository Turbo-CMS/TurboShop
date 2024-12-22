(function ($) {
	"use strict";

	/*
	// Fast Order
	*/

	$(function () {
		$('.fast-order-send-button').click(function () {
			$("#fast-order-product-name").html($(this).data('name'));

			var variant;
			var form_obj = $(this).closest("form.variants");
			if (form_obj.find('input[name=variant]:checked').length > 0)
				variant = form_obj.find('input[name=variant]:checked').val();
			if (form_obj.find('select[name=variant]').length > 0)
				variant = form_obj.find('select').val();

			$("#fast-order-product-id").val(variant);

		});
	});

	/*
	// Carousel
	*/

	$(function () {
		$('[id^=carousel-selector-]').click(function () {
			var id_selector = $(this).attr("id");
			var id = id_selector.substr(id_selector.length - 1);
			id = parseInt(id);
			$('[id^=carousel-selector-]').removeClass('selected');
			$(this).addClass('selected');
		});
	});

	// when the carousel slides, auto update
	$('#productImages').on('slid.bs.carousel', function (e) {
		var id = $('.carousel-item.active').data('slide-number');
		id = parseInt(id);
		$('[id^=carousel-selector-]').removeClass('selected');
		$('[id=carousel-selector-' + id + ']').addClass('selected');
	});

	/*
	// Scroll
	*/
	const scrollLink = document.querySelector('.scroll-link');

	if (scrollLink) {
		scrollLink.addEventListener('click', function (event) {
			event.preventDefault();

			const headerHeight = document.querySelector('.navbar')?.offsetHeight || 0;
			const targetPosition = document.querySelector('#description')?.getBoundingClientRect().top + window.pageYOffset || 0;

			window.scrollTo({
				top: targetPosition - headerHeight,
				behavior: 'smooth'
			});
		});
	}


	/*
	// Comment Form
	*/
	document.addEventListener('DOMContentLoaded', function () {
		const replyButtons = document.querySelectorAll('.comment-button.reply');
		const ratingBlock = document.querySelector('.modal .rating');
		const starsInput = document.getElementById('starsInput');

		if (ratingBlock && starsInput) {
			replyButtons.forEach(button => {
				button.addEventListener('click', function () {
					ratingBlock.style.display = 'none';
					starsInput.value = '0';
				});
			});

			const commentModal = document.getElementById('commentForm');
			commentModal.addEventListener('hidden.bs.modal', function () {
				ratingBlock.style.display = 'block';
				starsInput.value = '';
			});
		}
	});

})(jQuery);