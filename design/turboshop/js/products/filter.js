Turbo.namespace("Turbo.Iblock.SmartFilter");
Turbo.Iblock.SmartFilter = (function () {
	var SmartFilter = function (arParams) {
		if (typeof arParams === "object") {
			this.leftSlider = Turbo(arParams.leftSlider);
			this.rightSlider = Turbo(arParams.rightSlider);
			this.tracker = Turbo(arParams.tracker);
			this.trackerWrap = Turbo(arParams.trackerWrap);

			this.minInput = Turbo(arParams.minInputId);
			this.maxInput = Turbo(arParams.maxInputId);

			this.minPrice = parseFloat(arParams.minPrice);
			this.maxPrice = parseFloat(arParams.maxPrice);

			this.curMinPrice = parseFloat(arParams.curMinPrice);
			this.curMaxPrice = parseFloat(arParams.curMaxPrice);

			this.fltMinPrice = arParams.fltMinPrice ? parseFloat(arParams.fltMinPrice) : parseFloat(arParams.curMinPrice);
			this.fltMaxPrice = arParams.fltMaxPrice ? parseFloat(arParams.fltMaxPrice) : parseFloat(arParams.curMaxPrice);

			this.precision = arParams.precision || 0;

			this.priceDiff = this.maxPrice - this.minPrice;

			this.leftPercent = arParams.leftPercent ? parseFloat(arParams.leftPercent) : 0;
			this.rightPercent = arParams.rightPercent ? parseFloat(arParams.rightPercent) : 0;

			this.fltMinPercent = 0;
			this.fltMaxPercent = 0;

			this.colorUnavailableActive = Turbo(arParams.colorUnavailableActive); //gray
			this.colorAvailableActive = Turbo(arParams.colorAvailableActive); //blue
			this.colorAvailableInactive = Turbo(arParams.colorAvailableInactive); //light blue

			this.isTouch = false;

			this.init();

			if ("ontouchstart" in document.documentElement || "ontouchstart" in window) {
				this.isTouch = true;

				Turbo.bind(
					this.leftSlider,
					"touchstart",
					Turbo.proxy(function (event) {
						this.onMoveLeftSlider(event);
					}, this)
				);

				Turbo.bind(
					this.rightSlider,
					"touchstart",
					Turbo.proxy(function (event) {
						this.onMoveRightSlider(event);
					}, this)
				);

				Turbo.bind(
					this.colorAvailableActive,
					"touchstart",
					Turbo.proxy(function (event) {
						this.onChangeLeftSlider(event);
					}, this)
				);

				Turbo.bind(
					this.colorUnavailableActive,
					"touchstart",
					Turbo.proxy(function (event) {
						this.onChangeLeftSlider(event);
					}, this)
				);

				Turbo.bind(
					this.colorAvailableInactive,
					"touchstart",
					Turbo.proxy(function (event) {
						this.onChangeLeftSlider(event);
					}, this)
				);
			} else {
				Turbo.bind(
					this.leftSlider,
					"mousedown",
					Turbo.proxy(function (event) {
						this.onMoveLeftSlider(event);
					}, this)
				);

				Turbo.bind(
					this.rightSlider,
					"mousedown",
					Turbo.proxy(function (event) {
						this.onMoveRightSlider(event);
					}, this)
				);

				Turbo.bind(
					this.colorAvailableActive,
					"mousedown",
					Turbo.proxy(function (event) {
						this.onChangeLeftSlider(event);
					}, this)
				);

				Turbo.bind(
					this.colorUnavailableActive,
					"mousedown",
					Turbo.proxy(function (event) {
						this.onChangeLeftSlider(event);
					}, this)
				);

				Turbo.bind(
					this.colorAvailableInactive,
					"mousedown",
					Turbo.proxy(function (event) {
						this.onChangeLeftSlider(event);
					}, this)
				);
			}

			Turbo.bind(
				this.minInput,
				"keyup",
				Turbo.proxy(function (event) {
					this.onInputChange();
				}, this)
			);

			Turbo.bind(
				this.maxInput,
				"keyup",
				Turbo.proxy(function (event) {
					this.onInputChange();
				}, this)
			);
		}
	};

	SmartFilter.prototype.init = function () {
		var priceDiff;

		if (this.curMinPrice > this.minPrice) {
			priceDiff = this.curMinPrice - this.minPrice;
			this.leftPercent = (priceDiff * 100) / this.priceDiff;

			this.leftSlider.style.left = this.leftPercent + "%";
			this.colorUnavailableActive.style.left = this.leftPercent + "%";
		}

		this.setMinFilteredValue(this.fltMinPrice);

		if (this.curMaxPrice < this.maxPrice) {
			priceDiff = this.maxPrice - this.curMaxPrice;
			this.rightPercent = (priceDiff * 100) / this.priceDiff;

			this.rightSlider.style.right = this.rightPercent + "%";
			this.colorUnavailableActive.style.right = this.rightPercent + "%";
		}

		this.setMaxFilteredValue(this.fltMaxPrice);
	};

	SmartFilter.prototype.setMinFilteredValue = function (fltMinPrice) {
		this.fltMinPrice = parseFloat(fltMinPrice);
		if (this.fltMinPrice >= this.minPrice) {
			var priceDiff = this.fltMinPrice - this.minPrice;
			this.fltMinPercent = (priceDiff * 100) / this.priceDiff;

			if (this.leftPercent > this.fltMinPercent) this.colorAvailableActive.style.left = this.leftPercent + "%";
			else this.colorAvailableActive.style.left = this.fltMinPercent + "%";

			this.colorAvailableInactive.style.left = this.fltMinPercent + "%";
		} else {
			this.colorAvailableActive.style.left = "0%";
			this.colorAvailableInactive.style.left = "0%";
		}
	};

	SmartFilter.prototype.setMaxFilteredValue = function (fltMaxPrice) {
		this.fltMaxPrice = parseFloat(fltMaxPrice);
		if (this.fltMaxPrice <= this.maxPrice) {
			var priceDiff = this.maxPrice - this.fltMaxPrice;
			this.fltMaxPercent = (priceDiff * 100) / this.priceDiff;

			if (this.rightPercent > this.fltMaxPercent) this.colorAvailableActive.style.right = this.rightPercent + "%";
			else this.colorAvailableActive.style.right = this.fltMaxPercent + "%";

			this.colorAvailableInactive.style.right = this.fltMaxPercent + "%";
		} else {
			this.colorAvailableActive.style.right = "0%";
			this.colorAvailableInactive.style.right = "0%";
		}
	};

	SmartFilter.prototype.getXCoord = function (elem) {
		var box = elem.getBoundingClientRect();
		var body = document.body;
		var docElem = document.documentElement;

		var scrollLeft = window.pageXOffset || docElem.scrollLeft || body.scrollLeft;
		var clientLeft = docElem.clientLeft || body.clientLeft || 0;
		var left = box.left + scrollLeft - clientLeft;

		return Math.round(left);
	};

	SmartFilter.prototype.getPageX = function (e) {
		e = e || window.event;
		var pageX = null;

		if (this.isTouch && e.targetTouches[0] != null) {
			pageX = e.targetTouches[0].pageX;
		} else if (e.pageX != null) {
			pageX = e.pageX;
		} else if (e.clientX != null) {
			var html = document.documentElement;
			var body = document.body;

			pageX = e.clientX + (html.scrollLeft || (body && body.scrollLeft) || 0);
			pageX -= html.clientLeft || 0;
		}

		return pageX;
	};

	SmartFilter.prototype.recountMinPrice = function () {
		var newMinPrice = (this.priceDiff * this.leftPercent) / 100;
		newMinPrice = (this.minPrice + newMinPrice).toFixed(this.precision);

		if (newMinPrice != this.minPrice) this.minInput.value = newMinPrice;
		else this.minInput.value = "";
	};

	SmartFilter.prototype.recountMaxPrice = function () {
		var newMaxPrice = (this.priceDiff * this.rightPercent) / 100;
		newMaxPrice = (this.maxPrice - newMaxPrice).toFixed(this.precision);

		if (newMaxPrice != this.maxPrice) this.maxInput.value = newMaxPrice;
		else this.maxInput.value = "";
	};

	SmartFilter.prototype.onInputChange = function () {
		var priceDiff;
		if (this.minInput.value) {
			var leftInputValue = this.minInput.value;
			if (leftInputValue < this.minPrice) leftInputValue = this.minPrice;

			if (leftInputValue > this.maxPrice) leftInputValue = this.maxPrice;

			priceDiff = leftInputValue - this.minPrice;
			this.leftPercent = (priceDiff * 100) / this.priceDiff;

			this.makeLeftSliderMove(false);
		}

		if (this.maxInput.value) {
			var rightInputValue = this.maxInput.value;
			if (rightInputValue < this.minPrice) rightInputValue = this.minPrice;

			if (rightInputValue > this.maxPrice) rightInputValue = this.maxPrice;

			priceDiff = this.maxPrice - rightInputValue;
			this.rightPercent = (priceDiff * 100) / this.priceDiff;

			this.makeRightSliderMove(false);
		}
	};

	SmartFilter.prototype.makeLeftSliderMove = function (recountPrice) {
		recountPrice = recountPrice !== false;

		this.leftSlider.style.left = this.leftPercent + "%";
		this.colorUnavailableActive.style.left = this.leftPercent + "%";

		var areBothSlidersMoving = false;
		if (this.leftPercent + this.rightPercent >= 100) {
			areBothSlidersMoving = true;
			this.rightPercent = 100 - this.leftPercent;
			this.rightSlider.style.right = this.rightPercent + "%";
			this.colorUnavailableActive.style.right = this.rightPercent + "%";
		}

		if (this.leftPercent >= this.fltMinPercent && this.leftPercent <= 100 - this.fltMaxPercent) {
			this.colorAvailableActive.style.left = this.leftPercent + "%";
			if (areBothSlidersMoving) {
				this.colorAvailableActive.style.right = 100 - this.leftPercent + "%";
			}
		} else if (this.leftPercent <= this.fltMinPercent) {
			this.colorAvailableActive.style.left = this.fltMinPercent + "%";
			if (areBothSlidersMoving) {
				this.colorAvailableActive.style.right = 100 - this.fltMinPercent + "%";
			}
		} else if (this.leftPercent >= this.fltMaxPercent) {
			this.colorAvailableActive.style.left = 100 - this.fltMaxPercent + "%";
			if (areBothSlidersMoving) {
				this.colorAvailableActive.style.right = this.fltMaxPercent + "%";
			}
		}

		if (recountPrice) {
			this.recountMinPrice();
			if (areBothSlidersMoving) this.recountMaxPrice();
		}
	};

	SmartFilter.prototype.countNewLeft = function (event) {
		var pageX = this.getPageX(event);

		var trackerXCoord = this.getXCoord(this.trackerWrap);
		var rightEdge = this.trackerWrap.offsetWidth;

		var newLeft = pageX - trackerXCoord;

		if (newLeft < 0) newLeft = 0;
		else if (newLeft > rightEdge) newLeft = rightEdge;

		return newLeft;
	};

	SmartFilter.prototype.onMoveLeftSlider = function (e) {
		if (!this.isTouch) {
			this.leftSlider.ondragstart = function () {
				return false;
			};
		}

		$(".tb_filter .tb_filter_parameters_box_container input").prop("disabled", false);

		if (!this.isTouch) {
			document.onmousemove = Turbo.proxy(function (event) {
				this.leftPercent = (this.countNewLeft(event) * 100) / this.trackerWrap.offsetWidth;
				this.makeLeftSliderMove();
			}, this);

			document.onmouseup = function () {
				document.onmousemove = document.onmouseup = null;
			};
		} else {
			var onMoveFunction = Turbo.proxy(function (event) {
				this.leftPercent = (this.countNewLeft(event) * 100) / this.trackerWrap.offsetWidth;
				this.makeLeftSliderMove();
			}, this);

			var onEndFunction = Turbo.proxy(function (event) {
				window.removeEventListener("touchmove", onMoveFunction, false);
				window.removeEventListener("touchend", onEndFunction, false);
				onMoveFunction = onEndFunction = null;
			}, this);

			window.addEventListener("touchmove", onMoveFunction, false);
			window.addEventListener("touchend", onEndFunction, false);

			/*document.ontouchmove = Turbo.proxy(function(event) {
						  this.leftPercent = ((this.countNewLeft(event)*100)/this.trackerWrap.offsetWidth);
						  this.makeLeftSliderMove();
					  }, this);
	  
					  document.ontouchend = function() {
						  document.ontouchmove = document.touchend = null;
					  };*/
		}

		return false;
	};

	SmartFilter.prototype.makeRightSliderMove = function (recountPrice) {
		recountPrice = recountPrice !== false;

		this.rightSlider.style.right = this.rightPercent + "%";
		this.colorUnavailableActive.style.right = this.rightPercent + "%";

		var areBothSlidersMoving = false;
		if (this.leftPercent + this.rightPercent >= 100) {
			areBothSlidersMoving = true;
			this.leftPercent = 100 - this.rightPercent;
			this.leftSlider.style.left = this.leftPercent + "%";
			this.colorUnavailableActive.style.left = this.leftPercent + "%";
		}

		if (100 - this.rightPercent >= this.fltMinPercent && this.rightPercent >= this.fltMaxPercent) {
			this.colorAvailableActive.style.right = this.rightPercent + "%";
			if (areBothSlidersMoving) {
				this.colorAvailableActive.style.left = 100 - this.rightPercent + "%";
			}
		} else if (this.rightPercent <= this.fltMaxPercent) {
			this.colorAvailableActive.style.right = this.fltMaxPercent + "%";
			if (areBothSlidersMoving) {
				this.colorAvailableActive.style.left = 100 - this.fltMaxPercent + "%";
			}
		} else if (100 - this.rightPercent <= this.fltMinPercent) {
			this.colorAvailableActive.style.right = 100 - this.fltMinPercent + "%";
			if (areBothSlidersMoving) {
				this.colorAvailableActive.style.left = this.fltMinPercent + "%";
			}
		}

		if (recountPrice) {
			this.recountMaxPrice();
			if (areBothSlidersMoving) this.recountMinPrice();
		}
	};

	SmartFilter.prototype.onMoveRightSlider = function (e) {
		if (!this.isTouch) {
			this.rightSlider.ondragstart = function () {
				return false;
			};
		}

		$(".tb_filter .tb_filter_parameters_box_container input").prop("disabled", false);

		if (!this.isTouch) {
			document.onmousemove = Turbo.proxy(function (event) {
				this.rightPercent = 100 - (this.countNewLeft(event) * 100) / this.trackerWrap.offsetWidth;
				this.makeRightSliderMove();
			}, this);

			document.onmouseup = function () {
				document.onmousemove = document.onmouseup = null;
			};
		} else {
			var onMoveFunction = Turbo.proxy(function (event) {
				this.rightPercent = 100 - (this.countNewLeft(event) * 100) / this.trackerWrap.offsetWidth;
				this.makeRightSliderMove();
			}, this);

			var onEndFunction = Turbo.proxy(function (event) {
				window.removeEventListener("touchmove", onMoveFunction, false);
				window.removeEventListener("touchend", onEndFunction, false);
				onMoveFunction = onEndFunction = null;
			}, this);

			window.addEventListener("touchmove", onMoveFunction, false);
			window.addEventListener("touchend", onEndFunction, false);

			/*document.ontouchmove = Turbo.proxy(function(event) {
						  this.rightPercent = 100-(((this.countNewLeft(event))*100)/(this.trackerWrap.offsetWidth));
						  this.makeRightSliderMove();
					  }, this);
	  
					  document.ontouchend = function() {
						  document.ontouchmove = document.ontouchend = null;
					  };*/
		}

		return false;
	};

	SmartFilter.prototype.onChangeLeftSlider = function (e) {
		if (!this.isTouch) {
			this.leftSlider.ondragstart = function () {
				//return false;
			};
		}
		if (!this.isTouch) {
			// document.onmousedown = Turbo.proxy(function(event) {
			var percent = (this.countNewLeft(event) * 100) / this.trackerWrap.offsetWidth;
			if ($(event.target).is(".tb_ui_slider_handle") || !$(event.target).is("[class^=tb_ui_slider]")) return;
			if (percent < 50) {
				this.leftPercent = percent + 1;
				this.makeLeftSliderMove();
			} else {
				this.rightPercent = 100 - percent;
				this.makeRightSliderMove();
			}
			// }, this);

			document.onmouseup = function () {
				document.onmousemove = document.onmouseup = null;
			};
		} else {
			var percent = (this.countNewLeft(e) * 100) / this.trackerWrap.offsetWidth;
			if ($(e.target).is(".tb_ui_slider_handle")) return;
			if (percent < 50) {
				this.leftPercent = percent;
				this.makeLeftSliderMove();
			} else {
				this.rightPercent = 100 - percent;
				this.makeRightSliderMove();
			}

			/*document.ontouchend = Turbo.proxy(function(event) {
						  var percent=((this.countNewLeft(event)*100)/this.trackerWrap.offsetWidth);
						  if($(event.target).is(".tb_ui_slider_handle"))
							  return;
						  if(percent<50){
							  this.leftPercent = percent;
							  this.makeLeftSliderMove();
						  }else{
							  this.rightPercent = 100-percent;
							  this.makeRightSliderMove();
						  }
					  }, this);
	  
					  document.ontouchend = function() {
						  document.ontouchmove = document.touchend = null;
					  };*/
		}

		return false;
	};

	return SmartFilter;
})();
