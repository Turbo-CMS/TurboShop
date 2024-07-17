document.addEventListener('DOMContentLoaded', function(event) {
	const orders = document.querySelector('.orders--slider');
	if (orders) {
		if (typeof initSwiperSlider === 'function') {
			initSwiperSlider();

			// fix swiper bug (slidesPerView=auto) on window resize
			let resizeTimer = false;
			window.onresize = function(event) {
				if (orders.classList.contains('swiper--hidden-on-resize')) {
					if (resizeTimer) {
						clearTimeout(resizeTimer);
					}
					else {
						orders.querySelectorAll('.swiper-slide').forEach(slide => {
							slide.style.maxWidth = slide.style.minWidth = slide.clientWidth + 'px';
						});
					}

					resizeTimer = setTimeout(function() {
						resizeTimer = false;

						orders.querySelectorAll('.swiper-slide').forEach(slide => {
							slide.style.maxWidth = slide.style.minWidth = '';
						});

						setTimeout(function() {
							orders.swiper.update();
							orders.swiper.slideTo(0);
						}, 0);
					}, 100);
				}
			};
		}
	}
});
