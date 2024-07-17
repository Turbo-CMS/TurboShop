$(document).ready(function () {
	$('.phones__inner').hover(
		function (e) {
			let rect = $(this)[0].getBoundingClientRect();
			let $dropdown = $(this).find('.phones__dropdown');
			if ($dropdown.length) {
				let dropdown_rect = $dropdown[0].getBoundingClientRect();
				let dropdown_top = -20;
				let dropdown_left = -16;

				if (dropdown_rect.right > document.body.clientWidth) {
					$dropdown.css('left', (document.body.clientWidth - dropdown_rect.right + dropdown_left) + 'px');
				}
				else {
					$dropdown.css('left', dropdown_left + 'px');
				}

				if ($(this).closest('.footer__phone').length) {
					if ((window.scrollY + rect.y + dropdown_top + $dropdown[0].scrollHeight) <= document.body.clientHeight) {
						$dropdown.removeClass('phones__dropdown--top');
					} else {
						$dropdown.addClass('phones__dropdown--top');
					}
				}
			}
		}
	);
});    