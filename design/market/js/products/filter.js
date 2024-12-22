(function () {
	'use strict';

	/**
	 * Range slider
	 * @requires https://github.com/leongersen/noUiSlider
	 */

	var rangeSlider = function () {
		var rangeSliderWidget = document.querySelectorAll('.range-slider');
		var _loop7 = function _loop7() {
			var rangeSlider = rangeSliderWidget[i].querySelector('.range-slider-ui'),
				valueMinInput = rangeSliderWidget[i].querySelector('.range-slider-value-min'),
				valueMaxInput = rangeSliderWidget[i].querySelector('.range-slider-value-max');
			var options = {
				dataStartMin: parseInt(rangeSliderWidget[i].dataset.startMin, 10),
				dataStartMax: parseInt(rangeSliderWidget[i].dataset.startMax, 10),
				dataMin: parseInt(rangeSliderWidget[i].dataset.min, 10),
				dataMax: parseInt(rangeSliderWidget[i].dataset.max, 10),
				dataStep: parseInt(rangeSliderWidget[i].dataset.step, 10)
			};
			var dataCurrency = rangeSliderWidget[i].dataset.currency;
			noUiSlider.create(rangeSlider, {
				start: [options.dataStartMin, options.dataStartMax],
				connect: true,
				step: options.dataStep,
				// pips: {
				// 	mode: 'count',
				// 	values: 5
				// },
				tooltips: false,
				range: {
					'min': options.dataMin,
					'max': options.dataMax
				},
				format: {
					to: function to(value) {
						return "".concat(dataCurrency ? dataCurrency : '$').concat(parseInt(value, 10));
					},
					from: function from(value) {
						return Number(value);
					}
				}
			});
			rangeSlider.noUiSlider.on('update', function (values, handle) {
				var value = values[handle];
				value = value.replace(/\D/g, '');
				if (handle) {
					valueMaxInput.value = Math.round(value);
				} else {
					valueMinInput.value = Math.round(value);
				}
			});
			valueMinInput.addEventListener('change', function () {
				rangeSlider.noUiSlider.set([this.value, null]);
			});
			valueMaxInput.addEventListener('change', function () {
				rangeSlider.noUiSlider.set([null, this.value]);
			});
		};
		for (var i = 0; i < rangeSliderWidget.length; i++) {
			_loop7();
		}
	}();

	/**
	 * Filter list of items by typing in the search field
	 */

	var filterList = function () {
		var filterListWidget = document.querySelectorAll('.widget-filter');
		var _loop8 = function _loop8() {
			var filterInput = filterListWidget[i].querySelector('.widget-filter-search'),
				filterList = filterListWidget[i].querySelector('.widget-filter-list'),
				filterItems = filterList.querySelectorAll('.widget-filter-item');
			if (!filterInput) {
				return "continue";
			}
			filterInput.addEventListener('keyup', filterListFunc);
			function filterListFunc() {
				var filterValue = filterInput.value.toLowerCase();
				for (var _i4 = 0; _i4 < filterItems.length; _i4++) {
					var filterText = filterItems[_i4].querySelector('.widget-filter-item-text').innerHTML;
					if (filterText.toLowerCase().indexOf(filterValue) > -1) {
						filterItems[_i4].classList.remove('d-none');
					} else {
						filterItems[_i4].classList.add('d-none');
					}
				}
			}
		};
		for (var i = 0; i < filterListWidget.length; i++) {
			var _ret2 = _loop8();
			if (_ret2 === "continue") continue;
		}
	}();

})();