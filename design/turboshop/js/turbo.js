/**
 * Copyright (c) 2018-2024 TurboCMS.
 * https://github.com/Turbo-CMS
 */

(function ($) {

    /*
    // Add Cart
    */

    $(document).on('submit', 'form.variants', function (e) {
        e.preventDefault();

        button = $(this).find('button[type="submit"]');
        amount = $(this).find('button[type="submit"]').attr('data-quantity');

        if ($(this).find('select[name=variant]').length > 0) {
            variant = $(this).find('select').val();
        }

        if ($(this).find('input[name=variant]:checked').length > 0) {
            variant = $(this).find('input[name=variant]:checked').val();
        }

        var image = $(this).closest('.product').find('.image img').attr('src');
        var detail = $(this).closest('.product').find('.js-popup-title').text();
        var href = 'cart';

        $.ajax({
            url: 'ajax/cart.php',
            data: {
                variant: variant,
                amount: amount
            },
            dataType: 'json',
            success: function (data) {
                $('#cart-informer').html(data.cart_informer);
                $('#cart-informer-2').html(data.cart_informer_2);
                $('#cart-informer-mobile').html(data.cart_informer_mobile);
                $('#cart-informer-footer').html(data.cart_informer_footer);
                $('#cart-informer-sidebar').html(data.cart_informer_sidebar);

                if ($('#js-ajax-content').length > 0) {
                    $('#js-ajax-content').load(href + ' #js-ajax-content', function () {
                        initializeCustomNumber();
                    });
                }

                if (typeof JNoticeSurface === 'function') {
                    let surface = JNoticeSurface.get();
                    surface.onAdd2Cart({
                        image: image,
                        detail: detail
                    });
                }

                if (button.attr('data-result-text')) button.html(button.attr('data-result-text'));

                button.parent().removeClass("loadings");

                if ($('.counter-block').length > 0) {
                    $('.counter-block').show();
                }


            }
        });

        return false;
    });

    /*
    // Remove Cart
    */

    $(document).on('click', 'a.product-remove', function (e) {
        e.preventDefault();

        var href = $(this).attr('href');

        $('#cart-informer').load(href + ' #cart-informer');
        $('#cart-informer-2').load(href + ' #cart-informer-2');
        $('#cart-informer-footer').load(href + ' #cart-informer-footer');
        $('#cart-informer-sidebar').load(href + ' #cart-informer-sidebar');

        if ($('#js-ajax-content').length > 0) {
            $('#js-ajax-content').load(href + ' #js-ajax-content', function () {
                initializeCustomNumber();
            });
        }

        return false;
    });

    /*
    // Product Price Replacement
    */

    $(document).on('change', 'input[name=variant]', function () {
        var price = $('input[name=variant]:checked').data('price'),
            sku = $('input[name=variant]:checked').data('sku'),
            compare = $('input[name=variant]:checked').data('compare'),
            stock = $('input[name=variant]:checked').data('stock');
        discount = $('input[name=variant]:checked').data('discount');
        var $availability = $('.status-container');
        var $addToCart = $('#add-to-cart');
        var $fastOrder = $('#fast-order');

        $('.catalog-detail__buy-block .js-price__new-val').html(price);
        $('.catalog-detail__buy-block .js-price__old-val').html(compare);
        $('.catalog-detail__buy-block .js-price-economy__val').html(discount);
        $('.article .js-replace-article').html(sku);

        function updateStatus(statusClass) {
            $availability.find('.instock').removeClass('instock').addClass(statusClass);
            $availability.find('.nostock').removeClass('nostock').addClass(statusClass);
            $availability.find('.status__svg-icon use').attr('xlink:href', function (_, value) {
                return value.includes('#instock') ? value.replace('#instock', '#' + statusClass) : value.replace('#nostock', '#' + statusClass);
            });
        }

        if (stock < 1) {
            $availability.find('.js-replace-status').html($availability.data('stock'));
            updateStatus('nostock');
            $addToCart.attr('disabled', true).addClass('disabled');
            $fastOrder.attr('disabled', true).addClass('disabled');
        } else {
            $availability.find('.js-replace-status').html($availability.data('default'));
            updateStatus('instock');
            $addToCart.attr('disabled', false).removeClass('disabled');
            $fastOrder.attr('disabled', false).removeClass('disabled');
        }
    });

    /*
    // Wishlist
    */

    $(document).on('click', 'a.wishlist', function (e) {
        e.preventDefault();

        var href = $(this).attr('href');
        var image = $(this).closest('.product').find('.image img').attr('src');
        var detail = $(this).closest('.product').find('.js-popup-title').text();

        $('#wishlist-informer').load(href + ' #wishlist-informer');
        $('#wishlist-informer-2').load(href + ' #wishlist-informer-2');
        $('#wishlist-informer-mobile').load(href + ' #wishlist-informer-mobile');
        $('#wishlist-informer-footer').load(href + ' #wishlist-informer-footer');
        $('#wishlist-informer-sidebar').load(href + ' #wishlist-informer-sidebar');

        if (typeof JNoticeSurface === 'function') {
            let surface = JNoticeSurface.get();
            surface.onAdd2Favorite({
                image: image,
                detail: detail
            });
        }

        $(this).attr('title', $(this).data('title_added'));
        $(this).closest('.item-action').addClass('active');
        $(this).addClass('active');

        return false;
    });

    /*
    // Compare
    */

    $(document).on('click', 'a.compare', function (e) {
        e.preventDefault();

        var href = $(this).attr('href');
        var image = $(this).closest('.product').find('.image img').attr('src');
        var detail = $(this).closest('.product').find('.js-popup-title').text();

        $('#compare-informer').load(href + ' #compare-informer');
        $('#compare-informer-2').load(href + ' #compare-informer-2');
        $('#compare-informer-mobile').load(href + ' #compare-informer-mobile');
        $('#compare-informer-footer').load(href + ' #compare-informer-footer');
        $('#compare-informer-sidebar').load(href + ' #compare-informer-sidebar');

        if (typeof JNoticeSurface === 'function') {
            let surface = JNoticeSurface.get();
            surface.onAdd2Compare({
                image: image,
                detail: detail
            });
        }

        $(this).attr('title', $(this).data('title_added'));
        $(this).closest('.item-action').addClass('active');
        $(this).addClass('active');

        return false;
    });

    /*
    // Infinite Scroll
    */

    $('.js_append').on('request.infiniteScroll', function (event, path) {
        $('.more_text_ajax').addClass('loadings');
        $('.module-pagination').hide();
    });

    $('.js_append').on('load.infiniteScroll', function (event, response, path) {
        $('.more_text_ajax').removeClass('loadings');
    });

    $('.js_append').on('append.infiniteScroll', function (event, response, path, items) {
        initCountdown();
    });

    if ($('.arrows-pagination__next').length > 0) {
        $('.js_append').infiniteScroll({
            path: '.arrows-pagination__next',
            append: '.js-infinite',
            button: '.ajax_load_btn',
            scrollThreshold: false,
            status: '.page-load-status',
        });
    }

    /*
    // Comments
    */

    var $form = $('#form_comment_');
    var previousCommentId = null;

    $(document).on('click', '.blog-comment-action__link', function () {
        var $commentId = $(this).data('id');
        var $formContainer = $('#form_comment_' + $commentId);

        if ($formContainer.is(':visible')) {
            $formContainer.hide();
            if (previousCommentId === $commentId) {
                previousCommentId = null;
            }
        } else {
            $('.js-form-comment').hide();
            $form.find('#parent').val($commentId);
            var $formContents = $form.find('#form_c_del').html();
            $formContainer.html($formContents).show();
            $form.show();
            previousCommentId = $commentId;
            $formContainer.find('form').validate();
        }

        return false;
    });

    /*
    // Comments Tab Show
    */

    $(document).ready(function () {
        var activeTab = localStorage.getItem('activeTab');
        if (activeTab) {
            $('.nav-tabs a[href="' + activeTab + '"]').tab('show');
        }
        $('.nav-tabs a').on('shown.bs.tab', function (event) {
            var activeTab = $(event.target).attr('href');
            localStorage.setItem('activeTab', activeTab);
        });
    });

    /*
    // Comment & Post Rate
    */

    $(document).on('click', '.rating-vote a', function (e) {
        e.preventDefault();

        var $this = $(this);
        var $container = $this.closest('.rating-vote');
        var $counter = $container.find('.rating-vote__result');
        var url = $this.attr('href');

        $.ajax({
            url: url
        }).done(function (response) {
            if (response.success) {
                $container.find('.rating-vote__item').removeClass('active');
                $counter.html(response.value);

                if (response.value !== 0) {
                    $this.addClass('active');
                    $counter.addClass('active');
                } else {
                    $counter.removeClass('active');
                }
            } else {
                if (typeof JNoticeSurface === 'function') {
                    let surface = JNoticeSurface.get();
                    surface.onRatingError();
                }
            }
        });
    });

    /*
    // Modal
    */

    $(document).on('click', '.js-sku-props__value--pict', function (e) {
        e.preventDefault();
        var url = $(this).data('url');
        $('.fast_view_frame.jqmWindow.popup.show').load(url);
    });

    /*
    // initialize Custom Numbers
    */

    if ($('.basket-item-amount').length > 0) {
        function initializeCustomNumber() {
            $('.basket-item-amount').customNumber();
        }

        $(document).ready(function () {
            initializeCustomNumber();
        });
    }

    /*
    // Products Load
    */

    $(document).on('click', '.js-catalog__wrapper .js-sku-props__value', function (e) {
        e.preventDefault();
        var url = $(this).data('url');
        var hasOffersElement = $(this).closest('.js-catalog__wrapper');
        hasOffersElement.load(url, function () {
            initCountdown();
        });
    });


    /*
    // Products Price Replacement
    */

    $(document).on('change', 'input[name=variant]', function () {
        var $variant = $(this).closest('.js-catalog__wrapper');
        var price = $variant.find('input[name=variant]:checked').data('price'),
            compare = $variant.find('input[name=variant]:checked').data('compare'),
            stock = $variant.find('input[name=variant]:checked').data('stock');
        discount = $variant.find('input[name=variant]:checked').data('discount');
        var $availability = $variant.find('.js-status-container');
        var $addToCart = $variant.find('#add-to-cart');

        $variant.find('.js-price__new-val').html(price);
        $variant.find('.js-price__old-val').html(compare);
        $variant.find('.js-price-economy__val').html(discount);

        function updateStatus(statusClass) {
            $availability.find('.instock').removeClass('instock').addClass(statusClass);
            $availability.find('.nostock').removeClass('nostock').addClass(statusClass);
        }

        if (stock < 1) {
            $availability.find('.js-replace-status').html($availability.data('stock'));
            updateStatus('nostock');
            $addToCart.attr('disabled', true).addClass('disabled');
        } else {
            $availability.find('.js-replace-status').html($availability.data('default'));
            updateStatus('instock');
            $addToCart.attr('disabled', false).removeClass('disabled');
        }
    });

    $(document).ready(function () {
        $('form.validate').validate();
    });

})(jQuery);

