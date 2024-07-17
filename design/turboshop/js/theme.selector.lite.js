if (typeof window.JThemeSelector === 'undefined') {
	window.JThemeSelector = function (id, params, result) {
		var _private = {
			inited: false,
			id: id,
		};

		Object.defineProperties(this, {
			inited: {
				get: function () {
					return _private.inited;
				},
				set: function (value) {
					if (value) {
						_private.inited = true;
					}
				}
			},
			id: {
				get: function () {
					return _private.id;
				},
			},
		});

		this.params = function (key) {
			if (typeof params === 'object') {
				if (typeof key !== 'undefined') {
					if (Object.keys(params).indexOf(key) > -1) {
						return params[key];
					}
				}
			}

			return undefined;
		}

		this.result = function (key) {
			if (typeof result === 'object') {
				if (typeof key !== 'undefined') {
					if (Object.keys(result).indexOf(key) > -1) {
						return result[key];
					}
				}
			}

			return undefined;
		}

		this.init();
	}

	window.JThemeSelector.prototype = {
		node: null,

		get color() {
			if (this.isDefaultColor) {
				return 'default';
			} else {
				return Turbo.hasClass(document.body, 'theme-dark') ? 'dark' : 'light';
			}
		},
		set color(value) {
			if (
				this.node &&
				(
					value === 'light' ||
					value === 'dark' ||
					value === 'default'
				)
			) {
				let color = value;

				if (value === 'default') {
					color = this.defaultColor;
				}

				let item = this.node.querySelector('.theme-selector__item--' + color);
				if (
					item &&
					!Turbo.hasClass(item, 'current')
				) {
					Turbo.addClass(item, 'current');

					this.node.setAttribute('title', Turbo.message('TS_T_' + color));

					let items = Array.prototype.slice.call(this.node.querySelectorAll('.theme-selector__item.current:not(.theme-selector__item--' + color + ')'));
					if (items.length) {
						for (let i = 0; i < items.length; ++i) {
							Turbo.removeClass(items[i], 'current');
						}
					}
				}

				let changed = !Turbo.hasClass(document.body, 'theme-' + value);

				if (changed) {
					Turbo.removeClass(document.body, 'theme-default theme-dark theme-light');
					Turbo.addClass(document.body, 'theme-' + value);

					let items = Array.prototype.slice.call(document.querySelectorAll('.style-switcher [data-option-id="THEME_VIEW_COLOR"]'));
					if (items.length) {
						for (let i = 0; i < items.length; ++i) {
							let val = items[i].getAttribute('data-option-value');
							if (
								val &&
								val.toLowerCase() === value
							) {
								Turbo.addClass(items[i], 'current');
							} else {
								Turbo.removeClass(items[i], 'current');
							}
						}
					}

					let fd = new FormData();
					fd.set('color', value);
					/* this.sendAction('setColor', fd); */

					Turbo.onCustomEvent(
						'onChangeThemeColor',
						[{
							value: value,
						}]
					);
				}
			}
		},

		get isDefaultColor() {
			return Turbo.hasClass(document.body, 'theme-default');
		},

		get defaultColor() {
			return window.matchMedia("(prefers-color-scheme: dark)").matches ? 'dark' : 'light';
		},

		init: function () {
			if (!this.inited) {
				this.inited = true;

				this.node = Turbo('theme-selector--' + this.id);
				if (this.node) {
					this.node.theme_selector = this;

					this.bindEvents();

					// set current item as current body class
					this.color = this.color;
				}
			}
		},

		bindEvents: function () {
			if (this.node) {
				if (typeof this.handlers.onNodeClick === 'function') {
					Turbo.bind(
						this.node,
						'click',
						Turbo.proxy(
							this.handlers.onNodeClick,
							this
						)
					);
				}

				if (typeof this.handlers.onChangePrefersColorScheme === 'function') {
					window.matchMedia('(prefers-color-scheme: dark)').addEventListener(
						'change',
						Turbo.proxy(
							this.handlers.onChangePrefersColorScheme,
							this
						)
					);
				}

				if (typeof this.handlers.onChangeThemeColor === 'function') {
					Turbo.addCustomEvent(
						'onChangeThemeColor',
						Turbo.proxy(
							this.handlers.onChangeThemeColor,
							this
						)
					);
				}
			}
		},

		unbindEvents: function () {
			if (this.node) {
				if (typeof this.handlers.onNodeClick === 'function') {
					Turbo.unbind(
						this.node,
						'click',
						Turbo.proxy(
							this.handlers.onNodeClick,
							this
						)
					);
				}

				if (typeof this.handlers.onChangePrefersColorScheme === 'function') {
					window.matchMedia('(prefers-color-scheme: dark)').removeEventListener(
						'change',
						Turbo.proxy(
							this.handlers.onChangePrefersColorScheme,
							this
						)
					);
				}

				if (typeof this.handlers.onChangeThemeColor === 'function') {
					Turbo.removeCustomEvent(
						'onChangeThemeColor',
						Turbo.proxy(
							this.handlers.onChangeThemeColor,
							this
						)
					);
				}
			}
		},

		handlers: {
			onNodeClick: function (event) {
				// current color
				let color = this.isDefaultColor ? this.defaultColor : this.color;

				// invert color
				this.color = color === 'light' ? 'dark' : 'light';
			},

			onChangePrefersColorScheme: function (event) {
				if (this.isDefaultColor) {
					if (!event) {
						event = window.event;
					}

					this.color = 'default';
				}
			},

			onChangeThemeColor: function (eventdata) {
				if (
					typeof eventdata === 'object' &&
					eventdata &&
					'value' in eventdata
				) {
					this.color = eventdata.value;
				}
			},
		},
	}
}
