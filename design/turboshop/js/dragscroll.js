// class JSDragScroll
class JSDragScroll {
	constructor(element, option = {}) {
		this.setOption(option);
		if (typeof element === 'object') {
			this.wrapEl = element;
		} else if (typeof element === 'string') {
			this.wrapEl = document.querySelector(element);
		}

		this.activeClass = this.option.activeClass;
		this.scrollSpeed = this.option.scrollSpeed;
		this.cancelClickSpace = this.option.cancelClickSpace;
		this.arrowSpeed = this.option.arrowSpeed;

		this.wrapEl.classList.add('drag-scroll');
		this.el = this.wrapEl.querySelector('.drag-scroll__content');

		if (this.el && this.el instanceof Node) {
			this.init();
		} else {
			console.log('incorect params');
		}
	}

	init() {
		this.isDown = false;
		this.startX = 0;
		this.scrollLeft = 0;
		this.cancelClick = false;
		this.translateX = 0;
		this.scrollable = false;

		this.appendArrows();
		this.bindEvents();
		this.checkArrows();
	}

	setOption(option) {
		const optionDefault = {
			activeClass: 'drag-scroll--active',
			scrollSpeed: 1,
			cancelClickSpace: 10,
			arrowSpeed: 75,
		};
		this.option = Object.assign({}, optionDefault, option);
	}

	appendArrows() {
		var arrow_svg =
			'<svg width="7" height="12" viewBox="0 0 7 12" fill="none" xmlns="http://www.w3.org/2000/svg">' +
			'<path d="M1 1L6 6L1 11" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>' +
			"</svg>";
		let arrows_wrapper = '<div class="drag-scroll__arrows">' +
			'<div class="drag-scroll__arrow drag-scroll__arrow--left stroke-dark-light drag-scroll__arrow--disabled">' +
			arrow_svg +
			"</div>" +
			'<div class="drag-scroll__arrow drag-scroll__arrow--right stroke-dark-light drag-scroll__arrow--disabled">' +
			arrow_svg +
			"</div>" +
			"</div>";

		this.wrapEl.insertAdjacentHTML('beforeend', arrows_wrapper);
		this.arrowLeft = this.wrapEl.querySelector('.drag-scroll__arrow--left');
		this.arrowRight = this.wrapEl.querySelector('.drag-scroll__arrow--right');
	}

	removeArrows() {
		let arrows = this.wrapEl.querySelector('.drag-scroll__arrows');
		if (arrows) {
			arrows.remove();
		}
	}

	checkArrows() {
		let showArrows = false;

		if (this.translateX >= 0) {
			this.arrowLeft.classList.add('drag-scroll__arrow--disabled');
		} else {
			this.arrowLeft.classList.remove('drag-scroll__arrow--disabled');
			showArrows = true;
		}

		if (this.translateX <= this.el.clientWidth - this.el.scrollWidth) {
			this.arrowRight.classList.add('drag-scroll__arrow--disabled');
		} else {
			this.arrowRight.classList.remove('drag-scroll__arrow--disabled');
			showArrows = true;
		}

		if (showArrows) {
			this.scrollable = true;
			this.wrapEl.classList.add('drag-scroll--scrollable');
		} else {
			this.scrollable = false;
			this.wrapEl.classList.remove('drag-scroll--scrollable');
		}
	}

	setScroll() {
		if (this.translateX > 0) {
			this.translateX = 0;
		} else if (this.translateX < this.el.clientWidth - this.el.scrollWidth) {
			this.translateX = this.el.clientWidth - this.el.scrollWidth;
		}
		this.el.style.transform = "translateX(" + this.translateX + "px)";
	}

	onResize() {
		this.setScroll();
		this.checkArrows();
	}

	bindEvents() {
		this.wrapEl.addEventListener(
			'mousedown',
			Turbo.proxy(this.onMousedown, this)
		);

		this.wrapEl.addEventListener(
			'touchstart',
			Turbo.proxy(this.onTouchstart, this)
		);

		this.el.addEventListener(
			'click',
			Turbo.proxy(this.onClick, this)
		);

		document.addEventListener(
			'mouseup',
			Turbo.proxy(this.onMouseup, this)
		);

		document.addEventListener(
			'touchend',
			Turbo.proxy(this.onTouchend, this)
		);

		document.addEventListener(
			'mousemove',
			Turbo.proxy(this.onMousemove, this)
		);

		document.addEventListener(
			'touchmove',
			Turbo.proxy(this.onTouchmove, this)
		);

		if (this.arrowLeft) {
			this.arrowLeft.addEventListener(
				'click',
				Turbo.proxy(this.onArrowLeftClick, this)
			);
		}
		if (this.arrowRight) {
			this.arrowRight.addEventListener(
				'click',
				Turbo.proxy(this.onArrowRightClick, this)
			);
		}
		window.addEventListener(
			'resize',
			Turbo.proxy(this.onResize, this)
		);
	}

	onMousedown(e) {
		if (e.target.closest('.drag-scroll__arrow'))
			return;
		this.startAction(e.pageX);
	}

	onTouchstart() {
		if (e.target.closest('.drag-scroll__arrow'))
			return;
		this.startAction(e.touches[0].pageX);
	}

	onClick(e) {
		if (this.cancelClick) {
			e.preventDefault();
		}
	}

	onMouseup() {
		if (!this.isDown) return;
		this.endAction();
	}

	onTouchend() {
		if (!this.isDown) return;
		this.endAction();
	}

	onMousemove(e) {
		if (!this.isDown) return;
		e.preventDefault();
		this.moveAction(e.pageX);
	}

	onTouchmove(e) {
		if (!this.isDown) return;
		this.moveAction(e.touches[0].pageX);
	}

	onArrowRightClick() {
		this.translateX = this.translateX - this.arrowSpeed;
		this.checkArrows();
		this.el.style["transition-duration"] = "200ms";
		this.setScroll();
	}

	onArrowLeftClick() {
		this.translateX = this.translateX + this.arrowSpeed;
		this.checkArrows();
		this.el.style["transition-duration"] = "200ms";
		this.setScroll();
	}

	unBindEvents() {
		this.wrapEl.removeEventListener(
			'mousedown',
			Turbo.proxy(this.onMousedown, this)
		);

		this.wrapEl.removeEventListener(
			'touchstart',
			Turbo.proxy(this.onTouchstart, this)
		);

		this.el.removeEventListener(
			'click',
			Turbo.proxy(this.onClick, this)
		);

		document.removeEventListener(
			'mouseup',
			Turbo.proxy(this.onMouseup, this)
		);

		document.removeEventListener(
			'touchend',
			Turbo.proxy(this.onTouchend, this)
		);

		document.removeEventListener(
			'mousemove',
			Turbo.proxy(this.onMousemove, this)
		);

		document.removeEventListener(
			'touchmove',
			Turbo.proxy(this.onTouchmove, this)
		);

		if (this.arrowLeft) {
			this.arrowLeft.removeEventListener(
				'click',
				Turbo.proxy(this.onArrowLeftClick, this)
			);
		}

		if (this.arrowRight) {
			this.arrowRight.removeEventListener(
				'click',
				Turbo.proxy(this.onArrowRightClick, this)
			);
		}

		window.removeEventListener(
			'resize',
			Turbo.proxy(this.onResize, this)
		);
	}

	destroy() {
		this.unBindEvents();
		this.removeArrows();
	}

	moveAction(pageX) {
		const walk = (pageX - this.startX) * this.scrollSpeed; //scroll-fast
		this.translateX = walk;
		this.setScroll();

		if (!this.cancelClick) {
			this.cancelClick = Math.abs(walk) > this.cancelClickSpace;
		}
		this.checkArrows();
	}

	startAction(pageX) {
		if (this.scrollable) {
			this.isDown = true;
			this.cancelClick = false;
			this.wrapEl.classList.add(this.activeClass);
			this.el.style["transition-duration"] = "0ms";
			this.startX = pageX - this.translateX;
		}
	}

	endAction() {
		this.isDown = false;
		this.wrapEl.classList.remove(this.activeClass);
	}
}

