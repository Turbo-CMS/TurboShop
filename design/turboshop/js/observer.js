if (
	typeof AMutationObserver === 'undefined' &&
	typeof MutationObserver === 'function'
) {
	(function (w, d) {
		"use strict";

		/* ES5 class definition */
		var _AMutationObserver = /*#__PURE__*/function (_MutationObserver) {
			"use strict";

			_inheritsLoose(_AMutationObserver, _MutationObserver);

			function _AMutationObserver(callback) {
				var _this;

				_this = _MutationObserver.call(this, function (mutationsList, observer) {
					if (_AMutationObserver.ignore || observer.paused) {// ignore mutations without disconnect()
						//console.log('ignore observer callback', observer.id);
					}
					else {
						callback(mutationsList, observer);
					}
				}) || this;

				_this.paused = true;
				_this.id = Math.floor(Math.random() * Math.floor(1000));

				try {
					eval('@');
				}
				catch (e) {
					// define parent script
					if (typeof e.stack === 'string') {
						_this.stack = e.stack.match(/[^\s]*:[\d]+:[\d]+[^\s]/g);
						_this.stack.splice(0, 1);
						var script = _this.stack[0];
						script = script.replace(/^(.*[/])?(.*\.js)(.*)$/ig, '$2');
						_this.id = script.replace(/(\.min)?\.js$/i, '');
					}
				}
				finally {
					//console.log('new observer', _this.id);
				}

				return _this;
			}

			var _proto = _AMutationObserver.prototype;

			_proto.observe = function observe(target, options) {
				this.target = target;
				this.options = options;
				this.paused = false;

				if (typeof _AMutationObserver.observers[this.id] === 'undefined') {
					_AMutationObserver.observers[this.id] = this;
				}

				_MutationObserver.prototype.observe.call(this, target, options);
			};

			_proto.disconnect = function disconnect() {
				this.paused = true;

				_MutationObserver.prototype.disconnect.call(this);
			};

			_proto.takeRecords = function takeRecords() {
				if (_AMutationObserver.ignore || this.paused) {
					// ignore mutations without disconnect()
					//console.log('ignore observer takeRecords', this.id);
					return [];
				}
				else {
					return _MutationObserver.prototype.takeRecords.call(this);
				}
			};

			_proto.pause = function pause() {
				this.paused = true;
			};

			_proto.resume = function resume() {
				if (typeof this.options !== 'false') {
					this.paused = false;
				}
			};

			return _AMutationObserver;
		}( /*#__PURE__*/_wrapNativeSuper(MutationObserver));

		_AMutationObserver.ignore = false;
		_AMutationObserver.observers = [];
		_AMutationObserver.parent = MutationObserver;
		_AMutationObserver.toString = function () {
			return 'function MutationObserver() { [native code] }';
		}
		MutationObserver = _AMutationObserver;

		/* ES2015 Babel functions (loose) */
		function _inheritsLoose(subClass, superClass) { subClass.prototype = Object.create(superClass.prototype); subClass.prototype.constructor = subClass; subClass.__proto__ = superClass; }

		function _wrapNativeSuper(Class) { var _cache = typeof Map === "function" ? new Map() : undefined; _wrapNativeSuper = function _wrapNativeSuper(Class) { if (Class === null || !_isNativeFunction(Class)) return Class; if (typeof Class !== "function") { throw new TypeError("Super expression must either be null or a function"); } if (typeof _cache !== "undefined") { if (_cache.has(Class)) return _cache.get(Class); _cache.set(Class, Wrapper); } function Wrapper() { return _construct(Class, arguments, _getPrototypeOf(this).constructor); } Wrapper.prototype = Object.create(Class.prototype, { constructor: { value: Wrapper, enumerable: false, writable: true, configurable: true } }); return _setPrototypeOf(Wrapper, Class); }; return _wrapNativeSuper(Class); }

		function _construct(Parent, args, Class) { if (_isNativeReflectConstruct()) { _construct = Reflect.construct; } else { _construct = function _construct(Parent, args, Class) { var a = [null]; a.push.apply(a, args); var Constructor = Function.bind.apply(Parent, a); var instance = new Constructor(); if (Class) _setPrototypeOf(instance, Class.prototype); return instance; }; } return _construct.apply(null, arguments); }

		function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Date.prototype.toString.call(Reflect.construct(Date, [], function () { })); return true; } catch (e) { return false; } }

		function _isNativeFunction(fn) { return Function.toString.call(fn).indexOf("[native code]") !== -1; }

		function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }

		function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }
	})(window, document);
}