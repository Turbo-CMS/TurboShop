let serviceUrl = 'ajax/search_products.php';
let type;

function initializeAutocomplete($input) {
	$input.each(function () {
		const $this = $(this);
		const appendToSelector = $this.closest('#title-search');

		$this.devbridgeAutocomplete({
			serviceUrl: serviceUrl,
			minChars: 1,
			appendTo: appendToSelector,
			maxHeight: 700,
			containerClass: 'title-search-result title-search-input',
			noCache: false,
			onSearchComplete: function (query) {
				appendToSelector.find(".autocomplete-suggestion").wrapAll("<div class='searche-result scrollbar'></div>");
				appendToSelector.find(".title-search-result").append("<div class='searche-result__all'><button id='allResultsButton' class='all_result_title btn btn-transparent btn-wide tb_item_block has-ripple' type='button'>" + Turbo.message('SEARCH_ALL_RESULTS') + "</button></div>");
			},
			onSelect: function (suggestion) {
				$this.closest('form').submit();
			},
			onHide: function () {
				appendToSelector.find(".searche-result").remove();
				appendToSelector.find(".searche-result__all").remove();
			},
			formatResult: function (suggestion, currentValue) {
				var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
				var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
				var imageTag = suggestion.data.image ? '<span class="searche-result__item-image"><img class="img-responsive" src="' + suggestion.data.image + '"></span>' : '';
				var priceTag = suggestion.price && suggestion.currency ? '<div class="price color_222"><div class="line-block line-block--6 line-block--align-baseline line-block--flex-wrap"><div class="line-block__item"> <div class="price__new"><span class="price__new-val font_13">' + suggestion.price + ' ' + suggestion.currency + '</span></div></div></div></div>' : '';
				var urlPrefix = type === 'all' ? '' : type === 'blog' ? 'blog/' : type === 'article' ? 'article/' : 'products/';
				$.cookie('searchtitle_type', type);
				return '<a class="tb_item_block searche-result__item rounded-x dark_link" href="' + suggestion.lang + urlPrefix + suggestion.data.url + '"><span class="searche-result__inner flexbox flexbox--direction-row">' + imageTag + '<span class="searche-result__item-text"><span>' + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + '</span>' + priceTag + '</span></span></a>';
			}
		});
	});
}

$(document).on('click', '.dropdown-select.searchtype .dropdown-menu-item:not(.dropdown-menu-item--current)', function () {
	let $this = $(this);
	let $title = $this.closest('.dropdown-select').find('.dropdown-select__title');
	let $menu = $this.closest('.dropdown-select').find('.dropdown-select__list');
	let bVisibleMenu = $menu.is(':visible');
	let animate = !bVisibleMenu ? 'transition.slideUpIn' : 'fadeOut';

	type = $this.data('type');

	let name;

	switch (type) {
		case 'all':
			name = Turbo.message('SEARCH_IN_SITE');
			break;
		case 'catalog':
			name = Turbo.message('SEARCH_IN_CATALOG');
			break;
		case 'blog':
			name = Turbo.message('SEARCH_IN_BLOG');
			break;
		case 'article':
			name = Turbo.message('SEARCH_IN_ARTICLE');
			break;
		default:
			break;
	}

	if (!$title.hasClass('clicked')) {
		$title.addClass('clicked');
		$title.toggleClass('opened');
		$menu.stop().slideUp(300, function () {
			$title.removeClass("clicked");
		});
	}

	$.cookie('searchtitle_type', type);

	$this.closest('.dropdown-select').find('input[name=type]').val(type);

	$('.title-search-result').hide().empty();

	Turbo.fireEvent($this.closest('.dropdown-select').find('input[name=type]')[0], 'change');

	$('.dropdown-select.searchtype').each(function () {
		let url;

		switch (type) {
			case 'all':
				url = turboOptions.PAGES.SEARCH_PAGE_URL;
				break;
			case 'catalog':
				url = turboOptions.PAGES.CATALOG_PAGE_URL;
				break;
			case 'blog':
				url = turboOptions.PAGES.SEARCH_BLOG_URL;
				break;
			case 'article':
				url = turboOptions.PAGES.SEARCH_ARTICLE_URL;
				break;
			default:
				break;
		}

		$(this).closest('form').attr('action', url);
		$(this).find('.dropdown-select__title>span').text(name);
		$(this).find('.dropdown-menu-item').removeClass('dropdown-menu-item--current');
		$(this).find('.dropdown-menu-item[data-type=' + type + ']').addClass('dropdown-menu-item--current');
	});

	try {
		$this.closest('form').find('input[name=q]')[0].focus();
	} catch (e) { }

	switch (type) {
		case 'all':
			serviceUrl = 'ajax/search_pages.php';
			break;
		case 'catalog':
			serviceUrl = 'ajax/search_products.php';
			break;
		case 'blog':
			serviceUrl = 'ajax/search_blog.php';
			break;
		case 'article':
			serviceUrl = 'ajax/search_articles.php';
			break;
		default:
			serviceUrl = 'ajax/search_products.php';
			break;
	}

	$(".input_search").devbridgeAutocomplete('setOptions', {
		serviceUrl: serviceUrl
	});
});

$(function () {
	var savedType = $.cookie('searchtitle_type');
	if (savedType) {
		type = savedType;
		$('.dropdown-select.searchtype').find('.dropdown-menu-item').removeClass('dropdown-menu-item--current');
		$('.dropdown-select.searchtype').find('.dropdown-menu-item[data-type=' + type + ']').addClass('dropdown-menu-item--current');
		$('.dropdown-select.searchtype').each(function () {
			var name;
			switch (type) {
				case 'all':
					name = Turbo.message('SEARCH_IN_SITE');
					break;
				case 'catalog':
					name = Turbo.message('SEARCH_IN_CATALOG');
					break;
				case 'blog':
					name = Turbo.message('SEARCH_IN_BLOG');
					break;
				case 'article':
					name = Turbo.message('SEARCH_IN_ARTICLE');
					break;
				default:
					break;
			}
			$(this).closest('form').find('.dropdown-select__title>span').text(name);
		});

		switch (type) {
			case 'all':
				serviceUrl = 'ajax/search_pages.php';
				break;
			case 'catalog':
				serviceUrl = 'ajax/search_products.php';
				break;
			case 'blog':
				serviceUrl = 'ajax/search_blog.php';
				break;
			case 'article':
				serviceUrl = 'ajax/search_articles.php';
				break;
			default:
				serviceUrl = 'ajax/search_products.php';
				break;
		}

		$('.dropdown-select.searchtype').each(function () {
			var url;

			switch (type) {
				case 'all':
					url = turboOptions.PAGES.SEARCH_PAGE_URL;
					break;
				case 'catalog':
					url = turboOptions.PAGES.CATALOG_PAGE_URL;
					break;
				case 'blog':
					url = turboOptions.PAGES.SEARCH_BLOG_URL;
					break;
				case 'article':
					url = turboOptions.PAGES.SEARCH_ARTICLE_URL;
					break;
				default:
					break;
			}

			$(this).closest('form').attr('action', url);
		});
	}

	initializeAutocomplete($(".input_search"));
});

$(document).on('click', '#allResultsButton', function () {
	$('#title-search form').submit(); 
});
