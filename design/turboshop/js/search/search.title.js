$(document).ready(function () {
	let inputSelectors = ['#title-search-input_fixed', '#title-search-input'];

	function toggleClearButton() {
		inputSelectors.forEach(function (selector) {
			let searchForm = $(selector).closest('.search');
			if ($(selector).val() !== '') {
				searchForm.find('.btn-clear-search').show();
			} else {
				searchForm.find('.btn-clear-search').hide();
			}
		});
	}

	inputSelectors.forEach(function (selector) {
		$(selector).on('input', function () {
			toggleClearButton();
		});

		$(selector).closest('.search').find('.btn-clear-search').on('click', function () {
			inputSelectors.forEach(function (selector) {
				$(selector).val('');
			});
			$('.btn-clear-search').hide();
			$(inputSelectors[0]).focus();
		});

		toggleClearButton();
	});
});
