$(document).ready(function () {
	let inputSelector = '.search-input';

	function toggleClearButton() {
		$(inputSelector).each(function () {
			let searchForm = $(this).closest('.search');
			if ($(this).val() !== '') {
				searchForm.find('.btn-clear-search').show();
			} else {
				searchForm.find('.btn-clear-search').hide();
			}
		});
	}

	$(inputSelector).on('input', function () {
		toggleClearButton();
	});

	$(document).on('click', '.btn-clear-search', function () {
		$(inputSelector).each(function () {
			this.setAttribute('value', '');
			$(this).val('');
		});
		$('.btn-clear-search').hide();
		$(this).closest('.search').find(inputSelector).focus();
	});

	toggleClearButton();
});
