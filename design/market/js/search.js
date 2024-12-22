$(document).ready(function () {
    const inputElem = $('.search-panel .form-control');
    const searchConfigs = {
        "products-search": { serviceUrl: 'ajax/search_products.php', pathPrefix: 'products/' },
        "blog-search": { serviceUrl: 'ajax/search_blog.php', pathPrefix: 'blog/' },
        "articles-search": { serviceUrl: 'ajax/search_articles.php', pathPrefix: 'article/' },
        "pages-search": { serviceUrl: 'ajax/search_pages.php', pathPrefix: '' }
    };

    function setupAutocomplete(inputId, config) {
        if (!inputId || !config) return;

        inputElem.autocomplete({
            serviceUrl: config.serviceUrl,
            minChars: 1,
            noCache: false,
            onSelect: function () {
                inputElem.closest('form').submit();
            },
            formatResult: function (suggestion, currentValue) {
                const reEscape = new RegExp('([\\/\\.\\*\\+\\?\\|\\(\\)\\[\\]\\{\\}\\\\])', 'g');
                const pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
                const highlightedValue = suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1</strong>');
                const imageHtml = suggestion.data.image ? `<span class='search-img'><img align=absmiddle src='${suggestion.data.image}'></span>` : '';
                return `${imageHtml}<a href="${suggestion.lang}${config.pathPrefix}${suggestion.data.url}">${highlightedValue}</a>`;
            }
        });
    }

    $('.search-panel .dropdown-menu a').click(function (e) {
        e.preventDefault();

        const param = $(this).attr("href").replace("#", "");
        const concept = $(this).text();
        const inputId = $(this).attr("data-input");

        $('.search-panel span#search-concept').text(concept);
        $('#search-param').attr('action', param);
        $('.dropdown-item').removeClass('active');
        $(this).addClass('active');

        inputElem.attr('id', inputId);

        const config = searchConfigs[inputId];
        setupAutocomplete(inputId, config);
    });
});