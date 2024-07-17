var newHash = location.hash;
if ("onhashchange" in window) {
	$(window).bind('hashchange', function () {
		var newHash = location.hash;

		if (newHash) {
			if ('scrollRestoration' in history) {
				history.scrollRestoration = 'manual';
			}

			if ($('.tabs.tabs-history .nav a[href="' + newHash + '"]').length) {
				$('.tabs.tabs-history .nav a[href="' + newHash + '"]').trigger('click');

				var $block = $(newHash);
				if ($block.length) {
					if ($block.closest('.tab-pane').length) {
						var offset = -206;
						if (typeof turboOptions !== 'undefined') {
							offset = window.matchMedia("(max-width:991px)").matches ? (turboOptions.THEME.HEADER_MOBILE_FIXED !== 'Y' || turboOptions.THEME.HEADER_MOBILE_SHOW !== 'ALWAYS' ? -187 + 62 : -187) : (turboOptions.THEME.TOP_MENU_FIXED !== 'Y' ? -206 + 81 : -206);
						}

						$block.data('offset', offset);
					}

					scrollToBlock(newHash);
				}
				else {
					if ($('.ordered-block .tabs').length) {
						var content_offset = $('.ordered-block .tabs').offset();
						$('html, body').animate({ scrollTop: content_offset.top - 90 }, 400);
					}
				}
			}
		}
	});
}

$(document).on('click', '.tabs.tabs-history a[data-toggle=tab]', function (e) {
	var $this = $(e.target);

	if (
		typeof history !== 'undefined' &&
		$this.attr('href')
	) {
		e.preventDefault();
		$(this).tab('show');
	}
});
