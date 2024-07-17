readyDOM(function () {
	document.addEventListener('click', function (e) {
		const $label = e.target.closest('.tb_filter_parameters_box_container .sku-props__value')
		if ($label) {
			$label.classList.toggle('sku-props__value--active');
		}
	})
})