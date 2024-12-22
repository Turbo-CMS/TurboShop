$(document).ready(function () {
	$(".card").on("hide.bs.collapse", function () {
		const $cardHeader = $(this).find(".card-header");
		$cardHeader.addClass("accordion-bottom");
	});

	$(".card").on("show.bs.collapse", function () {
		const $cardHeader = $(this).find(".card-header");
		$cardHeader.removeClass("accordion-bottom");
	});

	$(".card").each(function () {
		const $cardHeader = $(this).find(".card-header");

		if ($(this).find(".collapse.show").length > 0) {
			$cardHeader.removeClass("accordion-bottom");
		} else {
			$cardHeader.addClass("accordion-bottom");
		}
	});
});