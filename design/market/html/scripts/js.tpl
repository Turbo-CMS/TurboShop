{* JS *}

{* Infinite Scroll *}
{js id="infinite-scroll" priority=99 include=["design/{$settings->theme|escape}/vendor/infinite-scroll/infinite-scroll.pkgd.min.js"]}{/js}
{javascript minify=true}

{* Fancybox *}
{css id="fancybox" include=["design/{$settings->theme|escape}/vendor/fancybox/fancybox.css"]}{/css}
{stylesheet minify=true}

{js id="fancybox" priority=99 include=["design/{$settings->theme|escape}/vendor/fancybox/fancybox.umd.js"]}{/js}
{javascript minify=true}

{* JS Main *}
{js id="main" priority=99 include=[
    "design/{$settings->theme|escape}/js/jquery/jquery.maskedinput.min.js",
    "design/{$settings->theme|escape}/js/jquery/jquery.autocomplete-min.js",
    "design/{$settings->theme|escape}/js/theme.js"
]}{/js}
{javascript minify=true}

{* Products *}
{js id="products" priority=99 include=["design/{$settings->theme|escape}/js/products/products.js"]}{/js}
{javascript minify=true}

{* Search *}
{js id="search" priority=99 include=["design/{$settings->theme|escape}/js/search.js"]}{/js}
{javascript minify=true}

{* Reviews Rating *}
{if $module == 'ReviewsView' || $module == 'ProductView'}
    {js id="rating" priority=99 include=["design/{$settings->theme|escape}/js/rating.js"]}{/js}
    {javascript minify=true}
{/if}

{* Blog & Articles *}
{if $module == 'BlogView' && $post || $module=='ArticlesView' && $post}
    {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
        {css id="prism" include=["design/{$settings->theme|escape}/vendor/prism/prism-dark.css"]}{/css}
        {stylesheet minify=true}
    {else}
        {css id="prism" include=["design/{$settings->theme|escape}/vendor/prism/prism.css"]}{/css}
        {stylesheet minify=true}
    {/if}

    {js id="prism" priority=99 include=["design/{$settings->theme|escape}/vendor/prism/prism.js"]}{/js}
    {javascript minify=false}

    {css id="post" include=["design/{$settings->theme|escape}/css/post/post.css"]}{/css}
    {stylesheet minify=true}

    {js id="post" priority=99 include=[
        "design/{$settings->theme|escape}/js/post/post.js",
        "design/{$settings->theme|escape}/js/jquery/jquery.toc.js"
    ]}{/js}
    {javascript minify=true}
{/if}

{* Description Blog Articles*}
{if $module == 'BlogView' && $post || $module=='ArticlesView' && $post || $module=='PageView' || $module=='ProductView'}
    {css id="description" include=["design/{$settings->theme|escape}/vendor/owl/owl.carousel.css"]}{/css}
    {stylesheet minify=true}

    {js id="description" priority=99 include=[
        "design/{$settings->theme|escape}/js/post/block.description.js",
        "design/{$settings->theme|escape}/vendor/owl/owl.carousel.min.js"
    ]}{/js}
    {javascript minify=true}
{/if}

{* Filters *}
{if $module == 'ProductsView'}
    {* Simplebar *}
    {css id="simplebar" include=["design/{$settings->theme|escape}/vendor/simplebar/simplebar.css"]}{/css}
    {stylesheet minify=true}

    {js id="simplebar" priority=99 include=["design/{$settings->theme|escape}/vendor/simplebar/simplebar.js"]}{/js}
    {javascript minify=true}

    {* noUiSlider *}
    {css id="nouislider" include=["design/{$settings->theme|escape}/vendor/nouislider/nouislider.css"]}{/css}
    {stylesheet minify=true}

    {js id="nouislider" priority=99 include=["design/{$settings->theme|escape}/vendor/nouislider/nouislider.js"]}{/js}
    {javascript minify=true}

    {* Filter *}
    {css id="filter" include=["design/{$settings->theme|escape}/css/products/filter.css"]}{/css}
    {stylesheet minify=true}

    {js id="filter" priority=99 include=["design/{$settings->theme|escape}/js/products/filter.js"]}{/js}
    {javascript minify=true}
{/if}

{* Product *}
{if $module=='ProductView'}
    {js id="product" priority=99 include=["design/{$settings->theme|escape}/js/products/product.js"]}{/js}
    {javascript minify=true}

    {* Timer Action *}
    {if !empty($product->sale_to)}
        {css id="countdown" include=["design/{$settings->theme|escape}/vendor/jq-timeTo/timeTo.css"]}{/css}
        {stylesheet minify=true}

        {js id="countdown" priority=99 include=["design/{$settings->theme|escape}/vendor/jq-timeTo/jquery.time-to.js"]}{/js}
        {javascript minify=true}

        <script>
            $('#countdown').each(function() {
                var prd = $(this).parent();
                $(this).timeTo({
                    timeTo: new Date(parseInt($(this).attr('sale_to'))),
                    displayDays: true,
                    fontSize: 28,
                    displayDays: 2,
                    {if isset($smarty.cookies.mode) && $smarty.cookies.mode == 'mode'}
                        theme: "black",
                    {/if}
                    displayCaptions: true,
                    lang: "{$language->label|escape}",
                    callback: function() {
                        prd.find('#countdown').hide();
                        prd.find('#countdown-title').hide();
                        real = prd.find('form.variants .offers-price-old .price-value').first().html();
                        if (typeof(real) == 'undefinded' || real == null) {
                            return;
                        }

                        prd.find('form.variants .offers-price-old').first().remove();
                        prd.find('form.variants .offers-price .price-value').first().html(real);
                    }
                });
            });
        </script>
    {/if}
{/if}

{* Callback Error *}
{if $call_error}
    <script>
        $(window).on("load", function() {
            $('#callbackModal').modal('show');
        });
    </script>
{/if}

{* Fastorder Error *}
{if $fastorder_error}
    <script>
        $(window).on("load", function() {
            $('#fastOrder').modal('show');
        });
    </script>
{/if}

{* Toast Callback *}
{if $call_sent}
    <script>
        $(window).on("load", function() {
            $('#callbackToast').toast('show');
        });
    </script>
{/if}

{* Toast Subscribe *}
{if $subscribe_success || $subscribe_error}
    <script>
        $(window).on("load", function() {
            $('#subscribe').toast('show');
        });
    </script>
{/if}

{* Online Chat *}
{if $settings->chat_viber || $settings->chat_whats_app || $settings->chat_telegram || $settings->chat_facebook}
    {css id="chat" include=["design/{$settings->theme|escape}/css/service/online-chat.css"]}{/css}
    {stylesheet minify=true}

    {js id="chat" priority=99 include=["design/{$settings->theme|escape}/js/service/online-chat.js"]}{/js}
    {javascript minify=true}

    {include file='service/online_chat.tpl'}
{/if}

{* Admintooltip *}
{if $smarty.session.admin == 'admin'}
    {$admintooltip}
{/if}

{* Custom Scripts Body Bottom *}
{if $counters['body_bottom']}
    {foreach $counters['body_bottom'] as $counter}
        {$counter->code}
    {/foreach}
{/if}