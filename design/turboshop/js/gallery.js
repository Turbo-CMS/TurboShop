document.addEventListener('click', function (e) {
	const $target = e.target.closest('.fancy-plus');

	if ($target && typeof $.fn.fancybox === 'function') {
		e.preventDefault();

		const $itemsContainer = $target.closest("[data-additional_items]");

		if ($itemsContainer) {
			const arItems = $itemsContainer.dataset.additional_items
				? JSON.parse($itemsContainer.dataset.additional_items)
				: false;

			if (arItems && arItems.length) {
				const index = Array.prototype.slice.call($target.parentNode.children).indexOf($target);

				$.fancybox.open(arItems, { loop: false, buttons: ['close'] }, index);
			}
		}
	}
});