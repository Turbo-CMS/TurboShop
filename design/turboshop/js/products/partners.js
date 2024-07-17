if ($('.partner-detail__text').length > 0) {
	$(document).ready(function () {
		let detailTextBlock = document.querySelector(".partner-detail__text");
		if (detailTextBlock.scrollHeight > detailTextBlock.clientHeight) {
			$(".partner-detail__more-detail-text-link").removeClass("hide");

			$('.partner-detail__more-detail-text-link > span').click(function () {
				$('.partner-detail__text').toggleClass('linecamp-4');

				if ($('.partner-detail__text').hasClass('linecamp-4')) {
					$('.partner-detail__more-detail-text-link > span').html(Turbo.message('MORE_DETAIL_TEXT'));
				} else {
					$('.partner-detail__more-detail-text-link > span').html(Turbo.message('HIDE_DETAIL_TEXT'));
				}
			});
		}
	});
}