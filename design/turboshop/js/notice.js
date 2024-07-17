if (typeof window.JNotice === "undefined") {
	let svgError = `<svg width="60" height="60" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg">
      <path d="M40.7071 19.2929C41.0976 19.6834 41.0976 20.3166 40.7071 20.7071L31.4142 30L40.7071 39.2929C41.0976 39.6834 41.0976 40.3166 40.7071 40.7071C40.3166 41.0976 39.6834 41.0976 39.2929 40.7071L30 31.4142L20.7071 40.7071C20.3166 41.0976 19.6834 41.0976 19.2929 40.7071C18.9024 40.3166 18.9024 39.6834 19.2929 39.2929L28.5858 30L19.2929 20.7071C18.9024 20.3166 18.9024 19.6834 19.2929 19.2929C19.6834 18.9024 20.3166 18.9024 20.7071 19.2929L30 28.5858L39.2929 19.2929C39.6834 18.9024 40.3166 18.9024 40.7071 19.2929Z"/>
      <path fill-rule="evenodd" clip-rule="evenodd" d="M0 30C0 13.4315 13.4315 0 30 0C46.5685 0 60 13.4315 60 30C60 46.5685 46.5685 60 30 60C13.4315 60 0 46.5685 0 30ZM30 2C14.536 2 2 14.536 2 30C2 45.464 14.536 58 30 58C45.464 58 58 45.464 58 30C58 14.536 45.464 2 30 2Z"/>
      </svg>`;

	let svgAuth = `<svg width="60" height="60" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M30 14C22.8203 14 17 19.8203 17 27C17 34.1797 22.8203 40 30 40C37.1797 40 43 34.1797 43 27C43 19.8203 37.1797 14 30 14ZM19 27C19 20.9249 23.9249 16 30 16C36.0751 16 41 20.9249 41 27C41 33.0751 36.0751 38 30 38C23.9249 38 19 33.0751 19 27Z"/>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M0 30C0 13.4315 13.4315 0 30 0C46.5685 0 60 13.4315 60 30C60 46.5685 46.5685 60 30 60C13.4315 60 0 46.5685 0 30ZM30 2C14.536 2 2 14.536 2 30C2 38.8944 6.14718 46.8202 12.6133 51.9492C17.5183 48.4552 23.5206 46.4 30 46.4C36.4794 46.4 42.4817 48.4552 47.3866 51.9492C53.8528 46.8202 58 38.8944 58 30C58 14.536 45.464 2 30 2ZM30 58C24.1894 58 18.7922 56.2301 14.3182 53.1999C18.792 50.1697 24.188 48.4 30 48.4C35.812 48.4 41.208 50.1698 45.6818 53.1999C41.2077 56.2301 35.8106 58 30 58Z"/>
    <g opacity="0.1">
    <path d="M31.5 39C36.7467 39 41 34.9706 41 30C41 25.0294 36.7467 21 31.5 21C26.2533 21 22 25.0294 22 30C22 34.9706 26.2533 39 31.5 39Z"/>
    <path d="M18 55.8C19.9882 54.4667 25.3811 51 32.5385 51C39.6959 51 43.6154 52.6 45 53.4C42.9231 55.8 38.1834 59 32.2189 59C26.2544 59 20.7692 57.4 18 55.8Z"/>
    </g>
    </svg>`;

	window.JNoticeSurface = function (config) {
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
				},
			},
		});

		this.config = function (key) {
			if (typeof config === "object") {
				if (typeof key !== "undefined") {
					if (Object.keys(config).indexOf(key) > -1) {
						return config[key];
					}
				}
			}

			return undefined;
		};

		this.init();
	};

	window.JNoticeSurface.prototype = {
		node: null,
		inner: null,
		notices: [],
		bUseJquery: false,

		get side() {
			var side = this.config("side");
			return side === "left" ? "left" : "right";
		},
		get reverse() {
			return Boolean(this.config("reverse"));
		},
		get classname() {
			return "notice-surface--" + this.side + (this.reverse ? " notice-surface--reverse" : "");
		},

		init: function () {
			if (!this.inited) {
				this.inited = true;

				this.node = Turbo.create({
					tag: "div",
					attrs: {
						class: "notice-surface " + this.classname,
					},
					html: '<div class="notice-surface__inner"></div>',
				});

				this.node.noticeSurface = this;
				this.inner = this.node.querySelector(".notice-surface__inner");

				this.bUseJquery = typeof jQuery === "function";

				Turbo.ready(
					Turbo.delegate(function () {
						Turbo.append(this.node, document.body);
					}, this)
				);
			}
		},

		search: function (notice) {
			if (typeof notice !== "undefined" && notice instanceof window.JNotice) {
				for (var i in this.notices) {
					if (this.notices[i] === notice) {
						return i;
					}
				}
			}

			return false;
		},

		create: function (config) {
			var notice = new JNotice(config);
			notice.appendTo(this);

			return notice;
		},

		append: function (notice) {
			if (typeof notice !== "undefined" && notice instanceof window.JNotice) {
				if (notice.removed || (notice.inserted && notice.surface !== this)) {
					return false;
				}

				var index = this.search(notice);

				if (!index) {
					this.notices.push(notice);
					index = this.notices.length - 1;
					Turbo.prepend(notice.node, this.inner);
				}

				if (!notice.inserted) {
					notice.appendTo(this);
				}

				return index;
			}

			return false;
		},

		remove: function (index) {
			if (typeof index !== "undefined") {
				if (typeof this.notices[index] !== "undefined") {
					var notice = this.notices[index];

					delete this.notices[index];
					this.notices.splice(index, 1);

					Turbo.remove(notice.node);

					notice.remove();
				}
			}
		},

		clear: function () {
			for (i in this.notices) {
				if (typeof this.notices[i] !== "undefined") {
					this.notices[i].remove();
				}
			}

			this.notices = [];
		},

		getItemName: function (options) {
			let item = options.item;
			let name = "";
			let detail = item.querySelector(".js-popup-title");
			if (detail) {
				name = detail.textContent;
			}

			if (options.useDataItem !== false) {
				var data = item.querySelector("[data-item]");
				if (data) {
					data = this.bUseJquery ? jQuery(data).data("item") : Turbo.data(data, "item");

					if (data) {
						if (!this.bUseJquery) {
							try {
								data = JSON.parse(data.toString());
								if (typeof data !== "object" || !data) {
									data = {};
								}
							} catch (e) {
								data = {};
							}
						}

						if (data) {
							name = data.NAME;
						}
					}
				}
			}

			return name;
		},

		getItemImg: function (options) {
			let item = options.item;
			let src = "";
			let image = item.querySelector(".detail-info__image, .js-popup-image");
			if (image) {
				let dataSrc = this.bUseJquery ? jQuery(image).data("src") : Turbo.data(image, "src");
				if (dataSrc) {
					src = dataSrc;
				}
			} else if ((image = item.querySelector("meta[itemprop=image]"))) {
				src = image.getAttribute("content");
			} else if ((image = item.querySelector(".image-list__link link[itemprop=image]"))) {
				src = image.getAttribute("href");
			} else if ((image = item.querySelector(".image-list-wrapper img"))) {
				src = image.getAttribute("src");
				let dataSrc = this.bUseJquery ? jQuery(image).data("src") : Turbo.data(image, "src");
				if (dataSrc && !Turbo.hasClass(image, "lazyloaded")) {
					src = dataSrc;
				}
			}

			return src;
		},

		onRequestError: function (xhr) {
			var content = {
				title: Turbo.message("NOTICE_REQUEST_ERROR"),
				detail: xhr.status + ' ' + xhr.statusText,
				image: svgError,
			};

			return this.create({
				closeable: true,
				autoclose: 3000,
				type: "requesterror",
				content: content,
			});
		},

		onRatingError: function () {
			var content = {
				title: Turbo.message("NOTICE_REQUEST_ERROR"),
				detail: Turbo.message("NOTICE_RATING_ERROR"),
				image: svgError,
			};

			return this.create({
				closeable: true,
				autoclose: 3000,
				type: "requesterror",
				content: content,
			});
		},

		onResultError: function (response) {
			var content = {
				title: Turbo.message("NOTICE_ERROR"),
				detail: response.error,
				image: svgError,
			};

			return this.create({
				closeable: true,
				autoclose: 3000,
				type: "resulterror",
				content: content,
			});
		},

		onAdd2Cart: function (params) {
			var content = {
				title: Turbo.message("NOTICE_ADDED2CART"),
				detail: params.detail,
				image: params.image,
			};

			return this.create({
				closeable: true,
				type: "add2cart",
				autoclose: 3000,
				link: turboOptions.PAGES.BASKET_PAGE_URL,
				content: content,
			});
		},

		onAdd2Compare: function (params) {
			var content = {
				title: Turbo.message("NOTICE_ADDED2COMPARE"),
				detail: params.detail,
				image: params.image,
			};

			return this.create({
				closeable: true,
				type: "add2compare",
				autoclose: 3000,
				link: turboOptions.PAGES.COMPARE_PAGE_URL,
				content: content,
			});
		},

		onAdd2Favorite: function (params) {
			var content = {
				title: Turbo.message("NOTICE_ADDED2FAVORITE"),
				detail: params.detail,
				image: params.image,
			};

			return this.create({
				closeable: true,
				type: "add2favorite",
				autoclose: 3000,
				link: turboOptions.PAGES.WISHLIST_PAGE_URL,
				content: content,
			});
		},
	};

	window.JNoticeSurface.get = function (config) {
		config = typeof config === "object" ? config : {};
		var side = config.side === "left" ? "left" : "right";
		var reverse = Boolean(config.reverse);
		var classname =
			".notice-surface.notice-surface--" +
			side +
			(reverse ? ".notice-surface--reverse" : ":not(.notice-surface--reverse)");
		var surface = document.querySelector(classname);
		if (surface) {
			surface = surface.noticeSurface;
		} else {
			surface = new window.JNoticeSurface(config);
		}

		return surface;
	};

	window.JNotice = function (config) {
		var _private = {
			surface: false,
			inited: false,
			removed: false,
		};

		Object.defineProperties(this, {
			surface: {
				get: function () {
					return _private.surface;
				},
				set: function (value) {
					if (
						typeof value !== "undefined" &&
						value instanceof window.JNoticeSurface &&
						!this.inserted &&
						!this.removed
					) {
						_private.surface = value;
						value.append(this);

						this.show();

						Turbo.onCustomEvent("onAppendNotice", { notice: this });
					}
				},
			},
			inserted: {
				get: function () {
					return _private.surface instanceof window.JNoticeSurface;
				},
			},
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
			removed: {
				get: function () {
					return _private.removed;
				},
				set: function (value) {
					if (value) {
						_private.removed = true;
					}
				},
			},
		});

		this.config = function (key) {
			if (typeof config === "object") {
				if (typeof key !== "undefined") {
					if (Object.keys(config).indexOf(key) > -1) {
						return config[key];
					}
				}
			}

			return undefined;
		};

		this.init();
	};

	window.JNotice.prototype = {
		node: null,
		inner: null,
		closer: null,
		handlers: {
			onClickNode: function (event) {
				if (!event) {
					event = window.event;
				}

				var target = event.target || event.srcElement;

				if (typeof target !== "undefined" && target) {
					if (!target.closest("a")) {
						if (!target.closest(".notice__closer")) {
							Turbo.PreventDefault(event);

							var notice = target.closest(".notice");
							if (notice) {
								notice = notice.notice;

								console.log('click', notice);

								if (notice.link.length) {
									location.href = notice.link;
								}
							}
						}
					}
				}
			},
			onMouseEnterNode: function (event) {
				if (!event) {
					event = window.event;
				}

				var target = event.target || event.srcElement;

				if (typeof target !== "undefined" && target) {
					var notice = target.closest(".notice");
					if (notice) {
						notice = notice.notice;

						if (notice.autoclose) {
							if (!notice.closed) {
								notice.stopAutoClose();
							}
						}
					}
				}
			},
			onMouseLeaveNode: function (event) {
				if (!event) {
					event = window.event;
				}

				var target = event.target || event.srcElement;

				if (typeof target !== "undefined" && target) {
					var notice = target.closest(".notice");
					if (notice) {
						notice = notice.notice;

						Turbo.removeClass(notice.node, "animate--notice-click");

						if (!notice.closed) {
							notice.startAutoClose();
						}
					}
				}
			},
			onMouseDownNode: function (event) {
				if (!event) {
					event = window.event;
				}

				var target = event.target || event.srcElement;

				if (typeof target !== "undefined" && target) {
					var notice = target.closest(".notice");
					if (notice) {
						notice = notice.notice;

						Turbo.addClass(notice.node, "animate--notice-click");
					}
				}
			},
			onMouseUpNode: function (event) {
				if (!event) {
					event = window.event;
				}

				var target = event.target || event.srcElement;

				if (typeof target !== "undefined" && target) {
					var notice = target.closest(".notice");
					if (notice) {
						notice = notice.notice;

						Turbo.removeClass(notice.node, "animate--notice-click");
					}
				}
			},
			onClickCloser: function (event) {
				if (!event) {
					event = window.event;
				}

				var target = event.target || event.srcElement;

				if (typeof target !== "undefined" && target) {
					// there is need IE hack for svg target here
					// var notice = target.closest('.notice');

					var notice = null;
					var parent = target;
					while (parent) {
						if (parent.matches(".notice")) {
							notice = parent;
							break;
						} else {
							parent = parent.parentElement || parent.parentNode;
						}
					}

					if (notice) {
						notice = notice.notice;

						Turbo.addClass(notice.node, "notice--closed");
						notice.remove();
					}
				}
			},
		},

		get visible() {
			return !Turbo.hasClass(this.node, "notice--hidden") && this.inserted;
		},
		get closed() {
			return Turbo.hasClass(this.node, "notice--closed");
		},
		get closeable() {
			return Boolean(this.config("closeable"));
		},
		get autoclose() {
			var autoclose = parseInt(this.config("autoclose"));
			return autoclose ? autoclose : 0;
		},
		get classname() {
			var classname = this.config("classname");
			return typeof classname === "string" ? classname : "";
		},
		get type() {
			var type = this.config("type");
			return typeof type === "string" ? type : "";
		},
		get link() {
			var link = this.config("link");
			return typeof link === "string" ? link : "";
		},
		get content() {
			var content = this.config("content");

			if (typeof content === "function") {
				content = content();
			}

			if (typeof content === "object") {
				var title =
					typeof content.title !== "undefined" && content.title
						? typeof content.title === "function"
							? content.title()
							: content.title.toString()
						: "";
				var detail =
					typeof content.detail !== "undefined" && content.detail
						? typeof content.detail === "function"
							? content.detail()
							: content.detail.toString()
						: "";
				var image =
					typeof content.image !== "undefined" && content.image
						? typeof content.image === "function"
							? content.image()
							: content.image.toString()
						: "";

				var bSvgImage = image.match(/^<svg[\s>]/);

				var image_link =
					typeof content.image_link !== "undefined" && content.image_link
						? typeof content.image_link === "function"
							? content.image_link()
							: content.image_link.toString()
						: "";

				if (title.length || detail.length || image.length) {
					content = '<div class="line-block line-block--20 line-block--align-flex-start">';

					if (image) {
						content +=
							'<div class="line-block__item"><div class="notice__image' + (bSvgImage ? ' notice__image--svg' : '') + '">' +
							(image_link ? '<a href="' + image_link + '">' : "") +
							(
								bSvgImage ?
									'<i class="svg inline fill-theme-svg" aria-hidden="true">' + image + '</i>' :
									'<img src="' + image + '" />'
							) +
							(image_link ? "</a>" : "") +
							"</div></div>";
					}
					if (title || detail) {
						content += '<div class="line-block__item">';
						if (title) {
							content += '<div class="notice__title switcher-title font_bold">' + title + "</div>";
						}
						if (detail) {
							content += '<div class="notice__detail font_14">' + detail + "</div>";
						}
						content += "</div>";
					}

					content += "</div>";
				}
			}

			if (typeof content === "undefined") {
				return "";
			} else {
				return content.toString();
			}
		},

		init: function () {
			if (!this.inited) {
				this.inited = true;

				var closer = this.closeable
					? '<span class="notice__closer stroke-theme-hover" title="' +
					Turbo.message("NOTICE_CLOSE") +
					'"><i class="svg inline" aria-hidden="true"><svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M13 1L1 13M1 1L13 13" stroke="#999999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></svg></i></span>'
					: "";

				this.node = Turbo.create({
					tag: "div",
					attrs: {
						class:
							"notice notice--hidden" +
							(this.classname.length ? " " + this.classname : "") +
							(this.link.length ? " notice--link" : ""),
					},
					dataset: {
						type: this.type,
					},
					html: closer + '<div class="notice__inner">' + this.content + "</div>",
				});

				this.node.notice = this;
				this.inner = this.node.querySelector(".notice__inner");
				if (this.closeable) {
					this.closer = this.node.querySelector(".notice__closer");
				}

				this.bindEvents();

				Turbo.onCustomEvent("onInitNotice", { notice: this });
			}
		},

		bindEvents: function () {
			if (this.node) {
				if (typeof this.handlers.onClickNode === "function") {
					this.node.addEventListener("click", this.handlers.onClickNode);
				}

				if (typeof this.handlers.onMouseEnterNode === "function") {
					this.node.addEventListener("mouseenter", this.handlers.onMouseEnterNode);
				}

				if (typeof this.handlers.onMouseLeaveNode === "function") {
					this.node.addEventListener("mouseleave", this.handlers.onMouseLeaveNode);
				}

				if (typeof this.handlers.onMouseEnterNode === "function") {
					this.node.addEventListener("mousedown", this.handlers.onMouseDownNode);
				}

				if (typeof this.handlers.onMouseLeaveNode === "function") {
					this.node.addEventListener("mouseup", this.handlers.onMouseUpNode);
				}
			}

			if (this.closeable) {
				if (this.closer && typeof this.handlers.onClickCloser === "function") {
					this.closer.addEventListener("click", this.handlers.onClickCloser);
				}
			}
		},

		unbindEvents: function () {
			if (this.node) {
				if (typeof this.handlers.onClickNode === "function") {
					this.node.removeEventListener("click", this.handlers.onClickNode);
				}

				if (typeof this.handlers.onMouseEnterNode === "function") {
					this.node.removeEventListener("mouseenter", this.handlers.onMouseEnterNode);
				}

				if (typeof this.handlers.onMouseLeaveNode === "function") {
					this.node.removeEventListener("mouseleave", this.handlers.onMouseLeaveNode);
				}

				if (typeof this.handlers.onMouseEnterNode === "function") {
					this.node.removeEventListener("mousedown", this.handlers.onMouseDownNode);
				}

				if (typeof this.handlers.onMouseLeaveNode === "function") {
					this.node.removeEventListener("mouseup", this.handlers.onMouseUpNode);
				}
			}

			if (this.closer && typeof this.handlers.onClickCloser === "function") {
				this.closer.removeEventListener("click", this.handlers.onClickCloser);
			}
		},

		callback: function (callback) {
			if (typeof callback === "function") {
				callback();
			}
		},

		appendTo: function (surface) {
			this.surface = surface;
		},

		show: function (callback) {
			if (!this.visible) {
				Turbo.addClass(this.node, "animate--notice-show");
				Turbo.removeClass(this.node, "notice--hidden");

				setTimeout(
					Turbo.delegate(function () {
						Turbo.removeClass(this.node, "animate--notice-show");
						this.startAutoClose();

						this.callback(callback);
					}, this),
					600
				);

				Turbo.onCustomEvent("onShowNotice", { notice: this });
			} else {
				this.callback(callback);
			}
		},

		hide: function (callback) {
			if (this.visible) {
				var that = this;

				setTimeout(function () {
					that.node.style.height = that.node.getBoundingClientRect().height + "px";
					that.node.style.opacity = 1;

					setTimeout(function () {
						Turbo.addClass(that.node, "animate--notice-hide");

						setTimeout(function () {
							Turbo.addClass(that.node, "notice--hidden");
							Turbo.removeClass(that.node, "animate--notice-hide");

							that.callback(callback);
						}, 700);
					}, 25);

					Turbo.onCustomEvent("onHideNotice", { notice: that });
				}, 100);
			} else {
				this.callback(callback);
			}
		},

		remove: function () {
			if (!this.removed) {
				this.removed = true;

				this.hide(
					Turbo.delegate(function () {
						this.unbindEvents();

						if (this.inserted) {
							this.surface.remove(this.surface.search(this));
						}

						Turbo.onCustomEvent("onRemoveNotice", { notice: this });
					}, this)
				);
			}
		},

		startAutoClose: function () {
			this.stopAutoClose();

			if (this.autoclose) {
				this.autocloseTimer = setTimeout(
					Turbo.delegate(function () {
						this.remove();
					}, this),
					this.autoclose
				);
			}
		},

		stopAutoClose: function () {
			if (typeof this.autocloseTimer !== "undefined" && this.autocloseTimer) {
				clearTimeout(this.autocloseTimer);
				this.autocloseTimer = false;
			}
		},
	};
}
