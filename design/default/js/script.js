var $form = $('#collapseExample');
var flag = true;
$('.comment span').click(function() {
    $form.hide();
    $('.comment span').text($(this).attr('data-reply-text'));
    if (!$(this).hasClass('active')) {
        $(this).text($(this).attr('data-close-text')).addClass('active');
        var $comment = $(this).parent();
        $form.find('#parent').val($comment.attr('id'));
        $comment.after($('#collapseExample').show());
        return false;
    } else {
        $('.comment span').removeClass('active');
        return false;
    }
});

$('.comments__reply_form').click(function() {
    $form.hide();
    $('.comments__reply_form').text($(this).attr('data-comment-text'));
    if (!$(this).hasClass('active')) {
        $(this).text($(this).attr('data-close-text')).addClass('active');
        var $comment = $(this);
        $comment.after($('#collapseExample').show());
        return false;
    } else {
        $('.comments__reply_form').removeClass('active');
        return false;
    }
});

$(document).on('click', '.vote a', function(e) {
    e.preventDefault();
    var counter = $(this).siblings('.vote__value');
    $.ajax({
        url: $(this).attr('href')
    }).done(function(response) {
        if (response.success) {
            counter.html(response.value);
            counter.text(response.value).toggleClass('neg', response.value < 0).toggleClass('pos', response.value > 0);
        } else {
            $('#rate_danger').toast('show');
        }
    });
});

/* Responsive video and tables tiny MCE */
if ($('.block__description').length) {
    $('.block__description').find('iframe').wrap('<p class="video"></p>');
    $('.block__description').find('table').wrap('<div class="table_responsive"></div>');

    $(document).ready(function() {
        $('img.fn_img_zoom').each(function(i) {
            if (this.parentNode.tagName != 'A') {
                $(this).wrap('<a class="fn_image_zoom" data-fancybox="fn_image_zoom' + i + '" rel="fancybox_' + i + '" href="' + this.src + '" target="_blank"/>');
            }
        });
        $('img.fn_img_gallery').each(function(i) {
            if (this.parentNode.tagName != 'A') {
                $(this).wrap('<a class="fn_image_gallery" data-fancybox="fn_image_gallery" rel="image_gallery" href="' + this.src + '" target="_blank"/>');
            }
        });
        $('img.fn_img_slider').each(function(i) {
            if (this.parentNode.tagName != 'A') {
                $(this).wrap('<a class="fn_image_slider" data-fancybox="fn_image_slider" rel="image_slider" href="' + this.src + '" target="_blank"/>');
            }
        });

        $("a.fn_image_gallery").wrapAll("<div class='fn_slider_gallery owl-carousel'></div>");

        $("a.fn_image_slider").wrapAll("<div class='fn_slider_mce owl-carousel'></div>");

        if ($('.fn_slider_gallery').length) {
            $('.fn_slider_gallery').owlCarousel({
                loop: false,
                margin: 0,
                lazyLoad: true,
                mouseDrag: false,
                nav: true,
                items: 1,
                dotsEach: true,
                responsive: {
                    768: {
                        mouseDrag: true,
                        items: 1
                    },
                    992: { items: 3 }
                }
            });
        }
        if ($('.fn_slider_mce').length) {
            $('.fn_slider_mce').owlCarousel({
                loop: true,
                margin: 0,
                lazyLoad: true,
                mouseDrag: true,
                nav: true,
                items: 1,
                dotsEach: true
            });
        }
    });

}

function createCookie(name, value, days) {
    var expires;

    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toGMTString();
    } else {
        expires = "";
    }
    document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/";
}

jQuery(function($) {
    "use strict";

    $(document).on('click', '.js-table-of-contents-hide', function() {

        var $toc = $(this).parents('.table-of-contents');

        $toc.toggleClass('open');
        if ($toc.hasClass('open')) {
            createCookie('turbocms_toc_hide', "", -1);
            $('.js-table-of-contents-list').slideDown();
        } else {
            createCookie('turbocms_toc_hide', 'hide');
            $('.js-table-of-contents-list').slideUp();
        }

    });

    $(document).on('click', '.table-of-contents a[href*="#"]', function(e) {
        var fixed_offset = 100;
        $('html,body').stop().animate({ scrollTop: $(this).parents('.entry-content').find(this.hash).offset().top - fixed_offset }, 500);
        e.preventDefault();
    });

});

(function($) {
    "use strict";
    $(window).on("load", function() {
        $('.loader-container').fadeIn('slow');
    })
})(jQuery);