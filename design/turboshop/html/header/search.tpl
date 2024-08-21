{* Search *}
<div id="title-search" class="search-wrapper relative">
	<form action="{$lang_link}all-products" class="search search--hastype">
		<button class="search-input-close btn-close fill-dark-light-block" type="button">
			<i class="svg inline clear" aria-hidden="true">
				<svg width="16" height="16">
					<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-16-16"></use>
				</svg>
			</i>
		</button>
		<div class="search-input-div">
			<input class="search-input font_16 banner-light-text form-control input_search" id="title-search-input" type="text" name="keyword" value="{$keyword|escape}" placeholder="{$lang->find}" size="40" maxlength="50" autocomplete="off" />
		</div>
		<div class="search-button-div">
			<button class="btn btn--no-rippple btn-clear-search fill-dark-light-block banner-light-icon-fill light-opacity-hover" type="reset" name="rs">
				<i class="svg inline clear" aria-hidden="true">
					<svg width="9" height="9">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-9-9"></use>
					</svg>
				</i>
			</button>
			<div class="dropdown-select dropdown-select--with-dropdown searchtype">
				<div class="dropdown-select__title font_14 font_large fill-dark-light banner-light-text">
					<span>
						{if isset($smarty.cookies.searchtitle_type) && $smarty.cookies.searchtitle_type == 'all'}
							{$lang->all_search}
						{elseif isset($smarty.cookies.searchtitle_type) && $smarty.cookies.searchtitle_type == 'blog'}
							{$lang->global_blog}
						{elseif isset($smarty.cookies.searchtitle_type) && $smarty.cookies.searchtitle_type == 'article'}
							{$lang->global_articles}
						{else}
							{$lang->catalog}
						{/if}
					</span>
					<i class="svg inline dropdown-select__icon-down banner-light-icon-fill" aria-hidden="true">
						<svg width="7" height="5">
							<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#down-7-5"></use>
						</svg>
					</i>
				</div>
				<div class="dropdown-select__list dropdown-menu-wrapper" role="menu">
					<div class="dropdown-menu-inner rounded-x">
						<div class="dropdown-select__list-item font_15">
							<span class="dropdown-menu-item dark_link" data-type="all">
								<span>{$lang->all_site}</span>
							</span>
						</div>
						<div class="dropdown-select__list-item font_15">
							<span class="dropdown-menu-item dark_link" data-type="blog">
								<span>{$lang->by_blog}</span>
							</span>
						</div>
						<div class="dropdown-select__list-item font_15">
							<span class="dropdown-menu-item dark_link" data-type="article">
								<span>{$lang->by_article}</span>
							</span>
						</div>
						<div class="dropdown-select__list-item font_15">
							<span class="dropdown-menu-item color_222 dropdown-menu-item--current" data-type="catalog">
								<span>{$lang->by_catalog}</span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<button class="btn btn-search btn--no-rippple fill-dark-light-block banner-light-icon-fill light-opacity-hover" type="submit">
				<i class="svg inline search" aria-hidden="true">
					<svg width="18" height="18">
						<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#search-18-18"></use>
					</svg>
				</i>
			</button>
		</div>
	</form>
</div>