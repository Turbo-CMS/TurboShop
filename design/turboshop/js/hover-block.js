$(document).on("mouseenter", ".hover-block .hover-block__item", function () {
	var $this = $(this);
	var $menu = $this.find(".hover-block__item-wrapper");
	var delay = $this.data("delay");
	var speed = $this.data("speed");

	if ($menu.data("timer")) {
		clearTimeout($menu.data("timer"));
		$menu.data("timer", false);
	}

	$menu.data(
		"timer",
		setTimeout(
			function () {
				$menu.stop();
				$menu.fadeIn(speed && speed.show ? speed.show : 300);
			},
			delay && delay.show ? delay.show : 100
		)
	);

	$this.one("mouseleave", function () {
		if ($menu.data("timer")) {
			clearTimeout($menu.data("timer"));
			$menu.data("timer", false);
		}

		$menu.data(
			"timer",
			setTimeout(
				function () {
					$menu.stop();
					$menu.fadeOut(speed && speed.hide ? speed.hide : 100);
				},
				delay && delay.hide ? delay.hide : 300
			)
		);
	});
});
