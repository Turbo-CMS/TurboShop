$(document).ready(function (e) {
    var inputElem = $('.search-panel .form-control');

    $('.search-panel .dropdown-menu').find('a').click(function (e) {
        e.preventDefault();
        var param = $(this).attr("href").replace("#", "");
        var concept = $(this).text();
        var input = $(this).attr("data-input");
        $('.search-panel span#search-concept').text(concept);
        $('#search-param').attr('action', param);
        $('.dropdown-item').removeClass('active');
        if (!$(this).hasClass('active')) {
            $(this).addClass('active');
        }

        inputElem.attr('id', input);

        if (inputElem.attr("id") == "products-search") {
            inputElem.autocomplete({
                serviceUrl: 'ajax/search_products.php',
                minChars: 1,
                noCache: false,
                onSelect: function (suggestion) {
                    inputElem.closest('form').submit();
                },
                formatResult: function (suggestion, currentValue) {
                    var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
                    var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
                    return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "products/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
                }
            });
        } else if (inputElem.attr("id") == "blog-search") {
            inputElem.autocomplete({
                serviceUrl: 'ajax/search_blog.php',
                minChars: 1,
                noCache: false,
                onSelect: function (suggestion) {
                    inputElem.closest('form').submit();
                },
                formatResult: function (suggestion, currentValue) {
                    var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
                    var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
                    return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "blog/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
                }
            });
        } else if (inputElem.attr("id") == "articles-search") {
            inputElem.autocomplete({
                serviceUrl: 'ajax/search_articles.php',
                minChars: 1,
                noCache: false,
                onSelect: function (suggestion) {
                    inputElem.closest('form').submit();
                },
                formatResult: function (suggestion, currentValue) {
                    var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
                    var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
                    return (suggestion.data.image ? "<span class='search-img'><img align=absmiddle src='" + suggestion.data.image + "'></span>" : '') + "<a href=" + suggestion.lang + "article/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
                }
            });
        } else if (inputElem.attr("id") == "pages-search") {
            inputElem.autocomplete({
                serviceUrl: 'ajax/search_pages.php',
                minChars: 1,
                noCache: false,
                onSelect: function (suggestion) {
                    inputElem.closest('form').submit();
                },
                formatResult: function (suggestion, currentValue) {
                    var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
                    var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
                    return "<span class='ms-3 mb-3'></span>" + "<a href=" + suggestion.lang + "/" + suggestion.data.url + '>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '<\/a>';
                }
            });
        }
    });
});