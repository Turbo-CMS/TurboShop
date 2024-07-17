/* http://keith-wood.name/countdown.html
 * Russian initialisation for the jQuery countdown extension
 * Written by Sergey K. (xslade{at}gmail.com) June 2010. */
(function ($) {
	$.countdown.regionalOptions['en'] = {
		labels: [Turbo.message('COUNTDOWN_YEAR0'), Turbo.message('COUNTDOWN_MONTH0'), Turbo.message('COUNTDOWN_WEAK0'), Turbo.message('COUNTDOWN_DAY0'), Turbo.message('COUNTDOWN_HOUR'), Turbo.message('COUNTDOWN_MIN'), Turbo.message('COUNTDOWN_SEC')],
		labels1: [Turbo.message('COUNTDOWN_YEAR1'), Turbo.message('COUNTDOWN_MONTH1'), Turbo.message('COUNTDOWN_WEAK1'), Turbo.message('COUNTDOWN_DAY1'), Turbo.message('COUNTDOWN_HOUR'), Turbo.message('COUNTDOWN_MIN'), Turbo.message('COUNTDOWN_SEC')],
		labels2: [Turbo.message('COUNTDOWN_YEAR2'), Turbo.message('COUNTDOWN_MONTH2'), Turbo.message('COUNTDOWN_WEAK2'), Turbo.message('COUNTDOWN_DAY2'), Turbo.message('COUNTDOWN_HOUR'), Turbo.message('COUNTDOWN_MIN'), Turbo.message('COUNTDOWN_SEC')],
		compactLabels: [Turbo.message('COUNTDOWN_COMPACT_YEAR0'), Turbo.message('COUNTDOWN_COMPACT_MONTH'), Turbo.message('COUNTDOWN_COMPACT_WEAK'), Turbo.message('COUNTDOWN_COMPACT_DAY'), Turbo.message('COUNTDOWN_COMPACT_HOUR'), Turbo.message('COUNTDOWN_COMPACT_MIN'), Turbo.message('COUNTDOWN_COMPACT_SEC')],
		compactLabels1: [Turbo.message('COUNTDOWN_COMPACT_YEAR1'), Turbo.message('COUNTDOWN_COMPACT_MONTH'), Turbo.message('COUNTDOWN_COMPACT_WEAK'), Turbo.message('COUNTDOWN_COMPACT_DAY'), Turbo.message('COUNTDOWN_COMPACT_HOUR'), Turbo.message('COUNTDOWN_COMPACT_MIN'), Turbo.message('COUNTDOWN_COMPACT_SEC')],
		whichLabels: function (amount) {
			var units = amount % 10;
			var tens = Math.floor((amount % 100) / 10);
			return (amount == 1 ? 1 : (units >= 2 && units <= 4 && tens != 1 ? 2 :
				(units == 1 && tens != 1 ? 1 : 0)));
		},
		digits: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
		timeSeparator: ':', isRTL: false
	};
	$.countdown.setDefaults($.countdown.regionalOptions['en']);
})(jQuery);