var players = {};

function pauseMainBanner() {
	// $(".banners-big .owl-carousel").trigger("stop.owl.autoplay");
	$(".banners-big .main-slider").data("swiper").autoplay.stop();
}

function playMainBanner() {
	/*$(".banners-big .owl-carousel").trigger("play.owl.autoplay");
	if ($(".banners-big .owl-carousel").is(":hover")) {
	  $(".banners-big .owl-carousel").trigger("mouseover.owl.autoplay");
	}
	*/
	if ($(".banners-big .main-slider").data("swiper").params.autoplay.enabled) {
		$(".banners-big .main-slider").data("swiper").autoplay.start();
	}
}

function startMainBannerSlideVideo($slide) {
	var slideActiveIndex = $slide.attr("data-slide_index");
	var $slides = $slide.closest(".main-slider").find('.main-slider__item[data-slide_index="' + slideActiveIndex + '"]'); // current slide & cloned
	var videoSource = $slide.attr("data-video_source");

	if (videoSource) {
		$slides.addClass("loading");
		pauseMainBanner();

		// var $slider = $slide.closest(".owl-carousel");
		var $slider = $slide.closest(".main-slider");
		var slidesIndexesWithVideo = $slider.data("slidesIndexesWithVideo");
		if (typeof slidesIndexesWithVideo === "undefined") {
			slidesIndexesWithVideo = [];
		}
		slidesIndexesWithVideo.push(slideActiveIndex);
		$slider.data("slidesIndexesWithVideo", slidesIndexesWithVideo);

		var videoPlayerSrc = $slide.attr("data-video_src");
		var videoSoundDisabled = $slide.attr("data-video_disable_sound");
		var bVideoSoundDisabled = videoSoundDisabled == 1;
		var videoLoop = $slide.attr("data-video_loop");
		var bVideoLoop = videoLoop == 1;
		var videoCover = $slide.attr("data-video_cover");
		var bVideoCover = videoCover == 1;
		var videoUnderText = $slide.attr("data-video_under_text");
		var bVideoUnderText = videoUnderText == 1;
		var videoPlayer = $slide.attr("data-video_player");
		var bVideoPlayerYoutube = videoPlayer === "YOUTUBE";
		var bVideoPlayerVimeo = videoPlayer === "VIMEO";
		var bVideoPlayerHtml5 = videoPlayer === "HTML5";
		var videoWidth = bVideoPlayerHtml5 ? false : $slide.attr("data-video_width");
		var videoHeight = bVideoPlayerHtml5 ? false : $slide.attr("data-video_height");

		if (videoPlayerSrc && !$slide.find(".video").length) {
			var InitPlayer = function () {
				// prepare videoID
				var videoIDs = [];
				for (var i = 0; i < $slides.length; ++i) {
					var videoID = getRandomInt(100, 1000);
					videoIDs.push(videoID);
				}

				// console.log("InitPlayer", videoIDs);

				$slides.each(function (i, node) {
					var $_slide = $(node);
					var videoID = videoIDs[i];
					var videoClass = $_slide.attr("id") + " player_" + videoID + (bVideoCover ? " cover" : "");

					if (!$_slide.find(".video." + videoClass).length) {
						if (bVideoPlayerYoutube) {
							$_slide.prepend(
								'<div class="wrapper_video"><iframe id="player_' +
								videoID +
								'" class="video ' +
								videoClass +
								'" src="' +
								videoPlayerSrc +
								'" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen allow="accelerometer; encrypted-media; gyroscope; fullscreen;"' +
								(videoWidth && videoHeight ? ' data-video_proportion="' + videoWidth / videoHeight + '"' : "") +
								"></iframe></div>"
							);
						} else if (bVideoPlayerVimeo) {
							$_slide.prepend(
								'<div class="wrapper_video"><iframe id="player_' +
								videoID +
								'" class="video ' +
								videoClass +
								'" src="' +
								videoPlayerSrc +
								'" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen allow="accelerometer; encrypted-media; gyroscope; fullscreen;"' +
								(videoWidth && videoHeight ? ' data-video_proportion="' + videoWidth / videoHeight + '"' : "") +
								"></iframe></div>"
							);
						} else if (bVideoPlayerHtml5) {
							$_slide.prepend(
								'<div class="wrapper_video"><video autobuffer playsinline webkit-playsinline id="player_' +
								videoID +
								'" class="video ' +
								videoClass +
								'"' +
								(bVideoLoop ? " loop " : "") +
								(bVideoSoundDisabled ? " muted " : "") +
								'><source src="' +
								videoPlayerSrc +
								'" type=\'video/mp4; codecs="avc1.42E01E, mp4a.40.2"\' /><p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that supports HTML5 video</p></iframe></div>'
							);
						}
					}

					if (typeof players !== "undefined" && players) {
						players[videoID] = {
							id: "player_" + videoID,
							mute: bVideoSoundDisabled,
							loop: bVideoLoop,
							cover: bVideoCover,
							videoPlayer: videoPlayer,
							slideIndex: slideActiveIndex,
							playing: false,
							clones: videoIDs,
							videoWidth: videoWidth,
							videoHeight: videoHeight,
							videoProportion: videoWidth && videoHeight ? videoWidth / videoHeight : false,
							src: videoPlayerSrc,
						};

						if (bVideoPlayerYoutube) {
							window[players[videoID].id] = new YT.Player(players[videoID].id, {
								events: {
									onReady: function (e) {
										if (videoID) {
											var mute = players[videoID].mute;
											var cover = players[videoID].cover;
											var $slide = $("#player_" + videoID).closest(".main-slider__item");
											var hidden = !$("#player_" + videoID).closest(".swiper-slide-active").length;
											// var hidden = !$("#player_" + videoID).closest(".owl-item.active").length;
											// console.log("onReady", videoID, hidden);

											// mute sound
											if (mute || hidden) {
												window[players[videoID].id].mute();
											}

											// cover video
											if (cover) {
												// get video`s original size
												if (!players[videoID].videoProportion) {
													var embedHtml = e.target.getVideoEmbedCode();
													if (embedHtml.length) {
														var match = embedHtml.match(/width="(\d*)"[^>]*height="(\d*)"/);
														if (match !== null) {
															var videoWidth = match[1];
															var videoHeight = match[2];

															players[videoID].videoWidth = videoWidth;
															players[videoID].videoHeight = videoHeight;
															players[videoID].videoProportion = videoWidth / videoHeight;

															$slide.find(".video").attr("data-video_proportion", players[videoID].videoProportion);
														}
													}
												}

												CoverPlayer();
											}

											if (hidden) {
												// not start hidden video playing
												// console.log("pause hidden", videoID);
												setTimeout(function () {
													e.target.pauseVideo();
												}, 100);
											} else {
												// stop slider
												// console.log("play visible", videoID);
												pauseMainBanner();
												window[players[videoID].id].seekTo(0, true);
												//e.target.playVideo();
											}

											// update slide class
											$slide.addClass("started");
											// $slide.removeClass('loading')
										}
									},
									onStateChange: function (e) {
										if (videoID) {
											var loop = players[videoID].loop;
											var $slide = $("#player_" + videoID).closest(".main-slider__item");
											var hidden = !$("#player_" + videoID).closest(".swiper-slide-active").length;
											// var hidden = !$("#player_" + videoID).closest(".owl-item.active").length;
											// console.log("onStateChange", videoID, hidden, e.data);

											if (!hidden) {
												if (e.data === YT.PlayerState.PLAYING) {
													players[videoID].playing = true;

													$("#player_" + videoID)
														.closest(".main-slider__item")
														// .find(".banners-big__inner")
														.addClass("loading");
													$("#player_" + videoID)
														.closest(".main-slider__item")
														.find(".banners-big__inner .btn-video")
														.addClass("loading");

													// stop slider
													pauseMainBanner();

													var videoClones = players[videoID].clones;
													for (var j in videoClones) {
														if (videoClones[j] != videoID) {
															if (players[videoClones[j]].playing) {
																// console.log("pause one of clone", videoClones[j]);
																window[players[videoClones[j]].id].pauseVideo();
															}
														}
													}

													//e.target.playVideo();
												} else if (e.data === YT.PlayerState.PAUSED) {
													players[videoID].playing = false;

													// sync time in cloned players & pause
													var time = Math.floor(window[players[videoID].id].getCurrentTime() * 10) / 10;

													$("#player_" + videoID)
														.closest(".main-slider__item")
														// .find(".banners-big__inner")
														.removeClass("loading");
													$("#player_" + videoID)
														.closest(".main-slider__item")
														.find(".banners-big__inner .btn-video")
														.removeClass("loading");

													window[players[videoID].id].seekTo(time, true);

													var videoClones = players[videoID].clones;
													for (var j in videoClones) {
														if (videoClones[j] != videoID) {
															if (players[videoClones[j]].playing) {
																// console.log("pause one of clone", videoClones[j]);
																window[players[videoClones[j]].id].pauseVideo();
															}

															if ("getCurrentTime" in window[players[videoClones[j]].id]) {
																window[players[videoClones[j]].id].seekTo(time, true);
															}
														}
													}

													playMainBanner();
												} else if (e.data === YT.PlayerState.ENDED) {
													players[videoID].playing = false;
													if (loop) {
														e.target.playVideo();
													} else {
														// play slider
														playMainBanner();
													}
												} else if (e.data === YT.PlayerState.UNSTARTED) {
													players[videoID].playing = false;
													$("#player_" + videoID)
														.closest(".main-slider__item")
														.find(".banners-big__inner .btn-video")
														.removeClass("loading");
													// window[players[videoID].id].mute()
													e.target.playVideo();
												}
											} else {
												players[videoID].playing = false;
												$("#player_" + videoID)
													.closest(".main-slider__item")
													// .find(".banners-big__inner")
													.removeClass("loading");
												$("#player_" + videoID)
													.closest(".main-slider__item")
													.find(".banners-big__inner .btn-video")
													.removeClass("loading");
											}
										}
									},
								},
							});
						} else if (bVideoPlayerVimeo) {
							window[players[videoID].id] = new Vimeo.Player(document.getElementById(players[videoID].id), {
								autopause: false,
								byline: false,
								loop: false,
								title: false,
							});
							window[players[videoID].id].on("loaded", onVimeoPlayerReady);
							window[players[videoID].id].on("play", onVimeoPlayerStateChange);
							window[players[videoID].id].on("pause", onVimeoPlayerStateChange);
							window[players[videoID].id].on("ended", onVimeoPlayerStateChange);
						} else if (bVideoPlayerHtml5) {
							document.getElementById(players[videoID].id).addEventListener("loadeddata", onHtml5PlayerReady);
							document.getElementById(players[videoID].id).addEventListener("play", onHtml5PlayerStateChange);
							document.getElementById(players[videoID].id).addEventListener("pause", onHtml5PlayerStateChange);
							document.getElementById(players[videoID].id).addEventListener("ended", onHtml5PlayerStateChange);
						}
					}
				});
			};

			if (!bVideoPlayerHtml5) {
				var obPlayerVariable = "";
				var fnPlayerVariable = "";
				if (typeof window["YoutubePlayerScriptLoaded"] === "undefined") {
					window["YoutubePlayerScriptLoaded"] = false;
				}
				if (typeof window["VimeoPlayerScriptLoaded"] === "undefined") {
					window["VimeoPlayerScriptLoaded"] = false;
				}

				// load script
				if (bVideoPlayerYoutube) {
					obPlayerVariable = "YT";
					fnPlayerVariable = "Player";
					if (!window["YoutubePlayerScriptLoaded"]) {
						var script = document.createElement("script");
						script.src = "https://www.youtube.com/iframe_api";
						var firstScriptTag = document.getElementsByTagName("script")[0];
						firstScriptTag.parentNode.insertBefore(script, firstScriptTag);
						window["YoutubePlayerScriptLoaded"] = true;
					}
				} else if (bVideoPlayerVimeo) {
					obPlayerVariable = "Vimeo";
					if (!window["VimeoPlayerScriptLoaded"]) {
						var script = document.createElement("script");
						script.src = "https://player.vimeo.com/api/player.js";
						(document.head || document.documentElement).appendChild(script);
						window["VimeoPlayerScriptLoaded"] = true;
					}
				}

				if (!obPlayerVariable.length) {
					InitPlayer();
				} else {
					// wait player class
					if (typeof window[obPlayerVariable] === "object") {
						if (
							!fnPlayerVariable.length ||
							(fnPlayerVariable.length && typeof window[obPlayerVariable][fnPlayerVariable] === "function")
						) {
							InitPlayer();
						}
					} else {
						var waitPlayerInterval = setInterval(function () {
							if (typeof window[obPlayerVariable] === "object") {
								if (
									!fnPlayerVariable.length ||
									(fnPlayerVariable.length && typeof window[obPlayerVariable][fnPlayerVariable] === "function")
								) {
									clearInterval(waitPlayerInterval);

									InitPlayer();
								}
							}
						}, 50);
					}
				}
			} else {
				InitPlayer();
			}
		} else {
			// console.log(players);
			// pause video
			if (typeof players !== "undefined" && players) {
				for (var j in players) {
					if (typeof window[players[j].id] == "object") {
						if (players[j].playing) {
							if (players[j].videoPlayer === "YOUTUBE") {
								// console.log("pause", j);
								window[players[j].id].pauseVideo();
							} else if (players[j].videoPlayer === "VIMEO") {
								window[players[j].id].pause();
							} else if (players[j].videoPlayer === "HTML5") {
								document.getElementById(players[j].id).pause();
							}
						} else if (players[j].slideIndex == slideActiveIndex) {
							if (players[j].videoPlayer === "YOUTUBE") {
								if (typeof window[players[j].id]["playVideo"] == "function") {
									window[players[j].id].playVideo();
								}
							} else if (players[j].videoPlayer === "VIMEO") {
								window[players[j].id].play();
							} else if (players[j].videoPlayer === "HTML5") {
								document.getElementById(players[j].id).play();
							}
						}
					}
				}
			}
		}
	}
}

var CoverPlayer = function () {
	$(".banners-big .video.cover:visible").each(function () {
		var $slide = $(this).closest(".main-slider__item");
		var slideHeight = $slide[0].getBoundingClientRect().height; // outer height with padding
		var slideWidth = $slide[0].getBoundingClientRect().width;
		var videoProportion = $(this).attr("data-video_proportion");
		if (videoProportion === undefined) {
			videoProportion = 16 / 9;
		}

		// set video width = 100% of slide width
		var videoWidth = slideWidth;
		// calculate video height proportional
		var videoHeight = slideWidth / videoProportion;
		// video minimal  height = 100% slide height
		if (videoHeight < slideHeight) {
			// increase video width proportional
			videoWidth = slideHeight * videoProportion;
			videoHeight = slideHeight;
		}

		$(this).width(videoWidth).height(videoHeight);
	});
};

function onVimeoPlayerReady(e) {
	var videoID = this.element.id.replace("player_", "");
	if (videoID) {
		var mute = players[videoID].mute;
		var cover = players[videoID].cover;
		//var clone = players[videoID].clone;
		var $slide = $("#player_" + videoID).closest(".main-slider__item");
		var clone = $("#player_" + videoID).closest(".main-slider__item:not(.swiper-slide-active)").length;
		// var clone = $("#player_" + videoID).closest(".owl-item:not(.active)").length;

		// mute sound
		if (mute || clone) {
			window[players[videoID].id].setVolume(0);
		}

		// cover video
		if (cover) {
			// get video`s original size
			if (!players[videoID].videoProportion) {
				var widthPromise = window[players[videoID].id].getVideoWidth();
				var heightPromise = window[players[videoID].id].getVideoHeight();
				widthPromise.then(function (value) {
					var videoWidth = value;

					heightPromise.then(function (value) {
						var videoHeight = value;

						players[videoID].videoWidth = videoWidth;
						players[videoID].videoHeight = videoHeight;
						players[videoID].videoProportion = videoWidth / videoHeight;

						$slide.find(".video").attr("data-video_proportion", players[videoID].videoProportion);

						CoverPlayer();
					});
				});
			}
		}

		// not start clone video playing
		if (clone) {
			setTimeout(function () {
				window[players[videoID].id].pause();
			}, 100);
		} else {
			// stop slider
			pauseMainBanner();

			// start video
			var promise = window[players[videoID].id].play();
			if (typeof promise !== "undefined") {
				promise.catch(function () {
					setTimeout(function () {
						window[players[videoID].id].setVolume(0);
						window[players[videoID].id].play();
					}, 100);
				});
			}
		}

		// update slide class
		$slide.addClass("started");
		// $slide.removeClass('loading')
	}
}

function onVimeoPlayerStateChange(e) {
	var videoID = this.element.id.replace("player_", "");
	if (videoID) {
		var cover = players[videoID].cover;
		//var clone = players[videoID].clone;
		var loop = players[videoID].loop;
		var slideIndex = players[videoID].slideIndex;
		var clone = $("#player_" + videoID).closest(".main-slider__item:not(.swiper-slide-active)").length;
		// var clone = $("#player_" + videoID).closest(".owl-item:not(.active)").length;

		window[players[videoID].id].getPaused().then(function (paused) {
			if (paused) {
				players[videoID].playing = false;

				$("#player_" + videoID)
					.closest(".main-slider__item")
					// .find(".banners-big__inner")
					.removeClass("loading");
				$("#player_" + videoID)
					.closest(".main-slider__item")
					.find(".banners-big__inner .btn-video")
					.removeClass("loading");

				// sync time in cloned players & pause
				window[players[videoID].id].getCurrentTime().then(function (seconds) {
					var time = Math.floor(seconds * 10) / 10;
					window[players[videoID].id].setCurrentTime(time).then(function (seconds) {
						for (var j in players) {
							if (
								players[j].slideIndex == slideIndex &&
								(j != videoID || (clone && j == videoID)) &&
								window[players[j].id]
							) {
								window[players[j].id].pause();
								window[players[j].id].setCurrentTime(time).then(function (seconds) { });
							}
						}
					});
				});
			} else {
				$("#player_" + videoID)
					.closest(".main-slider__item")
					// .find(".banners-big__inner")
					.addClass("loading");
				$("#player_" + videoID)
					.closest(".main-slider__item")
					.find(".banners-big__inner .btn-video")
					.addClass("loading");
				window[players[videoID].id].getEnded().then(function (ended) {
					if (ended) {
						players[videoID].playing = false;
						if (loop) {
							window[players[videoID].id].play();
						} else {
							// play slider
							playMainBanner();
						}
					} else {
						players[videoID].playing = true;

						// stop slider
						pauseMainBanner();
					}
				});
			}
		});
	}
}

function onRutubePlayerReady(videoID) {
	if (videoID) {
		var mute = players[videoID].mute;
		var cover = players[videoID].cover;
		//var clone = players[videoID].clone;
		var player = document.getElementById(players[videoID].id);
		var $slide = $("#player_" + videoID).closest(".main-slider__item");
		var clone = $(player).closest(".main-slider__item:not(.swiper-slide-active)").length;
		// var clone = $(player).closest(".owl-item:not(.active)").length;

		// mute sound
		if (mute || clone) {
			player.contentWindow.postMessage(
				JSON.stringify({
					type: "player:mute",
					data: {},
				}),
				"*"
			);
		}

		// cover video
		if (cover) {
			CoverPlayer();
		}

		// not start clone video playing
		if (clone) {
			setTimeout(function () {
				player.contentWindow.postMessage(
					JSON.stringify({
						type: "player:pause",
						data: {},
					}),
					"*"
				);
			}, 100);
		} else {
			// stop slider
			pauseMainBanner();

			player.contentWindow.postMessage(
				JSON.stringify({
					type: "player:play",
					data: {},
				}),
				"*"
			);
		}

		// update slide class
		$slide.addClass("started");
		// $slide.removeClass('loading')
	}
}

function onRutubePlayerCurrentTime(videoID, time) {
	if (videoID) {
		players[videoID].time = time;
	}
}

function onRutubePlayerStateChange(videoID, state) {
	if (videoID) {
		//var clone = players[videoID].clone;
		var loop = players[videoID].loop;
		var slideIndex = players[videoID].slideIndex;
		var player = document.getElementById(players[videoID].id);
		var clone = $(player).closest(".main-slider__item:not(.swiper-slide-active)").length;
		// var clone = $(player).closest(".owl-item:not(.active)").length;

		if (state === "playing") {
			$("#" + videoID)
				.closest(".main-slider__item")
				// .find(".banners-big__inner")
				.addClass("loading");
			$("#" + videoID)
				.closest(".main-slider__item")
				.find(".banners-big__inner .btn-video")
				.addClass("loading");

			players[videoID].playing = true;

			// stop slider
			pauseMainBanner();
		} else if (state === "paused") {
			$("#" + videoID)
				.closest(".main-slider__item")
				// .find(".banners-big__inner")
				.removeClass("loading");
			$("#" + videoID)
				.closest(".main-slider__item")
				.find(".banners-big__inner .btn-video")
				.removeClass("loading");

			players[videoID].playing = false;

			// sync time in cloned players & pause
			var time = Math.floor(players[videoID].time * 10) / 10;
			player.contentWindow.postMessage(
				JSON.stringify({
					type: "player:setCurrentTime",
					data: { time: time },
				}),
				"*"
			);
			for (var j in players) {
				if (
					players[j].slideIndex == slideIndex &&
					(j != videoID || (clone && j == videoID)) &&
					document.getElementById(players[j].id)
				) {
					document.getElementById(players[j].id).contentWindow.postMessage(
						JSON.stringify({
							type: "player:pause",
							data: {},
						}),
						"*"
					);
					document.getElementById(players[j].id).contentWindow.postMessage(
						JSON.stringify({
							type: "player:setCurrentTime",
							data: { time: time },
						}),
						"*"
					);
				}
			}
		} else if (state === "stopped") {
			$("#" + videoID)
				.closest(".main-slider__item")
				// .find(".banners-big__inner")
				.removeClass("loading");
			$("#" + videoID)
				.closest(".main-slider__item")
				.find(".banners-big__inner .btn-video")
				.removeClass("loading");

			players[videoID].playing = false;
			if (loop) {
				player.contentWindow.postMessage(
					JSON.stringify({
						type: "player:play",
						data: {},
					}),
					"*"
				);
			} else {
				// play slider
				playMainBanner();
			}
		}
	}
}

function onHtml5PlayerReady(e) {
	var videoID = e.target.id.replace("player_", "");
	if (videoID) {
		var mute = players[videoID].mute;
		var cover = players[videoID].cover;
		var clone = $(e.target).closest(".main-slider__item:not(.swiper-slide-active)").length;
		// var clone = $(e.target).closest(".owl-item:not(.active)").length;
		var $slide = $("#player_" + videoID).closest(".main-slider__item");

		// mute sound
		if (mute || clone) {
			$("#" + players[videoID].id).prop("muted", true);
		}

		// cover video
		if (cover) {
			// get video`s original size
			if (!players[videoID].videoProportion) {
				var videoWidth = $slide.find(".video")[0].videoWidth;
				var videoHeight = $slide.find(".video")[0].videoHeight;

				players[videoID].videoWidth = videoWidth;
				players[videoID].videoHeight = videoHeight;
				players[videoID].videoProportion = videoWidth / videoHeight;

				$slide.find(".video").attr("data-video_proportion", players[videoID].videoProportion);
			}

			CoverPlayer();
		}

		// not start clone video playing
		if (clone) {
			// console.log("stop clone");
			e.target.pause();
		} else {
			// stop slider
			pauseMainBanner();

			var promise = e.target.play();
			if (typeof promise !== "undefined") {
				promise.catch(function () {
					setTimeout(function () {
						$("#" + players[videoID].id).prop("muted", true);
						e.target.play();
					}, 100);
				});
			}
		}

		// update slide class
		$slide.addClass("started");
		// $slide.removeClass('loading')
	}
}

function onHtml5PlayerStateChange(e) {
	var videoID = e.target.id.replace("player_", "");
	if (videoID) {
		var cover = players[videoID].cover;
		var clone = $(e.target).closest(".main-slider__item:not(.swiper-slide-active)").length;
		// var clone = $(e.target).closest(".owl-item:not(.active)").length;
		var loop = players[videoID].loop;
		var slideIndex = players[videoID].slideIndex;

		if (e.target.paused && !e.target.ended) {
			players[videoID].playing = false;

			$("#player_" + videoID)
				.closest(".main-slider__item")
				// .find(".banners-big__inner")
				.removeClass("loading");
			$("#player_" + videoID)
				.closest(".main-slider__item")
				.find(".banners-big__inner .btn-video")
				.removeClass("loading");

			// sync time in cloned players & pause
			var time = Math.floor(e.target.currentTime * 10) / 10;
			e.target.currentTime = time;
			for (var j in players) {
				if (
					players[j].slideIndex == slideIndex &&
					(j != videoID || (clone && j == videoID)) &&
					document.getElementById(players[j].id)
				) {
					// console.log("stop some clone");
					document.getElementById(players[j].id).pause();
					document.getElementById(players[j].id).currentTime = time;
				}
			}
			pauseMainBanner(); //need for correct autoplay timeout
			playMainBanner();
		} else if (e.target.ended) {
			players[videoID].playing = false;
			if (loop) {
				$("#player_" + videoID)
					.closest(".main-slider__item")
					// .find(".banners-big__inner")
					.addClass("loading");
				$("#player_" + videoID)
					.closest(".main-slider__item")
					.find(".banners-big__inner .btn-video")
					.addClass("loading");

				e.target.play();
			} else {
				// play slider
				pauseMainBanner(); //need for correct autoplay timeout
				playMainBanner();
			}
		} else {
			players[videoID].playing = true;

			$("#player_" + videoID)
				.closest(".main-slider__item")
				// .find(".banners-big__inner")
				.addClass("loading");
			$("#player_" + videoID)
				.closest(".main-slider__item")
				.find(".banners-big__inner .btn-video")
				.addClass("loading");
			// stop slider
			pauseMainBanner();
		}
	}
}

waitYTPlayer = function (delay, callback) {
	if (typeof YT !== "undefined" && YT && YT.Player) {
		if (typeof callback == "function") callback();
	} else {
		setTimeout(function () {
			waitYTPlayer(delay, callback);
		}, delay);
	}
};

// click on HTML5 video
$(document).on("click", "video.video", function (e) {
	var videoID = e.target.id.replace("player_", "");
	if (videoID) {
		if (players[videoID].playing) {
			e.target.pause();
		} else {
			e.target.play();
		}
	}
});

// START VIDEO BUTTON
$(document).on("click", ".banners-big .btn-video", function (e) {
	e.stopPropagation();
	startMainBannerSlideVideo($(this).closest(".main-slider__item"));
});

// START VIDEO BY BANNER OR GOTO LINK
$(document).on("click", ".banners-big .banners-big__item", function (e) {
	var $item = $(this);
	var vvideo = $item.hasClass("vvideo");
	var wurl = $item.hasClass("wurl");

	if (!$(e.target).hasClass("btn")) {
		if (wurl) {
			var href = $item.find(".target").attr("href");
			if (href.length) {
				var target = $item.find(".target").attr("target");
				if (typeof target === "undefined" || target === "_self") {
					location.href = href;
				} else {
					window.open(href);
				}
			}
		} else {
			if (vvideo) {
				e.stopPropagation();
				$(this).find(".btn-video").trigger("click");
			}
		}
	}
});

getRandomInt = function (min, max) {
	return Math.floor(Math.random() * (max - min)) + min;
};

var ignoreResize = [];

Turbo.addCustomEvent("onWindowResize", function (eventdata) {
	try {
		CoverPlayer();
	} catch (e) {
	} finally {
		ignoreResize.pop();
	}
});

Turbo.addCustomEvent("onSlideEnd", function (eventdata) {
	try {
		ignoreResize.push(true);
		if (eventdata) {
			var slider = eventdata.slider;
			if (slider) {
				setTimeout(function () {
					$(".banners-big.front .btn-video, .banners-big.front .banners-big__item").removeClass("loading");
				}, 300);
			}
		}
	} catch (e) {
	} finally {
		ignoreResize.pop();
	}
});

Turbo.addCustomEvent("onSlide", function (eventdata) {
	try {
		ignoreResize.push(true);
		if (eventdata) {
			var slider = eventdata.slider;
			if (slider) {
				/*if (slider.data("owl.carousel")) {
				  var curSlideIndex = slider.data("owl.carousel").current();
				  var curSlide = slider.find(".owl-item").eq(curSlideIndex).find(".banners-big__item");
				} else if (slider.find(".owl-item.active").length) {
				  var curSlide = slider.find(".owl-item.active").first().find(".banners-big__item");
				} else {
				  var curSlide = slider.find(".owl-item:not(.cloned)").eq(0).find(".banners-big__item");
				}*/

				if (slider.data("swiper")) {
					var curSlideIndex = slider.data("swiper").realIndex;
					var curSlide = slider.find(".main-slider__item").eq(curSlideIndex + 1);
				} else if (slider.find(".swiper-slide-active").length) {
					var curSlide = slider.find(".swiper-slide-active").first();
				} else {
					var curSlide = slider.find(".main-slider__item:not(.swiper-slide-duplicate)").eq(0);
				}

				var curSlide = slider.find(".box.swiper-slide-active");

				var dataSlideIndex = curSlide.attr("data-slide_index");

				if (typeof curSlide !== "undefined" && curSlide.length) {
					var slidesIndexesWithVideo = slider.data("slidesIndexesWithVideo");
					if (typeof slidesIndexesWithVideo === "undefined") {
						slidesIndexesWithVideo = [];
					}

					var bVideoVisible = slidesIndexesWithVideo.indexOf(dataSlideIndex) != -1;
					if (bVideoVisible) {
						slider.addClass("video_visible");
					} else {
						slider.removeClass("video_visible");
					}

					setTimeout(function () {
						CoverPlayer();
					}, 200);

					// pause play video
					if (typeof players !== "undefined" && players) {
						for (var j in players) {
							if (players[j].playing && players[j].slideIndex != dataSlideIndex) {
								if (typeof window[players[j].id] == "object") {
									if (players[j].videoPlayer === "YOUTUBE") {
										window[players[j].id].pauseVideo();
									} else if (players[j].videoPlayer === "VIMEO") {
										window[players[j].id].pause();
									} else if (players[j].videoPlayer === "HTML5") {
										document.getElementById(players[j].id).pause();
									}
								}
							}
						}
					}

					// autoplay video
					var bVideoAutoPlay = curSlide.attr("data-video_autoplay") == 1;
					if (bVideoAutoPlay) {
						startMainBannerSlideVideo(curSlide);
					}
				}

				if (curSlide.find("video").length && !curSlide.find(".btn-video").length) {
					var videoID = curSlide.find("video").attr("id");
					document.getElementById(videoID).play();
				}
			}
		}
	} catch (e) {
	} finally {
		ignoreResize.pop();
	}
});
