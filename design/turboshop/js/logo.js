if (typeof window.JLogo === 'undefined') {
	window.JLogo = function (node, params) {
		var _private = {
			inited: false,
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
			node: {
				get: function () {
					return node;
				}
			},
			img: {
				get: function () {
					return node ? node.querySelector('img') : null;
				}
			},
			svg: {
				get: function () {
					return node ? node.querySelector('svg') : null;
				}
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

		this.init();
	}

	window.JLogo.prototype = {
		get src() {
			return this.img ? this.img.getAttribute('src') : '';
		},

		set src(value) {
			if (this.img) {
				this.img.setAttribute('src', value);
			}
		},

		get srcDark() {
			return turboOptions.THEME.LOGO_IMAGE;
		},

		get srcLight() {
			return turboOptions.THEME.LOGO_IMAGE_WHITE;
		},

		get color() {
			if (this.img) {
				let src = this.src;

				return src === this.srcDark ? 'dark' : (src === this.srcLight ? 'light' : '');
			}

			return '';
		},

		set color(value) {
			if (this.canChangeColor) {
				if (this.color !== value) {
					this.src = (value === 'light' ? this.srcLight : this.srcDark);
				}
			}
		},

		get isMainLogo() {
			return Boolean(this.node.closest('header'));
		},

		get canChangeColor() {
			return this.img && (!this.isMainLogo || !Turbo.hasClass(document.body, 'header_opacity'));
		},

		setColorOfBanner: function (banner) {
			if (
				this.img &&
				banner
			) {
				if (typeof window.headerLogo !== 'undefined') {
					value = Turbo.data(banner, 'color');
					value = value ? value : 'dark';
					if (this.color !== value) {
						this.node.setAttribute('src', value === 'light' ? this.srcLight : this.srcDark);
					}
				}
			}
		},

		get isPreferColor() {
			return Turbo.hasClass(document.body, 'theme-default');
		},

		get preferColor() {
			return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
		},

		get themeColor() {
			if (this.isPreferColor) {
				return this.preferColor;
			}
			else {
				return Turbo.hasClass(document.body, 'theme-dark') ? 'dark' : 'light';
			}
		},

		init: function () {
			if (!this.inited) {
				this.inited = true;

				if (this.img) {
					this.color = this.getInvertedColor(this.themeColor);

					this.bindEvents();
				}
			}
		},

		getInvertedColor: function (value) {
			if (value === 'default') {
				value = this.preferColor;
			}

			return value === 'light' ? 'dark' : (value === 'dark' ? 'light' : '');
		},

		bindEvents: function () {
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
		},

		unbindEvents: function () {

		},

		handlers: {
			onChangePrefersColorScheme: function (event) {
				if (!event) {
					event = window.event;
				}

				let newColor = event.matches ? 'dark' : 'light';

				if (this.isPreferColor) {
					this.color = this.getInvertedColor(newColor);
				}

				Turbo.setCookie('prefers-color-scheme', newColor);
			},

			onChangeThemeColor: function (eventdata) {
				if (
					typeof eventdata === 'object' &&
					eventdata &&
					'value' in eventdata
				) {
					this.color = this.getInvertedColor(eventdata.value);
				}
			},
		}
	}

	let readyFunc = typeof readyDOM === 'function' ? readyDOM : Turbo.ready;
	readyFunc(function () {
		window.headerLogo = new JLogo(document.querySelector('header .logo'));
		window.headerfixedLogo = new JLogo(document.querySelector('#headerfixed .header .logo'));
		window.mobileheaderLogo = new JLogo(document.querySelector('#mobileheader .mobileheader .logo'));
		window.mobilemenuLogo = new JLogo(document.querySelector('#mobilemenu .mobilemenu .logo'));
		Turbo.setCookie('prefers-color-scheme', window.headerLogo.preferColor);
	});
}