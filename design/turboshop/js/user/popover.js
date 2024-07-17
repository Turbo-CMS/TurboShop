if (typeof window.JxPopover === 'undefined') {
	window.JxPopover = function (toggleNode, options) {
		toggleNode = (typeof toggleNode === 'object' && toggleNode && toggleNode instanceof Node) ? toggleNode : null;
		options = (typeof options === 'object' && options) ? options : {};

		this.toggleNode = toggleNode;

		var _private = {
			inited: false,
		};

		let _options = JSON.stringify(options);

		Object.defineProperties(this, {
			inited: {
				get: function () {
					return _private.inited;
				},
				set: function (value) {
					if (value) {
						_private.inited = true;
					}
				},
			},

			options: {
				get: function () {
					return JSON.parse(_options);
				},
			},
		});

		this.init();
	};

	window.JxPopover.prototype = {
		node: null,
		toggleNode: null,
		drag: null,
		overlay: null,

		get visible() {
			return this.node && Turbo.hasClass(this.node, 'show');
		},

		get trigger() {
			let tmp = this.options.trigger;
			if (typeof tmp === 'string') {
				tmp = tmp.split(',');
			}

			if (typeof tmp === 'object' && tmp && tmp.length) {
				for (let i = 0, cnt = tmp.length; i < cnt; ++i) {
					tmp[i] = tmp[i].trim();
				}
			}
			else {
				tmp = [];
			}

			let trigger = [];
			if (tmp.indexOf('click') !== -1) {
				trigger.push('click');
			}
			if (tmp.indexOf('hover') !== -1) {
				trigger.push('hover');
			}
			if (!trigger.length) {
				trigger.push('click');
			}

			return trigger;
		},

		get placement() {
			let tmp = this.options.placement;
			if (typeof tmp === 'string') {
				tmp = tmp.split(',');
			}
			else if (typeof tmp === 'object' && tmp && tmp.length) {
				tmp = [tmp[0], tmp[1]];
			}
			else {
				tmp = ['top', ''];
			}

			let placement = [
				tmp.indexOf('bottom') !== -1 ? 'bottom' : (tmp.indexOf('top') !== -1 ? 'top' : ''),
				tmp.indexOf('right') !== -1 ? 'right' : (tmp.indexOf('left') !== -1 ? 'left' : ''),
			];

			return placement;
		},

		get offset() {
			let tmp = this.options.offset;
			if (typeof tmp === 'string') {
				tmp = tmp.split(',');
			}
			else if (typeof tmp === 'object' && tmp && tmp.length) {
				tmp = [tmp[0], tmp[1]];
			}
			else {
				tmp = [0, 0];
			}

			let offset = [
				typeof tmp[0] === 'string' ? tmp[0] : 0,
				typeof tmp[1] === 'string' ? tmp[1] : 0,
			];

			return offset;
		},

		get sticky() {
			let tmp = this.options.sticky;
			let sticky = typeof tmp === 'boolean' ? tmp : true;

			return sticky;
		},

		init: function () {
			if (!this.inited) {
				this.inited = true;
				this.toggleNode.xpopover = this;

				this.delayedHide.cnt = 0;
				this.delayedHide.timer = false;
				this.setPosition.timer = false;
				this.resetPosition();
			}
		},

		bindEvents: function () {
			if (this.trigger.indexOf('hover') !== -1) {
				if (typeof this.handlers.onLeave === 'function') {
					Turbo.bind(this.toggleNode, 'mouseleave', Turbo.proxy(this.handlers.onLeave, this));
					Turbo.bind(this.node, 'mouseleave', Turbo.proxy(this.handlers.onLeave, this));
				}

				if (typeof this.handlers.onEnter === 'function') {
					Turbo.bind(this.toggleNode, 'mouseenter', Turbo.proxy(this.handlers.onEnter, this));
					Turbo.bind(this.node, 'mouseenter', Turbo.proxy(this.handlers.onEnter, this));
				}
			}

			if (window.JxPopover.isTouch()) {
				Turbo.bind(this.node, 'touchstart', Turbo.proxy(this.handlers.onTouchStart, this));
				Turbo.bind(this.node, 'touchmove', Turbo.proxy(this.handlers.onTouchMove, this));
				Turbo.bind(this.node, 'touchend', Turbo.proxy(this.handlers.onTouchEnd, this));
				Turbo.bind(this.node, 'touchcancel', Turbo.proxy(this.handlers.onTouchCancel, this));
			}
		},

		unbindEvents: function () {
			if (this.trigger.indexOf('hover') !== -1) {
				if (typeof this.handlers.onLeave === 'function') {
					Turbo.unbind(this.toggleNode, 'mouseleave', Turbo.proxy(this.handlers.onLeave, this));
					Turbo.unbind(this.node, 'mouseleave', Turbo.proxy(this.handlers.onLeave, this));
				}

				if (typeof this.handlers.onEnter === 'function') {
					Turbo.unbind(this.toggleNode, 'mouseenter', Turbo.proxy(this.handlers.onEnter, this));
					Turbo.unbind(this.node, 'mouseenter', Turbo.proxy(this.handlers.onEnter, this));
				}
			}

			if (window.JxPopover.isTouch()) {
				Turbo.unbind(this.node, 'touchstart', Turbo.proxy(this.handlers.onTouchStart, this));
				Turbo.unbind(this.node, 'touchmove', Turbo.proxy(this.handlers.onTouchMove, this));
				Turbo.unbind(this.node, 'touchend', Turbo.proxy(this.handlers.onTouchEnd, this));
				Turbo.unbind(this.node, 'touchcancel', Turbo.proxy(this.handlers.onTouchCancel, this));
			}
		},

		append: function () {
			let translateX = this.offset[0] === 'center' ? '-50%' : this.offset[0];
			let translateY = this.offset[1] === 'center' ? '-50%' : this.offset[1];

			this.node = Turbo.create({
				tag: 'div',
				attrs: {
					class: 'xpopover',
				},
				style: {
					transform: 'translate(' + translateX + ',' + translateY + ')',
				}
			});

			this.drag = Turbo.create({
				tag: 'div',
				attrs: {
					class: 'xpopover-drag',
				},
			});

			this.node.append(this.drag);

			let content = this.getContent();
			if (content) {
				this.node.append(content);
			}

			this.node.xpopover = this;

			Turbo.append(this.node, document.body);
		},

		show: function () {
			if (!this.visible) {
				window.JxPopover.hide();

				this.resetPosition();

				if (!this.node) {
					this.append();
				}

				if (this.node) {
					this.bindEvents();

					this.setPosition(true);
					Turbo.addClass(this.node, 'show');

					if (this.setPosition.timer) {
						clearInterval(this.setPosition.timer);
					}

					this.setPosition.timer = setInterval(
						() => {
							this.setPosition();
						}, 200
					);
				}
			}
		},

		hide: function () {
			if (this.visible) {
				if (this.setPosition.timer) {
					clearTimeout(this.setPosition.timer);
					this.setPosition.timer = false;
				}

				this.resetPosition();

				this.removeOverlay();
				this.unbindEvents();
				Turbo.removeClass(this.node, 'show');

				setTimeout(() => {
					Turbo.remove(this.node);
					this.node = null;
				}, 200);
			}
		},

		toggle: function () {
			if (this.visible) {
				this.hide();
			}
			else {
				this.show();
			}
		},

		delayedHide: function () {
			if (this.delayedHide.cnt > 0) {
				clearTimeout(this.delayedHide.timer);
				this.delayedHide.timer = false;
			}
			else {
				this.delayedHide.cnt = 0;

				if (!this.delayedHide.timer) {
					this.delayedHide.timer = setTimeout(
						() => {
							this.hide();
							this.delayedHide.timer = false;
							this.delayedHide.cnt = 0;
						}, 1000
					);
				}
			}
		},

		position: {
			real: {
				left: null,
				top: null,
			},
			applyed: {
				left: null,
				top: null,
				ww: null,
				wh: null,
				changed: false,
			},
			calculated: {
				left: null,
				top: null,
				ww: null,
				wh: null,
				changed: false,
			},
			last: {
				left: null,
				top: null,
				ww: null,
				wh: null,
			},
		},

		resetPosition: function () {
			this.position = {
				real: {
					left: null,
					top: null,
				},
				applyed: {
					left: null,
					top: null,
					ww: null,
					wh: null,
					changed: false,
				},
				calculated: {
					left: null,
					top: null,
					ww: null,
					wh: null,
					changed: false,
				},
				last: {
					left: null,
					top: null,
					ww: null,
					wh: null,
				},
			};
		},

		calcPosition: function () {
			if (
				this.toggleNode &&
				this.node
			) {
				let toggleNodeOffset = this.toggleNode.getBoundingClientRect();
				this.position.calculated.left = parseInt(toggleNodeOffset.left + (this.placement[1] === 'right' ? toggleNodeOffset.width : (this.placement[1] === 'left' ? -1 * this.node.offsetWidth : 0)));
				this.position.calculated.top = parseInt(toggleNodeOffset.top + (this.placement[0] === 'bottom' ? toggleNodeOffset.height : (this.placement[0] === 'top' ? -1 * this.node.offsetHeight : 0)));
				this.position.calculated.ww = document.body.offsetWidth;
				this.position.calculated.wh = window.innerHeight;

				this.position.calculated.changed = this.position.calculated.top !== this.position.last.top || this.position.calculated.left !== this.position.last.left || this.position.calculated.wh !== this.position.last.wh || this.position.calculated.ww !== this.position.last.ww;

				this.position.applyed.changed = this.position.calculated.top !== this.position.applyed.top || this.position.calculated.left !== this.position.applyed.left || this.position.calculated.wh !== this.position.applyed.wh || this.position.calculated.ww !== this.position.applyed.ww;
			}
		},

		swapPosition: function () {
			this.position.last.left = this.position.calculated.left;
			this.position.last.top = this.position.calculated.top;
			this.position.last.ww = this.position.calculated.ww;
			this.position.last.wh = this.position.calculated.wh;
		},

		setPosition: function (force = false) {
			if (
				this.toggleNode &&
				this.toggleNode.offsetParent !== null // toggle visible
			) {
				if (
					this.node &&
					(force || !window.JxPopover.skipSetPosition)
				) {
					if (window.JxPopover.isMobile()) {
						this.addOverlay();
					}
					else {
						this.removeOverlay();

						this.calcPosition();

						if (this.position.calculated.changed) {
							this.swapPosition();

							if (force) {
								if (this.sticky) {
									this.applyStickyPosition();
								}
								else {
									this.applyPosition();
								}
							}
							else {
								this.hide();
							}
						}
					}
				}
			}
			else {
				this.hide();
			}
		},

		applyPosition: function (left = null, top = null) {
			if (this.node) {
				this.position.real.left = (typeof left !== 'undefined' && left !== null ? left : this.position.calculated.left);
				this.position.real.top = (typeof top !== 'undefined' && top != null ? top : this.position.calculated.top);

				Turbo.style(this.node, 'left', this.position.real.left + 'px');
				Turbo.style(this.node, 'top', this.position.real.top + 'px');

				this.position.applyed.left = this.position.calculated.left;
				this.position.applyed.top = this.position.calculated.top;
				this.position.applyed.ww = this.position.calculated.ww;
				this.position.applyed.wh = this.position.calculated.wh;
			}
		},

		applyStickyPosition: function () {
			if (
				this.sticky &&
				this.toggleNode &&
				this.node
			) {
				if (!window.JxPopover.isMobile()) {
					this.calcPosition();

					let clone = this.node.cloneNode(true);
					clone.classList.add('clone');
					clone.style.left = this.position.calculated.left + 'px';
					clone.style.top = this.position.calculated.top + 'px';
					Turbo.append(clone, document.body);

					let cloneOffset = clone.getBoundingClientRect();
					cloneOffset = {
						x: Math.round(cloneOffset.x),
						left: Math.round(cloneOffset.x),
						right: Math.round(cloneOffset.x + cloneOffset.width),
						y: Math.round(cloneOffset.y),
						top: Math.round(cloneOffset.y),
						bottom: Math.round(cloneOffset.y + cloneOffset.height),
					};

					let left = parseInt(clone.style.left);
					left = isNaN(left) ? 0 : left;
					if (cloneOffset.x <= 0) {
						left += -1 * cloneOffset.x;
					}
					else if (cloneOffset.right >= document.body.offsetWidth) {
						left -= cloneOffset.right - document.body.offsetWidth;
					}

					let top = parseInt(clone.style.top);
					top = isNaN(top) ? 0 : top;
					if (cloneOffset.y <= 0) {
						top += -1 * cloneOffset.y;
					}
					else if (cloneOffset.bottom >= window.innerHeight) {
						top -= cloneOffset.bottom - window.innerHeight;
					}

					clone.remove();

					this.applyPosition(left, top);
				}
			}
		},

		getContent: function () {
			if (this.toggleNode) {
				let template = this.toggleNode.querySelector('.xpopover-template');
				if (template) {
					return template.content.cloneNode(true);
				}

				return null;
			}
		},

		touch: null,

		handlers: {
			onLeave: function (event) {
				if (!window.JxPopover.isMobile()) {
					event = event || window.event;
					--this.delayedHide.cnt;
					this.delayedHide();
				}
			},

			onEnter: function (event) {
				if (!window.JxPopover.isMobile()) {
					event = event || window.event;
					++this.delayedHide.cnt;
					this.delayedHide();
				}
			},

			onTouchStart: function (event) {
				if (window.JxPopover.isMobile()) {
					event = event || window.event;

					let target = event.target || event.srcElement;
					if (target) {
						let scroll = target.closest('.scrollbar');
						if (scroll) {
							if (scroll.scrollTop) {
								return;
							}
						}
					}

					if (
						event.changedTouches &&
						event.changedTouches.length
					) {
						this.touch = event.changedTouches[0];
						this.touch.time = new Date().getTime()
					}
				}
			},

			onTouchMove: function (event) {
				if (window.JxPopover.isMobile()) {
					event = event || window.event;

					if (
						event.changedTouches &&
						event.changedTouches.length &&
						this.touch
					) {
						let touch = event.changedTouches[0];
						let bottom = touch.screenY - this.touch.screenY;
						if (bottom >= 0) {
							this.node.style.setProperty('bottom', `-${bottom}px`, 'important');
						}
					}
				}
			},

			onTouchEnd: function (event) {
				if (window.JxPopover.isMobile()) {
					event = event || window.event;

					if (
						event.changedTouches &&
						event.changedTouches.length &&
						this.touch
					) {
						let touch = event.changedTouches[0];
						let bottom = touch.screenY - this.touch.screenY;
						let height = this.node.clientHeight;
						let time = new Date().getTime();
						let speed = (time - this.touch.time) / bottom;
						if (bottom > 0) {
							if (
								bottom >= 100 ||
								bottom > height / 2 ||
								speed < 2
							) {
								this.node.style.setProperty('transform', 'translate(0,100%)', 'important');
								setTimeout(() => {
									this.hide();
								}, 300);

								return;
							}
						}

						this.node.style.bottom = '';
						this.touch = null;
					}
				}
			},

			onTouchCancel: function (event) {
				if (window.JxPopover.isMobile()) {
					event = event || window.event;

					this.node.style.bottom = '';
					this.touch = null;
				}
			},
		},

		addOverlay: function () {
			if (
				!this.overlay &&
				this.node
			) {
				this.overlay = Turbo.create({
					tag: 'div',
					attrs: {
						class: 'xpopover-overlay',
					},
				});

				this.node.parentNode.insertBefore(this.overlay, this.node);
				this.overlay.xpopover = this;
				this.fixBody();
			}
		},

		removeOverlay: function () {
			if (this.overlay) {
				this.unfixBody();
				this.overlay.remove();
				this.overlay = null;
			}
		},

		fixBody: function () {
			let diffWidth = window.innerWidth - document.documentElement.clientWidth;
			if (diffWidth) {
				document.body.style.paddingRight = diffWidth + 'px';
			}

			document.body.style.height = '100vh';
			document.body.style.overflow = 'hidden';
		},

		unfixBody: function () {
			document.body.style.paddingRight = '';
			document.body.style.height = '';
			document.body.style.overflow = '';
		},
	};

	window.JxPopover.handlers = {
		onToggleNodeClick: function (event) {
			event = event || window.event;

			let toggleNode = this.closest('[data-xpopover]');
			let popover = JxPopover.get(toggleNode);
			if (popover) {
				if (
					popover.trigger.indexOf('click') !== -1 ||
					window.JxPopover.isMobile() ||
					window.JxPopover.isTouch()
				) {
					event.preventDefault();
					popover.toggle();
				}
			}
		},

		onDocOver: function (event) {
			if (window.JxPopover.isTouch()) {
				return;
			}

			event = event || window.event;
			let target = event.target;
			if (target) {
				let toggleNode = target.closest('[data-xpopover]');
				let popover = JxPopover.get(toggleNode);
				if (popover) {
					if (
						popover.trigger.indexOf('hover') !== -1 &&
						!popover.visible
					) {
						if (
							window.JxPopover.handlers.onDocOver.timer &&
							window.JxPopover.handlers.onDocOver.toggleNode &&
							!window.JxPopover.handlers.onDocOver.toggleNode.isEqualNode(toggleNode)
						) {
							clearTimeout(window.JxPopover.handlers.onDocOver.timer);
							window.JxPopover.handlers.onDocOver.timer = false;
						}

						if (!window.JxPopover.handlers.onDocOver.timer) {
							window.JxPopover.handlers.onDocOver.toggleNode = toggleNode;
							let toggleNodePosition = toggleNode.getBoundingClientRect();

							window.JxPopover.handlers.onDocOver.timer = setTimeout(function () {
								window.JxPopover.handlers.onDocOver.timer = false;

								let toggleNodePositionNew = popover.toggleNode.getBoundingClientRect();
								if (
									(toggleNodePosition.top == toggleNodePositionNew.top) &&
									(toggleNodePosition.left == toggleNodePositionNew.left)
								) {
									popover.show();
								}
							}, 1000);
						}

						return;
					}
				}
			}

			if (window.JxPopover.handlers.onDocOver.timer) {
				clearTimeout(window.JxPopover.handlers.onDocOver.timer);
				window.JxPopover.handlers.onDocOver.timer = false;
			}
		},

		onOverlayClick: function (event) {
			event = event || window.event;

			let target = event.target;
			if (target) {
				let popover = target.xpopover;

				if (
					typeof popover !== 'undefined' &&
					popover &&
					popover instanceof JxPopover
				) {
					popover.hide();
				}
				else {
					target.remove();
				}
			}
		},

		onDocClick: function (event) {
			event = event || window.event;

			let target = event.target;
			if (target) {
				let toggleNode = target.closest('.xpopover-toggle');
				if (toggleNode) {
					return;
				}

				let overlay = target.closest('.xpopover-overlay');
				if (overlay) {
					return;
				}

				let popover = target.closest('.xpopover');
				if (popover) {
					return;
				}
			}

			window.JxPopover.hide();
		},

		onWindowResize: function (event) {
			if (!window.JxPopover.isMobile()) {
				window.JxPopover.hide();
			}
		},
	}

	window.JxPopover.get = function (toggleNode) {
		if (toggleNode) {
			if (
				typeof toggleNode.xpopover === 'undefined' ||
				!(toggleNode.xpopover instanceof JxPopover)
			) {
				let options = {};

				let data = toggleNode.getAttribute('data-xpopover');
				if (data) {
					try {
						options = JSON.parse(data);
					}
					catch (e) {
						options = {};
					}
				}

				return new JxPopover(toggleNode, options);
			}

			return toggleNode.xpopover;
		}

		return null;
	}

	window.JxPopover.hide = function () {
		let visiblePopovers = document.querySelectorAll('.xpopover.show');
		if (visiblePopovers.length) {
			visiblePopovers.forEach((popover) => {
				if (
					typeof popover.xpopover !== 'undefined' &&
					popover.xpopover instanceof JxPopover
				) {
					popover.xpopover.hide();
				}
			});
		}
	}

	window.JxPopover.isMobile = function () {
		return window.matchMedia('(max-width: 380px)').matches ||
			(
				window.devicePixelRatio >= 2 &&
				window.matchMedia('(max-width: 760px)').matches
			);
	}

	window.JxPopover.isTouch = function () {
		return document.documentElement.classList.contains('tb-touch');
	}

	window.JxPopover.bindEvents = function () {
		if (typeof window.JxPopover.handlers.onToggleNodeClick === 'function') {
			Turbo.bindDelegate(document, 'click', { className: 'xpopover-toggle' }, window.JxPopover.handlers.onToggleNodeClick);
		}

		if (!window.JxPopover.isTouch()) {
			if (typeof window.JxPopover.handlers.onDocOver === 'function') {
				Turbo.bind(document, 'mouseover', window.JxPopover.handlers.onDocOver);
			}
		}

		if (typeof window.JxPopover.handlers.onDocClick === 'function') {
			Turbo.bind(document, 'click', window.JxPopover.handlers.onDocClick);
		}

		if (typeof window.JxPopover.handlers.onOverlayClick === 'function') {
			Turbo.bindDelegate(document, 'click', { className: 'xpopover-overlay' }, window.JxPopover.handlers.onOverlayClick);
		}

		if (typeof window.JxPopover.handlers.onWindowResize === 'function') {
			window.onresize = window.JxPopover.handlers.onWindowResize;
		}
	}

	window.JxPopover.bindEvents();
}
