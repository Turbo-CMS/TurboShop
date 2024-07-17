if (!funcDefined("sliceItemBlock")) {
	sliceItemBlock = function () {
		$(".catalog-block .catalog-block__item:visible .catalog-block__info-title").sliceHeight({
			row: ".grid-list",
			item: ".catalog-block__item:visible",
			mobile: true,
		});
	};
}

(function () {
	const ready = function (callback) {
		if (document.readyState !== "loading") {
			callback();
		} else {
			document.addEventListener("DOMContentLoaded", callback);
		}
	};
	const equalHeight = function (options) {
		const parent = options.items.parent();
		const parentRect = parent[0].getBoundingClientRect();
		const index = options.index;
		let items = options.items;
		let size = options.size;

		if (!size) {
			const rect = options.items[0].getBoundingClientRect();
			size = Math.round(parentRect.width / rect.width);
		}
		if (index) {
			let from = 1;
			let to = size;
			if (index % size === 0) {
				from = index - size;
			} else {
				from = index - (index % size);
			}
			to += from;
			items = options.items.slice(from, to);
		}

		const sizes = [];
		items.each(function (item) {
			const _this = $(this).find(options.block);
			_this.css("height", "");
			sizes.push(_this[0].clientHeight);
		});
		const maxSize = Math.max.apply(null, sizes);

		if (options.current) {
			options.current.find(options.block).css("height", maxSize);
		} else if (index) {
			items
				.eq(index - 1)
				.find(options.block)
				.css("height", maxSize);
		} else {
			items.each(function () {
				$(this).find(options.block).css("height", maxSize);
			});
		}
	};
	const handler = function () {
		$(document).on("mouseenter", ".catalog-block__wrapper.has-offers", function () {
			const _this = $(this);
			const parent = _this.parent();
			const bHovered = _this.data("hovered");
			if (bHovered) {
				return;
			}
			const rect = _this[0].getBoundingClientRect();
			const index = _this.index() + 1;

			equalHeight({
				items: parent.find(" .catalog-block__wrapper:visible"),
				current: _this,
				block: ".catalog-block__info",
				index: index,
			});

			_this.css("height", rect.height);
			_this.attr("data-hovered", true);
		});
		$(document).on("mouseleave", ".catalog-block__wrapper.has-offers", function () {
			const _this = $(this);

			_this.css("height", "");
			_this.attr("data-hovered", false);
			_this.find(".catalog-block__info").css("height", "");
		});
	};
	ready(handler);
})();
