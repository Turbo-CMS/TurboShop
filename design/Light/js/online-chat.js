(function($) {
    "use strict";
    $(document).on('click', '.i-trigger-open', function() {
        var newPosition = -$('.chaty-widget-social').length * 100 + '%';
        $('.chaty-widget-is').css('top', newPosition);
        $('#chaty-widget').addClass('chaty-widget-show');
        $('#chaty-widget').removeClass('none-widget-show');
    });
    $(document).on('click', '.i-trigger-close', function() {

        $('#chaty-widget').removeClass('chaty-widget-show');
        $('#chaty-widget').addClass('none-widget-show');
    });
    var scrollTrigger = 100, // px
        backToTop = function() {
            var scrollTop = $(window).scrollTop();
            if (scrollTop > scrollTrigger) {
                $('#chaty-widget').addClass('show');
            } else {
                $('#chaty-widget').removeClass('show');
            }
        };
    backToTop();
    $(window).on('scroll', function() {
        backToTop();
    });
})(jQuery);